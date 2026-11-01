/**
 * @fileoverview Oxlint JS plugin: disallow React effect hooks entirely.
 */

const disallowedEffectHooks = new Set(["useEffect", "useLayoutEffect"]);
const disallowedEffectAliases = new Set(["runClientLayout"]);
const effectHookNamePattern = /^use[A-Za-z0-9]*Effect$/u;

const isDisallowedEffectHookName = (name) => disallowedEffectHooks.has(name) || disallowedEffectAliases.has(name) || effectHookNamePattern.test(name);

const noUseEffectRule = {
  meta: {
    type: "problem",
    docs: {
      description: "Disallow useEffect and useLayoutEffect usage",
    },
    messages: {
      noUseEffect: "Do not use React effect hooks. Move the behavior to store actions, event handlers, route loaders, or explicit subscriptions.",
    },
    schema: [],
  },
  create(context) {
    return {
      Identifier(node) {
        if (!isDisallowedEffectHookName(node.name)) {
          return;
        }

        context.report({
          node,
          messageId: "noUseEffect",
        });
      },

      MemberExpression(node) {
        const property = node.property;

        if (property?.type !== "Identifier" || !isDisallowedEffectHookName(property.name)) {
          if (property?.type !== "Literal" || typeof property.value !== "string" || !isDisallowedEffectHookName(property.value)) {
            return;
          }
        }

        context.report({
          node: property,
          messageId: "noUseEffect",
        });
      },

      Literal(node) {
        if (typeof node.value !== "string" || !isDisallowedEffectHookName(node.value)) {
          return;
        }

        context.report({
          node,
          messageId: "noUseEffect",
        });
      },
    };
  },
};

const plugin = {
  meta: {
    name: "template-effect",
  },
  rules: {
    "no-use-effect": noUseEffectRule,
  },
};

export default plugin;
