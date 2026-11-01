/**
 * @fileoverview Oxlint JS plugin: require JSX handler names to end with the event prop verb.
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

  return normalized.includes("/__spec__/") || normalized.includes("/__tests__/") || normalized.includes("/e2e/") || normalized.includes("/routes/api/");
}

function unwrapExpression(node) {
  if (node && (node.type === "ChainExpression" || node.type === "TSAsExpression" || node.type === "TSSatisfiesExpression" || node.type === "TSNonNullExpression")) {
    return unwrapExpression(node.expression);
  }

  return node;
}

function getPropertyName(node) {
  if (!node) {
    return "";
  }

  if (node.type === "Identifier" || node.type === "JSXIdentifier") {
    return node.name;
  }

  if (node.type === "Literal") {
    return String(node.value);
  }

  return "";
}

function getJsxAttributeName(node) {
  if (node?.name?.type === "JSXIdentifier") {
    return node.name.name;
  }

  return "";
}

function getMemberPropertyName(node) {
  const expression = unwrapExpression(node);

  return expression?.type === "MemberExpression" ? getPropertyName(expression.property) : "";
}

function getHandlerNameFromExpression(node) {
  const expression = unwrapExpression(node);

  if (!expression) {
    return "";
  }

  if (expression.type === "Identifier") {
    return expression.name;
  }

  if (expression.type === "MemberExpression") {
    return getPropertyName(expression.property);
  }

  if (expression.type !== "CallExpression") {
    return "";
  }

  if (getMemberPropertyName(expression.callee) !== "bind") {
    return "";
  }

  const boundTarget = unwrapExpression(expression.callee.object);

  if (boundTarget?.type === "Identifier") {
    return boundTarget.name;
  }

  if (boundTarget?.type === "MemberExpression") {
    return getPropertyName(boundTarget.property);
  }

  return "";
}

function getHandlerName(node) {
  if (!node?.value || node.value.type !== "JSXExpressionContainer") {
    return "";
  }

  return getHandlerNameFromExpression(node.value.expression);
}

function isJsxEventProp(name) {
  return /^on[A-Z0-9]/.test(name);
}

function isHandleName(name) {
  return /^handle[A-Z0-9]/.test(name);
}

const strictJsxHandlerVerbRule = {
  meta: {
    type: "problem",
    docs: {
      description: "Require JSX handle names to end with the exact event prop verb",
    },
    messages: {
      mismatchedVerb: "'{{handlerName}}' passed to '{{propName}}' must end with '{{expectedSuffix}}'. Rename it to end with the exact event verb.",
    },
    schema: [],
  },
  create(context) {
    const filename = getFilename(context);

    if (!isTsxFile(filename) || isIgnoredFile(filename)) {
      return {};
    }

    return {
      JSXAttribute(node) {
        const propName = getJsxAttributeName(node);

        if (!isJsxEventProp(propName)) {
          return;
        }

        const handlerName = getHandlerName(node);

        if (!isHandleName(handlerName)) {
          return;
        }

        const expectedSuffix = propName.slice(2);

        if (handlerName.endsWith(expectedSuffix)) {
          return;
        }

        context.report({
          node: node.value ?? node,
          messageId: "mismatchedVerb",
          data: {
            expectedSuffix,
            handlerName,
            propName,
          },
        });
      },
    };
  },
};

const plugin = {
  meta: {
    name: "template-handler-verb",
  },
  rules: {
    "strict-jsx-handler-verb": strictJsxHandlerVerbRule,
  },
};

export default plugin;
