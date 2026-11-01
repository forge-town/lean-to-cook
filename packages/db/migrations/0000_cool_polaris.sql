CREATE TABLE "ingredient_aliases" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"ingredient_id" uuid NOT NULL,
	"name" text NOT NULL,
	"created_at" timestamp (3) with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp (3) with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "ingredient_aliases_name_not_blank" CHECK (char_length(btrim("ingredient_aliases"."name")) between 1 and 100)
);
--> statement-breakpoint
CREATE TABLE "ingredient_categories" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"name" text NOT NULL,
	"created_at" timestamp (3) with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp (3) with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "ingredient_categories_name_not_blank" CHECK (char_length(btrim("ingredient_categories"."name")) between 1 and 100)
);
--> statement-breakpoint
CREATE TABLE "ingredients" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"name" text NOT NULL,
	"category_id" uuid,
	"description" text DEFAULT '' NOT NULL,
	"created_at" timestamp (3) with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp (3) with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "ingredients_name_not_blank" CHECK (char_length(btrim("ingredients"."name")) between 1 and 100)
);
--> statement-breakpoint
CREATE TABLE "measurement_units" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"code" text NOT NULL,
	"name" text NOT NULL,
	"dimension" text NOT NULL,
	"created_at" timestamp (3) with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp (3) with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "measurement_units_name_not_blank" CHECK (char_length(btrim("measurement_units"."name")) between 1 and 100),
	CONSTRAINT "measurement_units_dimension" CHECK ("measurement_units"."dimension" in ('mass', 'volume', 'count', 'other'))
);
--> statement-breakpoint
CREATE TABLE "recipe_categories" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"name" text NOT NULL,
	"created_at" timestamp (3) with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp (3) with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "recipe_categories_name_not_blank" CHECK (char_length(btrim("recipe_categories"."name")) between 1 and 100)
);
--> statement-breakpoint
CREATE TABLE "recipe_publications" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"recipe_id" uuid NOT NULL,
	"content_digest" text NOT NULL,
	"created_at" timestamp (3) with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp (3) with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "recipe_publications_recipe_unique" UNIQUE("recipe_id")
);
--> statement-breakpoint
CREATE TABLE "recipe_requirements" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"recipe_id" uuid NOT NULL,
	"position" integer NOT NULL,
	"label" text NOT NULL,
	"kind" text NOT NULL,
	"ingredient_id" uuid,
	"quantity_text" text DEFAULT '' NOT NULL,
	"amount" numeric(18, 6),
	"unit_id" uuid,
	"optional" boolean DEFAULT false NOT NULL,
	"created_at" timestamp (3) with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp (3) with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "recipe_requirements_recipe_position_unique" UNIQUE("recipe_id","position"),
	CONSTRAINT "recipe_requirements_position_positive" CHECK ("recipe_requirements"."position" > 0),
	CONSTRAINT "recipe_requirements_kind" CHECK ("recipe_requirements"."kind" in ('unclassified', 'ingredient', 'tool')),
	CONSTRAINT "recipe_requirements_food_link" CHECK (("recipe_requirements"."kind" = 'ingredient') = ("recipe_requirements"."ingredient_id" is not null)),
	CONSTRAINT "recipe_requirements_quantity_pair" CHECK (("recipe_requirements"."amount" is null) = ("recipe_requirements"."unit_id" is null)),
	CONSTRAINT "recipe_requirements_amount_positive" CHECK ("recipe_requirements"."amount" is null or "recipe_requirements"."amount" > 0)
);
--> statement-breakpoint
CREATE TABLE "recipe_sources" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"recipe_id" uuid NOT NULL,
	"source_id" text NOT NULL,
	"path" text NOT NULL,
	"url" text NOT NULL,
	"commit" text NOT NULL,
	"license" text NOT NULL,
	"markdown" text NOT NULL,
	"created_at" timestamp (3) with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp (3) with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "recipe_sources_recipe_unique" UNIQUE("recipe_id"),
	CONSTRAINT "recipe_sources_source_id_unique" UNIQUE("source_id")
);
--> statement-breakpoint
CREATE TABLE "recipe_steps" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"recipe_id" uuid NOT NULL,
	"position" integer NOT NULL,
	"instruction" text NOT NULL,
	"created_at" timestamp (3) with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp (3) with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "recipe_steps_recipe_position_unique" UNIQUE("recipe_id","position"),
	CONSTRAINT "recipe_steps_position_positive" CHECK ("recipe_steps"."position" > 0),
	CONSTRAINT "recipe_steps_not_blank" CHECK (char_length(btrim("recipe_steps"."instruction")) > 0)
);
--> statement-breakpoint
CREATE TABLE "recipes" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"title" text NOT NULL,
	"category_id" uuid,
	"description" text DEFAULT '' NOT NULL,
	"servings" integer,
	"notes" text DEFAULT '' NOT NULL,
	"created_at" timestamp (3) with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp (3) with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "recipes_title_not_blank" CHECK (char_length(btrim("recipes"."title")) between 1 and 200),
	CONSTRAINT "recipes_servings_positive" CHECK ("recipes"."servings" is null or "recipes"."servings" between 1 and 10000)
);
--> statement-breakpoint
ALTER TABLE "ingredient_aliases" ADD CONSTRAINT "ingredient_aliases_ingredient_id_ingredients_id_fk" FOREIGN KEY ("ingredient_id") REFERENCES "public"."ingredients"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "ingredients" ADD CONSTRAINT "ingredients_category_id_ingredient_categories_id_fk" FOREIGN KEY ("category_id") REFERENCES "public"."ingredient_categories"("id") ON DELETE restrict ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "recipe_publications" ADD CONSTRAINT "recipe_publications_recipe_id_recipes_id_fk" FOREIGN KEY ("recipe_id") REFERENCES "public"."recipes"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "recipe_requirements" ADD CONSTRAINT "recipe_requirements_recipe_id_recipes_id_fk" FOREIGN KEY ("recipe_id") REFERENCES "public"."recipes"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "recipe_requirements" ADD CONSTRAINT "recipe_requirements_ingredient_id_ingredients_id_fk" FOREIGN KEY ("ingredient_id") REFERENCES "public"."ingredients"("id") ON DELETE restrict ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "recipe_requirements" ADD CONSTRAINT "recipe_requirements_unit_id_measurement_units_id_fk" FOREIGN KEY ("unit_id") REFERENCES "public"."measurement_units"("id") ON DELETE restrict ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "recipe_sources" ADD CONSTRAINT "recipe_sources_recipe_id_recipes_id_fk" FOREIGN KEY ("recipe_id") REFERENCES "public"."recipes"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "recipe_steps" ADD CONSTRAINT "recipe_steps_recipe_id_recipes_id_fk" FOREIGN KEY ("recipe_id") REFERENCES "public"."recipes"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "recipes" ADD CONSTRAINT "recipes_category_id_recipe_categories_id_fk" FOREIGN KEY ("category_id") REFERENCES "public"."recipe_categories"("id") ON DELETE restrict ON UPDATE no action;--> statement-breakpoint
CREATE UNIQUE INDEX "ingredient_aliases_name_unique" ON "ingredient_aliases" USING btree (lower(normalize("name", NFKC)));--> statement-breakpoint
CREATE INDEX "ingredient_aliases_ingredient_index" ON "ingredient_aliases" USING btree ("ingredient_id");--> statement-breakpoint
CREATE UNIQUE INDEX "ingredient_categories_name_unique" ON "ingredient_categories" USING btree (lower(normalize("name", NFKC)));--> statement-breakpoint
CREATE UNIQUE INDEX "ingredients_name_unique" ON "ingredients" USING btree (lower(normalize("name", NFKC)));--> statement-breakpoint
CREATE INDEX "ingredients_category_index" ON "ingredients" USING btree ("category_id");--> statement-breakpoint
CREATE UNIQUE INDEX "measurement_units_name_unique" ON "measurement_units" USING btree (lower(normalize("name", NFKC)));--> statement-breakpoint
CREATE UNIQUE INDEX "measurement_units_code_unique" ON "measurement_units" USING btree (lower("code"));--> statement-breakpoint
CREATE UNIQUE INDEX "recipe_categories_name_unique" ON "recipe_categories" USING btree (lower(normalize("name", NFKC)));--> statement-breakpoint
CREATE INDEX "recipe_requirements_ingredient_index" ON "recipe_requirements" USING btree ("ingredient_id");--> statement-breakpoint
CREATE INDEX "recipe_requirements_unit_index" ON "recipe_requirements" USING btree ("unit_id");--> statement-breakpoint
CREATE INDEX "recipes_category_index" ON "recipes" USING btree ("category_id");