import { MigrateUpArgs, MigrateDownArgs, sql } from '@payloadcms/db-vercel-postgres'

export async function up({ db, payload, req }: MigrateUpArgs): Promise<void> {
  await db.execute(sql`
   ALTER TABLE "pages" ADD COLUMN "hero_show_form" boolean;
  ALTER TABLE "pages" ADD COLUMN "hero_form_id" integer;
  ALTER TABLE "_pages_v" ADD COLUMN "version_hero_show_form" boolean;
  ALTER TABLE "_pages_v" ADD COLUMN "version_hero_form_id" integer;
  DO $$ BEGIN
   ALTER TABLE "pages" ADD CONSTRAINT "pages_hero_form_id_forms_id_fk" FOREIGN KEY ("hero_form_id") REFERENCES "public"."forms"("id") ON DELETE set null ON UPDATE no action;
  EXCEPTION
   WHEN duplicate_object THEN null;
  END $$;
  
  DO $$ BEGIN
   ALTER TABLE "_pages_v" ADD CONSTRAINT "_pages_v_version_hero_form_id_forms_id_fk" FOREIGN KEY ("version_hero_form_id") REFERENCES "public"."forms"("id") ON DELETE set null ON UPDATE no action;
  EXCEPTION
   WHEN duplicate_object THEN null;
  END $$;
  
  CREATE INDEX IF NOT EXISTS "pages_hero_hero_form_idx" ON "pages" USING btree ("hero_form_id");
  CREATE INDEX IF NOT EXISTS "_pages_v_version_hero_version_hero_form_idx" ON "_pages_v" USING btree ("version_hero_form_id");`)
}

export async function down({ db, payload, req }: MigrateDownArgs): Promise<void> {
  await db.execute(sql`
   ALTER TABLE "pages" DROP CONSTRAINT "pages_hero_form_id_forms_id_fk";
  
  ALTER TABLE "_pages_v" DROP CONSTRAINT "_pages_v_version_hero_form_id_forms_id_fk";
  
  DROP INDEX IF EXISTS "pages_hero_hero_form_idx";
  DROP INDEX IF EXISTS "_pages_v_version_hero_version_hero_form_idx";
  ALTER TABLE "pages" DROP COLUMN IF EXISTS "hero_show_form";
  ALTER TABLE "pages" DROP COLUMN IF EXISTS "hero_form_id";
  ALTER TABLE "_pages_v" DROP COLUMN IF EXISTS "version_hero_show_form";
  ALTER TABLE "_pages_v" DROP COLUMN IF EXISTS "version_hero_form_id";`)
}
