/**
 * @fileoverview Oxlint JS plugin: Disallow direct process.env usage outside env integrations.
 */

function getFilename(context) {
  return context.filename ?? context.physicalFilename ?? context.getFilename?.() ?? context.sourceCode?.filename ?? "";
}

function isProcessEnvMember(node) {
  return node.object?.type === "Identifier" && node.object.name === "process" && node.property?.type === "Identifier" && node.property.name === "env";
}

function isAllowedIntegrationFile(filename) {
  const normalized = filename.replaceAll("\\", "/");

  return normalized.includes("/src/integrations/env/") || normalized.includes("/src/integrations/server-env/");
}

const noProcessEnvOutsideIntegrationRule = {
  meta: {
    type: "problem",
    docs: {
      description: "Disallow direct process.env usage outside env integration modules",
    },
    messages: {
      noProcessEnv: "process.env must go through src/integrations/env or src/integrations/server-env instead of being read directly.",
    },
    schema: [],
  },
  create(context) {
    const filename = getFilename(context);

    if (isAllowedIntegrationFile(filename)) {
      return {};
    }

    return {
      MemberExpression(node) {
        if (!isProcessEnvMember(node)) {
          return;
        }

        context.report({
          node,
          messageId: "noProcessEnv",
        });
      },
    };
  },
};

const plugin = {
  meta: {
    name: "template-env",
  },
  rules: {
    "no-process-env-outside-integration": noProcessEnvOutsideIntegrationRule,
  },
};

export default plugin;
