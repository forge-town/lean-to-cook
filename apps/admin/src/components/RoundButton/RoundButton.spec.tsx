import { createRef } from "react";
import { cleanup, fireEvent, render, screen } from "@testing-library/react";
import { afterEach, expect, it, vi } from "vitest";
import { Pencil } from "lucide-react";
import { RoundButton } from "./RoundButton";
const callbacks = { onClick: vi.fn() };
afterEach(cleanup);
it("keeps icon-only actions accessible and forwards focus and disabled behavior", () => {
  const ref = createRef<HTMLButtonElement>();
  const view = render(
    <RoundButton ref={ref} label="编辑" {...callbacks}>
      <Pencil aria-hidden="true" />
    </RoundButton>,
  );
  const button = screen.getByRole("button", { name: "编辑" });
  expect(ref.current).toBe(button);
  expect(button.getAttribute("type")).toBe("button");
  fireEvent.click(button);
  expect(callbacks.onClick).toHaveBeenCalledOnce();
  view.rerender(<RoundButton disabled label="编辑" {...callbacks} />);
  fireEvent.click(screen.getByRole("button", { name: "编辑" }));
  expect(callbacks.onClick).toHaveBeenCalledOnce();
});
