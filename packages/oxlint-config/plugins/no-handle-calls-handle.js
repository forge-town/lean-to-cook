/**
 * @fileoverview Oxlint JS plugin: disallow handle callbacks from calling other handle callbacks.
 */

function getFilename(context) {
  return context.filename ?? context.physicalFilename ?? context.getFilename?.() ?? context.sourceCode?.filename ?? "";
}

function normalizePath(filename) {
  return filename.replaceAll("\\", "/");
}

function isTsxFile(filename) {
  return normalizePath(filename).endsWith(".tsx");
}

function isIgnoredFile(filename) {
  const normalized = normalizePath(filename);

  return (
    normalized.includes("/__spec__/") ||
    normalized.includes("/__tests__/") ||
    normalized.includes("/e2e/") ||
    normalized.includes("/routes/api/") ||
    normalized.includes("/_store/") ||
    normalized.includes("/store/") ||
    /(?:^|\/)[A-Za-z0-9]+Store\.[cm]?tsx?$/.test(normalized) ||
    /(?:^|\/)[A-Za-z0-9]+Slice\.[cm]?tsx?$/.test(normalized)
  );
}

function unwrapExpression(node) {
  if (node && (node.type === "ChainExpression" || node.type === "TSAsExpression" || node.type === "TSSatisfiesExpression" || node.type === "TSNonNullExpression")) {
    return unwrapExpression(node.expression);
  }

  return node;
}

function isHandleName(name) {
  return /^handle[A-Z0-9]/.test(name);
}

function getCalleeName(callee) {
  const expression = unwrapExpression(callee);

  if (expression?.type === "Identifier") {
    return expression.name;
  }

  if (expression?.type === "MemberExpression") {
    if (expression.property?.type === "Identifier") {
      return expression.property.name;
    }

    if (expression.property?.type === "Literal") {
      return String(expression.property.value);
    }
  }

  return "";
}

const noHandleCallsHandleRule = {
  meta: {
    type: "problem",
    docs: {
      description: "Disallow handle callbacks from calling other handle callbacks",
    },
    messages: {
      noHandleCall: "Do not call '{{name}}' inside a handle function. Move the shared behavior into a non-handle helper.",
    },
    schema: [],
  },
  create(context) {
    const filename = getFilename(context);

    if (!isTsxFile(filename) || isIgnoredFile(filename)) {
      return {};
    }

    const functionNames = new WeakMap();
    const handleFunctionStack = [];

    function enterFunction(node) {
      const functionName = node.id?.name ?? functionNames.get(node) ?? "";
      handleFunctionStack.push(isHandleName(functionName));
    }

    function exitFunction() {
      handleFunctionStack.pop();
    }

    return {
      VariableDeclarator(node) {
        if (node.id.type === "Identifier" && (node.init?.type === "ArrowFunctionExpression" || node.init?.type === "FunctionExpression")) {
          functionNames.set(node.init, node.id.name);
        }
      },

      FunctionDeclaration: enterFunction,
      "FunctionDeclaration:exit": exitFunction,
      FunctionExpression: enterFunction,
      "FunctionExpression:exit": exitFunction,
      ArrowFunctionExpression: enterFunction,
      "ArrowFunctionExpression:exit": exitFunction,

      CallExpression(node) {
        if (!handleFunctionStack.at(-1)) {
          return;
        }

        const calleeName = getCalleeName(node.callee);

        if (!isHandleName(calleeName)) {
          return;
        }

        context.report({
          node: node.callee,
          messageId: "noHandleCall",
          data: {
            name: calleeName,
          },
        });
      },
    };
  },
};

const plugin = {
  meta: {
    name: "template-handle-call",
  },
  rules: {
    "no-handle-calls-handle": noHandleCallsHandleRule,
  },
};

export default plugin;
