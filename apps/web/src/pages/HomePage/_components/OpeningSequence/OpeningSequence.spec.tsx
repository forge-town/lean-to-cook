// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { OpeningSequence } from "./OpeningSequence";
afterEach(cleanup);
it("keeps the decorative opening out of keyboard and pointer interaction", () => {
  render(<OpeningSequence className="custom-opening" />);
  const opening = screen.getByTestId("home-opening");
  expect(opening.getAttribute("aria-hidden")).toBe("true");
  expect(opening.className).toContain("pointer-events-none");
  expect(opening.className).toContain("motion-reduce:hidden");
  expect(opening.className).toContain("custom-opening");
  expect(opening.querySelector("button, a, input")).toBeNull();
  expect(screen.queryByText("跳过开场")).toBeNull();
});
