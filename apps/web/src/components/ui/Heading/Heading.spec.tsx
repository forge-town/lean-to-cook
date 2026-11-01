// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, describe, expect, it } from "vitest";
import { Heading } from "./Heading";

afterEach(cleanup);
describe("Heading", () => {
  it("exposes its content through the appropriate accessible role", () => {
    render(<Heading>厨房里的定义</Heading>);
    expect(screen.getByRole("heading", { name: "厨房里的定义", level: 1 })).toBeTruthy();
  });
});
