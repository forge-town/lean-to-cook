// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, describe, expect, it } from "vitest";
import { Text } from "./Text";

afterEach(cleanup);
describe("Text", () => {
  it("exposes its content through the appropriate accessible role", () => {
    render(<Text>从原料到结论。</Text>);
    expect(screen.getByText("从原料到结论。")).toBeTruthy();
  });
});
