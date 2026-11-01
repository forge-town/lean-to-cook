import { kitchenTheoryCatalog } from "@repo/schemas";

import { TheoryLibraryPageStoreProvider } from "./_store";
import { TheoryLibraryPageContent } from "./TheoryLibraryPageContent";

const lastStageByTheoryId = Object.fromEntries(
  kitchenTheoryCatalog.map((document) => [document.id, document.reductions.length + 1])
);

export const TheoryLibraryPage = () => (
  <TheoryLibraryPageStoreProvider
    initialTheoryId={kitchenTheoryCatalog[0].id}
    lastStageByTheoryId={lastStageByTheoryId}
  >
    <TheoryLibraryPageContent />
  </TheoryLibraryPageStoreProvider>
);
