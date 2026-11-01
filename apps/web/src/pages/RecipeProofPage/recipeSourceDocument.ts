export type RecipeSourceLineKind = "bullet" | "image" | "paragraph" | "step" | "subheading";

export interface RecipeSourceLine {
  kind: RecipeSourceLineKind;
  text: string;
}

export interface RecipeSourceSection {
  heading: string;
  lines: RecipeSourceLine[];
}

export interface RecipeSourceDocument {
  introduction: string[];
  sections: RecipeSourceSection[];
}

const cleanInlineMarkdown = (value: string) =>
  value
    .replaceAll(/!\[([^\]]*)\]\([^)]+\)/g, "$1")
    .replaceAll(/\[([^\]]+)\]\([^)]+\)/g, "$1")
    .replaceAll(/[*_`~]/g, "")
    .replace(/^>\s*/, "")
    .trim();

const parseContentLine = (line: string): RecipeSourceLine => {
  const subheadingMatch = line.match(/^#{3,6}\s+(.+)$/);

  if (subheadingMatch?.[1]) {
    return { kind: "subheading", text: cleanInlineMarkdown(subheadingMatch[1]) };
  }

  const numberedImageMatch = line.match(/^\d+[.)、]\s*!\[([^\]]*)\]\([^)]+\)$/);

  if (numberedImageMatch) {
    return { kind: "image", text: cleanInlineMarkdown(numberedImageMatch[1] ?? "") };
  }

  const stepMatch = line.match(/^\d+[.)、]\s*(.+)$/);

  if (stepMatch?.[1]) {
    return { kind: "step", text: cleanInlineMarkdown(stepMatch[1]) };
  }

  const bulletMatch = line.match(/^[-*+]\s+(.+)$/);

  if (bulletMatch?.[1]) {
    return { kind: "bullet", text: cleanInlineMarkdown(bulletMatch[1]) };
  }

  return { kind: "paragraph", text: cleanInlineMarkdown(line) };
};

export const parseRecipeSourceDocument = (markdown: string): RecipeSourceDocument => {
  const document: RecipeSourceDocument = { introduction: [], sections: [] };
  const state: { currentSection: RecipeSourceSection | undefined } = {
    currentSection: undefined,
  };

  for (const rawLine of markdown.split("\n")) {
    const line = rawLine.trim();

    if (!line || /^!\[[^\]]*\]\([^)]+\)$/.test(line)) {
      continue;
    }

    const headingMatch = line.match(/^##\s+(.+)$/);

    if (headingMatch?.[1]) {
      state.currentSection = { heading: cleanInlineMarkdown(headingMatch[1]), lines: [] };
      document.sections.push(state.currentSection);
      continue;
    }

    if (/^#\s+/.test(line)) {
      continue;
    }

    const contentLine = parseContentLine(line);

    if (state.currentSection) {
      state.currentSection.lines.push(contentLine);
    } else if (contentLine.text) {
      document.introduction.push(contentLine.text);
    }
  }

  return document;
};
