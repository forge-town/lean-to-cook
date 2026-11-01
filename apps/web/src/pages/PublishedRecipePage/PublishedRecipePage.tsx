import { useOne } from "@refinedev/core";
import type { CatalogDetail } from "@repo/schemas/catalog";
export type PublishedRecipePageProps = { id: string };
export const PublishedRecipePage = ({ id }: PublishedRecipePageProps) => {
  const query = useOne<CatalogDetail>({
    resource: "recipes",
    id,
    queryOptions: { retry: false, enabled: globalThis.document !== undefined },
    errorNotification: false,
  });
  const record = query.result;

  return (
    <div className="h-full overflow-y-auto p-6 sm:p-10 [&_article]:mx-auto [&_article]:max-w-3xl [&_h1]:mb-6 [&_h1]:font-display [&_h1]:text-4xl [&_h2]:mb-4 [&_h2]:font-display [&_h2]:text-2xl [&_li]:my-3 [&_ol]:list-decimal [&_ol]:pl-5 [&_p]:my-4 [&_p]:leading-8 [&_section]:mt-9 [&_ul]:list-disc [&_ul]:pl-5">
      {query.query.isLoading ? (
        <p role="status">正在读取菜谱…</p>
      ) : query.query.isError || !record || !("requirements" in record.values) ? (
        <div role="alert">
          <h1>菜谱暂不可查看</h1>
          <p>{query.query.error?.message ?? "这道菜谱尚未发布"}</p>
        </div>
      ) : (
        <article>
          <h1>{record.values.title}</h1>
          {record.values.description && (
            <p className="published-recipe-intro">{record.values.description}</p>
          )}
          {record.values.servings && <p>{record.values.servings} 人份</p>}
          <section>
            <h2>原料与工具</h2>
            <ul>
              {record.values.requirements.map((item, index) => {
                const unit = record.references.find(
                  (r) => r.kind === "unit" && r.id === item.unitId
                );

                return (
                  <li key={index}>
                    <span>
                      {item.label}
                      {item.optional ? "（可选）" : ""}
                    </span>
                    <span>
                      {item.quantityText ||
                        (item.amount === null ? "" : `${item.amount} ${unit?.name ?? ""}`)}
                    </span>
                  </li>
                );
              })}
            </ul>
          </section>
          <section>
            <h2>做法</h2>
            <ol>
              {record.values.steps.map((step, index) => (
                <li key={index}>{step}</li>
              ))}
            </ol>
          </section>
          {record.values.notes && (
            <section>
              <h2>小贴士</h2>
              <p>{record.values.notes}</p>
            </section>
          )}
        </article>
      )}
    </div>
  );
};
