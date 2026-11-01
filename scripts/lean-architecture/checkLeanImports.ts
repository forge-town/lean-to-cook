import { err, ok, type Result } from "neverthrow";

const readHeaderImports = (source: string): Result<string[], Error> => {
  const cursor = { index: 0 };
  const skipTrivia = (): Result<undefined, Error> => {
    while (cursor.index < source.length) {
      if (/\s/.test(source[cursor.index]!)) {
        cursor.index++;
        continue;
      }
      if (source.startsWith("--", cursor.index)) {
        const end = source.indexOf("\n", cursor.index);
        cursor.index = end < 0 ? source.length : end;
        continue;
      }
      if (!source.startsWith("/-", cursor.index)) break;
      const comment = { depth: 1 };
      cursor.index += 2;
      while (comment.depth > 0 && cursor.index < source.length) {
        if (source.startsWith("/-", cursor.index)) {
          comment.depth++;
          cursor.index += 2;
        } else if (source.startsWith("-/", cursor.index)) {
          comment.depth--;
          cursor.index += 2;
        } else {
          cursor.index++;
        }
      }
      if (comment.depth > 0) return err(new Error("Unterminated Lean header comment"));
    }

    return ok(undefined);
  };
  const readWord = () =>
    skipTrivia().map(() => {
      const word = source.slice(cursor.index).match(/^[A-Za-z_][A-Za-z0-9_'.]*/)?.[0];
      if (word) cursor.index += word.length;

      return word;
    });
  const imports: string[] = [];
  while (cursor.index < source.length) {
    const token = readWord();
    if (token.isErr()) return err(token.error);
    if (token.value === "module" || token.value === "prelude") continue;
    const prefix = { word: token.value };
    while (prefix.word === "public" || prefix.word === "meta") {
      const next = readWord();
      if (next.isErr()) return err(next.error);
      prefix.word = next.value;
    }
    if (prefix.word !== "import") break;
    const module = readWord().andThen((word) => (word === "all" ? readWord() : ok(word)));
    if (module.isErr()) return err(module.error);
    if (
      !module.value ||
      !/^[A-Za-z_][A-Za-z0-9_']*(?:\.[A-Za-z_][A-Za-z0-9_']*)*$/.test(module.value)
    )
      return err(new Error("Unsupported Lean module name in header import"));
    imports.push(module.value);
  }

  return ok(imports);
};

const dependencyAllowed = (path: string, dependency: string) => {
  if (path.includes("/Core/")) return dependency.startsWith("LeanToCook.Core.");
  if (path.includes("/Theories/")) return /^LeanToCook\.(Core|Theories)\./.test(dependency);
  if (path.includes("/DataContracts/"))
    return /^LeanToCook\.(Core|DataContracts)\./.test(dependency);
  if (path.includes("/Generated/")) return /^LeanToCook\.(Core|Generated)\./.test(dependency);
  const module = path.replaceAll("/", ".").replace(/\.lean$/, "");
  if (path.endsWith("/Model.lean")) return /^LeanToCook\.(Core|Theories)\./.test(dependency);
  if (path.endsWith("/Spec.lean")) return dependency === module.replace(/\.Spec$/, ".Model");
  if (path.endsWith("/Proofs.lean")) {
    const unit = module.replace(/\.Proofs$/, "");

    return dependency === `${unit}.Spec` || dependency.startsWith(`${unit}.Lemmas.`);
  }
  if (path.includes("/Lemmas/")) {
    const unit = module.split(".Lemmas.")[0]!;

    return (
      dependency === `${unit}.Model` ||
      dependency === `${unit}.Spec` ||
      dependency.startsWith(`${unit}.Lemmas.`)
    );
  }

  return path.startsWith("LeanToCook/Verification/") && dependency.startsWith("LeanToCook.");
};

/** Check dependency direction separately from Anatomy's filesystem contract. */
export const checkLeanImports = (path: string, source: string) =>
  readHeaderImports(source).andThen((imports) => {
    const normalizedPath = path.replaceAll("\\", "/");
    const invalid = imports.find((dependency) => !dependencyAllowed(normalizedPath, dependency));

    return invalid
      ? err(new Error(`Invalid Lean layer dependency: ${normalizedPath} imports ${invalid}`))
      : ok(imports);
  });
