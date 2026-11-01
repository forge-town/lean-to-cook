CREATE TABLE "ingredient_lean_certificates" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"ingredient_id" uuid NOT NULL,
	"content_digest" text NOT NULL,
	"source" text NOT NULL,
	"model_source" text NOT NULL,
	"lean_version" text NOT NULL,
	"created_at" timestamp (3) with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp (3) with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "ingredient_lean_certificates_owner_digest_unique" UNIQUE("ingredient_id","content_digest"),
	CONSTRAINT "ingredient_lean_certificates_digest" CHECK ("ingredient_lean_certificates"."content_digest" ~ '^[a-f0-9]{64}$')
);
--> statement-breakpoint
CREATE TABLE "recipe_lean_certificates" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"recipe_id" uuid NOT NULL,
	"content_digest" text NOT NULL,
	"source" text NOT NULL,
	"model_source" text NOT NULL,
	"lean_version" text NOT NULL,
	"created_at" timestamp (3) with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp (3) with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "recipe_lean_certificates_owner_digest_unique" UNIQUE("recipe_id","content_digest"),
	CONSTRAINT "recipe_lean_certificates_digest" CHECK ("recipe_lean_certificates"."content_digest" ~ '^[a-f0-9]{64}$')
);
--> statement-breakpoint
ALTER TABLE "ingredient_lean_certificates" ADD CONSTRAINT "ingredient_lean_certificates_ingredient_id_ingredients_id_fk" FOREIGN KEY ("ingredient_id") REFERENCES "public"."ingredients"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "recipe_lean_certificates" ADD CONSTRAINT "recipe_lean_certificates_recipe_id_recipes_id_fk" FOREIGN KEY ("recipe_id") REFERENCES "public"."recipes"("id") ON DELETE cascade ON UPDATE no action;