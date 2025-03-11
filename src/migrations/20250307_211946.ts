import { MigrateUpArgs, MigrateDownArgs, sql } from '@payloadcms/db-vercel-postgres'

export async function up({ db, payload, req }: MigrateUpArgs): Promise<void> {
  await db.execute(sql`
   CREATE TABLE IF NOT EXISTS "pages_blocks_form_block_multi_step_steps_fields" (
  	"_order" integer NOT NULL,
  	"_parent_id" varchar NOT NULL,
  	"id" varchar PRIMARY KEY NOT NULL,
  	"field_name" varchar
  );
  
  CREATE TABLE IF NOT EXISTS "pages_blocks_form_block_multi_step_steps" (
  	"_order" integer NOT NULL,
  	"_parent_id" varchar NOT NULL,
  	"id" varchar PRIMARY KEY NOT NULL,
  	"title" varchar
  );
  
  CREATE TABLE IF NOT EXISTS "_pages_v_blocks_form_block_multi_step_steps_fields" (
  	"_order" integer NOT NULL,
  	"_parent_id" integer NOT NULL,
  	"id" serial PRIMARY KEY NOT NULL,
  	"field_name" varchar,
  	"_uuid" varchar
  );
  
  CREATE TABLE IF NOT EXISTS "_pages_v_blocks_form_block_multi_step_steps" (
  	"_order" integer NOT NULL,
  	"_parent_id" integer NOT NULL,
  	"id" serial PRIMARY KEY NOT NULL,
  	"title" varchar,
  	"_uuid" varchar
  );
  
  ALTER TABLE "pages_blocks_form_block" ADD COLUMN "multi_step_enabled" boolean DEFAULT false;
  ALTER TABLE "_pages_v_blocks_form_block" ADD COLUMN "multi_step_enabled" boolean DEFAULT false;
  DO $$ BEGIN
   ALTER TABLE "pages_blocks_form_block_multi_step_steps_fields" ADD CONSTRAINT "pages_blocks_form_block_multi_step_steps_fields_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages_blocks_form_block_multi_step_steps"("id") ON DELETE cascade ON UPDATE no action;
  EXCEPTION
   WHEN duplicate_object THEN null;
  END $$;
  
  DO $$ BEGIN
   ALTER TABLE "pages_blocks_form_block_multi_step_steps" ADD CONSTRAINT "pages_blocks_form_block_multi_step_steps_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages_blocks_form_block"("id") ON DELETE cascade ON UPDATE no action;
  EXCEPTION
   WHEN duplicate_object THEN null;
  END $$;
  
  DO $$ BEGIN
   ALTER TABLE "_pages_v_blocks_form_block_multi_step_steps_fields" ADD CONSTRAINT "_pages_v_blocks_form_block_multi_step_steps_fields_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v_blocks_form_block_multi_step_steps"("id") ON DELETE cascade ON UPDATE no action;
  EXCEPTION
   WHEN duplicate_object THEN null;
  END $$;
  
  DO $$ BEGIN
   ALTER TABLE "_pages_v_blocks_form_block_multi_step_steps" ADD CONSTRAINT "_pages_v_blocks_form_block_multi_step_steps_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v_blocks_form_block"("id") ON DELETE cascade ON UPDATE no action;
  EXCEPTION
   WHEN duplicate_object THEN null;
  END $$;
  
  CREATE INDEX IF NOT EXISTS "pages_blocks_form_block_multi_step_steps_fields_order_idx" ON "pages_blocks_form_block_multi_step_steps_fields" USING btree ("_order");
  CREATE INDEX IF NOT EXISTS "pages_blocks_form_block_multi_step_steps_fields_parent_id_idx" ON "pages_blocks_form_block_multi_step_steps_fields" USING btree ("_parent_id");
  CREATE INDEX IF NOT EXISTS "pages_blocks_form_block_multi_step_steps_order_idx" ON "pages_blocks_form_block_multi_step_steps" USING btree ("_order");
  CREATE INDEX IF NOT EXISTS "pages_blocks_form_block_multi_step_steps_parent_id_idx" ON "pages_blocks_form_block_multi_step_steps" USING btree ("_parent_id");
  CREATE INDEX IF NOT EXISTS "_pages_v_blocks_form_block_multi_step_steps_fields_order_idx" ON "_pages_v_blocks_form_block_multi_step_steps_fields" USING btree ("_order");
  CREATE INDEX IF NOT EXISTS "_pages_v_blocks_form_block_multi_step_steps_fields_parent_id_idx" ON "_pages_v_blocks_form_block_multi_step_steps_fields" USING btree ("_parent_id");
  CREATE INDEX IF NOT EXISTS "_pages_v_blocks_form_block_multi_step_steps_order_idx" ON "_pages_v_blocks_form_block_multi_step_steps" USING btree ("_order");
  CREATE INDEX IF NOT EXISTS "_pages_v_blocks_form_block_multi_step_steps_parent_id_idx" ON "_pages_v_blocks_form_block_multi_step_steps" USING btree ("_parent_id");`)
}

export async function down({ db, payload, req }: MigrateDownArgs): Promise<void> {
  await db.execute(sql`
   DROP TABLE "pages_blocks_form_block_multi_step_steps_fields" CASCADE;
  DROP TABLE "pages_blocks_form_block_multi_step_steps" CASCADE;
  DROP TABLE "_pages_v_blocks_form_block_multi_step_steps_fields" CASCADE;
  DROP TABLE "_pages_v_blocks_form_block_multi_step_steps" CASCADE;
  ALTER TABLE "pages_blocks_form_block" DROP COLUMN IF EXISTS "multi_step_enabled";
  ALTER TABLE "_pages_v_blocks_form_block" DROP COLUMN IF EXISTS "multi_step_enabled";`)
}
