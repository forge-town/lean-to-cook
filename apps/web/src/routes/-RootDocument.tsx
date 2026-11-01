import { AppShellStoreProvider } from "../components/AppShell/_store/AppShellStoreProvider";
import { AppShell } from "../components/AppShell";
import { PublicCatalog } from "../components/PublicCatalog";
import { Outlet, HeadContent, Scripts } from "@tanstack/react-router";

export const RootDocument = () => {
  return (
    <html lang="zh-CN">
      <head>
        <HeadContent />
      </head>
      <body className="h-dvh min-w-80 overflow-hidden bg-paper font-sans text-ink antialiased">
        <PublicCatalog>
          <AppShellStoreProvider>
            <AppShell>
              <Outlet />
            </AppShell>
          </AppShellStoreProvider>
        </PublicCatalog>
        <Scripts />
      </body>
    </html>
  );
};
