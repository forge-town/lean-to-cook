/**
 * @fileoverview Oxlint JS plugin: enforce atomic schema modules.
 */

function getFilename(context) {
  return context.filename ?? context.physicalFilename ?? context.getFilename?.() ?? context.sourceCode?.filename ?? "";
}

function normalizePath(filename) {
  return filename.replaceAll("\\", "/");
}

function getBasename(filename) {
  const normalized = normalizePath(filename);
  const segments = normalized.split("/");

  return segments.at(-1) ?? "";
}

function removeExtension(filename) {
  return filename.replace(/\.[cm]?[jt]sx?$/, "");
}

function isDbSchemaFile(filename) {
  const normalized = normalizePath(filename);

  return normalized.includes("/packages/db/src/schema") || normalized.includes("/packages/db/src/schemas/");
}

function isSchemaFile(filename) {
  const normalized = normalizePath(filename);

  if (isDbSchemaFile(normalized)) {
    return false;
  }

  return normalized.includes("/packages/schemas/src/") || normalized.includes("/schemas/") || normalized.endsWith("/schema.ts") || normalized.endsWith("/schema.tsx");
}

function isSchemasDirectoryFile(filename) {
  const normalized = normalizePath(filename);

  return !isDbSchemaFile(normalized) && !normalized.includes("/packages/schemas/src/") && normalized.includes("/schemas/");
}

function isSchemaModuleFileName(fileName) {
  return /^[A-Z][A-Za-z0-9]*Schemas\.[cm]?[jt]sx?$/.test(fileName);
}

function isAtomicSchemaFileName(fileName) {
  return /^[A-Z][A-Za-z0-9]*\.schema\.[cm]?[jt]sx?$/.test(fileName);
}

function isIndexFileName(fileName) {
  return /^index\.[cm]?[jt]sx?$/.test(fileName);
}

function isExportOnlyStatement(statement) {
  return statement.type === "ExportAllDeclaration" || (statement.type === "ExportNamedDeclaration" && Boolean(statement.source));
}

function getNonExportOnlyStatement(program) {
  return program.body.find((statement) => {
    if (statement.type === "EmptyStatement") {
      return false;
    }

    return !isExportOnlyStatement(statement);
  });
}

function getDeclarationNames(declaration) {
  if (!declaration) {
    return [];
  }

  if (
    declaration.type === "TSTypeAliasDeclaration" ||
    declaration.type === "TSInterfaceDeclaration" ||
    declaration.type === "TSEnumDeclaration" ||
    declaration.type === "FunctionDeclaration" ||
    declaration.type === "ClassDeclaration"
  ) {
    return declaration.id?.name ? [declaration.id.name] : [];
  }

  if (declaration.type !== "VariableDeclaration") {
    return [];
  }

  return declaration.declarations
    .map((item) => item.id)
    .filter((id) => id?.type === "Identifier")
    .map((id) => id.name);
}

function getExportSpecifierName(specifier) {
  return specifier.exported?.name ?? specifier.local?.name ?? null;
}

function getDeclarationKind(declaration) {
  if (declaration?.type === "TSTypeAliasDeclaration" || declaration?.type === "TSInterfaceDeclaration") {
    return "type";
  }

  return "value";
}

function getLocalExports(program) {
  const localExports = [];

  for (const statement of program.body) {
    if (statement.type === "ExportDefaultDeclaration") {
      localExports.push({ kind: "value", name: "default", node: statement });
      continue;
    }

    if (statement.type !== "ExportNamedDeclaration") {
      continue;
    }

    if (statement.source) {
      continue;
    }

    const declarationKind = getDeclarationKind(statement.declaration);
    const declarationNames = getDeclarationNames(statement.declaration);

    for (const name of declarationNames) {
      localExports.push({ kind: declarationKind, name, node: statement.declaration ?? statement });
    }

    if (declarationNames.length > 0) {
      continue;
    }

    for (const specifier of statement.specifiers ?? []) {
      const name = getExportSpecifierName(specifier);

      if (name) {
        localExports.push({ kind: "value", name, node: specifier });
      }
    }
  }

  return localExports;
}

function getLocalValueExports(localExports) {
  return localExports.filter((item) => item.kind === "value");
}

function isZodImportSource(value) {
  return value === "zod" || value === "zod/v4";
}

function getZodImportNames(program) {
  const names = new Set();

  for (const statement of program.body) {
    if (statement.type !== "ImportDeclaration") {
      continue;
    }

    if (!isZodImportSource(statement.source?.value)) {
      continue;
    }

    for (const specifier of statement.specifiers ?? []) {
      if (specifier.local?.name) {
        names.add(specifier.local.name);
      }
    }
  }

  return names;
}

function getVariableInitializers(program, names) {
  const initializers = [];

  for (const statement of program.body) {
    const declaration = statement.type === "ExportNamedDeclaration" ? statement.declaration : statement;

    if (declaration?.type !== "VariableDeclaration") {
      continue;
    }

    for (const declarator of declaration.declarations ?? []) {
      if (declarator.id?.type === "Identifier" && names.has(declarator.id.name) && declarator.init) {
        initializers.push(declarator.init);
      }
    }
  }

  return initializers;
}

function nodeReferencesAnyName(node, names, seen = new WeakSet()) {
  if (!node || typeof node !== "object") {
    return false;
  }

  if (seen.has(node)) {
    return false;
  }

  seen.add(node);

  if (node.type === "Identifier" && names.has(node.name)) {
    return true;
  }

  for (const [key, value] of Object.entries(node)) {
    if (key === "parent" || key === "loc" || key === "range" || key === "start" || key === "end") {
      continue;
    }

    if (Array.isArray(value)) {
      if (value.some((item) => nodeReferencesAnyName(item, names, seen))) {
        return true;
      }

      continue;
    }

    if (nodeReferencesAnyName(value, names, seen)) {
      return true;
    }
  }

  return false;
}

function hasZodSchemaDefinition(program, schemaValueExports) {
  const zodImportNames = getZodImportNames(program);

  if (zodImportNames.size === 0) {
    return false;
  }

  const schemaNames = new Set(schemaValueExports.map((item) => item.name));
  const initializers = getVariableInitializers(program, schemaNames);

  return initializers.some((initializer) => nodeReferencesAnyName(initializer, zodImportNames));
}

function isCompanionTypeName(typeName, valueName) {
  if (valueName.endsWith("Schema") && typeName === valueName.slice(0, -"Schema".length)) {
    return true;
  }

  if (valueName.endsWith("Schema")) {
    const baseName = valueName.slice(0, -"Schema".length);
    const pascalBaseName = `${baseName.charAt(0).toUpperCase()}${baseName.slice(1)}`;

    if (typeName === pascalBaseName) {
      return true;
    }
  }

  if (valueName.endsWith("Enum") && typeName === valueName.slice(0, -"Enum".length)) {
    return true;
  }

  if (typeName === `${valueName}Type`) {
    return true;
  }

  return false;
}

function getPrimaryExportNames(localExports) {
  const valueExportNames = localExports
    .filter((item) => item.kind === "value")
    .filter((item) => !/^[A-Z0-9_]+$/.test(item.name))
    .map((item) => item.name);
  const primaryNames = new Set(valueExportNames);

  for (const item of localExports) {
    if (item.kind !== "type") {
      continue;
    }

    const isCompanionType = valueExportNames.some((valueName) => isCompanionTypeName(item.name, valueName));

    if (!isCompanionType) {
      primaryNames.add(item.name);
    }
  }

  return [...primaryNames];
}

const atomicSchemaRule = {
  meta: {
    type: "problem",
    docs: {
      description: "Require schema concepts to live in atomic schema modules",
    },
    messages: {
      indexHasLocalExports: "Schema index files must only re-export atomic schema modules; move local declarations into their own file.",
      schemaFileName: "Do not declare schema concepts in a generic schema.ts file; move each concept into schemas/<ConceptName>.schema.ts.",
      invalidSchemaFileName: "Files inside schemas/ must be named Xxx.schema.ts, index.ts, or XxxSchemas.ts.",
      moduleHasLocalDeclarations: "Schema module files must only re-export atomic schema files.",
      mismatchedExport: "Schema module '{{fileName}}' must be atomic; move '{{exportName}}' into its own schema module.",
      missingZodSchema: "Atomic schema files must export exactly one zod schema value named XxxSchema.",
      missingZodImport: "Atomic schema files must define the exported XxxSchema value with zod.",
    },
    schema: [],
  },
  create(context) {
    const filename = getFilename(context);

    if (!isSchemaFile(filename)) {
      return {};
    }

    const fileName = getBasename(filename);
    const moduleName = removeExtension(fileName);
    const isSchemasFile = isSchemasDirectoryFile(filename);

    return {
      Program(program) {
        if (isSchemasFile) {
          if (isIndexFileName(fileName) || isSchemaModuleFileName(fileName)) {
            const nonExportOnlyStatement = getNonExportOnlyStatement(program);

            if (nonExportOnlyStatement) {
              context.report({
                node: nonExportOnlyStatement,
                messageId: "moduleHasLocalDeclarations",
              });
            }
            return;
          }

          if (!isAtomicSchemaFileName(fileName)) {
            context.report({
              node: program,
              messageId: "invalidSchemaFileName",
            });
            return;
          }
        }

        const localExports = getLocalExports(program);

        if (localExports.length === 0) {
          return;
        }

        if (moduleName === "index") {
          context.report({
            node: localExports[0].node,
            messageId: "indexHasLocalExports",
          });
          return;
        }

        if (moduleName === "schema") {
          context.report({
            node: localExports[0].node,
            messageId: "schemaFileName",
          });
          return;
        }

        const primaryExportNames = getPrimaryExportNames(localExports);
        const localValueExports = getLocalValueExports(localExports);

        if (primaryExportNames.length > 1) {
          const invalidExport = localExports.find((item) => item.name === primaryExportNames[1]);

          context.report({
            node: invalidExport?.node ?? localExports[0].node,
            messageId: "mismatchedExport",
            data: {
              exportName: primaryExportNames[1],
              fileName,
            },
          });
        }

        if (isSchemasFile && isAtomicSchemaFileName(fileName)) {
          const schemaValueExports = localValueExports.filter((item) => item.name.endsWith("Schema"));

          if (schemaValueExports.length !== 1) {
            context.report({
              node: localExports[0]?.node ?? program,
              messageId: "missingZodSchema",
            });
          }

          if (!hasZodSchemaDefinition(program, schemaValueExports)) {
            context.report({
              node: localExports[0]?.node ?? program,
              messageId: "missingZodImport",
            });
          }
        }
      },
    };
  },
};

const plugin = {
  meta: {
    name: "template-schema",
  },
  rules: {
    "atomic-schema": atomicSchemaRule,
  },
};

export default plugin;
