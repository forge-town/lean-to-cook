import { execFileSync } from "node:child_process";
import { createHash } from "node:crypto";
import {
  cpSync,
  mkdirSync,
  mkdtempSync,
  readFileSync,
  readdirSync,
  rmSync,
  writeFileSync,
} from "node:fs";
import { tmpdir } from "node:os";
import { dirname, join, relative, resolve, sep } from "node:path";
import { fileURLToPath } from "node:url";

const UPSTREAM_COMMIT = "308cc8b7dab1da84b20e7fafdf836a715437f582";
const UPSTREAM_REPOSITORY = "https://github.com/Anduin2017/HowToCook.git";

const categoryByDirectory = {
  aquatic: "aquatic",
  breakfast: "breakfast",
  condiment: "condiment",
  dessert: "dessert",
  drink: "drink",
  meat_dish: "meat",
  "semi-finished": "semiFinished",
  soup: "soup",
  staple: "staple",
  vegetable_dish: "vegetable",
} as const;

const scriptDirectory = dirname(fileURLToPath(import.meta.url));
const repositoryRoot = resolve(scriptDirectory, "..");
const contentDirectory = join(repositoryRoot, "content", "how-to-cook");
const catalogPath = join(
  repositoryRoot,
  "packages",
  "schemas",
  "src",
  "sourceRecipes",
  "sourceRecipeCatalogData.json",
);

const toPosixPath = (path: string) => path.split(sep).join("/");

const collectMarkdownFiles = (directory: string): string[] =>
  readdirSync(directory, { withFileTypes: true }).flatMap((entry) => {
    const entryPath = join(directory, entry.name);

    return entry.isDirectory()
      ? collectMarkdownFiles(entryPath)
      : entry.isFile() && entry.name.endsWith(".md")
        ? [entryPath]
        : [];
  });

const getTitle = (markdownPath: string) => {
  const markdown = readFileSync(markdownPath, "utf8");
  const heading = markdown.split("\n").find((line) => line.startsWith("# "));

  if (!heading) {
    throw new Error(`Missing level-one heading in ${markdownPath}`);
  }

  return heading
    .slice(2)
    .trim()
    .replace(/的做法$/, "");
};

const temporaryDirectory = mkdtempSync(join(tmpdir(), "lean-to-cook-how-to-cook-"));
const upstreamDirectory = join(temporaryDirectory, "upstream");

execFileSync(
  "git",
  ["clone", "--filter=blob:none", "--no-checkout", UPSTREAM_REPOSITORY, upstreamDirectory],
  { stdio: "inherit" },
);
execFileSync("git", ["-C", upstreamDirectory, "checkout", "--detach", UPSTREAM_COMMIT], {
  stdio: "inherit",
});

const upstreamDishesDirectory = join(upstreamDirectory, "dishes");
const targetDishesDirectory = join(contentDirectory, "dishes");

rmSync(targetDishesDirectory, { force: true, recursive: true });
mkdirSync(contentDirectory, { recursive: true });
cpSync(upstreamDishesDirectory, targetDishesDirectory, { recursive: true });
cpSync(join(upstreamDirectory, "LICENSE"), join(contentDirectory, "LICENSE"));

const sourceRecipes = collectMarkdownFiles(targetDishesDirectory)
  .map((markdownPath) => {
    const sourcePath = toPosixPath(relative(contentDirectory, markdownPath));
    const [, categoryDirectory] = sourcePath.split("/");

    if (categoryDirectory === "template") {
      return undefined;
    }

    const category = categoryByDirectory[categoryDirectory as keyof typeof categoryByDirectory];

    if (!category) {
      throw new Error(`Unknown HowToCook category: ${categoryDirectory}`);
    }

    return {
      category,
      id: createHash("sha256").update(sourcePath).digest("hex").slice(0, 12),
      license: "Unlicense" as const,
      sourcePath,
      sourceUrl: encodeURI(
        `https://github.com/Anduin2017/HowToCook/blob/${UPSTREAM_COMMIT}/${sourcePath}`,
      ),
      title: getTitle(markdownPath),
      upstreamCommit: UPSTREAM_COMMIT,
    };
  })
  .filter((recipe) => recipe !== undefined)
  .sort((left, right) => left.sourcePath.localeCompare(right.sourcePath, "zh-CN"));

mkdirSync(dirname(catalogPath), { recursive: true });
writeFileSync(catalogPath, `${JSON.stringify(sourceRecipes, null, 2)}\n`);

console.log(`Synced ${sourceRecipes.length} recipes from HowToCook @ ${UPSTREAM_COMMIT}.`);
rmSync(temporaryDirectory, { force: true, recursive: true });

execFileSync(
  process.execPath,
  [fileURLToPath(new URL("./generate-recipe-thumbnails.ts", import.meta.url))],
  { stdio: "inherit" },
);
