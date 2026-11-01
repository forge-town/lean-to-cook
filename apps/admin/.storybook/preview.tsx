import type { Preview } from "@storybook/react-vite";
import { Refine } from "@refinedev/core";
import { fixtureProvider, fixtureAuth } from "../src/storybook/fixtures";
import "../src/styles.css";
export default { decorators: [(Story) => <Refine authProvider={fixtureAuth} dataProvider={fixtureProvider} options={{ disableTelemetry: true }}><div style={{ padding: 24 }}><Story /></div></Refine>], parameters: { layout: "fullscreen" } } satisfies Preview;
