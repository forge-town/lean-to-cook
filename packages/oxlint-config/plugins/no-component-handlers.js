/**
 * @fileoverview Oxlint JS plugin: prefer store-defined handle callbacks over component-local handlers.
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

function isTsOrTsxFile(filename) {
  return /\.[cm]?tsx?$/.test(normalizePath(filename));
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

function isHandleName(name) {
  return /^handle[A-Z0-9]/.test(name);
}

function unwrapExpression(node) {
  if (node && (node.type === "ChainExpression" || node.type === "TSAsExpression" || node.type === "TSSatisfiesExpression" || node.type === "TSNonNullExpression")) {
    return unwrapExpression(node.expression);
  }

  return node;
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

function isStoreHookCall(node) {
  const expression = unwrapExpression(node);

  if (expression?.type !== "CallExpression") {
    return false;
  }

  const calleeName = getCalleeName(expression.callee);

  if (/^use[A-Z].*Store$/.test(calleeName)) {
    return true;
  }

  if (calleeName !== "useStore") {
    return false;
  }

  const storeArgument = unwrapExpression(expression.arguments?.[0]);

  return storeArgument?.type === "Identifier" && /(?:store|Store)$/.test(storeArgument.name);
}

function isUseStoreSelectorCall(node, handleName) {
  const expression = unwrapExpression(node);

  if (!isStoreHookCall(expression)) {
    return false;
  }

  const calleeName = getCalleeName(expression.callee);
  const selector = calleeName === "useStore" ? expression.arguments?.[1] : expression.arguments?.[0];
  const selectorExpression = unwrapExpression(selector);

  if (selectorExpression?.type !== "ArrowFunctionExpression" && selectorExpression?.type !== "FunctionExpression") {
    return false;
  }

  const body = unwrapExpression(selectorExpression.body);

  if (!isHandleName(handleName)) {
    return false;
  }

  if (isMemberExpressionForHandle(body, handleName)) {
    return true;
  }

  const selectedHandleName = getPropertyName(body?.property);

  return isHandleName(selectedHandleName);
}

function getPropertyName(node) {
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

function isMemberExpressionForHandle(node, handleName) {
  const expression = unwrapExpression(node);

  return expression?.type === "MemberExpression" && getPropertyName(expression.property) === handleName;
}

function isAllowedStoreObjectPattern(id, init) {
  if (id.type !== "ObjectPattern") {
    return false;
  }

  return isStoreHookCall(init);
}

function isAllowedStoreIdentifier(id, init) {
  if (id.type !== "Identifier") {
    return false;
  }

  return isUseStoreSelectorCall(init, id.name);
}

function getBoundIdentifierName(node) {
  const expression = unwrapExpression(node);

  if (expression?.type === "Identifier") {
    return expression.name;
  }

  if (expression?.type === "AssignmentPattern" && expression.left.type === "Identifier") {
    return expression.left.name;
  }

  return "";
}

function reportIdentifier(context, node, name) {
  if (!isHandleName(name)) {
    return;
  }

  context.report({
    node,
    messageId: "componentHandler",
    data: {
      name,
    },
  });
}

function isFunctionExpression(node) {
  const expression = unwrapExpression(node);

  return expression?.type === "ArrowFunctionExpression" || expression?.type === "FunctionExpression";
}

function getFunctionExpression(node) {
  const expression = unwrapExpression(node);

  if (isFunctionExpression(expression)) {
    return expression;
  }

  if (expression?.type !== "CallExpression") {
    return null;
  }

  if (getCalleeName(expression.callee) !== "useCallback") {
    return null;
  }

  const callback = unwrapExpression(expression.arguments?.[0]);

  return isFunctionExpression(callback) ? callback : null;
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

function getHandleFunctionName(node) {
  if (node.type === "FunctionDeclaration") {
    return node.id?.name ?? "";
  }

  if (node.type === "VariableDeclarator" && node.id.type === "Identifier" && getFunctionExpression(node.init)) {
    return node.id.name;
  }

  if (node.type === "Property" && getFunctionExpression(node.value)) {
    return getStaticPropertyName(node.key);
  }

  return "";
}

function reportHandleReturnFunction(context, node, name) {
  context.report({
    node,
    messageId: "handleReturnFunction",
    data: {
      name,
    },
  });
}

function checkFunctionReturnsFunction(context, functionNode, reportNode, name) {
  if (!isHandleName(name)) {
    return;
  }

  const body = unwrapExpression(functionNode.body);

  if (isFunctionExpression(body)) {
    reportHandleReturnFunction(context, reportNode, name);

    return;
  }

  if (body?.type !== "BlockStatement") {
    return;
  }

  for (const statement of body.body ?? []) {
    if (statement.type === "ReturnStatement" && isFunctionExpression(statement.argument)) {
      reportHandleReturnFunction(context, statement.argument, name);
    }
  }
}

const noComponentHandlersRule = {
  meta: {
    type: "problem",
    docs: {
      description: "Disallow component-local handle callbacks; handlers should be defined in stores",
    },
    messages: {
      componentHandler: "Do not define '{{name}}' in a component. Define it in the page/component store and read it through useStore.",
    },
    schema: [],
  },
  create(context) {
    const filename = getFilename(context);

    if (!isTsxFile(filename) || isIgnoredFile(filename)) {
      return {};
    }

    return {
      FunctionDeclaration(node) {
        if (node.id?.name) {
          reportIdentifier(context, node.id, node.id.name);
        }
      },

      VariableDeclarator(node) {
        if (isAllowedStoreObjectPattern(node.id, node.init)) {
          return;
        }

        if (isAllowedStoreIdentifier(node.id, node.init)) {
          return;
        }

        if (node.id.type === "Identifier") {
          reportIdentifier(context, node.id, node.id.name);

          return;
        }

        if (node.id.type !== "ObjectPattern") {
          return;
        }

        for (const property of node.id.properties ?? []) {
          if (property.type !== "Property") {
            continue;
          }

          const boundName = getBoundIdentifierName(property.value);

          if (boundName) {
            reportIdentifier(context, property.value, boundName);
          }
        }
      },
    };
  },
};

const noHandleReturnFunctionRule = {
  meta: {
    type: "problem",
    docs: {
      description: "Disallow handle callbacks from returning another function",
    },
    messages: {
      handleReturnFunction: "Do not return a function from '{{name}}'. Pass arguments with .bind in JSX instead.",
    },
    schema: [],
  },
  create(context) {
    const filename = getFilename(context);

    if (!isTsOrTsxFile(filename)) {
      return {};
    }

    return {
      FunctionDeclaration(node) {
        const name = getHandleFunctionName(node);
        checkFunctionReturnsFunction(context, node, node.id ?? node, name);
      },

      VariableDeclarator(node) {
        const name = getHandleFunctionName(node);
        const functionExpression = getFunctionExpression(node.init);

        if (name && functionExpression) {
          checkFunctionReturnsFunction(context, functionExpression, node.id, name);
        }
      },

      Property(node) {
        const name = getHandleFunctionName(node);
        const functionExpression = getFunctionExpression(node.value);

        if (name && functionExpression) {
          checkFunctionReturnsFunction(context, functionExpression, node.key, name);
        }
      },
    };
  },
};

const plugin = {
  meta: {
    name: "template-store",
  },
  rules: {
    "no-component-handlers": noComponentHandlersRule,
    "no-handle-return-function": noHandleReturnFunctionRule,
  },
};

export default plugin;
