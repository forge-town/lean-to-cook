import { pageSizes } from "../../../../lib/pageSizes";
import { useList } from "@refinedev/core";
import { useForm } from "react-hook-form";
import { Form } from "@repo/ui/form";
import { Button } from "@repo/ui/button";
import { Select, SelectTrigger, SelectValue, SelectContent, SelectItem } from "@repo/ui/select";
import type { CatalogRow } from "@repo/schemas/catalog";
import { RecordTable } from "../../../../components/RecordTable";
import { TextField } from "../../../../components/TextField";
import { ReferenceField } from "../../../../components/ReferenceField";
import { Typography } from "../../../../components/ui/Typography";
import { Anchor } from "../../../../components/ui/Anchor";
import { SurfaceForm } from "../../../../components/ui/SurfaceForm";
import { resources, type AdminLocation } from "../../../../lib/resources";
import { catalogHref } from "../../../../lib/navigation";
import { useListPageStore } from "../../_store";
export const ListPageContent = ({ location }: { location: AdminLocation }) => {
  const formControl = useListPageStore((s) => s.formControl);
  const handleFilterFormSubmit = useListPageStore((s) => s.handleFilterFormSubmit);
  const handlePageSizeValueChange = useListPageStore((s) => s.handlePageSizeValueChange);
  const form = useForm({ formControl: formControl.formControl });
  const query = useList<CatalogRow>({
    resource: location.resource,
    pagination: { currentPage: location.page, pageSize: location.pageSize },
    filters: [
      { field: "q", operator: "contains", value: location.search },
      ...(location.categoryId
        ? [{ field: "categoryId", operator: "eq" as const, value: location.categoryId }]
        : []),
    ],
    queryOptions: { retry: false },
  });
  const { result } = query;
  const info = resources.find((r) => r.name === location.resource)!;
  const pages = Math.max(1, Math.ceil((result.total ?? 0) / location.pageSize));
  const outOfRange = query.query.isSuccess && location.page > pages;
  const loading = query.query.isFetching || query.query.isLoading || outOfRange;
  const pageHref = (page: number) =>
    catalogHref(location.resource, {
      page,
      pageSize: location.pageSize,
      q: location.search,
      categoryId: location.categoryId,
    });
  const resetHref = catalogHref(location.resource, { pageSize: location.pageSize });
  const hasCategory = location.resource === "recipes" || location.resource === "ingredients";

  return (
    <div className="list-content">
      <Form {...form}>
        <SurfaceForm
          className={hasCategory ? "filter-bar" : "filter-bar filter-bar-simple"}
          onSubmit={form.handleSubmit(handleFilterFormSubmit)}
        >
          <TextField
            label="搜索"
            name="search"
            placeholder={
              location.resource === "ingredients" ? "搜索食材名称或别名" : `搜索${info.label}名称`
            }
          />
          {hasCategory && (
            <ReferenceField
              label="分类"
              name="categoryId"
              resource={
                location.resource === "recipes" ? "recipe-categories" : "ingredient-categories"
              }
            />
          )}
          <Button type="submit" variant="outline">
            筛选
          </Button>
          <Anchor className="reset-link" href={resetHref}>
            清空筛选
          </Anchor>
        </SurfaceForm>
      </Form>
      <div className="table-results">
        <RecordTable
          error={query.query.isError ? query.query.error.message : undefined}
          filtered={!!(location.search || location.categoryId)}
          loading={loading}
          resetHref={resetHref}
          resource={location.resource}
          retryHref={pageHref(location.page)}
          rows={result.data}
          skeletonRows={location.pageSize}
        />
        <div aria-label="列表分页" className="pagination">
          <Typography className="helper">
            共 {query.query.isSuccess ? result.total : "—"} 条 · 第{" "}
            {outOfRange ? pages : location.page} / {pages} 页
          </Typography>
          <div className="button-row">
            <Select
              items={pageSizes.map((size) => ({ value: String(size), label: `${size} 条 / 页` }))}
              value={String(location.pageSize)}
              onValueChange={handlePageSizeValueChange}
            >
              <SelectTrigger aria-label="每页条数">
                <SelectValue />
              </SelectTrigger>
              <SelectContent>
                {pageSizes.map((size) => (
                  <SelectItem key={size} value={String(size)}>
                    {size} 条 / 页
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
            {!loading && !query.query.isError && location.page > 1 ? (
              <Anchor className="quiet-button" href={pageHref(location.page - 1)}>
                上一页
              </Anchor>
            ) : (
              <Button disabled variant="ghost">
                上一页
              </Button>
            )}
            {!loading && !query.query.isError && location.page < pages ? (
              <Anchor className="quiet-button" href={pageHref(location.page + 1)}>
                下一页
              </Anchor>
            ) : (
              <Button disabled variant="ghost">
                下一页
              </Button>
            )}
          </div>
        </div>
      </div>
    </div>
  );
};
