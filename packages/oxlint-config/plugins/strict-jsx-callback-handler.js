/**
 * @fileoverview Oxlint JS plugin: require JSX on* callbacks to use handle* identifiers.
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

function isTsxFile(filename) {
  return normalizePath(filename).endsWith(".tsx");
}

function isIgnoredFile(filename) {
  const normalized = normalizePath(filename);

  return (
    normalized.includes("/__spec__/") ||
    normalized.includes("/__tests__/") ||
    normalized.includes("/e2e/") ||
    normalized.includes("/routes/api/")
  );
}

function unwrapExpression(node) {
  if (
    node &&
    (node.type === "ChainExpression" ||
      node.type === "TSAsExpression" ||
      node.type === "TSSatisfiesExpression" ||
      node.type === "TSNonNullExpression")
  ) {
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
  return node?.name?.type === "JSXIdentifier" ? node.name.name : "";
}

function isJsxEventPropName(name) {
  return /^on[A-Z0-9]/.test(name);
}

function isHandleName(name) {
  return /^handle[A-Z0-9]/.test(name);
}

function isHandleIdentifier(node) {
  const expression = unwrapExpression(node);

  return expression?.type === "Identifier" && isHandleName(expression.name);
}

function getMemberObjectName(node) {
  const expression = unwrapExpression(node);

  if (expression?.type !== "MemberExpression") {
    return "";
  }

  const object = unwrapExpression(expression.object);

  return object?.type === "Identifier" ? object.name : "";
}

function isHandleMember(node, localObjectNames) {
  const expression = unwrapExpression(node);

  if (expression?.type !== "MemberExpression") {
    return false;
  }

  return (
    isHandleName(getPropertyName(expression.property)) &&
    !localObjectNames.has(getMemberObjectName(expression))
  );
}

function isHandleBindCall(node) {
  const expression = unwrapExpression(node);

  if (expression?.type !== "CallExpression") {
    return false;
  }

  const callee = unwrapExpression(expression.callee);

  if (callee?.type !== "MemberExpression" || getPropertyName(callee.property) !== "bind") {
    return false;
  }

  return isHandleIdentifier(callee.object) || isHandleMember(callee.object, new Set());
}

function isFormHandleSubmitCall(node) {
  const expression = unwrapExpression(node);

  if (expression?.type !== "CallExpression") {
    return false;
  }

  const callee = unwrapExpression(expression.callee);

  return callee?.type === "MemberExpression" && getPropertyName(callee.property) === "handleSubmit";
}

function isReactHookFormFieldCallback(node) {
  const expression = unwrapExpression(node);

  if (expression?.type !== "MemberExpression") {
    return false;
  }

  const object = unwrapExpression(expression.object);
  const propertyName = getPropertyName(expression.property);

  return (
    object?.type === "Identifier" &&
    object.name === "field" &&
    (propertyName === "onChange" || propertyName === "onBlur")
  );
}

function isHandleBindCallWithLocalObjects(node, localObjectNames) {
  const expression = unwrapExpression(node);

  if (expression?.type !== "CallExpression") {
    return false;
  }

  const callee = unwrapExpression(expression.callee);

  if (callee?.type !== "MemberExpression" || getPropertyName(callee.property) !== "bind") {
    return false;
  }

  return isHandleIdentifier(callee.object) || isHandleMember(callee.object, localObjectNames);
}

function isAllowedCallbackExpression(node, localObjectNames) {
  return (
    isHandleIdentifier(node) ||
    isHandleMember(node, localObjectNames) ||
    isHandleBindCallWithLocalObjects(node, localObjectNames) ||
    isFormHandleSubmitCall(node) ||
    isReactHookFormFieldCallback(node)
  );
}

const strictJsxCallbackHandlerRule = {
  meta: {
    type: "problem",
    docs: {
      description:
        "Require JSX on* callbacks to pass handle* directly or handle*.bind, except form helpers",
    },
    messages: {
      invalidCallback:
        "JSX '{{propName}}' callbacks must use handle* or handle*.bind(...). Form handleSubmit and field callbacks are the only exceptions.",
    },
    schema: [],
  },
  create(context) {
    const filename = getFilename(context);

    if (!isTsxFile(filename) || isIgnoredFile(filename)) {
      return {};
    }

    const localObjectNames = new Set();

    return {
      VariableDeclarator(node) {
        if (node.id?.type !== "Identifier") {
          return;
        }

        if (unwrapExpression(node.init)?.type !== "ObjectExpression") {
          return;
        }

        localObjectNames.add(node.id.name);
      },

      JSXAttribute(node) {
        const propName = getJsxAttributeName(node);

        if (!isJsxEventPropName(propName) || node.value?.type !== "JSXExpressionContainer") {
          return;
        }

        if (isAllowedCallbackExpression(node.value.expression, localObjectNames)) {
          return;
        }

        context.report({
          node: node.value,
          messageId: "invalidCallback",
          data: {
            propName,
          },
        });
      },
    };
  },
};

const plugin = {
  meta: {
    name: "template-jsx-callback",
  },
  rules: {
    "strict-jsx-callback-handler": strictJsxCallbackHandlerRule,
  },
};

export default plugin;
