import { cleanup, fireEvent, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { NumericField } from "./NumericField";
import { EditorPageStoreProvider } from "../../pages/EditorPage/_store";
import { EditorStoryForm } from "../../storybook/EditorStoryForm";
import { editorOptions } from "../../storybook/fixtures";
afterEach(cleanup);
it("should retain a temporary decimal draft and report its invalid final value on blur", async () => {
  render(
    <EditorPageStoreProvider options={editorOptions}>
      <EditorStoryForm>
        <NumericField label="数量" mode="decimal" name="requirements.0.amount" />
      </EditorStoryForm>
    </EditorPageStoreProvider>,
  );
  const input = screen.getByLabelText("数量");
  fireEvent.change(input, { target: { value: "0." } });
  expect((input as HTMLInputElement).value).toBe("0.");
  expect(screen.queryByText(/数量需/)).toBeNull();
  fireEvent.blur(input);
  expect(await screen.findByText("数量需为普通十进制数字，最多六位小数")).toBeDefined();
  fireEvent.change(input, { target: { value: "0.000001" } });
  fireEvent.blur(input);
  expect(screen.queryByText(/数量需/)).toBeNull();
  expect((input as HTMLInputElement).value).toBe("0.000001");
});
