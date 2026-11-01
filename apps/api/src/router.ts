import { initTRPC, TRPCError } from "@trpc/server";
import { z } from "zod/v4";
import { CatalogService, type CatalogServiceError } from "@repo/services";
import {
  CatalogWriteSchema,
  CatalogDeleteSchema,
  CatalogListInputSchema,
  CatalogListSchema,
  CatalogIdentitySchema,
  CatalogDetailSchema,
  RecipePublicationInputSchema,
  CatalogLeanIdentitySchema,
  CatalogLeanArtifactSchema,
  PublicIngredientSchema,
} from "@repo/schemas/catalog";
import type { ResultAsync } from "neverthrow";
const t = initTRPC.context<{ authenticated: boolean }>().create({ isDev: false });
const protectedProcedure = t.procedure.use(({ ctx, next }) => {
  if (!ctx.authenticated) throw new TRPCError({ code: "UNAUTHORIZED", message: "请先登录后台" });

  return next();
});
const unwrap = async <T>(result: ResultAsync<T, CatalogServiceError>): Promise<T> =>
  (await result).match(
    (value) => value,
    (error) => {
      const code =
        error.code === "NOT_FOUND"
          ? "NOT_FOUND"
          : error.code === "INTERNAL"
            ? "INTERNAL_SERVER_ERROR"
            : "CONFLICT";
      throw new TRPCError({ code, message: error.message });
    },
  );
export const appRouter = t.router({
  catalog: t.router({
    lean: protectedProcedure
      .input(CatalogLeanIdentitySchema)
      .output(CatalogLeanArtifactSchema)
      .query(({ input }) => unwrap(CatalogService.getLean(input))),
    checkLean: protectedProcedure
      .input(CatalogLeanIdentitySchema)
      .output(CatalogLeanArtifactSchema)
      .mutation(({ input }) => unwrap(CatalogService.checkLean(input))),
    assignIngredientImages: protectedProcedure
      .output(z.object({ updated: z.int().nonnegative() }))
      .mutation(() => unwrap(CatalogService.assignIngredientImages())),
    list: protectedProcedure
      .input(CatalogListInputSchema)
      .output(CatalogListSchema)
      .query(({ input }) => unwrap(CatalogService.list(input))),
    get: protectedProcedure
      .input(CatalogIdentitySchema)
      .output(CatalogDetailSchema)
      .query(({ input }) => unwrap(CatalogService.get(input))),
    save: protectedProcedure
      .input(CatalogWriteSchema)
      .output(CatalogDetailSchema)
      .mutation(({ input }) => unwrap(CatalogService.save(input))),
    delete: protectedProcedure
      .input(CatalogDeleteSchema)
      .output(z.object({ id: z.uuid() }))
      .mutation(({ input }) => unwrap(CatalogService.remove(input))),
    publish: protectedProcedure
      .input(RecipePublicationInputSchema)
      .output(CatalogDetailSchema)
      .mutation(({ input }) => unwrap(CatalogService.publish(input))),
    unpublish: protectedProcedure
      .input(RecipePublicationInputSchema)
      .output(CatalogDetailSchema)
      .mutation(({ input }) => unwrap(CatalogService.unpublish(input))),
  }),
  public: t.router({
    ingredients: t.procedure
      .output(z.array(PublicIngredientSchema))
      .query(() => unwrap(CatalogService.listIngredients())),
    recipes: t.procedure
      .input(CatalogListInputSchema.omit({ resource: true }))
      .output(CatalogListSchema)
      .query(({ input }) => unwrap(CatalogService.listPublic({ ...input, resource: "recipes" }))),
    recipe: t.procedure
      .input(z.object({ id: z.uuid() }))
      .output(CatalogDetailSchema)
      .query(({ input }) => unwrap(CatalogService.getPublic(input))),
  }),
});
export type AppRouter = typeof appRouter;
