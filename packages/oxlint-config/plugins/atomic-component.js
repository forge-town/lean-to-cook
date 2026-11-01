/**
 * @fileoverview Oxlint JS plugin: enforce atomic React component modules.
 */

function getFilename(context) {
  return (
    context.filename ??
    context.physicalFilename ??
    context.getFilename?.() ??
    context.sourceCode?.filename ??
    ""
  );
}

function normalizePath(filename) {
  return filename.replaceAll("\\", "/");
}

function getPathSegments(filename) {
  return normalizePath(filename).split("/");
}

function getBasename(filename) {
  const segments = getPathSegments(filename);

  return segments.at(-1) ?? "";
}

function removeExtension(filename) {
  return filename.replace(/\.[cm]?[jt]sx?$/, "");
}

function isTsxFile(filename) {
  return normalizePath(filename).endsWith(".tsx");
}

function isPascalCaseName(name) {
  return /^[A-Z][A-Za-z0-9]*$/.test(name);
}

function isIgnoredFile(filename) {
  const normalized = normalizePath(filename);

  return (
    normalized.includes("/__spec__/") ||
    normalized.includes("/__tests__/") ||
    normalized.includes("/e2e/") ||
    normalized.includes("/routes/") ||
    normalized.includes("/_store/") ||
    normalized.includes("/store/") ||
    /\.(?:test|spec|stories)\.tsx$/.test(normalized)
  );
}

function getExpectedComponentName(filename) {
  const fileName = getBasename(filename);
  const moduleName = removeExtension(fileName);

  if (moduleName !== "index") {
    return isPascalCaseName(moduleName) ? moduleName : "";
  }

  const segments = getPathSegments(filename);
  const parentName = segments.at(-2) ?? "";

  return isPascalCaseName(parentName) ? parentName : "";
}

function unwrapExpression(node) {
  if (
    node &&
    (node.type === "ChainExpression" ||
      node.type === "TSAsExpression" ||
      node.type === "TSSatisfiesExpression" ||
      node.type === "TSNonNullExpression" ||
      node.type === "TSInstantiationExpression")
  ) {
    return unwrapExpression(node.expression);
  }

  return node;
}

function getStaticPropertyName(node) {
  if (!node) {
    return "";
  }

  if (node.type === "Identifier") {
    return node.name;
  }

  if (node.type === "Literal") {
    return String(node.value);
  }

  return "";
}

function getCalleeName(callee) {
  const expression = unwrapExpression(callee);

  if (expression?.type === "Identifier") {
    return expression.name;
  }

  if (expression?.type === "MemberExpression") {
    return getStaticPropertyName(expression.property);
  }

  return "";
}

function isComponentWrapperCall(node) {
  const calleeName = getCalleeName(node.callee);

  return calleeName === "memo" || calleeName === "forwardRef";
}

function getFunctionExpression(node) {
  const expression = unwrapExpression(node);

  if (expression?.type === "ArrowFunctionExpression" || expression?.type === "FunctionExpression") {
    return expression;
  }

  if (expression?.type !== "CallExpression" || !isComponentWrapperCall(expression)) {
    return null;
  }

  return getFunctionExpression(expression.arguments?.[0]);
}

function containsJsx(node, seen = new WeakSet()) {
  if (!node || typeof node !== "object") {
    return false;
  }

  if (seen.has(node)) {
    return false;
  }

  seen.add(node);

  if (node.type === "JSXElement" || node.type === "JSXFragment") {
    return true;
  }

  for (const [key, value] of Object.entries(node)) {
    if (key === "parent" || key === "loc" || key === "range" || key === "start" || key === "end") {
      continue;
    }

    if (Array.isArray(value)) {
      if (value.some((item) => containsJsx(item, seen))) {
        return true;
      }

      continue;
    }

    if (containsJsx(value, seen)) {
      return true;
    }
  }

  return false;
}

function functionReturnsJsx(functionNode) {
  const body = unwrapExpression(functionNode.body);

  if (!body) {
    return false;
  }

  if (body.type !== "BlockStatement") {
    return containsJsx(body);
  }

  return body.body.some(
    (statement) => statement.type === "ReturnStatement" && containsJsx(statement.argument),
  );
}

function getDeclarationName(declaration) {
  if (
    declaration?.type === "FunctionDeclaration" ||
    declaration?.type === "TSInterfaceDeclaration" ||
    declaration?.type === "TSTypeAliasDeclaration"
  ) {
    return declaration.id?.name ?? "";
  }

  return "";
}

function getExportSpecifierName(specifier) {
  return specifier.exported?.name ?? specifier.local?.name ?? "";
}

function getExportKind(statement, specifier) {
  if (statement.exportKind === "type" || specifier?.exportKind === "type") {
    return "type";
  }

  if (
    statement.declaration?.type === "TSInterfaceDeclaration" ||
    statement.declaration?.type === "TSTypeAliasDeclaration"
  ) {
    return "type";
  }

  return "value";
}

function collectVariableDeclarations(declaration, declarations) {
  for (const declarator of declaration.declarations ?? []) {
    if (declarator.id?.type !== "Identifier") {
      continue;
    }

    const functionExpression = getFunctionExpression(declarator.init);

    declarations.push({
      name: declarator.id.name,
      node: declarator.id,
      returnsJsx: functionExpression ? functionReturnsJsx(functionExpression) : false,
      type: "variable",
    });
  }
}

function collectLocalDeclarations(program) {
  const declarations = [];

  for (const statement of program.body) {
    const declaration =
      statement.type === "ExportNamedDeclaration" ? statement.declaration : statement;

    if (declaration?.type === "VariableDeclaration") {
      collectVariableDeclarations(declaration, declarations);
      continue;
    }

    const name = getDeclarationName(declaration);

    if (!name) {
      continue;
    }

    declarations.push({
      name,
      node: declaration.id ?? declaration,
      returnsJsx:
        declaration.type === "FunctionDeclaration" ? functionReturnsJsx(declaration) : false,
      type: declaration.type,
    });
  }

  return declarations;
}

function collectLocalExports(program) {
  const exports = [];

  for (const statement of program.body) {
    if (
      statement.type === "ExportDefaultDeclaration" ||
      statement.type === "ExportAllDeclaration"
    ) {
      exports.push({ kind: "value", name: "default", node: statement });
      continue;
    }

    if (statement.type !== "ExportNamedDeclaration" || statement.source) {
      continue;
    }

    if (statement.declaration?.type === "VariableDeclaration") {
      for (const declarator of statement.declaration.declarations ?? []) {
        if (declarator.id?.type === "Identifier") {
          exports.push({ kind: "value", name: declarator.id.name, node: declarator.id });
        }
      }

      continue;
    }

    const declarationName = getDeclarationName(statement.declaration);

    if (declarationName) {
      exports.push({
        kind: getExportKind(statement),
        name: declarationName,
        node: statement.declaration.id ?? statement.declaration,
      });

      continue;
    }

    for (const specifier of statement.specifiers ?? []) {
      const name = getExportSpecifierName(specifier);

      if (name) {
        exports.push({ kind: getExportKind(statement, specifier), name, node: specifier });
      }
    }
  }

  return exports;
}

const atomicComponentRule = {
  meta: {
    type: "problem",
    docs: {
      description: "Require component files to export only their props and same-name JSX component",
    },
    messages: {
      invalidExport:
        "Atomic component files may only export '{{propsName}}' and '{{componentName}}'; remove '{{exportName}}'.",
      missingComponentExport:
        "Atomic component file '{{fileName}}' must export the same-name component '{{componentName}}'.",
      multipleComponentDeclarations:
        "Atomic component file '{{fileName}}' must declare '{{componentName}}' only once.",
      nonJsxComponent: "Exported component '{{componentName}}' must return JSX.",
    },
    schema: [],
  },
  create(context) {
    const filename = getFilename(context);

    if (!isTsxFile(filename) || isIgnoredFile(filename)) {
      return {};
    }

    const componentName = getExpectedComponentName(filename);

    if (!componentName) {
      return {};
    }

    const propsName = `${componentName}Props`;

    return {
      Program(program) {
        const declarations = collectLocalDeclarations(program);
        const localExports = collectLocalExports(program);
        const allowedExportNames = new Set([componentName, propsName]);
        const componentDeclarations = declarations.filter((item) => item.name === componentName);
        const componentExport = localExports.find(
          (item) => item.kind === "value" && item.name === componentName,
        );

        for (const localExport of localExports) {
          if (!allowedExportNames.has(localExport.name)) {
            context.report({
              node: localExport.node,
              messageId: "invalidExport",
              data: {
                componentName,
                exportName: localExport.name,
                propsName,
              },
            });
          }
        }

        if (!componentExport) {
          context.report({
            node: program,
            messageId: "missingComponentExport",
            data: {
              componentName,
              fileName: getBasename(filename),
            },
          });
        }

        if (componentDeclarations.length > 1) {
          context.report({
            node: componentDeclarations[1].node,
            messageId: "multipleComponentDeclarations",
            data: {
              componentName,
              fileName: getBasename(filename),
            },
          });
        }

        if (componentExport && !componentDeclarations.some((item) => item.returnsJsx)) {
          context.report({
            node: componentExport.node,
            messageId: "nonJsxComponent",
            data: {
              componentName,
            },
          });
        }
      },
    };
  },
};

const plugin = {
  meta: {
    name: "template-component",
  },
  rules: {
    "atomic-component": atomicComponentRule,
  },
};

export default plugin;
