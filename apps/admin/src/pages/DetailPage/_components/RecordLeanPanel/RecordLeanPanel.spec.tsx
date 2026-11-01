import { Refine } from "@refinedev/core";
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { RecordLeanPanel } from "./RecordLeanPanel";
import { EditorPageStoreProvider } from "../../../EditorPage/_store";
import {
  editorOptions,
  fixtureProvider,
  fixtureAuth,
  detailFor,
} from "../../../../storybook/fixtures";
afterEach(cleanup);
it("renders the ingredient's actual record identity and pending code separately from its model", async () => {
  const record = detailFor("ingredients");
  render(
    <Refine authProvider={fixtureAuth} dataProvider={fixtureProvider}>
      <EditorPageStoreProvider options={{ ...editorOptions, resource: "ingredients", record }}>
        <RecordLeanPanel record={record} />
      </EditorPageStoreProvider>
    </Refine>,
  );
  const code = await screen.findByLabelText("当前版本 Lean 代码");
  expect(code.textContent).toContain(record.id);
  expect(code.textContent).toContain('name := "西红柿"');
  expect(code.textContent).toContain(record.updatedAt);
  expect(screen.getByText("待校验")).toBeDefined();
  expect(screen.queryByLabelText("来源快照 Lean 证明")).toBeNull();
});
