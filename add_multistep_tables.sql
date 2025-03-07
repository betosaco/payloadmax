-- Este script crea las tablas necesarias para la funcionalidad multi-step
-- sin perder datos existentes en la base de datos

-- Crear tablas para los campos de los pasos en el formulario principal
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

-- Crear tablas para los campos de los pasos en las versiones
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

-- Añadir columna para habilitar/deshabilitar multi-step
-- Utilizamos ALTER TABLE IF NOT EXISTS o una estructura segura para evitar errores
DO $$ 
BEGIN
  -- Agregar columna multi_step_enabled si no existe
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                 WHERE table_name = 'pages_blocks_form_block' 
                 AND column_name = 'multi_step_enabled') THEN
    ALTER TABLE "pages_blocks_form_block" ADD COLUMN "multi_step_enabled" boolean DEFAULT false;
  END IF;

  -- Agregar columna multi_step_enabled en la tabla de versiones si no existe
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                 WHERE table_name = '_pages_v_blocks_form_block' 
                 AND column_name = 'multi_step_enabled') THEN
    ALTER TABLE "_pages_v_blocks_form_block" ADD COLUMN "multi_step_enabled" boolean DEFAULT false;
  END IF;
END $$;

-- Agregar restricciones y relaciones de manera segura usando try-catch de PL/pgSQL
DO $$ 
BEGIN
  ALTER TABLE "pages_blocks_form_block_multi_step_steps_fields" 
  ADD CONSTRAINT "pages_blocks_form_block_multi_step_steps_fields_parent_id_fk" 
  FOREIGN KEY ("_parent_id") REFERENCES "pages_blocks_form_block_multi_step_steps"("id") 
  ON DELETE cascade ON UPDATE no action;
EXCEPTION
  WHEN duplicate_object THEN null;
END $$;

DO $$ 
BEGIN
  ALTER TABLE "pages_blocks_form_block_multi_step_steps" 
  ADD CONSTRAINT "pages_blocks_form_block_multi_step_steps_parent_id_fk" 
  FOREIGN KEY ("_parent_id") REFERENCES "pages_blocks_form_block"("id") 
  ON DELETE cascade ON UPDATE no action;
EXCEPTION
  WHEN duplicate_object THEN null;
END $$;

DO $$ 
BEGIN
  ALTER TABLE "_pages_v_blocks_form_block_multi_step_steps_fields" 
  ADD CONSTRAINT "_pages_v_blocks_form_block_multi_step_steps_fields_parent_id_fk" 
  FOREIGN KEY ("_parent_id") REFERENCES "_pages_v_blocks_form_block_multi_step_steps"("id") 
  ON DELETE cascade ON UPDATE no action;
EXCEPTION
  WHEN duplicate_object THEN null;
END $$;

DO $$ 
BEGIN
  ALTER TABLE "_pages_v_blocks_form_block_multi_step_steps" 
  ADD CONSTRAINT "_pages_v_blocks_form_block_multi_step_steps_parent_id_fk" 
  FOREIGN KEY ("_parent_id") REFERENCES "_pages_v_blocks_form_block"("id") 
  ON DELETE cascade ON UPDATE no action;
EXCEPTION
  WHEN duplicate_object THEN null;
END $$;

-- Crear índices para optimizar rendimiento
CREATE INDEX IF NOT EXISTS "pages_blocks_form_block_multi_step_steps_fields_order_idx" 
ON "pages_blocks_form_block_multi_step_steps_fields" USING btree ("_order");

CREATE INDEX IF NOT EXISTS "pages_blocks_form_block_multi_step_steps_fields_parent_id_idx" 
ON "pages_blocks_form_block_multi_step_steps_fields" USING btree ("_parent_id");

CREATE INDEX IF NOT EXISTS "pages_blocks_form_block_multi_step_steps_order_idx" 
ON "pages_blocks_form_block_multi_step_steps" USING btree ("_order");

CREATE INDEX IF NOT EXISTS "pages_blocks_form_block_multi_step_steps_parent_id_idx" 
ON "pages_blocks_form_block_multi_step_steps" USING btree ("_parent_id");

CREATE INDEX IF NOT EXISTS "_pages_v_blocks_form_block_multi_step_steps_fields_order_idx" 
ON "_pages_v_blocks_form_block_multi_step_steps_fields" USING btree ("_order");

CREATE INDEX IF NOT EXISTS "_pages_v_blocks_form_block_multi_step_steps_fields_parent_id_idx" 
ON "_pages_v_blocks_form_block_multi_step_steps_fields" USING btree ("_parent_id");

CREATE INDEX IF NOT EXISTS "_pages_v_blocks_form_block_multi_step_steps_order_idx" 
ON "_pages_v_blocks_form_block_multi_step_steps" USING btree ("_order");

CREATE INDEX IF NOT EXISTS "_pages_v_blocks_form_block_multi_step_steps_parent_id_idx" 
ON "_pages_v_blocks_form_block_multi_step_steps" USING btree ("_parent_id"); 