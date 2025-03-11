import { MigrateUpArgs, MigrateDownArgs, sql } from '@payloadcms/db-vercel-postgres'

export async function up({ db, payload, req }: MigrateUpArgs): Promise<void> {
  await db.execute(sql`
   CREATE TYPE "public"."enum_pages_blocks_form_block_background_color" AS ENUM('transparent', 'white', 'gray-50', 'gray-100', 'cream', 'beige', 'blue-50', 'blue-100', 'green-50', 'green-100', 'pink-50', 'purple-50', 'yellow-50');
  CREATE TYPE "public"."enum_pages_hero_form_background_color" AS ENUM('transparent', 'white', 'gray-50', 'gray-100', 'cream', 'beige', 'blue-50', 'blue-100', 'green-50', 'green-100', 'pink-50', 'purple-50', 'yellow-50');
  CREATE TYPE "public"."enum__pages_v_blocks_form_block_background_color" AS ENUM('transparent', 'white', 'gray-50', 'gray-100', 'cream', 'beige', 'blue-50', 'blue-100', 'green-50', 'green-100', 'pink-50', 'purple-50', 'yellow-50');
  CREATE TYPE "public"."enum__pages_v_version_hero_form_background_color" AS ENUM('transparent', 'white', 'gray-50', 'gray-100', 'cream', 'beige', 'blue-50', 'blue-100', 'green-50', 'green-100', 'pink-50', 'purple-50', 'yellow-50');
  CREATE TYPE "public"."enum_forms_blocks_payment_price_conditions_condition" AS ENUM('hasValue', 'equals', 'notEquals');
  CREATE TYPE "public"."enum_forms_blocks_payment_price_conditions_operator" AS ENUM('add', 'subtract', 'multiply', 'divide');
  CREATE TYPE "public"."enum_forms_blocks_payment_price_conditions_value_type" AS ENUM('static', 'valueOfField');
  CREATE TABLE IF NOT EXISTS "forms_blocks_payment_price_conditions" (
  	"_order" integer NOT NULL,
  	"_parent_id" varchar NOT NULL,
  	"id" varchar PRIMARY KEY NOT NULL,
  	"field_to_use" varchar,
  	"condition" "enum_forms_blocks_payment_price_conditions_condition" DEFAULT 'hasValue',
  	"value_for_condition" varchar,
  	"operator" "enum_forms_blocks_payment_price_conditions_operator" DEFAULT 'add',
  	"value_type" "enum_forms_blocks_payment_price_conditions_value_type" DEFAULT 'static',
  	"value_for_operator" varchar
  );
  
  CREATE TABLE IF NOT EXISTS "forms_blocks_payment" (
  	"_order" integer NOT NULL,
  	"_parent_id" integer NOT NULL,
  	"_path" text NOT NULL,
  	"id" varchar PRIMARY KEY NOT NULL,
  	"name" varchar NOT NULL,
  	"label" varchar,
  	"width" numeric,
  	"base_price" numeric,
  	"required" boolean,
  	"block_name" varchar
  );
  
  ALTER TABLE "pages_blocks_form_block" ALTER COLUMN "multi_step_enabled" DROP DEFAULT;
  ALTER TABLE "_pages_v_blocks_form_block" ALTER COLUMN "multi_step_enabled" DROP DEFAULT;
  ALTER TABLE "pages_blocks_form_block_multi_step_steps" ADD COLUMN "is_partners_step" boolean;
  ALTER TABLE "pages_blocks_form_block" ADD COLUMN "background_color" "enum_pages_blocks_form_block_background_color" DEFAULT 'white';
  ALTER TABLE "pages" ADD COLUMN "hero_form_background_color" "enum_pages_hero_form_background_color" DEFAULT 'transparent';
  ALTER TABLE "_pages_v_blocks_form_block_multi_step_steps" ADD COLUMN "is_partners_step" boolean;
  ALTER TABLE "_pages_v_blocks_form_block" ADD COLUMN "background_color" "enum__pages_v_blocks_form_block_background_color" DEFAULT 'white';
  ALTER TABLE "_pages_v" ADD COLUMN "version_hero_form_background_color" "enum__pages_v_version_hero_form_background_color" DEFAULT 'transparent';
  ALTER TABLE "form_submissions" ADD COLUMN "payment_field" varchar;
  ALTER TABLE "form_submissions" ADD COLUMN "payment_status" varchar;
  ALTER TABLE "form_submissions" ADD COLUMN "payment_amount" numeric;
  ALTER TABLE "form_submissions" ADD COLUMN "payment_payment_processor" varchar;
  ALTER TABLE "form_submissions" ADD COLUMN "payment_credit_card_token" varchar;
  ALTER TABLE "form_submissions" ADD COLUMN "payment_credit_card_brand" varchar;
  ALTER TABLE "form_submissions" ADD COLUMN "payment_credit_card_number" varchar;
  DO $$ BEGIN
   ALTER TABLE "forms_blocks_payment_price_conditions" ADD CONSTRAINT "forms_blocks_payment_price_conditions_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms_blocks_payment"("id") ON DELETE cascade ON UPDATE no action;
  EXCEPTION
   WHEN duplicate_object THEN null;
  END $$;
  
  DO $$ BEGIN
   ALTER TABLE "forms_blocks_payment" ADD CONSTRAINT "forms_blocks_payment_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms"("id") ON DELETE cascade ON UPDATE no action;
  EXCEPTION
   WHEN duplicate_object THEN null;
  END $$;
  
  CREATE INDEX IF NOT EXISTS "forms_blocks_payment_price_conditions_order_idx" ON "forms_blocks_payment_price_conditions" USING btree ("_order");
  CREATE INDEX IF NOT EXISTS "forms_blocks_payment_price_conditions_parent_id_idx" ON "forms_blocks_payment_price_conditions" USING btree ("_parent_id");
  CREATE INDEX IF NOT EXISTS "forms_blocks_payment_order_idx" ON "forms_blocks_payment" USING btree ("_order");
  CREATE INDEX IF NOT EXISTS "forms_blocks_payment_parent_id_idx" ON "forms_blocks_payment" USING btree ("_parent_id");
  CREATE INDEX IF NOT EXISTS "forms_blocks_payment_path_idx" ON "forms_blocks_payment" USING btree ("_path");`)
}

export async function down({ db, payload, req }: MigrateDownArgs): Promise<void> {
  await db.execute(sql`
   ALTER TABLE "forms_blocks_payment_price_conditions" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "forms_blocks_payment" DISABLE ROW LEVEL SECURITY;
  DROP TABLE "forms_blocks_payment_price_conditions" CASCADE;
  DROP TABLE "forms_blocks_payment" CASCADE;
  ALTER TABLE "pages_blocks_form_block" ALTER COLUMN "multi_step_enabled" SET DEFAULT false;
  ALTER TABLE "_pages_v_blocks_form_block" ALTER COLUMN "multi_step_enabled" SET DEFAULT false;
  ALTER TABLE "pages_blocks_form_block_multi_step_steps" DROP COLUMN IF EXISTS "is_partners_step";
  ALTER TABLE "pages_blocks_form_block" DROP COLUMN IF EXISTS "background_color";
  ALTER TABLE "pages" DROP COLUMN IF EXISTS "hero_form_background_color";
  ALTER TABLE "_pages_v_blocks_form_block_multi_step_steps" DROP COLUMN IF EXISTS "is_partners_step";
  ALTER TABLE "_pages_v_blocks_form_block" DROP COLUMN IF EXISTS "background_color";
  ALTER TABLE "_pages_v" DROP COLUMN IF EXISTS "version_hero_form_background_color";
  ALTER TABLE "form_submissions" DROP COLUMN IF EXISTS "payment_field";
  ALTER TABLE "form_submissions" DROP COLUMN IF EXISTS "payment_status";
  ALTER TABLE "form_submissions" DROP COLUMN IF EXISTS "payment_amount";
  ALTER TABLE "form_submissions" DROP COLUMN IF EXISTS "payment_payment_processor";
  ALTER TABLE "form_submissions" DROP COLUMN IF EXISTS "payment_credit_card_token";
  ALTER TABLE "form_submissions" DROP COLUMN IF EXISTS "payment_credit_card_brand";
  ALTER TABLE "form_submissions" DROP COLUMN IF EXISTS "payment_credit_card_number";
  DROP TYPE "public"."enum_pages_blocks_form_block_background_color";
  DROP TYPE "public"."enum_pages_hero_form_background_color";
  DROP TYPE "public"."enum__pages_v_blocks_form_block_background_color";
  DROP TYPE "public"."enum__pages_v_version_hero_form_background_color";
  DROP TYPE "public"."enum_forms_blocks_payment_price_conditions_condition";
  DROP TYPE "public"."enum_forms_blocks_payment_price_conditions_operator";
  DROP TYPE "public"."enum_forms_blocks_payment_price_conditions_value_type";`)
}
