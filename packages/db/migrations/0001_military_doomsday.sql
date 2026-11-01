ALTER TABLE "ingredients" ADD COLUMN "source_name" text;--> statement-breakpoint
ALTER TABLE "ingredients" ADD COLUMN "image_key" text;
--> statement-breakpoint
UPDATE "ingredients" SET "source_name" = "name" WHERE "source_name" IS NULL;
