--
-- PostgreSQL database dump
--

-- Dumped from database version 15.12
-- Dumped by pg_dump version 15.12 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: neondb_owner
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO neondb_owner;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: neondb_owner
--

COMMENT ON SCHEMA public IS '';


--
-- Name: enum__pages_v_blocks_archive_populate_by; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum__pages_v_blocks_archive_populate_by AS ENUM (
    'collection',
    'selection'
);


ALTER TYPE public.enum__pages_v_blocks_archive_populate_by OWNER TO neondb_owner;

--
-- Name: enum__pages_v_blocks_archive_relation_to; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum__pages_v_blocks_archive_relation_to AS ENUM (
    'posts'
);


ALTER TYPE public.enum__pages_v_blocks_archive_relation_to OWNER TO neondb_owner;

--
-- Name: enum__pages_v_blocks_content_columns_link_appearance; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum__pages_v_blocks_content_columns_link_appearance AS ENUM (
    'default',
    'outline'
);


ALTER TYPE public.enum__pages_v_blocks_content_columns_link_appearance OWNER TO neondb_owner;

--
-- Name: enum__pages_v_blocks_content_columns_link_type; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum__pages_v_blocks_content_columns_link_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum__pages_v_blocks_content_columns_link_type OWNER TO neondb_owner;

--
-- Name: enum__pages_v_blocks_content_columns_size; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum__pages_v_blocks_content_columns_size AS ENUM (
    'oneThird',
    'half',
    'twoThirds',
    'full'
);


ALTER TYPE public.enum__pages_v_blocks_content_columns_size OWNER TO neondb_owner;

--
-- Name: enum__pages_v_blocks_cta_links_link_appearance; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum__pages_v_blocks_cta_links_link_appearance AS ENUM (
    'default',
    'outline'
);


ALTER TYPE public.enum__pages_v_blocks_cta_links_link_appearance OWNER TO neondb_owner;

--
-- Name: enum__pages_v_blocks_cta_links_link_type; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum__pages_v_blocks_cta_links_link_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum__pages_v_blocks_cta_links_link_type OWNER TO neondb_owner;

--
-- Name: enum__pages_v_blocks_form_block_background_color; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum__pages_v_blocks_form_block_background_color AS ENUM (
    'transparent',
    'white',
    'gray-50',
    'gray-100',
    'cream',
    'beige',
    'blue-50',
    'blue-100',
    'green-50',
    'green-100',
    'pink-50',
    'purple-50',
    'yellow-50'
);


ALTER TYPE public.enum__pages_v_blocks_form_block_background_color OWNER TO neondb_owner;

--
-- Name: enum__pages_v_version_hero_form_background_color; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum__pages_v_version_hero_form_background_color AS ENUM (
    'transparent',
    'white',
    'gray-50',
    'gray-100',
    'cream',
    'beige',
    'blue-50',
    'blue-100',
    'green-50',
    'green-100',
    'pink-50',
    'purple-50',
    'yellow-50'
);


ALTER TYPE public.enum__pages_v_version_hero_form_background_color OWNER TO neondb_owner;

--
-- Name: enum__pages_v_version_hero_links_link_appearance; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum__pages_v_version_hero_links_link_appearance AS ENUM (
    'default',
    'outline'
);


ALTER TYPE public.enum__pages_v_version_hero_links_link_appearance OWNER TO neondb_owner;

--
-- Name: enum__pages_v_version_hero_links_link_type; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum__pages_v_version_hero_links_link_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum__pages_v_version_hero_links_link_type OWNER TO neondb_owner;

--
-- Name: enum__pages_v_version_hero_type; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum__pages_v_version_hero_type AS ENUM (
    'none',
    'highImpact',
    'mediumImpact',
    'lowImpact'
);


ALTER TYPE public.enum__pages_v_version_hero_type OWNER TO neondb_owner;

--
-- Name: enum__pages_v_version_status; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum__pages_v_version_status AS ENUM (
    'draft',
    'published'
);


ALTER TYPE public.enum__pages_v_version_status OWNER TO neondb_owner;

--
-- Name: enum__posts_v_version_status; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum__posts_v_version_status AS ENUM (
    'draft',
    'published'
);


ALTER TYPE public.enum__posts_v_version_status OWNER TO neondb_owner;

--
-- Name: enum_footer_nav_items_link_type; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum_footer_nav_items_link_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum_footer_nav_items_link_type OWNER TO neondb_owner;

--
-- Name: enum_forms_blocks_payment_price_conditions_condition; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum_forms_blocks_payment_price_conditions_condition AS ENUM (
    'hasValue',
    'equals',
    'notEquals'
);


ALTER TYPE public.enum_forms_blocks_payment_price_conditions_condition OWNER TO neondb_owner;

--
-- Name: enum_forms_blocks_payment_price_conditions_operator; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum_forms_blocks_payment_price_conditions_operator AS ENUM (
    'add',
    'subtract',
    'multiply',
    'divide'
);


ALTER TYPE public.enum_forms_blocks_payment_price_conditions_operator OWNER TO neondb_owner;

--
-- Name: enum_forms_blocks_payment_price_conditions_value_type; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum_forms_blocks_payment_price_conditions_value_type AS ENUM (
    'static',
    'valueOfField'
);


ALTER TYPE public.enum_forms_blocks_payment_price_conditions_value_type OWNER TO neondb_owner;

--
-- Name: enum_forms_confirmation_type; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum_forms_confirmation_type AS ENUM (
    'message',
    'redirect'
);


ALTER TYPE public.enum_forms_confirmation_type OWNER TO neondb_owner;

--
-- Name: enum_header_nav_items_link_type; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum_header_nav_items_link_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum_header_nav_items_link_type OWNER TO neondb_owner;

--
-- Name: enum_pages_blocks_archive_populate_by; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum_pages_blocks_archive_populate_by AS ENUM (
    'collection',
    'selection'
);


ALTER TYPE public.enum_pages_blocks_archive_populate_by OWNER TO neondb_owner;

--
-- Name: enum_pages_blocks_archive_relation_to; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum_pages_blocks_archive_relation_to AS ENUM (
    'posts'
);


ALTER TYPE public.enum_pages_blocks_archive_relation_to OWNER TO neondb_owner;

--
-- Name: enum_pages_blocks_content_columns_link_appearance; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum_pages_blocks_content_columns_link_appearance AS ENUM (
    'default',
    'outline'
);


ALTER TYPE public.enum_pages_blocks_content_columns_link_appearance OWNER TO neondb_owner;

--
-- Name: enum_pages_blocks_content_columns_link_type; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum_pages_blocks_content_columns_link_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum_pages_blocks_content_columns_link_type OWNER TO neondb_owner;

--
-- Name: enum_pages_blocks_content_columns_size; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum_pages_blocks_content_columns_size AS ENUM (
    'oneThird',
    'half',
    'twoThirds',
    'full'
);


ALTER TYPE public.enum_pages_blocks_content_columns_size OWNER TO neondb_owner;

--
-- Name: enum_pages_blocks_cta_links_link_appearance; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum_pages_blocks_cta_links_link_appearance AS ENUM (
    'default',
    'outline'
);


ALTER TYPE public.enum_pages_blocks_cta_links_link_appearance OWNER TO neondb_owner;

--
-- Name: enum_pages_blocks_cta_links_link_type; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum_pages_blocks_cta_links_link_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum_pages_blocks_cta_links_link_type OWNER TO neondb_owner;

--
-- Name: enum_pages_blocks_form_block_background_color; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum_pages_blocks_form_block_background_color AS ENUM (
    'transparent',
    'white',
    'gray-50',
    'gray-100',
    'cream',
    'beige',
    'blue-50',
    'blue-100',
    'green-50',
    'green-100',
    'pink-50',
    'purple-50',
    'yellow-50'
);


ALTER TYPE public.enum_pages_blocks_form_block_background_color OWNER TO neondb_owner;

--
-- Name: enum_pages_hero_form_background_color; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum_pages_hero_form_background_color AS ENUM (
    'transparent',
    'white',
    'gray-50',
    'gray-100',
    'cream',
    'beige',
    'blue-50',
    'blue-100',
    'green-50',
    'green-100',
    'pink-50',
    'purple-50',
    'yellow-50'
);


ALTER TYPE public.enum_pages_hero_form_background_color OWNER TO neondb_owner;

--
-- Name: enum_pages_hero_links_link_appearance; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum_pages_hero_links_link_appearance AS ENUM (
    'default',
    'outline'
);


ALTER TYPE public.enum_pages_hero_links_link_appearance OWNER TO neondb_owner;

--
-- Name: enum_pages_hero_links_link_type; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum_pages_hero_links_link_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum_pages_hero_links_link_type OWNER TO neondb_owner;

--
-- Name: enum_pages_hero_type; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum_pages_hero_type AS ENUM (
    'none',
    'highImpact',
    'mediumImpact',
    'lowImpact'
);


ALTER TYPE public.enum_pages_hero_type OWNER TO neondb_owner;

--
-- Name: enum_pages_status; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum_pages_status AS ENUM (
    'draft',
    'published'
);


ALTER TYPE public.enum_pages_status OWNER TO neondb_owner;

--
-- Name: enum_payload_jobs_log_state; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum_payload_jobs_log_state AS ENUM (
    'failed',
    'succeeded'
);


ALTER TYPE public.enum_payload_jobs_log_state OWNER TO neondb_owner;

--
-- Name: enum_payload_jobs_log_task_slug; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum_payload_jobs_log_task_slug AS ENUM (
    'inline',
    'schedulePublish'
);


ALTER TYPE public.enum_payload_jobs_log_task_slug OWNER TO neondb_owner;

--
-- Name: enum_payload_jobs_task_slug; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum_payload_jobs_task_slug AS ENUM (
    'inline',
    'schedulePublish'
);


ALTER TYPE public.enum_payload_jobs_task_slug OWNER TO neondb_owner;

--
-- Name: enum_posts_status; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum_posts_status AS ENUM (
    'draft',
    'published'
);


ALTER TYPE public.enum_posts_status OWNER TO neondb_owner;

--
-- Name: enum_redirects_to_type; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.enum_redirects_to_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum_redirects_to_type OWNER TO neondb_owner;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: _pages_v; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public._pages_v (
    id integer NOT NULL,
    parent_id integer,
    version_title character varying,
    version_hero_type public.enum__pages_v_version_hero_type DEFAULT 'lowImpact'::public.enum__pages_v_version_hero_type,
    version_hero_rich_text jsonb,
    version_hero_media_id integer,
    version_hero_show_form boolean,
    version_hero_form_id integer,
    version_hero_form_background_color public.enum__pages_v_version_hero_form_background_color DEFAULT 'transparent'::public.enum__pages_v_version_hero_form_background_color,
    version_meta_title character varying,
    version_meta_image_id integer,
    version_meta_description character varying,
    version_published_at timestamp(3) with time zone,
    version_slug character varying,
    version_slug_lock boolean DEFAULT true,
    version_updated_at timestamp(3) with time zone,
    version_created_at timestamp(3) with time zone,
    version__status public.enum__pages_v_version_status DEFAULT 'draft'::public.enum__pages_v_version_status,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    latest boolean,
    autosave boolean
);


ALTER TABLE public._pages_v OWNER TO neondb_owner;

--
-- Name: _pages_v_blocks_archive; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public._pages_v_blocks_archive (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id integer NOT NULL,
    intro_content jsonb,
    populate_by public.enum__pages_v_blocks_archive_populate_by DEFAULT 'collection'::public.enum__pages_v_blocks_archive_populate_by,
    relation_to public.enum__pages_v_blocks_archive_relation_to DEFAULT 'posts'::public.enum__pages_v_blocks_archive_relation_to,
    "limit" numeric DEFAULT 10,
    _uuid character varying,
    block_name character varying
);


ALTER TABLE public._pages_v_blocks_archive OWNER TO neondb_owner;

--
-- Name: _pages_v_blocks_archive_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public._pages_v_blocks_archive_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._pages_v_blocks_archive_id_seq OWNER TO neondb_owner;

--
-- Name: _pages_v_blocks_archive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public._pages_v_blocks_archive_id_seq OWNED BY public._pages_v_blocks_archive.id;


--
-- Name: _pages_v_blocks_content; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public._pages_v_blocks_content (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id integer NOT NULL,
    _uuid character varying,
    block_name character varying
);


ALTER TABLE public._pages_v_blocks_content OWNER TO neondb_owner;

--
-- Name: _pages_v_blocks_content_columns; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public._pages_v_blocks_content_columns (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    size public.enum__pages_v_blocks_content_columns_size DEFAULT 'oneThird'::public.enum__pages_v_blocks_content_columns_size,
    rich_text jsonb,
    enable_link boolean,
    link_type public.enum__pages_v_blocks_content_columns_link_type DEFAULT 'reference'::public.enum__pages_v_blocks_content_columns_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying,
    link_appearance public.enum__pages_v_blocks_content_columns_link_appearance DEFAULT 'default'::public.enum__pages_v_blocks_content_columns_link_appearance,
    _uuid character varying
);


ALTER TABLE public._pages_v_blocks_content_columns OWNER TO neondb_owner;

--
-- Name: _pages_v_blocks_content_columns_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public._pages_v_blocks_content_columns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._pages_v_blocks_content_columns_id_seq OWNER TO neondb_owner;

--
-- Name: _pages_v_blocks_content_columns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public._pages_v_blocks_content_columns_id_seq OWNED BY public._pages_v_blocks_content_columns.id;


--
-- Name: _pages_v_blocks_content_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public._pages_v_blocks_content_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._pages_v_blocks_content_id_seq OWNER TO neondb_owner;

--
-- Name: _pages_v_blocks_content_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public._pages_v_blocks_content_id_seq OWNED BY public._pages_v_blocks_content.id;


--
-- Name: _pages_v_blocks_cta; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public._pages_v_blocks_cta (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id integer NOT NULL,
    rich_text jsonb,
    _uuid character varying,
    block_name character varying
);


ALTER TABLE public._pages_v_blocks_cta OWNER TO neondb_owner;

--
-- Name: _pages_v_blocks_cta_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public._pages_v_blocks_cta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._pages_v_blocks_cta_id_seq OWNER TO neondb_owner;

--
-- Name: _pages_v_blocks_cta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public._pages_v_blocks_cta_id_seq OWNED BY public._pages_v_blocks_cta.id;


--
-- Name: _pages_v_blocks_cta_links; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public._pages_v_blocks_cta_links (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    link_type public.enum__pages_v_blocks_cta_links_link_type DEFAULT 'reference'::public.enum__pages_v_blocks_cta_links_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying,
    link_appearance public.enum__pages_v_blocks_cta_links_link_appearance DEFAULT 'default'::public.enum__pages_v_blocks_cta_links_link_appearance,
    _uuid character varying
);


ALTER TABLE public._pages_v_blocks_cta_links OWNER TO neondb_owner;

--
-- Name: _pages_v_blocks_cta_links_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public._pages_v_blocks_cta_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._pages_v_blocks_cta_links_id_seq OWNER TO neondb_owner;

--
-- Name: _pages_v_blocks_cta_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public._pages_v_blocks_cta_links_id_seq OWNED BY public._pages_v_blocks_cta_links.id;


--
-- Name: _pages_v_blocks_form_block; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public._pages_v_blocks_form_block (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id integer NOT NULL,
    form_id integer,
    enable_intro boolean,
    intro_content jsonb,
    background_color public.enum__pages_v_blocks_form_block_background_color DEFAULT 'white'::public.enum__pages_v_blocks_form_block_background_color,
    multi_step_enabled boolean,
    _uuid character varying,
    block_name character varying
);


ALTER TABLE public._pages_v_blocks_form_block OWNER TO neondb_owner;

--
-- Name: _pages_v_blocks_form_block_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public._pages_v_blocks_form_block_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._pages_v_blocks_form_block_id_seq OWNER TO neondb_owner;

--
-- Name: _pages_v_blocks_form_block_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public._pages_v_blocks_form_block_id_seq OWNED BY public._pages_v_blocks_form_block.id;


--
-- Name: _pages_v_blocks_form_block_multi_step_steps; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public._pages_v_blocks_form_block_multi_step_steps (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    title character varying,
    _uuid character varying,
    is_partners_step boolean
);


ALTER TABLE public._pages_v_blocks_form_block_multi_step_steps OWNER TO neondb_owner;

--
-- Name: _pages_v_blocks_form_block_multi_step_steps_fields; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public._pages_v_blocks_form_block_multi_step_steps_fields (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    field_name character varying,
    _uuid character varying
);


ALTER TABLE public._pages_v_blocks_form_block_multi_step_steps_fields OWNER TO neondb_owner;

--
-- Name: _pages_v_blocks_form_block_multi_step_steps_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public._pages_v_blocks_form_block_multi_step_steps_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._pages_v_blocks_form_block_multi_step_steps_fields_id_seq OWNER TO neondb_owner;

--
-- Name: _pages_v_blocks_form_block_multi_step_steps_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public._pages_v_blocks_form_block_multi_step_steps_fields_id_seq OWNED BY public._pages_v_blocks_form_block_multi_step_steps_fields.id;


--
-- Name: _pages_v_blocks_form_block_multi_step_steps_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public._pages_v_blocks_form_block_multi_step_steps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._pages_v_blocks_form_block_multi_step_steps_id_seq OWNER TO neondb_owner;

--
-- Name: _pages_v_blocks_form_block_multi_step_steps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public._pages_v_blocks_form_block_multi_step_steps_id_seq OWNED BY public._pages_v_blocks_form_block_multi_step_steps.id;


--
-- Name: _pages_v_blocks_media_block; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public._pages_v_blocks_media_block (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id integer NOT NULL,
    media_id integer,
    _uuid character varying,
    block_name character varying
);


ALTER TABLE public._pages_v_blocks_media_block OWNER TO neondb_owner;

--
-- Name: _pages_v_blocks_media_block_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public._pages_v_blocks_media_block_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._pages_v_blocks_media_block_id_seq OWNER TO neondb_owner;

--
-- Name: _pages_v_blocks_media_block_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public._pages_v_blocks_media_block_id_seq OWNED BY public._pages_v_blocks_media_block.id;


--
-- Name: _pages_v_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public._pages_v_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._pages_v_id_seq OWNER TO neondb_owner;

--
-- Name: _pages_v_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public._pages_v_id_seq OWNED BY public._pages_v.id;


--
-- Name: _pages_v_rels; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public._pages_v_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    pages_id integer,
    posts_id integer,
    categories_id integer
);


ALTER TABLE public._pages_v_rels OWNER TO neondb_owner;

--
-- Name: _pages_v_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public._pages_v_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._pages_v_rels_id_seq OWNER TO neondb_owner;

--
-- Name: _pages_v_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public._pages_v_rels_id_seq OWNED BY public._pages_v_rels.id;


--
-- Name: _pages_v_version_hero_links; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public._pages_v_version_hero_links (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    link_type public.enum__pages_v_version_hero_links_link_type DEFAULT 'reference'::public.enum__pages_v_version_hero_links_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying,
    link_appearance public.enum__pages_v_version_hero_links_link_appearance DEFAULT 'default'::public.enum__pages_v_version_hero_links_link_appearance,
    _uuid character varying
);


ALTER TABLE public._pages_v_version_hero_links OWNER TO neondb_owner;

--
-- Name: _pages_v_version_hero_links_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public._pages_v_version_hero_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._pages_v_version_hero_links_id_seq OWNER TO neondb_owner;

--
-- Name: _pages_v_version_hero_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public._pages_v_version_hero_links_id_seq OWNED BY public._pages_v_version_hero_links.id;


--
-- Name: _posts_v; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public._posts_v (
    id integer NOT NULL,
    parent_id integer,
    version_title character varying,
    version_hero_image_id integer,
    version_content jsonb,
    version_meta_title character varying,
    version_meta_image_id integer,
    version_meta_description character varying,
    version_published_at timestamp(3) with time zone,
    version_slug character varying,
    version_slug_lock boolean DEFAULT true,
    version_updated_at timestamp(3) with time zone,
    version_created_at timestamp(3) with time zone,
    version__status public.enum__posts_v_version_status DEFAULT 'draft'::public.enum__posts_v_version_status,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    latest boolean,
    autosave boolean
);


ALTER TABLE public._posts_v OWNER TO neondb_owner;

--
-- Name: _posts_v_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public._posts_v_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._posts_v_id_seq OWNER TO neondb_owner;

--
-- Name: _posts_v_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public._posts_v_id_seq OWNED BY public._posts_v.id;


--
-- Name: _posts_v_rels; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public._posts_v_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    posts_id integer,
    categories_id integer,
    users_id integer
);


ALTER TABLE public._posts_v_rels OWNER TO neondb_owner;

--
-- Name: _posts_v_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public._posts_v_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._posts_v_rels_id_seq OWNER TO neondb_owner;

--
-- Name: _posts_v_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public._posts_v_rels_id_seq OWNED BY public._posts_v_rels.id;


--
-- Name: _posts_v_version_populated_authors; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public._posts_v_version_populated_authors (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    _uuid character varying,
    name character varying
);


ALTER TABLE public._posts_v_version_populated_authors OWNER TO neondb_owner;

--
-- Name: _posts_v_version_populated_authors_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public._posts_v_version_populated_authors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._posts_v_version_populated_authors_id_seq OWNER TO neondb_owner;

--
-- Name: _posts_v_version_populated_authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public._posts_v_version_populated_authors_id_seq OWNED BY public._posts_v_version_populated_authors.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    title character varying NOT NULL,
    slug character varying,
    slug_lock boolean DEFAULT true,
    parent_id integer,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.categories OWNER TO neondb_owner;

--
-- Name: categories_breadcrumbs; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.categories_breadcrumbs (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    doc_id integer,
    url character varying,
    label character varying
);


ALTER TABLE public.categories_breadcrumbs OWNER TO neondb_owner;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO neondb_owner;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: footer; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.footer (
    id integer NOT NULL,
    updated_at timestamp(3) with time zone,
    created_at timestamp(3) with time zone
);


ALTER TABLE public.footer OWNER TO neondb_owner;

--
-- Name: footer_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.footer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.footer_id_seq OWNER TO neondb_owner;

--
-- Name: footer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.footer_id_seq OWNED BY public.footer.id;


--
-- Name: footer_nav_items; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.footer_nav_items (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    link_type public.enum_footer_nav_items_link_type DEFAULT 'reference'::public.enum_footer_nav_items_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying NOT NULL
);


ALTER TABLE public.footer_nav_items OWNER TO neondb_owner;

--
-- Name: footer_rels; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.footer_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    pages_id integer,
    posts_id integer
);


ALTER TABLE public.footer_rels OWNER TO neondb_owner;

--
-- Name: footer_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.footer_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.footer_rels_id_seq OWNER TO neondb_owner;

--
-- Name: footer_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.footer_rels_id_seq OWNED BY public.footer_rels.id;


--
-- Name: form_submissions; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.form_submissions (
    id integer NOT NULL,
    form_id integer NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    payment_field character varying,
    payment_status character varying,
    payment_amount numeric,
    payment_payment_processor character varying,
    payment_credit_card_token character varying,
    payment_credit_card_brand character varying,
    payment_credit_card_number character varying
);


ALTER TABLE public.form_submissions OWNER TO neondb_owner;

--
-- Name: form_submissions_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.form_submissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.form_submissions_id_seq OWNER TO neondb_owner;

--
-- Name: form_submissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.form_submissions_id_seq OWNED BY public.form_submissions.id;


--
-- Name: form_submissions_submission_data; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.form_submissions_submission_data (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    field character varying NOT NULL,
    value character varying NOT NULL
);


ALTER TABLE public.form_submissions_submission_data OWNER TO neondb_owner;

--
-- Name: forms; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.forms (
    id integer NOT NULL,
    title character varying NOT NULL,
    submit_button_label character varying,
    confirmation_type public.enum_forms_confirmation_type DEFAULT 'message'::public.enum_forms_confirmation_type,
    confirmation_message jsonb,
    redirect_url character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.forms OWNER TO neondb_owner;

--
-- Name: forms_blocks_checkbox; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.forms_blocks_checkbox (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    name character varying NOT NULL,
    label character varying,
    width numeric,
    required boolean,
    default_value boolean,
    block_name character varying
);


ALTER TABLE public.forms_blocks_checkbox OWNER TO neondb_owner;

--
-- Name: forms_blocks_country; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.forms_blocks_country (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    name character varying NOT NULL,
    label character varying,
    width numeric,
    required boolean,
    block_name character varying
);


ALTER TABLE public.forms_blocks_country OWNER TO neondb_owner;

--
-- Name: forms_blocks_email; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.forms_blocks_email (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    name character varying NOT NULL,
    label character varying,
    width numeric,
    required boolean,
    block_name character varying
);


ALTER TABLE public.forms_blocks_email OWNER TO neondb_owner;

--
-- Name: forms_blocks_message; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.forms_blocks_message (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    message jsonb,
    block_name character varying
);


ALTER TABLE public.forms_blocks_message OWNER TO neondb_owner;

--
-- Name: forms_blocks_number; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.forms_blocks_number (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    name character varying NOT NULL,
    label character varying,
    width numeric,
    default_value numeric,
    required boolean,
    block_name character varying
);


ALTER TABLE public.forms_blocks_number OWNER TO neondb_owner;

--
-- Name: forms_blocks_payment; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.forms_blocks_payment (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    name character varying NOT NULL,
    label character varying,
    width numeric,
    base_price numeric,
    required boolean,
    block_name character varying
);


ALTER TABLE public.forms_blocks_payment OWNER TO neondb_owner;

--
-- Name: forms_blocks_payment_price_conditions; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.forms_blocks_payment_price_conditions (
    _order integer NOT NULL,
    _parent_id character varying NOT NULL,
    id character varying NOT NULL,
    field_to_use character varying,
    condition public.enum_forms_blocks_payment_price_conditions_condition DEFAULT 'hasValue'::public.enum_forms_blocks_payment_price_conditions_condition,
    value_for_condition character varying,
    operator public.enum_forms_blocks_payment_price_conditions_operator DEFAULT 'add'::public.enum_forms_blocks_payment_price_conditions_operator,
    value_type public.enum_forms_blocks_payment_price_conditions_value_type DEFAULT 'static'::public.enum_forms_blocks_payment_price_conditions_value_type,
    value_for_operator character varying
);


ALTER TABLE public.forms_blocks_payment_price_conditions OWNER TO neondb_owner;

--
-- Name: forms_blocks_select; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.forms_blocks_select (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    name character varying NOT NULL,
    label character varying,
    width numeric,
    default_value character varying,
    required boolean,
    block_name character varying
);


ALTER TABLE public.forms_blocks_select OWNER TO neondb_owner;

--
-- Name: forms_blocks_select_options; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.forms_blocks_select_options (
    _order integer NOT NULL,
    _parent_id character varying NOT NULL,
    id character varying NOT NULL,
    label character varying NOT NULL,
    value character varying NOT NULL
);


ALTER TABLE public.forms_blocks_select_options OWNER TO neondb_owner;

--
-- Name: forms_blocks_state; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.forms_blocks_state (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    name character varying NOT NULL,
    label character varying,
    width numeric,
    required boolean,
    block_name character varying
);


ALTER TABLE public.forms_blocks_state OWNER TO neondb_owner;

--
-- Name: forms_blocks_text; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.forms_blocks_text (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    name character varying NOT NULL,
    label character varying,
    width numeric,
    default_value character varying,
    required boolean,
    block_name character varying
);


ALTER TABLE public.forms_blocks_text OWNER TO neondb_owner;

--
-- Name: forms_blocks_textarea; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.forms_blocks_textarea (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    name character varying NOT NULL,
    label character varying,
    width numeric,
    default_value character varying,
    required boolean,
    block_name character varying
);


ALTER TABLE public.forms_blocks_textarea OWNER TO neondb_owner;

--
-- Name: forms_emails; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.forms_emails (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    email_to character varying,
    cc character varying,
    bcc character varying,
    reply_to character varying,
    email_from character varying,
    subject character varying DEFAULT 'You''''ve received a new message.'::character varying NOT NULL,
    message jsonb
);


ALTER TABLE public.forms_emails OWNER TO neondb_owner;

--
-- Name: forms_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.forms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forms_id_seq OWNER TO neondb_owner;

--
-- Name: forms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.forms_id_seq OWNED BY public.forms.id;


--
-- Name: header; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.header (
    id integer NOT NULL,
    updated_at timestamp(3) with time zone,
    created_at timestamp(3) with time zone
);


ALTER TABLE public.header OWNER TO neondb_owner;

--
-- Name: header_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.header_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.header_id_seq OWNER TO neondb_owner;

--
-- Name: header_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.header_id_seq OWNED BY public.header.id;


--
-- Name: header_nav_items; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.header_nav_items (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    link_type public.enum_header_nav_items_link_type DEFAULT 'reference'::public.enum_header_nav_items_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying NOT NULL
);


ALTER TABLE public.header_nav_items OWNER TO neondb_owner;

--
-- Name: header_rels; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.header_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    pages_id integer,
    posts_id integer
);


ALTER TABLE public.header_rels OWNER TO neondb_owner;

--
-- Name: header_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.header_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.header_rels_id_seq OWNER TO neondb_owner;

--
-- Name: header_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.header_rels_id_seq OWNED BY public.header_rels.id;


--
-- Name: media; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.media (
    id integer NOT NULL,
    alt character varying,
    caption jsonb,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    url character varying,
    thumbnail_u_r_l character varying,
    filename character varying,
    mime_type character varying,
    filesize numeric,
    width numeric,
    height numeric,
    focal_x numeric,
    focal_y numeric,
    sizes_thumbnail_url character varying,
    sizes_thumbnail_width numeric,
    sizes_thumbnail_height numeric,
    sizes_thumbnail_mime_type character varying,
    sizes_thumbnail_filesize numeric,
    sizes_thumbnail_filename character varying,
    sizes_square_url character varying,
    sizes_square_width numeric,
    sizes_square_height numeric,
    sizes_square_mime_type character varying,
    sizes_square_filesize numeric,
    sizes_square_filename character varying,
    sizes_small_url character varying,
    sizes_small_width numeric,
    sizes_small_height numeric,
    sizes_small_mime_type character varying,
    sizes_small_filesize numeric,
    sizes_small_filename character varying,
    sizes_medium_url character varying,
    sizes_medium_width numeric,
    sizes_medium_height numeric,
    sizes_medium_mime_type character varying,
    sizes_medium_filesize numeric,
    sizes_medium_filename character varying,
    sizes_large_url character varying,
    sizes_large_width numeric,
    sizes_large_height numeric,
    sizes_large_mime_type character varying,
    sizes_large_filesize numeric,
    sizes_large_filename character varying,
    sizes_xlarge_url character varying,
    sizes_xlarge_width numeric,
    sizes_xlarge_height numeric,
    sizes_xlarge_mime_type character varying,
    sizes_xlarge_filesize numeric,
    sizes_xlarge_filename character varying,
    sizes_og_url character varying,
    sizes_og_width numeric,
    sizes_og_height numeric,
    sizes_og_mime_type character varying,
    sizes_og_filesize numeric,
    sizes_og_filename character varying
);


ALTER TABLE public.media OWNER TO neondb_owner;

--
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.media_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.media_id_seq OWNER TO neondb_owner;

--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.media_id_seq OWNED BY public.media.id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.pages (
    id integer NOT NULL,
    title character varying,
    hero_type public.enum_pages_hero_type DEFAULT 'lowImpact'::public.enum_pages_hero_type,
    hero_rich_text jsonb,
    hero_media_id integer,
    hero_show_form boolean,
    hero_form_id integer,
    hero_form_background_color public.enum_pages_hero_form_background_color DEFAULT 'transparent'::public.enum_pages_hero_form_background_color,
    meta_title character varying,
    meta_image_id integer,
    meta_description character varying,
    published_at timestamp(3) with time zone,
    slug character varying,
    slug_lock boolean DEFAULT true,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    _status public.enum_pages_status DEFAULT 'draft'::public.enum_pages_status
);


ALTER TABLE public.pages OWNER TO neondb_owner;

--
-- Name: pages_blocks_archive; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.pages_blocks_archive (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    intro_content jsonb,
    populate_by public.enum_pages_blocks_archive_populate_by DEFAULT 'collection'::public.enum_pages_blocks_archive_populate_by,
    relation_to public.enum_pages_blocks_archive_relation_to DEFAULT 'posts'::public.enum_pages_blocks_archive_relation_to,
    "limit" numeric DEFAULT 10,
    block_name character varying
);


ALTER TABLE public.pages_blocks_archive OWNER TO neondb_owner;

--
-- Name: pages_blocks_content; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.pages_blocks_content (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    block_name character varying
);


ALTER TABLE public.pages_blocks_content OWNER TO neondb_owner;

--
-- Name: pages_blocks_content_columns; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.pages_blocks_content_columns (
    _order integer NOT NULL,
    _parent_id character varying NOT NULL,
    id character varying NOT NULL,
    size public.enum_pages_blocks_content_columns_size DEFAULT 'oneThird'::public.enum_pages_blocks_content_columns_size,
    rich_text jsonb,
    enable_link boolean,
    link_type public.enum_pages_blocks_content_columns_link_type DEFAULT 'reference'::public.enum_pages_blocks_content_columns_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying,
    link_appearance public.enum_pages_blocks_content_columns_link_appearance DEFAULT 'default'::public.enum_pages_blocks_content_columns_link_appearance
);


ALTER TABLE public.pages_blocks_content_columns OWNER TO neondb_owner;

--
-- Name: pages_blocks_cta; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.pages_blocks_cta (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    rich_text jsonb,
    block_name character varying
);


ALTER TABLE public.pages_blocks_cta OWNER TO neondb_owner;

--
-- Name: pages_blocks_cta_links; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.pages_blocks_cta_links (
    _order integer NOT NULL,
    _parent_id character varying NOT NULL,
    id character varying NOT NULL,
    link_type public.enum_pages_blocks_cta_links_link_type DEFAULT 'reference'::public.enum_pages_blocks_cta_links_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying,
    link_appearance public.enum_pages_blocks_cta_links_link_appearance DEFAULT 'default'::public.enum_pages_blocks_cta_links_link_appearance
);


ALTER TABLE public.pages_blocks_cta_links OWNER TO neondb_owner;

--
-- Name: pages_blocks_form_block; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.pages_blocks_form_block (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    form_id integer,
    enable_intro boolean,
    intro_content jsonb,
    background_color public.enum_pages_blocks_form_block_background_color DEFAULT 'white'::public.enum_pages_blocks_form_block_background_color,
    multi_step_enabled boolean,
    block_name character varying
);


ALTER TABLE public.pages_blocks_form_block OWNER TO neondb_owner;

--
-- Name: pages_blocks_form_block_multi_step_steps; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.pages_blocks_form_block_multi_step_steps (
    _order integer NOT NULL,
    _parent_id character varying NOT NULL,
    id character varying NOT NULL,
    title character varying,
    is_partners_step boolean
);


ALTER TABLE public.pages_blocks_form_block_multi_step_steps OWNER TO neondb_owner;

--
-- Name: pages_blocks_form_block_multi_step_steps_fields; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.pages_blocks_form_block_multi_step_steps_fields (
    _order integer NOT NULL,
    _parent_id character varying NOT NULL,
    id character varying NOT NULL,
    field_name character varying
);


ALTER TABLE public.pages_blocks_form_block_multi_step_steps_fields OWNER TO neondb_owner;

--
-- Name: pages_blocks_media_block; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.pages_blocks_media_block (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    media_id integer,
    block_name character varying
);


ALTER TABLE public.pages_blocks_media_block OWNER TO neondb_owner;

--
-- Name: pages_hero_links; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.pages_hero_links (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    link_type public.enum_pages_hero_links_link_type DEFAULT 'reference'::public.enum_pages_hero_links_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying,
    link_appearance public.enum_pages_hero_links_link_appearance DEFAULT 'default'::public.enum_pages_hero_links_link_appearance
);


ALTER TABLE public.pages_hero_links OWNER TO neondb_owner;

--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_id_seq OWNER TO neondb_owner;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;


--
-- Name: pages_rels; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.pages_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    pages_id integer,
    posts_id integer,
    categories_id integer
);


ALTER TABLE public.pages_rels OWNER TO neondb_owner;

--
-- Name: pages_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.pages_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_rels_id_seq OWNER TO neondb_owner;

--
-- Name: pages_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.pages_rels_id_seq OWNED BY public.pages_rels.id;


--
-- Name: payload_jobs; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.payload_jobs (
    id integer NOT NULL,
    input jsonb,
    completed_at timestamp(3) with time zone,
    total_tried numeric DEFAULT 0,
    has_error boolean DEFAULT false,
    error jsonb,
    task_slug public.enum_payload_jobs_task_slug,
    queue character varying DEFAULT 'default'::character varying,
    wait_until timestamp(3) with time zone,
    processing boolean DEFAULT false,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payload_jobs OWNER TO neondb_owner;

--
-- Name: payload_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.payload_jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payload_jobs_id_seq OWNER TO neondb_owner;

--
-- Name: payload_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.payload_jobs_id_seq OWNED BY public.payload_jobs.id;


--
-- Name: payload_jobs_log; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.payload_jobs_log (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    executed_at timestamp(3) with time zone NOT NULL,
    completed_at timestamp(3) with time zone NOT NULL,
    task_slug public.enum_payload_jobs_log_task_slug NOT NULL,
    task_i_d character varying NOT NULL,
    input jsonb,
    output jsonb,
    state public.enum_payload_jobs_log_state NOT NULL,
    error jsonb
);


ALTER TABLE public.payload_jobs_log OWNER TO neondb_owner;

--
-- Name: payload_locked_documents; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.payload_locked_documents (
    id integer NOT NULL,
    global_slug character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payload_locked_documents OWNER TO neondb_owner;

--
-- Name: payload_locked_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.payload_locked_documents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payload_locked_documents_id_seq OWNER TO neondb_owner;

--
-- Name: payload_locked_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.payload_locked_documents_id_seq OWNED BY public.payload_locked_documents.id;


--
-- Name: payload_locked_documents_rels; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.payload_locked_documents_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    pages_id integer,
    posts_id integer,
    media_id integer,
    categories_id integer,
    users_id integer,
    redirects_id integer,
    forms_id integer,
    form_submissions_id integer,
    search_id integer,
    payload_jobs_id integer
);


ALTER TABLE public.payload_locked_documents_rels OWNER TO neondb_owner;

--
-- Name: payload_locked_documents_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.payload_locked_documents_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payload_locked_documents_rels_id_seq OWNER TO neondb_owner;

--
-- Name: payload_locked_documents_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.payload_locked_documents_rels_id_seq OWNED BY public.payload_locked_documents_rels.id;


--
-- Name: payload_migrations; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.payload_migrations (
    id integer NOT NULL,
    name character varying,
    batch numeric,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payload_migrations OWNER TO neondb_owner;

--
-- Name: payload_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.payload_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payload_migrations_id_seq OWNER TO neondb_owner;

--
-- Name: payload_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.payload_migrations_id_seq OWNED BY public.payload_migrations.id;


--
-- Name: payload_preferences; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.payload_preferences (
    id integer NOT NULL,
    key character varying,
    value jsonb,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payload_preferences OWNER TO neondb_owner;

--
-- Name: payload_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.payload_preferences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payload_preferences_id_seq OWNER TO neondb_owner;

--
-- Name: payload_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.payload_preferences_id_seq OWNED BY public.payload_preferences.id;


--
-- Name: payload_preferences_rels; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.payload_preferences_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    users_id integer
);


ALTER TABLE public.payload_preferences_rels OWNER TO neondb_owner;

--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.payload_preferences_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payload_preferences_rels_id_seq OWNER TO neondb_owner;

--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.payload_preferences_rels_id_seq OWNED BY public.payload_preferences_rels.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    title character varying,
    hero_image_id integer,
    content jsonb,
    meta_title character varying,
    meta_image_id integer,
    meta_description character varying,
    published_at timestamp(3) with time zone,
    slug character varying,
    slug_lock boolean DEFAULT true,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    _status public.enum_posts_status DEFAULT 'draft'::public.enum_posts_status
);


ALTER TABLE public.posts OWNER TO neondb_owner;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO neondb_owner;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: posts_populated_authors; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.posts_populated_authors (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    name character varying
);


ALTER TABLE public.posts_populated_authors OWNER TO neondb_owner;

--
-- Name: posts_rels; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.posts_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    posts_id integer,
    categories_id integer,
    users_id integer
);


ALTER TABLE public.posts_rels OWNER TO neondb_owner;

--
-- Name: posts_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.posts_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_rels_id_seq OWNER TO neondb_owner;

--
-- Name: posts_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.posts_rels_id_seq OWNED BY public.posts_rels.id;


--
-- Name: redirects; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.redirects (
    id integer NOT NULL,
    "from" character varying NOT NULL,
    to_type public.enum_redirects_to_type DEFAULT 'reference'::public.enum_redirects_to_type,
    to_url character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.redirects OWNER TO neondb_owner;

--
-- Name: redirects_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.redirects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.redirects_id_seq OWNER TO neondb_owner;

--
-- Name: redirects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.redirects_id_seq OWNED BY public.redirects.id;


--
-- Name: redirects_rels; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.redirects_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    pages_id integer,
    posts_id integer
);


ALTER TABLE public.redirects_rels OWNER TO neondb_owner;

--
-- Name: redirects_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.redirects_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.redirects_rels_id_seq OWNER TO neondb_owner;

--
-- Name: redirects_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.redirects_rels_id_seq OWNED BY public.redirects_rels.id;


--
-- Name: search; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.search (
    id integer NOT NULL,
    title character varying,
    priority numeric,
    slug character varying,
    meta_title character varying,
    meta_description character varying,
    meta_image_id integer,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.search OWNER TO neondb_owner;

--
-- Name: search_categories; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.search_categories (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    relation_to character varying,
    title character varying
);


ALTER TABLE public.search_categories OWNER TO neondb_owner;

--
-- Name: search_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.search_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.search_id_seq OWNER TO neondb_owner;

--
-- Name: search_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.search_id_seq OWNED BY public.search.id;


--
-- Name: search_rels; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.search_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    posts_id integer
);


ALTER TABLE public.search_rels OWNER TO neondb_owner;

--
-- Name: search_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.search_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.search_rels_id_seq OWNER TO neondb_owner;

--
-- Name: search_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.search_rels_id_seq OWNED BY public.search_rels.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    email character varying NOT NULL,
    reset_password_token character varying,
    reset_password_expiration timestamp(3) with time zone,
    salt character varying,
    hash character varying,
    login_attempts numeric DEFAULT 0,
    lock_until timestamp(3) with time zone
);


ALTER TABLE public.users OWNER TO neondb_owner;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO neondb_owner;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: _pages_v id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v ALTER COLUMN id SET DEFAULT nextval('public._pages_v_id_seq'::regclass);


--
-- Name: _pages_v_blocks_archive id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_blocks_archive ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_archive_id_seq'::regclass);


--
-- Name: _pages_v_blocks_content id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_blocks_content ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_content_id_seq'::regclass);


--
-- Name: _pages_v_blocks_content_columns id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_blocks_content_columns ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_content_columns_id_seq'::regclass);


--
-- Name: _pages_v_blocks_cta id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_blocks_cta ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_cta_id_seq'::regclass);


--
-- Name: _pages_v_blocks_cta_links id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_blocks_cta_links ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_cta_links_id_seq'::regclass);


--
-- Name: _pages_v_blocks_form_block id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_blocks_form_block ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_form_block_id_seq'::regclass);


--
-- Name: _pages_v_blocks_form_block_multi_step_steps id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_blocks_form_block_multi_step_steps ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_form_block_multi_step_steps_id_seq'::regclass);


--
-- Name: _pages_v_blocks_form_block_multi_step_steps_fields id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_blocks_form_block_multi_step_steps_fields ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_form_block_multi_step_steps_fields_id_seq'::regclass);


--
-- Name: _pages_v_blocks_media_block id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_blocks_media_block ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_media_block_id_seq'::regclass);


--
-- Name: _pages_v_rels id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_rels ALTER COLUMN id SET DEFAULT nextval('public._pages_v_rels_id_seq'::regclass);


--
-- Name: _pages_v_version_hero_links id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_version_hero_links ALTER COLUMN id SET DEFAULT nextval('public._pages_v_version_hero_links_id_seq'::regclass);


--
-- Name: _posts_v id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._posts_v ALTER COLUMN id SET DEFAULT nextval('public._posts_v_id_seq'::regclass);


--
-- Name: _posts_v_rels id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._posts_v_rels ALTER COLUMN id SET DEFAULT nextval('public._posts_v_rels_id_seq'::regclass);


--
-- Name: _posts_v_version_populated_authors id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._posts_v_version_populated_authors ALTER COLUMN id SET DEFAULT nextval('public._posts_v_version_populated_authors_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: footer id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.footer ALTER COLUMN id SET DEFAULT nextval('public.footer_id_seq'::regclass);


--
-- Name: footer_rels id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.footer_rels ALTER COLUMN id SET DEFAULT nextval('public.footer_rels_id_seq'::regclass);


--
-- Name: form_submissions id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.form_submissions ALTER COLUMN id SET DEFAULT nextval('public.form_submissions_id_seq'::regclass);


--
-- Name: forms id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.forms ALTER COLUMN id SET DEFAULT nextval('public.forms_id_seq'::regclass);


--
-- Name: header id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.header ALTER COLUMN id SET DEFAULT nextval('public.header_id_seq'::regclass);


--
-- Name: header_rels id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.header_rels ALTER COLUMN id SET DEFAULT nextval('public.header_rels_id_seq'::regclass);


--
-- Name: media id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.media ALTER COLUMN id SET DEFAULT nextval('public.media_id_seq'::regclass);


--
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);


--
-- Name: pages_rels id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages_rels ALTER COLUMN id SET DEFAULT nextval('public.pages_rels_id_seq'::regclass);


--
-- Name: payload_jobs id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.payload_jobs ALTER COLUMN id SET DEFAULT nextval('public.payload_jobs_id_seq'::regclass);


--
-- Name: payload_locked_documents id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.payload_locked_documents ALTER COLUMN id SET DEFAULT nextval('public.payload_locked_documents_id_seq'::regclass);


--
-- Name: payload_locked_documents_rels id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.payload_locked_documents_rels ALTER COLUMN id SET DEFAULT nextval('public.payload_locked_documents_rels_id_seq'::regclass);


--
-- Name: payload_migrations id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.payload_migrations ALTER COLUMN id SET DEFAULT nextval('public.payload_migrations_id_seq'::regclass);


--
-- Name: payload_preferences id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.payload_preferences ALTER COLUMN id SET DEFAULT nextval('public.payload_preferences_id_seq'::regclass);


--
-- Name: payload_preferences_rels id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.payload_preferences_rels ALTER COLUMN id SET DEFAULT nextval('public.payload_preferences_rels_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: posts_rels id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.posts_rels ALTER COLUMN id SET DEFAULT nextval('public.posts_rels_id_seq'::regclass);


--
-- Name: redirects id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.redirects ALTER COLUMN id SET DEFAULT nextval('public.redirects_id_seq'::regclass);


--
-- Name: redirects_rels id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.redirects_rels ALTER COLUMN id SET DEFAULT nextval('public.redirects_rels_id_seq'::regclass);


--
-- Name: search id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.search ALTER COLUMN id SET DEFAULT nextval('public.search_id_seq'::regclass);


--
-- Name: search_rels id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.search_rels ALTER COLUMN id SET DEFAULT nextval('public.search_rels_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: _pages_v; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public._pages_v (id, parent_id, version_title, version_hero_type, version_hero_rich_text, version_hero_media_id, version_hero_show_form, version_hero_form_id, version_hero_form_background_color, version_meta_title, version_meta_image_id, version_meta_description, version_published_at, version_slug, version_slug_lock, version_updated_at, version_created_at, version__status, created_at, updated_at, latest, autosave) FROM stdin;
18	1	Contact	highImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Estamos aquí para ayudarte!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Si tienes alguna pregunta o necesitas más información, no dudes en contactarnos. Puedes escribirnos a:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"id": "67cd51c3ece25ca3df7a6475", "type": "link", "fields": {"url": "mailto:hola@nuo.lat", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "hola@nuo.lat", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "+51925573697", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "DISHUB - Calle Alcanfores 425, Miraflores, 15048, Lima, Perú.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "O bien, completa el formulario y uno de nuestros asesores se pondrá en contacto contigo.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	t	1	transparent	Contact NUO LAT	\N	\N	2025-03-09 08:22:18.525+00	contact	t	2025-03-09 08:37:49.363+00	2025-03-09 08:17:59.614+00	published	2025-03-09 08:37:49.553+00	2025-03-09 08:37:49.554+00	f	f
66	11	Registro de Empresa	lowImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Comienza tu Registro de Empresa", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Completa el formulario paso a paso para iniciar el proceso de registro de tu empresa en Perú de manera sencilla y guiada.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	8	\N	\N	transparent	Registro de Empresa - Nuolat	\N	Proceso de registro de empresa en Perú con Nuolat	2025-03-10 16:08:43.989+00	registro-de-empresa	t	2025-03-10 16:51:50.603+00	2025-03-09 11:21:33.279+00	published	2025-03-10 16:51:50.847+00	2025-03-10 16:51:50.848+00	t	f
57	11	Registro de Empresa	lowImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Comienza tu Registro de Empresa", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Completa el formulario paso a paso para iniciar el proceso de registro de tu empresa en Perú de manera sencilla y guiada.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	8	\N	\N	transparent	Registro de Empresa - Nuolat	\N	Proceso de registro de empresa en Perú con Nuolat	2025-03-10 16:08:42.031+00	registro-de-empresa	t	2025-03-10 16:08:42.032+00	2025-03-09 11:21:33.279+00	draft	2025-03-10 16:08:39.157+00	2025-03-10 16:08:42.06+00	f	t
65	11	Registro de Empresa	lowImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Comienza tu Registro de Empresa", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Completa el formulario paso a paso para iniciar el proceso de registro de tu empresa en Perú de manera sencilla y guiada.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	8	\N	\N	transparent	Registro de Empresa - Nuolat	\N	Proceso de registro de empresa en Perú con Nuolat	2025-03-10 16:08:43.989+00	registro-de-empresa	t	2025-03-10 16:51:44.326+00	2025-03-09 11:21:33.279+00	draft	2025-03-10 16:51:31.344+00	2025-03-10 16:51:44.348+00	f	t
58	11	Registro de Empresa	lowImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Comienza tu Registro de Empresa", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Completa el formulario paso a paso para iniciar el proceso de registro de tu empresa en Perú de manera sencilla y guiada.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	8	\N	\N	transparent	Registro de Empresa - Nuolat	\N	Proceso de registro de empresa en Perú con Nuolat	2025-03-10 16:08:43.989+00	registro-de-empresa	t	2025-03-10 16:08:44.009+00	2025-03-09 11:21:33.279+00	published	2025-03-10 16:08:44.232+00	2025-03-10 16:08:44.233+00	f	f
23	2	Home	highImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Expande tu negocio en Latinoamérica sin complicaciones!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Nos encargamos de todo: desde la apertura de tu cuenta bancaria hasta la contabilidad, para que conquistes nuevos mercados sin preocupaciones.", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	\N	\N	transparent	NUO LAT	8	An open-source website built with Payload and Next.js.	2025-03-09 08:33:52.454+00	home	t	2025-03-09 08:52:43.278+00	2025-03-09 08:18:13.954+00	published	2025-03-09 08:52:43.545+00	2025-03-09 08:52:43.545+00	f	f
19	4	\N	lowImpact	\N	\N	\N	\N	transparent	\N	\N	\N	\N	\N	t	2025-03-09 08:45:55.789+00	2025-03-09 08:45:55.775+00	draft	2025-03-09 08:45:55.87+00	2025-03-09 08:45:55.87+00	f	f
14	1	Contact	highImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Estamos aquí para ayudarte!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Si tienes alguna pregunta o necesitas más información, no dudes en contactarnos. Puedes escribirnos a:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"id": "67cd51c3ece25ca3df7a6475", "type": "link", "fields": {"url": "mailto:hola@nuo.lat", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "hola@nuo.lat", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "+51925573697", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "DISHUB - Calle Alcanfores 425, Miraflores, 15048, Lima, Perú.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "O bien, completa el formulario y uno de nuestros asesores se pondrá en contacto contigo.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	t	1	transparent	Contact NUO LAT	\N	\N	2025-03-09 08:22:18.525+00	contact	t	2025-03-09 08:32:26.324+00	2025-03-09 08:17:59.614+00	published	2025-03-09 08:32:26.5+00	2025-03-09 08:32:26.501+00	f	f
10	1	Contact	highImpact	\N	8	t	1	transparent	Contact NUO LAT	\N	\N	2025-03-09 08:22:18.525+00	contact	t	2025-03-09 08:30:13.956+00	2025-03-09 08:17:59.614+00	published	2025-03-09 08:30:16.054+00	2025-03-09 08:30:16.055+00	f	f
9	1	Contact	highImpact	\N	8	t	1	transparent	Contact NUO LAT	\N	\N	2025-03-09 08:22:18.525+00	contact	t	2025-03-09 08:30:06.985+00	2025-03-09 08:17:59.614+00	draft	2025-03-09 08:29:24.146+00	2025-03-09 08:30:07.16+00	f	t
8	1	Contact	highImpact	\N	8	t	1	transparent	Contact NUO LAT	\N	\N	2025-03-09 08:22:18.525+00	contact	t	2025-03-09 08:28:42.561+00	2025-03-09 08:17:59.614+00	published	2025-03-09 08:28:44.429+00	2025-03-09 08:28:44.43+00	f	f
6	1	Contact	highImpact	\N	8	t	1	transparent	Contact NUO LAT	\N	\N	2025-03-09 08:22:18.525+00	contact	t	2025-03-09 08:27:35.686+00	2025-03-09 08:17:59.614+00	published	2025-03-09 08:27:37.555+00	2025-03-09 08:27:37.557+00	f	f
32	4	About Us	mediumImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Softlandero Evoluciona, el futuro es ahora.", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Somos NUO", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Hacemos que el crecimiento de tu empresa en nuevos mercados sea ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "ágil", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "estratégico ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "y ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "sin fricciones", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Porque ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "expandirse ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "no debería ser complicado, sino una ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "oportunidad ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "para escalar con", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": " inteligencia", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " y ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "sin límites", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	\N	\N	transparent	\N	\N	\N	2025-03-09 08:46:13.591+00	about-us	t	2025-03-09 09:01:10.246+00	2025-03-09 08:45:55.775+00	published	2025-03-09 09:01:10.554+00	2025-03-09 09:01:10.555+00	f	f
7	1	Contact	highImpact	\N	8	t	1	transparent	Contact NUO LAT	\N	\N	2025-03-09 08:22:18.525+00	contact	t	2025-03-09 08:28:37.833+00	2025-03-09 08:17:59.614+00	draft	2025-03-09 08:28:34.065+00	2025-03-09 08:28:38.047+00	f	t
60	2	Home	highImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Expande tu negocio en Latinoamérica sin complicaciones!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Nos encargamos de todo: desde la apertura de tu cuenta bancaria hasta la contabilidad, para que conquistes nuevos mercados sin preocupaciones.", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	\N	\N	transparent	NUO LAT	8	An open-source website built with Payload and Next.js.	2025-03-09 08:33:52.454+00	home	t	2025-03-10 16:10:09.604+00	2025-03-09 08:18:13.954+00	published	2025-03-10 16:10:09.924+00	2025-03-10 16:10:09.925+00	t	f
34	4	About Us	mediumImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Softlandero Evoluciona, el futuro es ahora.", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Somos NUO", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Hacemos que el crecimiento de tu empresa en nuevos mercados sea ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "ágil", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "estratégico ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "y ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "sin fricciones", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Porque ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "expandirse ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "no debería ser complicado, sino una ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "oportunidad ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "para escalar con", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": " inteligencia", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " y ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "sin límites", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	\N	\N	transparent	\N	\N	\N	2025-03-09 08:46:13.591+00	about-us	t	2025-03-09 09:01:21.344+00	2025-03-09 08:45:55.775+00	published	2025-03-09 09:01:21.566+00	2025-03-09 09:01:21.566+00	f	f
25	2	Home	highImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Expande tu negocio en Latinoamérica sin complicaciones!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Nos encargamos de todo: desde la apertura de tu cuenta bancaria hasta la contabilidad, para que conquistes nuevos mercados sin preocupaciones.", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	\N	\N	transparent	NUO LAT	8	An open-source website built with Payload and Next.js.	2025-03-09 08:33:52.454+00	home	t	2025-03-09 08:53:17.499+00	2025-03-09 08:18:13.954+00	published	2025-03-09 08:53:17.751+00	2025-03-09 08:53:17.752+00	f	f
59	2	Home	highImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Expande tu negocio en Latinoamérica sin complicaciones!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Nos encargamos de todo: desde la apertura de tu cuenta bancaria hasta la contabilidad, para que conquistes nuevos mercados sin preocupaciones.", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	\N	\N	transparent	NUO LAT	8	An open-source website built with Payload and Next.js.	2025-03-09 08:33:52.454+00	home	t	2025-03-10 16:10:08.193+00	2025-03-09 08:18:13.954+00	draft	2025-03-10 16:09:59.679+00	2025-03-10 16:10:08.215+00	f	t
22	2	Home	highImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Expande tu negocio en Latinoamérica sin complicaciones!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Nos encargamos de todo: desde la apertura de tu cuenta bancaria hasta la contabilidad, para que conquistes nuevos mercados sin preocupaciones.", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	\N	\N	transparent	NUO LAT	8	An open-source website built with Payload and Next.js.	2025-03-09 08:33:52.454+00	home	t	2025-03-09 08:52:41.022+00	2025-03-09 08:18:13.954+00	draft	2025-03-09 08:52:27.021+00	2025-03-09 08:52:41.044+00	f	t
11	1	Contact	highImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Estamos aquí para ayudarte!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Si tienes alguna pregunta o necesitas más información, no dudes en contactarnos. Puedes escribirnos a:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"id": "67cd51c3ece25ca3df7a6475", "type": "link", "fields": {"url": "mailto:hola@nuo.lat", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "hola@nuo.lat", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "+51925573697", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "DISHUB - Calle Alcanfores 425, Miraflores, 15048, Lima, Perú.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "O bien, completa el formulario y uno de nuestros asesores se pondrá en contacto contigo.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	t	1	transparent	Contact NUO LAT	\N	\N	2025-03-09 08:22:18.525+00	contact	t	2025-03-09 08:31:10.025+00	2025-03-09 08:17:59.614+00	draft	2025-03-09 08:30:42.296+00	2025-03-09 08:31:10.226+00	f	t
1	1	Contact	none	\N	\N	\N	\N	transparent	\N	\N	\N	\N	contact	t	2025-03-09 08:18:13.285+00	2025-03-09 08:17:59.614+00	published	2025-03-09 08:18:14.166+00	2025-03-09 08:18:14.169+00	f	f
5	1	Contact	highImpact	\N	8	t	1	transparent	Contact NUO LAT	\N	\N	2025-03-09 08:22:18.525+00	contact	t	2025-03-09 08:27:30.156+00	2025-03-09 08:17:59.614+00	draft	2025-03-09 08:22:14.414+00	2025-03-09 08:27:30.354+00	f	t
51	2	Home	highImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Expande tu negocio en Latinoamérica sin complicaciones!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Nos encargamos de todo: desde la apertura de tu cuenta bancaria hasta la contabilidad, para que conquistes nuevos mercados sin preocupaciones.", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	\N	\N	transparent	NUO LAT	8	An open-source website built with Payload and Next.js.	2025-03-09 08:33:52.454+00	home	t	2025-03-09 11:29:03.564+00	2025-03-09 08:18:13.954+00	draft	2025-03-09 11:28:44.995+00	2025-03-09 11:29:03.611+00	f	t
2	2	Home	highImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "NUO LAT", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Visit the admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " to begin managing this site's content. The code for this template is completely open-source and can be found ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://github.com/payloadcms/payload/tree/main/templates/website", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "on our Github", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ". ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	8	\N	\N	transparent	NUO LAT	8	An open-source website built with Payload and Next.js.	\N	home	t	2025-03-09 08:18:13.257+00	2025-03-09 08:18:13.954+00	published	2025-03-09 08:18:15.24+00	2025-03-09 08:18:15.242+00	f	f
16	2	Home	highImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "NUO LAT", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Visit the admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " to begin managing this site's content. The code for this template is completely open-source and can be found ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://github.com/payloadcms/payload/tree/main/templates/website", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "on our Github", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ". ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	8	\N	\N	transparent	NUO LAT	8	An open-source website built with Payload and Next.js.	2025-03-09 08:33:52.454+00	home	t	2025-03-09 08:33:52.477+00	2025-03-09 08:18:13.954+00	published	2025-03-09 08:33:55.591+00	2025-03-09 08:33:55.593+00	f	f
31	4	About Us	mediumImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Softlandero Evoluciona, el futuro es ahora.", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Somos NUO", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Hacemos que el crecimiento de tu empresa en nuevos mercados sea ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "ágil", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "estratégico ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "y ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "sin fricciones", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Porque ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "expandirse ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "no debería ser complicado, sino una ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "oportunidad ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "para escalar con", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": " inteligencia", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " y ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "sin límites", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	\N	\N	transparent	\N	\N	\N	2025-03-09 08:46:13.591+00	about-us	t	2025-03-09 09:01:08.894+00	2025-03-09 08:45:55.775+00	draft	2025-03-09 09:01:08.044+00	2025-03-09 09:01:08.915+00	f	t
33	4	About Us	mediumImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Softlandero Evoluciona, el futuro es ahora.", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Somos NUO", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Hacemos que el crecimiento de tu empresa en nuevos mercados sea ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "ágil", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "estratégico ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "y ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "sin fricciones", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Porque ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "expandirse ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "no debería ser complicado, sino una ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "oportunidad ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "para escalar con", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": " inteligencia", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " y ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "sin límites", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	\N	\N	transparent	\N	\N	\N	2025-03-09 08:46:13.591+00	about-us	t	2025-03-09 09:01:20.446+00	2025-03-09 08:45:55.775+00	draft	2025-03-09 09:01:19.503+00	2025-03-09 09:01:20.468+00	f	t
52	2	Home	highImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Expande tu negocio en Latinoamérica sin complicaciones!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Nos encargamos de todo: desde la apertura de tu cuenta bancaria hasta la contabilidad, para que conquistes nuevos mercados sin preocupaciones.", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	\N	\N	transparent	NUO LAT	8	An open-source website built with Payload and Next.js.	2025-03-09 08:33:52.454+00	home	t	2025-03-09 11:29:05.442+00	2025-03-09 08:18:13.954+00	published	2025-03-09 11:29:05.721+00	2025-03-09 11:29:05.721+00	f	f
15	2	Home	highImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "NUO LAT", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Visit the admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " to begin managing this site's content. The code for this template is completely open-source and can be found ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://github.com/payloadcms/payload/tree/main/templates/website", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "on our Github", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ". ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	8	\N	\N	transparent	NUO LAT	8	An open-source website built with Payload and Next.js.	2025-03-09 08:33:44.356+00	home	t	2025-03-09 08:33:44.358+00	2025-03-09 08:18:13.954+00	draft	2025-03-09 08:33:28.911+00	2025-03-09 08:33:44.698+00	f	t
27	2	Home	highImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Expande tu negocio en Latinoamérica sin complicaciones!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Nos encargamos de todo: desde la apertura de tu cuenta bancaria hasta la contabilidad, para que conquistes nuevos mercados sin preocupaciones.", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	\N	\N	transparent	NUO LAT	8	An open-source website built with Payload and Next.js.	2025-03-09 08:33:52.454+00	home	t	2025-03-09 08:56:06.766+00	2025-03-09 08:18:13.954+00	published	2025-03-09 08:56:07.027+00	2025-03-09 08:56:07.027+00	f	f
50	11	Registro de Empresa	highImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Comienza tu Registro de Empresa", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Completa el formulario paso a paso para iniciar el proceso de registro de tu empresa en Perú de manera sencilla y guiada.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	8	\N	\N	transparent	Registro de Empresa - Nuolat	\N	Proceso de registro de empresa en Perú con Nuolat	\N	onboarding	t	2025-03-09 11:21:32.524+00	2025-03-09 11:21:33.279+00	published	2025-03-09 11:21:33.586+00	2025-03-09 11:21:33.59+00	f	f
28	4	About Us	mediumImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Softlandero Evoluciona, el futuro es ahora.", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Somos NUO", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Hacemos que el crecimiento de tu empresa en nuevos mercados sea ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "ágil", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "estratégico ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "y ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "sin fricciones", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Porque ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "expandirse ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "no debería ser complicado, sino una ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "oportunidad ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "para escalar con", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": " inteligencia", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " y ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "sin límites", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	\N	\N	transparent	\N	\N	\N	2025-03-09 08:46:13.591+00	about-us	t	2025-03-09 09:00:26.824+00	2025-03-09 08:45:55.775+00	published	2025-03-09 09:00:27.039+00	2025-03-09 09:00:27.039+00	f	f
24	2	Home	highImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Expande tu negocio en Latinoamérica sin complicaciones!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Nos encargamos de todo: desde la apertura de tu cuenta bancaria hasta la contabilidad, para que conquistes nuevos mercados sin preocupaciones.", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	\N	\N	transparent	NUO LAT	8	An open-source website built with Payload and Next.js.	2025-03-09 08:33:52.454+00	home	t	2025-03-09 08:53:13.965+00	2025-03-09 08:18:13.954+00	draft	2025-03-09 08:52:50.391+00	2025-03-09 08:53:13.988+00	f	t
20	4	About Us	mediumImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Softlandero Evoluciona, el futuro es ahora.", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Somos NUO", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Hacemos que el crecimiento de tu empresa en nuevos mercados sea ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "ágil", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "estratégico ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "y ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "sin fricciones", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Porque ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "expandirse ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "no debería ser complicado, sino una ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "oportunidad ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "para escalar con", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": " inteligencia", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " y ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "sin límites", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	\N	\N	transparent	\N	\N	\N	2025-03-09 08:46:13.591+00	about-us	t	2025-03-09 09:00:24.434+00	2025-03-09 08:45:55.775+00	draft	2025-03-09 08:45:57.197+00	2025-03-09 09:00:24.454+00	f	t
53	4	About Us	mediumImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Softlandero Evoluciona, el futuro es ahora.", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Somos NUO", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Hacemos que el crecimiento de tu empresa en nuevos mercados sea ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "ágil", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "estratégico ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "y ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "sin fricciones", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Porque ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "expandirse ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "no debería ser complicado, sino una ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "oportunidad ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "para escalar con", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": " inteligencia", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " y ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "sin límites", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	\N	\N	transparent	\N	\N	\N	2025-03-09 08:46:13.591+00	about-us	t	2025-03-09 11:29:55.476+00	2025-03-09 08:45:55.775+00	draft	2025-03-09 11:29:38.662+00	2025-03-09 11:29:55.496+00	f	t
26	2	Home	highImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Expande tu negocio en Latinoamérica sin complicaciones!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Nos encargamos de todo: desde la apertura de tu cuenta bancaria hasta la contabilidad, para que conquistes nuevos mercados sin preocupaciones.", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	\N	\N	transparent	NUO LAT	8	An open-source website built with Payload and Next.js.	2025-03-09 08:33:52.454+00	home	t	2025-03-09 08:56:00.668+00	2025-03-09 08:18:13.954+00	draft	2025-03-09 08:53:33.938+00	2025-03-09 08:56:00.69+00	f	t
62	4	About Us	mediumImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Softlandero Evoluciona, el futuro es ahora.", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Somos NUO", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Hacemos que el crecimiento de tu empresa en nuevos mercados sea ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "ágil", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "estratégico ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "y ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "sin fricciones", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Porque ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "expandirse ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "no debería ser complicado, sino una ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "oportunidad ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "para escalar con", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": " inteligencia", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " y ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "sin límites", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	\N	\N	transparent	\N	\N	\N	2025-03-09 08:46:13.591+00	about-us	t	2025-03-10 16:10:33.88+00	2025-03-09 08:45:55.775+00	published	2025-03-10 16:10:34.093+00	2025-03-10 16:10:34.093+00	t	f
61	4	About Us	mediumImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Softlandero Evoluciona, el futuro es ahora.", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Somos NUO", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Hacemos que el crecimiento de tu empresa en nuevos mercados sea ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "ágil", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "estratégico ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "y ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "sin fricciones", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Porque ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "expandirse ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "no debería ser complicado, sino una ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "oportunidad ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "para escalar con", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": " inteligencia", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " y ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "sin límites", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	\N	\N	transparent	\N	\N	\N	2025-03-09 08:46:13.591+00	about-us	t	2025-03-10 16:10:32.589+00	2025-03-09 08:45:55.775+00	draft	2025-03-10 16:10:15.749+00	2025-03-10 16:10:32.61+00	f	t
63	1	Contact	highImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Estamos aquí para ayudarte!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Si tienes alguna pregunta o necesitas más información, no dudes en contactarnos. Puedes escribirnos a:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"id": "67cd51c3ece25ca3df7a6475", "type": "link", "fields": {"url": "mailto:hola@nuo.lat", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "hola@nuo.lat", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "+51925573697", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "DISHUB - Calle Alcanfores 425, Miraflores, 15048, Lima, Perú.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "O bien, completa el formulario y uno de nuestros asesores se pondrá en contacto contigo.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	t	1	transparent	Contact NUO LAT	\N	\N	2025-03-09 08:22:18.525+00	contact	t	2025-03-10 16:10:42.828+00	2025-03-09 08:17:59.614+00	draft	2025-03-10 16:10:41.962+00	2025-03-10 16:10:42.849+00	f	t
54	4	About Us	mediumImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Softlandero Evoluciona, el futuro es ahora.", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Somos NUO", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Hacemos que el crecimiento de tu empresa en nuevos mercados sea ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "ágil", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "estratégico ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "y ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "sin fricciones", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Porque ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "expandirse ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "no debería ser complicado, sino una ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "oportunidad ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "para escalar con", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": " inteligencia", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " y ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "sin límites", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	\N	\N	transparent	\N	\N	\N	2025-03-09 08:46:13.591+00	about-us	t	2025-03-09 11:29:56.802+00	2025-03-09 08:45:55.775+00	published	2025-03-09 11:29:57.01+00	2025-03-09 11:29:57.011+00	f	f
30	4	About Us	mediumImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Softlandero Evoluciona, el futuro es ahora.", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Somos NUO", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Hacemos que el crecimiento de tu empresa en nuevos mercados sea ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "ágil", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "estratégico ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "y ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "sin fricciones", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Porque ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "expandirse ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "no debería ser complicado, sino una ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "oportunidad ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "para escalar con", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": " inteligencia", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " y ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "sin límites", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	\N	\N	transparent	\N	\N	\N	2025-03-09 08:46:13.591+00	about-us	t	2025-03-09 09:00:57.54+00	2025-03-09 08:45:55.775+00	published	2025-03-09 09:00:57.767+00	2025-03-09 09:00:57.767+00	f	f
64	1	Contact	highImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Estamos aquí para ayudarte!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Si tienes alguna pregunta o necesitas más información, no dudes en contactarnos. Puedes escribirnos a:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"id": "67cd51c3ece25ca3df7a6475", "type": "link", "fields": {"url": "mailto:hola@nuo.lat", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "hola@nuo.lat", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "+51925573697", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "DISHUB - Calle Alcanfores 425, Miraflores, 15048, Lima, Perú.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "O bien, completa el formulario y uno de nuestros asesores se pondrá en contacto contigo.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	t	1	transparent	Contact NUO LAT	\N	\N	2025-03-09 08:22:18.525+00	contact	t	2025-03-10 16:10:48.926+00	2025-03-09 08:17:59.614+00	published	2025-03-10 16:10:49.119+00	2025-03-10 16:10:49.12+00	t	f
56	1	Contact	highImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Estamos aquí para ayudarte!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Si tienes alguna pregunta o necesitas más información, no dudes en contactarnos. Puedes escribirnos a:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"id": "67cd51c3ece25ca3df7a6475", "type": "link", "fields": {"url": "mailto:hola@nuo.lat", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "hola@nuo.lat", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "+51925573697", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "DISHUB - Calle Alcanfores 425, Miraflores, 15048, Lima, Perú.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "O bien, completa el formulario y uno de nuestros asesores se pondrá en contacto contigo.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	t	1	transparent	Contact NUO LAT	\N	\N	2025-03-09 08:22:18.525+00	contact	t	2025-03-09 11:30:13.572+00	2025-03-09 08:17:59.614+00	published	2025-03-09 11:30:13.782+00	2025-03-09 11:30:13.783+00	f	f
12	1	Contact	highImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Estamos aquí para ayudarte!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Si tienes alguna pregunta o necesitas más información, no dudes en contactarnos. Puedes escribirnos a:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"id": "67cd51c3ece25ca3df7a6475", "type": "link", "fields": {"url": "mailto:hola@nuo.lat", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "hola@nuo.lat", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "+51925573697", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "DISHUB - Calle Alcanfores 425, Miraflores, 15048, Lima, Perú.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "O bien, completa el formulario y uno de nuestros asesores se pondrá en contacto contigo.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	t	1	transparent	Contact NUO LAT	\N	\N	2025-03-09 08:22:18.525+00	contact	t	2025-03-09 08:31:16.649+00	2025-03-09 08:17:59.614+00	published	2025-03-09 08:31:18.563+00	2025-03-09 08:31:18.564+00	f	f
29	4	About Us	mediumImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Softlandero Evoluciona, el futuro es ahora.", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Somos NUO", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Hacemos que el crecimiento de tu empresa en nuevos mercados sea ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "ágil", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "estratégico ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "y ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "sin fricciones", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Porque ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "expandirse ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "no debería ser complicado, sino una ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "oportunidad ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "para escalar con", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": " inteligencia", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " y ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "sin límites", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	\N	\N	transparent	\N	\N	\N	2025-03-09 08:46:13.591+00	about-us	t	2025-03-09 09:00:56.275+00	2025-03-09 08:45:55.775+00	draft	2025-03-09 09:00:55.258+00	2025-03-09 09:00:56.296+00	f	t
55	1	Contact	highImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Estamos aquí para ayudarte!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Si tienes alguna pregunta o necesitas más información, no dudes en contactarnos. Puedes escribirnos a:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"id": "67cd51c3ece25ca3df7a6475", "type": "link", "fields": {"url": "mailto:hola@nuo.lat", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "hola@nuo.lat", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "+51925573697", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "DISHUB - Calle Alcanfores 425, Miraflores, 15048, Lima, Perú.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "O bien, completa el formulario y uno de nuestros asesores se pondrá en contacto contigo.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	t	1	transparent	Contact NUO LAT	\N	\N	2025-03-09 08:22:18.525+00	contact	t	2025-03-09 11:30:12.407+00	2025-03-09 08:17:59.614+00	draft	2025-03-09 11:30:11.558+00	2025-03-09 11:30:12.43+00	f	t
17	1	Contact	highImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Estamos aquí para ayudarte!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Si tienes alguna pregunta o necesitas más información, no dudes en contactarnos. Puedes escribirnos a:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"id": "67cd51c3ece25ca3df7a6475", "type": "link", "fields": {"url": "mailto:hola@nuo.lat", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "hola@nuo.lat", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "+51925573697", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "DISHUB - Calle Alcanfores 425, Miraflores, 15048, Lima, Perú.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "O bien, completa el formulario y uno de nuestros asesores se pondrá en contacto contigo.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	t	1	transparent	Contact NUO LAT	\N	\N	2025-03-09 08:22:18.525+00	contact	t	2025-03-09 08:37:20.159+00	2025-03-09 08:17:59.614+00	draft	2025-03-09 08:34:51.948+00	2025-03-09 08:37:20.18+00	f	t
13	1	Contact	highImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Estamos aquí para ayudarte!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Si tienes alguna pregunta o necesitas más información, no dudes en contactarnos. Puedes escribirnos a:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"id": "67cd51c3ece25ca3df7a6475", "type": "link", "fields": {"url": "mailto:hola@nuo.lat", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "hola@nuo.lat", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "+51925573697", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "DISHUB - Calle Alcanfores 425, Miraflores, 15048, Lima, Perú.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "O bien, completa el formulario y uno de nuestros asesores se pondrá en contacto contigo.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	t	1	transparent	Contact NUO LAT	\N	\N	2025-03-09 08:22:18.525+00	contact	t	2025-03-09 08:32:25.068+00	2025-03-09 08:17:59.614+00	draft	2025-03-09 08:32:15.421+00	2025-03-09 08:32:25.099+00	f	t
\.


--
-- Data for Name: _pages_v_blocks_archive; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public._pages_v_blocks_archive (_order, _parent_id, _path, id, intro_content, populate_by, relation_to, "limit", _uuid, block_name) FROM stdin;
3	2	version.layout	1	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Recent posts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The posts below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or posts can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	collection	posts	10	67cd4ec5073bbe0ba022953e	Archive Block
3	15	version.layout	5	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Recent posts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The posts below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or posts can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	collection	posts	10	67cd4ec5073bbe0ba022953e	Archive Block
3	16	version.layout	6	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Recent posts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The posts below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or posts can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	collection	posts	10	67cd4ec5073bbe0ba022953e	Archive Block
3	22	version.layout	16	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Recent posts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The posts below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or posts can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	collection	posts	10	67cd4ec5073bbe0ba022953e	Archive Block
3	23	version.layout	17	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Recent posts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The posts below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or posts can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	collection	posts	10	67cd4ec5073bbe0ba022953e	Archive Block
3	24	version.layout	36	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Recent posts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The posts below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or posts can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	collection	posts	10	67cd4ec5073bbe0ba022953e	Archive Block
3	25	version.layout	37	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Recent posts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The posts below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or posts can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	collection	posts	10	67cd4ec5073bbe0ba022953e	Archive Block
\.


--
-- Data for Name: _pages_v_blocks_content; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public._pages_v_blocks_content (_order, _parent_id, _path, id, _uuid, block_name) FROM stdin;
1	2	version.layout	1	67cd4ec5073bbe0ba022953c	Content Block
1	15	version.layout	5	67cd4ec5073bbe0ba022953c	Content Block
1	16	version.layout	6	67cd4ec5073bbe0ba022953c	Content Block
1	20	version.layout	289	67cd5808066bc40058165b0a	Slogan
2	20	version.layout	290	67cd5837066bc40058165b11	¿Qué hay de Nuevo?
1	28	version.layout	291	67cd5808066bc40058165b0a	Slogan
2	28	version.layout	292	67cd5837066bc40058165b11	¿Qué hay de Nuevo?
1	22	version.layout	16	67cd4ec5073bbe0ba022953c	Content Block
1	23	version.layout	17	67cd4ec5073bbe0ba022953c	Content Block
1	29	version.layout	295	67cd5808066bc40058165b0a	Slogan
2	29	version.layout	296	67cd5837066bc40058165b11	¿Qué hay de Nuevo?
1	30	version.layout	297	67cd5808066bc40058165b0a	Slogan
2	30	version.layout	298	67cd5837066bc40058165b11	¿Qué hay de Nuevo?
1	26	version.layout	112	67cd4ec5073bbe0ba022953c	Content Block
1	27	version.layout	113	67cd4ec5073bbe0ba022953c	Content Block
1	31	version.layout	301	67cd5808066bc40058165b0a	Slogan
2	31	version.layout	302	67cd5837066bc40058165b11	¿Qué hay de Nuevo?
1	32	version.layout	303	67cd5808066bc40058165b0a	Slogan
2	32	version.layout	304	67cd5837066bc40058165b11	¿Qué hay de Nuevo?
1	33	version.layout	307	67cd5808066bc40058165b0a	Slogan
2	33	version.layout	308	67cd5837066bc40058165b11	¿Qué hay de Nuevo?
1	34	version.layout	309	67cd5808066bc40058165b0a	Slogan
2	34	version.layout	310	67cd5837066bc40058165b11	¿Qué hay de Nuevo?
1	24	version.layout	36	67cd4ec5073bbe0ba022953c	Content Block
1	25	version.layout	37	67cd4ec5073bbe0ba022953c	Content Block
1	51	version.layout	316	67cd4ec5073bbe0ba022953c	Content Block
1	52	version.layout	317	67cd4ec5073bbe0ba022953c	Content Block
1	53	version.layout	336	67cd5808066bc40058165b0a	Slogan
2	53	version.layout	337	67cd5837066bc40058165b11	¿Qué hay de Nuevo?
1	54	version.layout	338	67cd5808066bc40058165b0a	Slogan
2	54	version.layout	339	67cd5837066bc40058165b11	¿Qué hay de Nuevo?
1	59	version.layout	343	67cd4ec5073bbe0ba022953c	Content Block
1	60	version.layout	344	67cd4ec5073bbe0ba022953c	Content Block
1	61	version.layout	359	67cd5808066bc40058165b0a	Slogan
2	61	version.layout	360	67cd5837066bc40058165b11	¿Qué hay de Nuevo?
1	62	version.layout	361	67cd5808066bc40058165b0a	Slogan
2	62	version.layout	362	67cd5837066bc40058165b11	¿Qué hay de Nuevo?
\.


--
-- Data for Name: _pages_v_blocks_content_columns; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public._pages_v_blocks_content_columns (_order, _parent_id, id, size, rich_text, enable_link, link_type, link_new_tab, link_url, link_label, link_appearance, _uuid) FROM stdin;
1	1	1	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Core features", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229536
2	1	2	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Admin Dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Manage this site's pages and posts from the ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229537
3	1	3	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Preview", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Using versions, drafts, and preview, editors can review and share their changes before publishing them.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229538
4	1	4	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Page Builder", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Custom page builder allows you to create unique page, post, and project layouts for any type of content.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229539
5	1	5	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "SEO", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Editors have complete control over SEO data and site content directly from the ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba022953a
6	1	6	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dark Mode", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Users will experience this site in their preferred color scheme and each block can be inverted.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba022953b
1	289	952	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Donde StartUps y empresas crecen de manera estratégica y sin complicaciones", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd580f066bc40058165b0b
1	290	953	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¿Qué hay de nuevo?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5846066bc40058165b12
3	6	33	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Preview", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Using versions, drafts, and preview, editors can review and share their changes before publishing them.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229538
2	290	954	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"id": "67cd585fde3ef816dd4e1932", "type": "link", "fields": {"doc": {"value": 3, "relationTo": "pages"}, "newTab": true, "linkType": "internal"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Onboarding 100% Digital", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Expande tu negocio a mercados clave de manera simple y eficiente.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd584f066bc40058165b13
3	290	955	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Servicios Escenciales", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Representación legal, domicilio fiscal y acompañamiento estratégico para un crecimiento sin fricciones.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5887066bc40058165b14
4	290	956	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dashboard centralizado", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Accede a toda la información operativa en un solo lugar.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5891066bc40058165b15
1	291	957	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Donde StartUps y empresas crecen de manera estratégica y sin complicaciones", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd580f066bc40058165b0b
1	292	958	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¿Qué hay de nuevo?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5846066bc40058165b12
2	292	959	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"id": "67cd585fde3ef816dd4e1932", "type": "link", "fields": {"doc": {"value": 3, "relationTo": "pages"}, "newTab": true, "linkType": "internal"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Onboarding 100% Digital", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Expande tu negocio a mercados clave de manera simple y eficiente.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd584f066bc40058165b13
3	292	960	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Servicios Escenciales", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Representación legal, domicilio fiscal y acompañamiento estratégico para un crecimiento sin fricciones.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5887066bc40058165b14
4	292	961	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dashboard centralizado", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Accede a toda la información operativa en un solo lugar.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5891066bc40058165b15
1	5	25	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Core features", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229536
2	5	26	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Admin Dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Manage this site's pages and posts from the ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229537
3	5	27	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Preview", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Using versions, drafts, and preview, editors can review and share their changes before publishing them.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229538
4	5	28	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Page Builder", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Custom page builder allows you to create unique page, post, and project layouts for any type of content.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229539
5	5	29	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "SEO", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Editors have complete control over SEO data and site content directly from the ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba022953a
6	5	30	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dark Mode", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Users will experience this site in their preferred color scheme and each block can be inverted.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba022953b
1	6	31	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Core features", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229536
2	6	32	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Admin Dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Manage this site's pages and posts from the ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229537
1	298	973	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¿Qué hay de nuevo?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5846066bc40058165b12
4	6	34	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Page Builder", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Custom page builder allows you to create unique page, post, and project layouts for any type of content.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229539
5	6	35	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "SEO", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Editors have complete control over SEO data and site content directly from the ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba022953a
6	6	36	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dark Mode", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Users will experience this site in their preferred color scheme and each block can be inverted.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba022953b
1	295	967	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Donde StartUps y empresas crecen de manera estratégica y sin complicaciones", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd580f066bc40058165b0b
1	296	968	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¿Qué hay de nuevo?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5846066bc40058165b12
2	296	969	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"id": "67cd585fde3ef816dd4e1932", "type": "link", "fields": {"doc": {"value": 3, "relationTo": "pages"}, "newTab": true, "linkType": "internal"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Onboarding 100% Digital", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Expande tu negocio a mercados clave de manera simple y eficiente.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd584f066bc40058165b13
3	296	970	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Servicios Escenciales", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Representación legal, domicilio fiscal y acompañamiento estratégico para un crecimiento sin fricciones.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5887066bc40058165b14
4	296	971	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dashboard centralizado", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Accede a toda la información operativa en un solo lugar.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5891066bc40058165b15
1	297	972	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Donde StartUps y empresas crecen de manera estratégica y sin complicaciones", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd580f066bc40058165b0b
2	298	974	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"id": "67cd585fde3ef816dd4e1932", "type": "link", "fields": {"doc": {"value": 3, "relationTo": "pages"}, "newTab": true, "linkType": "internal"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Onboarding 100% Digital", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Expande tu negocio a mercados clave de manera simple y eficiente.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd584f066bc40058165b13
3	298	975	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Servicios Escenciales", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Representación legal, domicilio fiscal y acompañamiento estratégico para un crecimiento sin fricciones.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5887066bc40058165b14
4	298	976	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dashboard centralizado", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Accede a toda la información operativa en un solo lugar.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5891066bc40058165b15
1	343	1122	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Servicios que Impulsan tu Expansión", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229536
2	343	1123	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Constitución de Empresas", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Registro Rápido y Eficiente en México, Colombia y Perú. Para que inicies operaciones sin retrasos.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229537
3	343	1124	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Apertura de Cuenta Corriente Empresarial", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Te ayudamos a abrir cuentas bancarias en cada país, facilitando la gestión financiera desde el primer día.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229538
4	343	1125	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Representación Legal", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Ofrecemos Representación Legal en cada país, asegurando el cumplimiento logcal y protegiendo tus intereses internacionales.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229539
1	301	982	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Donde StartUps y empresas crecen de manera estratégica y sin complicaciones", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd580f066bc40058165b0b
1	302	983	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¿Qué hay de nuevo?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5846066bc40058165b12
1	308	998	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¿Qué hay de nuevo?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5846066bc40058165b12
2	302	984	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"id": "67cd585fde3ef816dd4e1932", "type": "link", "fields": {"doc": {"value": 3, "relationTo": "pages"}, "newTab": true, "linkType": "internal"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Onboarding 100% Digital", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Expande tu negocio a mercados clave de manera simple y eficiente.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd584f066bc40058165b13
3	302	985	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Servicios Escenciales", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Representación legal, domicilio fiscal y acompañamiento estratégico para un crecimiento sin fricciones.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5887066bc40058165b14
4	302	986	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dashboard centralizado", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Accede a toda la información operativa en un solo lugar.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5891066bc40058165b15
1	303	987	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Donde StartUps y empresas crecen de manera estratégica y sin complicaciones", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd580f066bc40058165b0b
1	304	988	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¿Qué hay de nuevo?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5846066bc40058165b12
2	304	989	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"id": "67cd585fde3ef816dd4e1932", "type": "link", "fields": {"doc": {"value": 3, "relationTo": "pages"}, "newTab": true, "linkType": "internal"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Onboarding 100% Digital", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Expande tu negocio a mercados clave de manera simple y eficiente.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd584f066bc40058165b13
3	304	990	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Servicios Escenciales", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Representación legal, domicilio fiscal y acompañamiento estratégico para un crecimiento sin fricciones.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5887066bc40058165b14
4	304	991	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dashboard centralizado", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Accede a toda la información operativa en un solo lugar.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5891066bc40058165b15
3	17	99	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Preview", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Using versions, drafts, and preview, editors can review and share their changes before publishing them.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229538
5	343	1126	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Checklists Regulatorios y Cumplimiento Legal", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Realizamos un Checklist legal para asegurar el cumplimiento en tu nuevo mercado y te asesoramos en obtener permisos y licencias necesarias para industrias reguladas.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba022953a
6	343	1127	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dashboard Administrativo", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Con herramientas avanzadas y una interfaz amigable, el Dashboard te permite mantener el control total sobre tu plataforma, facilitando la toma de decisiones estratégicas para seguir creciendo en nuevos mercados.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba022953b
1	344	1128	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Servicios que Impulsan tu Expansión", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229536
2	344	1129	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Constitución de Empresas", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Registro Rápido y Eficiente en México, Colombia y Perú. Para que inicies operaciones sin retrasos.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229537
3	344	1130	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Apertura de Cuenta Corriente Empresarial", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Te ayudamos a abrir cuentas bancarias en cada país, facilitando la gestión financiera desde el primer día.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229538
4	344	1131	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Representación Legal", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Ofrecemos Representación Legal en cada país, asegurando el cumplimiento logcal y protegiendo tus intereses internacionales.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229539
5	344	1132	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Checklists Regulatorios y Cumplimiento Legal", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Realizamos un Checklist legal para asegurar el cumplimiento en tu nuevo mercado y te asesoramos en obtener permisos y licencias necesarias para industrias reguladas.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba022953a
6	344	1133	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dashboard Administrativo", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Con herramientas avanzadas y una interfaz amigable, el Dashboard te permite mantener el control total sobre tu plataforma, facilitando la toma de decisiones estratégicas para seguir creciendo en nuevos mercados.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba022953b
1	307	997	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Donde StartUps y empresas crecen de manera estratégica y sin complicaciones", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd580f066bc40058165b0b
2	308	999	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"id": "67cd585fde3ef816dd4e1932", "type": "link", "fields": {"doc": {"value": 3, "relationTo": "pages"}, "newTab": true, "linkType": "internal"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Onboarding 100% Digital", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Expande tu negocio a mercados clave de manera simple y eficiente.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd584f066bc40058165b13
3	308	1000	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Servicios Escenciales", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Representación legal, domicilio fiscal y acompañamiento estratégico para un crecimiento sin fricciones.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5887066bc40058165b14
4	308	1001	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dashboard centralizado", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Accede a toda la información operativa en un solo lugar.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5891066bc40058165b15
1	309	1002	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Donde StartUps y empresas crecen de manera estratégica y sin complicaciones", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd580f066bc40058165b0b
1	310	1003	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¿Qué hay de nuevo?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5846066bc40058165b12
2	310	1004	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"id": "67cd585fde3ef816dd4e1932", "type": "link", "fields": {"doc": {"value": 3, "relationTo": "pages"}, "newTab": true, "linkType": "internal"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Onboarding 100% Digital", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Expande tu negocio a mercados clave de manera simple y eficiente.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd584f066bc40058165b13
3	310	1005	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Servicios Escenciales", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Representación legal, domicilio fiscal y acompañamiento estratégico para un crecimiento sin fricciones.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5887066bc40058165b14
4	310	1006	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dashboard centralizado", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Accede a toda la información operativa en un solo lugar.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5891066bc40058165b15
1	16	91	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Core features", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229536
1	37	217	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Core features", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229536
2	16	92	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Admin Dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Manage this site's pages and posts from the ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229537
3	16	93	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Preview", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Using versions, drafts, and preview, editors can review and share their changes before publishing them.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229538
4	16	94	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Page Builder", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Custom page builder allows you to create unique page, post, and project layouts for any type of content.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229539
5	16	95	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "SEO", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Editors have complete control over SEO data and site content directly from the ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba022953a
6	16	96	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dark Mode", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Users will experience this site in their preferred color scheme and each block can be inverted.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba022953b
1	17	97	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Core features", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229536
2	17	98	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Admin Dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Manage this site's pages and posts from the ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229537
4	17	100	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Page Builder", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Custom page builder allows you to create unique page, post, and project layouts for any type of content.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229539
5	17	101	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "SEO", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Editors have complete control over SEO data and site content directly from the ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba022953a
6	17	102	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dark Mode", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Users will experience this site in their preferred color scheme and each block can be inverted.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba022953b
1	112	667	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Servicios que Impulsan tu Expansión", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229536
2	112	668	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Constitución de Empresas", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Registro Rápido y Eficiente en México, Colombia y Perú. Para que inicies operaciones sin retrasos.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229537
3	112	669	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Apertura de Cuenta Corriente Empresarial", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Te ayudamos a abrir cuentas bancarias en cada país, facilitando la gestión financiera desde el primer día.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229538
4	112	670	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Representación Legal", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Ofrecemos Representación Legal en cada país, asegurando el cumplimiento logcal y protegiendo tus intereses internacionales.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229539
5	112	671	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Checklists Regulatorios y Cumplimiento Legal", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Realizamos un Checklist legal para asegurar el cumplimiento en tu nuevo mercado y te asesoramos en obtener permisos y licencias necesarias para industrias reguladas.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba022953a
6	112	672	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dashboard Administrativo", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Con herramientas avanzadas y una interfaz amigable, el Dashboard te permite mantener el control total sobre tu plataforma, facilitando la toma de decisiones estratégicas para seguir creciendo en nuevos mercados.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba022953b
1	113	673	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Servicios que Impulsan tu Expansión", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229536
2	113	674	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Constitución de Empresas", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Registro Rápido y Eficiente en México, Colombia y Perú. Para que inicies operaciones sin retrasos.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229537
3	113	675	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Apertura de Cuenta Corriente Empresarial", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Te ayudamos a abrir cuentas bancarias en cada país, facilitando la gestión financiera desde el primer día.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229538
4	113	676	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Representación Legal", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Ofrecemos Representación Legal en cada país, asegurando el cumplimiento logcal y protegiendo tus intereses internacionales.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229539
5	113	677	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Checklists Regulatorios y Cumplimiento Legal", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Realizamos un Checklist legal para asegurar el cumplimiento en tu nuevo mercado y te asesoramos en obtener permisos y licencias necesarias para industrias reguladas.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba022953a
6	113	678	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dashboard Administrativo", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Con herramientas avanzadas y una interfaz amigable, el Dashboard te permite mantener el control total sobre tu plataforma, facilitando la toma de decisiones estratégicas para seguir creciendo en nuevos mercados.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba022953b
1	359	1169	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Donde StartUps y empresas crecen de manera estratégica y sin complicaciones", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd580f066bc40058165b0b
1	360	1170	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¿Qué hay de nuevo?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5846066bc40058165b12
2	360	1171	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"id": "67cd585fde3ef816dd4e1932", "type": "link", "fields": {"doc": {"value": 11, "relationTo": "pages"}, "newTab": true, "linkType": "internal"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Onboarding 100% Digital", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Expande tu negocio a mercados clave de manera simple y eficiente.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd584f066bc40058165b13
3	360	1172	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Servicios Escenciales", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Representación legal, domicilio fiscal y acompañamiento estratégico para un crecimiento sin fricciones.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5887066bc40058165b14
1	316	1037	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Servicios que Impulsan tu Expansión", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229536
2	316	1038	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Constitución de Empresas", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Registro Rápido y Eficiente en México, Colombia y Perú. Para que inicies operaciones sin retrasos.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229537
3	316	1039	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Apertura de Cuenta Corriente Empresarial", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Te ayudamos a abrir cuentas bancarias en cada país, facilitando la gestión financiera desde el primer día.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229538
4	316	1040	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Representación Legal", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Ofrecemos Representación Legal en cada país, asegurando el cumplimiento logcal y protegiendo tus intereses internacionales.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229539
5	316	1041	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Checklists Regulatorios y Cumplimiento Legal", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Realizamos un Checklist legal para asegurar el cumplimiento en tu nuevo mercado y te asesoramos en obtener permisos y licencias necesarias para industrias reguladas.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba022953a
6	316	1042	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dashboard Administrativo", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Con herramientas avanzadas y una interfaz amigable, el Dashboard te permite mantener el control total sobre tu plataforma, facilitando la toma de decisiones estratégicas para seguir creciendo en nuevos mercados.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba022953b
1	317	1043	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Servicios que Impulsan tu Expansión", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229536
2	317	1044	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Constitución de Empresas", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Registro Rápido y Eficiente en México, Colombia y Perú. Para que inicies operaciones sin retrasos.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229537
3	317	1045	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Apertura de Cuenta Corriente Empresarial", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Te ayudamos a abrir cuentas bancarias en cada país, facilitando la gestión financiera desde el primer día.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229538
4	317	1046	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Representación Legal", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Ofrecemos Representación Legal en cada país, asegurando el cumplimiento logcal y protegiendo tus intereses internacionales.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229539
5	317	1047	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Checklists Regulatorios y Cumplimiento Legal", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Realizamos un Checklist legal para asegurar el cumplimiento en tu nuevo mercado y te asesoramos en obtener permisos y licencias necesarias para industrias reguladas.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba022953a
6	317	1048	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dashboard Administrativo", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Con herramientas avanzadas y una interfaz amigable, el Dashboard te permite mantener el control total sobre tu plataforma, facilitando la toma de decisiones estratégicas para seguir creciendo en nuevos mercados.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba022953b
4	360	1173	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dashboard centralizado", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Accede a toda la información operativa en un solo lugar.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5891066bc40058165b15
1	361	1174	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Donde StartUps y empresas crecen de manera estratégica y sin complicaciones", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd580f066bc40058165b0b
1	362	1175	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¿Qué hay de nuevo?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5846066bc40058165b12
2	362	1176	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"id": "67cd585fde3ef816dd4e1932", "type": "link", "fields": {"doc": {"value": 11, "relationTo": "pages"}, "newTab": true, "linkType": "internal"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Onboarding 100% Digital", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Expande tu negocio a mercados clave de manera simple y eficiente.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd584f066bc40058165b13
3	362	1177	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Servicios Escenciales", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Representación legal, domicilio fiscal y acompañamiento estratégico para un crecimiento sin fricciones.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5887066bc40058165b14
4	362	1178	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dashboard centralizado", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Accede a toda la información operativa en un solo lugar.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5891066bc40058165b15
1	336	1094	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Donde StartUps y empresas crecen de manera estratégica y sin complicaciones", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd580f066bc40058165b0b
1	337	1095	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¿Qué hay de nuevo?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5846066bc40058165b12
2	337	1096	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"id": "67cd585fde3ef816dd4e1932", "type": "link", "fields": {"doc": {"value": 11, "relationTo": "pages"}, "newTab": true, "linkType": "internal"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Onboarding 100% Digital", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Expande tu negocio a mercados clave de manera simple y eficiente.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd584f066bc40058165b13
3	337	1097	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Servicios Escenciales", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Representación legal, domicilio fiscal y acompañamiento estratégico para un crecimiento sin fricciones.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5887066bc40058165b14
4	337	1098	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dashboard centralizado", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Accede a toda la información operativa en un solo lugar.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5891066bc40058165b15
1	338	1099	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Donde StartUps y empresas crecen de manera estratégica y sin complicaciones", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd580f066bc40058165b0b
1	339	1100	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¿Qué hay de nuevo?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5846066bc40058165b12
6	36	216	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dark Mode", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Users will experience this site in their preferred color scheme and each block can be inverted.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba022953b
2	339	1101	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"id": "67cd585fde3ef816dd4e1932", "type": "link", "fields": {"doc": {"value": 11, "relationTo": "pages"}, "newTab": true, "linkType": "internal"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Onboarding 100% Digital", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Expande tu negocio a mercados clave de manera simple y eficiente.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd584f066bc40058165b13
3	339	1102	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Servicios Escenciales", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Representación legal, domicilio fiscal y acompañamiento estratégico para un crecimiento sin fricciones.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5887066bc40058165b14
4	339	1103	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dashboard centralizado", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Accede a toda la información operativa en un solo lugar.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd5891066bc40058165b15
1	36	211	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Core features", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229536
2	36	212	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Admin Dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Manage this site's pages and posts from the ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229537
3	36	213	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Preview", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Using versions, drafts, and preview, editors can review and share their changes before publishing them.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229538
4	36	214	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Page Builder", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Custom page builder allows you to create unique page, post, and project layouts for any type of content.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229539
5	36	215	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "SEO", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Editors have complete control over SEO data and site content directly from the ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba022953a
2	37	218	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Admin Dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Manage this site's pages and posts from the ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229537
3	37	219	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Preview", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Using versions, drafts, and preview, editors can review and share their changes before publishing them.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229538
4	37	220	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Page Builder", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Custom page builder allows you to create unique page, post, and project layouts for any type of content.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba0229539
5	37	221	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "SEO", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Editors have complete control over SEO data and site content directly from the ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba022953a
6	37	222	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dark Mode", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Users will experience this site in their preferred color scheme and each block can be inverted.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default	67cd4ec5073bbe0ba022953b
\.


--
-- Data for Name: _pages_v_blocks_cta; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public._pages_v_blocks_cta (_order, _parent_id, _path, id, rich_text, _uuid, block_name) FROM stdin;
4	2	version.layout	1	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This is a call to action", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This is a custom layout building block ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "configured in the admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	67cd4ec5073bbe0ba0229540	CTA
1	18	version.layout	71	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Da el salto hacia la expansión internacional con NUO!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Con nuestras soluciones integrales, llevar tu negocio a Latinoamérica es más sencillo que nunca. Desde la constitución de tu empresa hasta la gestión legal y contable en México, Colombia y Perú, nos encargamos de todo para que puedas concentrarte en crecer.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	67cd5078a4557c10ecf4fc83	Registra tu Empresa
1	7	version.layout	25	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Da el salto hacia la expansión internacional con NUO!", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Con nuestras soluciones integrales, llevar tu negocio a Latinoamérica es más sencillo que nunca. Desde la constitución de tu empresa hasta la gestión legal y contable en México, Colombia y Perú, nos encargamos de todo para que puedas concentrarte en crecer.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	67cd5078a4557c10ecf4fc83	Registra tu Empresa
1	8	version.layout	26	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Da el salto hacia la expansión internacional con NUO!", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Con nuestras soluciones integrales, llevar tu negocio a Latinoamérica es más sencillo que nunca. Desde la constitución de tu empresa hasta la gestión legal y contable en México, Colombia y Perú, nos encargamos de todo para que puedas concentrarte en crecer.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	67cd5078a4557c10ecf4fc83	Registra tu Empresa
2	22	version.layout	81	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This is a call to action", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This is a custom layout building block ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "configured in the admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	67cd4ec5073bbe0ba0229540	CTA
2	23	version.layout	82	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This is a call to action", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This is a custom layout building block ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "configured in the admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	67cd4ec5073bbe0ba0229540	CTA
1	9	version.layout	36	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Da el salto hacia la expansión internacional con NUO!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Con nuestras soluciones integrales, llevar tu negocio a Latinoamérica es más sencillo que nunca. Desde la constitución de tu empresa hasta la gestión legal y contable en México, Colombia y Perú, nos encargamos de todo para que puedas concentrarte en crecer.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	67cd5078a4557c10ecf4fc83	Registra tu Empresa
1	10	version.layout	37	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Da el salto hacia la expansión internacional con NUO!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Con nuestras soluciones integrales, llevar tu negocio a Latinoamérica es más sencillo que nunca. Desde la constitución de tu empresa hasta la gestión legal y contable en México, Colombia y Perú, nos encargamos de todo para que puedas concentrarte en crecer.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	67cd5078a4557c10ecf4fc83	Registra tu Empresa
1	5	version.layout	22	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Da el salto hacia la expansión internacional con NUO!", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Con nuestras soluciones integrales, llevar tu negocio a Latinoamérica es más sencillo que nunca. Desde la constitución de tu empresa hasta la gestión legal y contable en México, Colombia y Perú, nos encargamos de todo para que puedas concentrarte en crecer.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	67cd5078a4557c10ecf4fc83	Registra tu Empresa
1	6	version.layout	23	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Da el salto hacia la expansión internacional con NUO!", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Con nuestras soluciones integrales, llevar tu negocio a Latinoamérica es más sencillo que nunca. Desde la constitución de tu empresa hasta la gestión legal y contable en México, Colombia y Perú, nos encargamos de todo para que puedas concentrarte en crecer.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	67cd5078a4557c10ecf4fc83	Registra tu Empresa
1	11	version.layout	44	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Da el salto hacia la expansión internacional con NUO!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Con nuestras soluciones integrales, llevar tu negocio a Latinoamérica es más sencillo que nunca. Desde la constitución de tu empresa hasta la gestión legal y contable en México, Colombia y Perú, nos encargamos de todo para que puedas concentrarte en crecer.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	67cd5078a4557c10ecf4fc83	Registra tu Empresa
1	12	version.layout	45	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Da el salto hacia la expansión internacional con NUO!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Con nuestras soluciones integrales, llevar tu negocio a Latinoamérica es más sencillo que nunca. Desde la constitución de tu empresa hasta la gestión legal y contable en México, Colombia y Perú, nos encargamos de todo para que puedas concentrarte en crecer.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	67cd5078a4557c10ecf4fc83	Registra tu Empresa
1	13	version.layout	50	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Da el salto hacia la expansión internacional con NUO!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Con nuestras soluciones integrales, llevar tu negocio a Latinoamérica es más sencillo que nunca. Desde la constitución de tu empresa hasta la gestión legal y contable en México, Colombia y Perú, nos encargamos de todo para que puedas concentrarte en crecer.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	67cd5078a4557c10ecf4fc83	Registra tu Empresa
1	14	version.layout	51	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Da el salto hacia la expansión internacional con NUO!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Con nuestras soluciones integrales, llevar tu negocio a Latinoamérica es más sencillo que nunca. Desde la constitución de tu empresa hasta la gestión legal y contable en México, Colombia y Perú, nos encargamos de todo para que puedas concentrarte en crecer.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	67cd5078a4557c10ecf4fc83	Registra tu Empresa
2	15	version.layout	55	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This is a call to action", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This is a custom layout building block ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "configured in the admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	67cd4ec5073bbe0ba0229540	CTA
2	16	version.layout	56	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This is a call to action", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This is a custom layout building block ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "configured in the admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	67cd4ec5073bbe0ba0229540	CTA
1	17	version.layout	70	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Da el salto hacia la expansión internacional con NUO!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Con nuestras soluciones integrales, llevar tu negocio a Latinoamérica es más sencillo que nunca. Desde la constitución de tu empresa hasta la gestión legal y contable en México, Colombia y Perú, nos encargamos de todo para que puedas concentrarte en crecer.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	67cd5078a4557c10ecf4fc83	Registra tu Empresa
2	24	version.layout	101	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This is a call to action", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This is a custom layout building block ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "configured in the admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	67cd4ec5073bbe0ba0229540	CTA
2	25	version.layout	102	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This is a call to action", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This is a custom layout building block ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "configured in the admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	67cd4ec5073bbe0ba0229540	CTA
2	26	version.layout	177	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Da el salto hacia la expansión internacional con NUO!", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Con nuestras soluciones integrales, llevar tu negocio a Latinoamérica es más sencillo que nunca. Desde la constitución de tu empresa hasta la gestión legal y contable en México, Colombia y Perú, nos encargamos de todo para que puedas concentrarte en crecer.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	67cd4ec5073bbe0ba0229540	CTA
2	27	version.layout	178	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Da el salto hacia la expansión internacional con NUO!", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Con nuestras soluciones integrales, llevar tu negocio a Latinoamérica es más sencillo que nunca. Desde la constitución de tu empresa hasta la gestión legal y contable en México, Colombia y Perú, nos encargamos de todo para que puedas concentrarte en crecer.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	67cd4ec5073bbe0ba0229540	CTA
2	51	version.layout	184	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Da el salto hacia la expansión internacional con NUO!", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Con nuestras soluciones integrales, llevar tu negocio a Latinoamérica es más sencillo que nunca. Desde la constitución de tu empresa hasta la gestión legal y contable en México, Colombia y Perú, nos encargamos de todo para que puedas concentrarte en crecer.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	67cd4ec5073bbe0ba0229540	CTA
2	52	version.layout	185	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Da el salto hacia la expansión internacional con NUO!", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Con nuestras soluciones integrales, llevar tu negocio a Latinoamérica es más sencillo que nunca. Desde la constitución de tu empresa hasta la gestión legal y contable en México, Colombia y Perú, nos encargamos de todo para que puedas concentrarte en crecer.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	67cd4ec5073bbe0ba0229540	CTA
1	55	version.layout	187	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Da el salto hacia la expansión internacional con NUO!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Con nuestras soluciones integrales, llevar tu negocio a Latinoamérica es más sencillo que nunca. Desde la constitución de tu empresa hasta la gestión legal y contable en México, Colombia y Perú, nos encargamos de todo para que puedas concentrarte en crecer.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	67cd5078a4557c10ecf4fc83	Registra tu Empresa
1	56	version.layout	188	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Da el salto hacia la expansión internacional con NUO!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Con nuestras soluciones integrales, llevar tu negocio a Latinoamérica es más sencillo que nunca. Desde la constitución de tu empresa hasta la gestión legal y contable en México, Colombia y Perú, nos encargamos de todo para que puedas concentrarte en crecer.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	67cd5078a4557c10ecf4fc83	Registra tu Empresa
2	59	version.layout	192	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Da el salto hacia la expansión internacional con NUO!", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Con nuestras soluciones integrales, llevar tu negocio a Latinoamérica es más sencillo que nunca. Desde la constitución de tu empresa hasta la gestión legal y contable en México, Colombia y Perú, nos encargamos de todo para que puedas concentrarte en crecer.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	67cd4ec5073bbe0ba0229540	CTA
2	60	version.layout	193	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Da el salto hacia la expansión internacional con NUO!", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Con nuestras soluciones integrales, llevar tu negocio a Latinoamérica es más sencillo que nunca. Desde la constitución de tu empresa hasta la gestión legal y contable en México, Colombia y Perú, nos encargamos de todo para que puedas concentrarte en crecer.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	67cd4ec5073bbe0ba0229540	CTA
1	63	version.layout	195	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Da el salto hacia la expansión internacional con NUO!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Con nuestras soluciones integrales, llevar tu negocio a Latinoamérica es más sencillo que nunca. Desde la constitución de tu empresa hasta la gestión legal y contable en México, Colombia y Perú, nos encargamos de todo para que puedas concentrarte en crecer.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	67cd5078a4557c10ecf4fc83	Registra tu Empresa
1	64	version.layout	196	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Da el salto hacia la expansión internacional con NUO!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Con nuestras soluciones integrales, llevar tu negocio a Latinoamérica es más sencillo que nunca. Desde la constitución de tu empresa hasta la gestión legal y contable en México, Colombia y Perú, nos encargamos de todo para que puedas concentrarte en crecer.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	67cd5078a4557c10ecf4fc83	Registra tu Empresa
\.


--
-- Data for Name: _pages_v_blocks_cta_links; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public._pages_v_blocks_cta_links (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label, link_appearance, _uuid) FROM stdin;
1	1	1	custom	\N	/posts	All posts	default	67cd4ec5073bbe0ba022953f
1	22	14	reference	\N	\N	Registra tu Empresa 🚀	default	67cd50a9a4557c10ecf4fc85
1	23	15	reference	\N	\N	Registra tu Empresa 🚀	default	67cd50a9a4557c10ecf4fc85
1	25	17	reference	\N	\N	Registra tu Empresa 🚀	default	67cd50a9a4557c10ecf4fc85
1	26	18	reference	\N	\N	Registra tu Empresa 🚀	default	67cd50a9a4557c10ecf4fc85
1	36	28	reference	\N	\N	Registra tu Empresa 🚀	default	67cd50a9a4557c10ecf4fc85
1	37	29	reference	\N	\N	Registra tu Empresa 🚀	default	67cd50a9a4557c10ecf4fc85
1	44	36	reference	\N	\N	Registra tu Empresa 🚀	default	67cd50a9a4557c10ecf4fc85
1	45	37	reference	\N	\N	Registra tu Empresa 🚀	default	67cd50a9a4557c10ecf4fc85
1	50	42	reference	\N	\N	Registra tu Empresa 🚀	default	67cd50a9a4557c10ecf4fc85
1	51	43	reference	\N	\N	Registra tu Empresa 🚀	default	67cd50a9a4557c10ecf4fc85
1	55	47	custom	\N	/posts	All posts	default	67cd4ec5073bbe0ba022953f
1	56	48	custom	\N	/posts	All posts	default	67cd4ec5073bbe0ba022953f
1	70	62	reference	\N	\N	Registra tu Empresa 🚀	default	67cd50a9a4557c10ecf4fc85
1	71	63	reference	\N	\N	Registra tu Empresa 🚀	default	67cd50a9a4557c10ecf4fc85
1	177	169	reference	\N	/posts	Registra tu Empresa 🚀	default	67cd4ec5073bbe0ba022953f
1	178	170	reference	\N	/posts	Registra tu Empresa 🚀	default	67cd4ec5073bbe0ba022953f
1	81	73	custom	\N	/posts	All posts	default	67cd4ec5073bbe0ba022953f
1	82	74	custom	\N	/posts	All posts	default	67cd4ec5073bbe0ba022953f
1	184	176	reference	\N	/posts	Registra tu Empresa 🚀	default	67cd4ec5073bbe0ba022953f
1	185	177	reference	\N	/posts	Registra tu Empresa 🚀	default	67cd4ec5073bbe0ba022953f
1	187	179	reference	\N	\N	Registra tu Empresa 🚀	default	67cd50a9a4557c10ecf4fc85
1	188	180	reference	\N	\N	Registra tu Empresa 🚀	default	67cd50a9a4557c10ecf4fc85
1	192	184	reference	t	/posts	Registra tu Empresa 🚀	default	67cd4ec5073bbe0ba022953f
1	193	185	reference	t	/posts	Registra tu Empresa 🚀	default	67cd4ec5073bbe0ba022953f
1	195	187	reference	t	\N	Registra tu Empresa 🚀	default	67cd50a9a4557c10ecf4fc85
1	196	188	reference	t	\N	Registra tu Empresa 🚀	default	67cd50a9a4557c10ecf4fc85
1	101	93	custom	\N	/posts	All posts	default	67cd4ec5073bbe0ba022953f
1	102	94	custom	\N	/posts	All posts	default	67cd4ec5073bbe0ba022953f
\.


--
-- Data for Name: _pages_v_blocks_form_block; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public._pages_v_blocks_form_block (_order, _parent_id, _path, id, form_id, enable_intro, intro_content, background_color, multi_step_enabled, _uuid, block_name) FROM stdin;
1	1	version.layout	1	1	t	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Example contact form:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	white	f	67cd4ec5073bbe0ba0229541	\N
1	50	version.layout	54	10	t	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Formulario de Registro de Empresa", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Complete todos los pasos del formulario para iniciar el proceso de registro de su empresa. Nuestro equipo se pondrá en contacto con usted en breve para continuar con el proceso.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	white	t	67cd79bce165d47974f6c8fd	\N
1	57	version.layout	58	10	t	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Formulario de Registro de Empresa", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Complete todos los pasos del formulario para iniciar el proceso de registro de su empresa. Nuestro equipo se pondrá en contacto con usted en breve para continuar con el proceso.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	white	t	67cd79bce165d47974f6c8fd	\N
1	58	version.layout	59	10	t	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Formulario de Registro de Empresa", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Complete todos los pasos del formulario para iniciar el proceso de registro de su empresa. Nuestro equipo se pondrá en contacto con usted en breve para continuar con el proceso.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	white	t	67cd79bce165d47974f6c8fd	\N
1	65	version.layout	71	10	t	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Formulario de Registro de Empresa", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Complete todos los pasos del formulario para iniciar el proceso de registro de su empresa. Nuestro equipo se pondrá en contacto con usted en breve para continuar con el proceso.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	white	t	67cd79bce165d47974f6c8fd	Registro de Empresa
1	66	version.layout	72	10	t	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Formulario de Registro de Empresa", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Complete todos los pasos del formulario para iniciar el proceso de registro de su empresa. Nuestro equipo se pondrá en contacto con usted en breve para continuar con el proceso.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	white	t	67cd79bce165d47974f6c8fd	Registro de Empresa
\.


--
-- Data for Name: _pages_v_blocks_form_block_multi_step_steps; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public._pages_v_blocks_form_block_multi_step_steps (_order, _parent_id, id, title, _uuid, is_partners_step) FROM stdin;
1	54	154	Selección de Residencia	67cd79bce165d47974f6c8e9	f
2	54	155	Selección de Tipo de Empresa	67cd79bce165d47974f6c8eb	f
3	54	156	Propósito Corporativo	67cd79bce165d47974f6c8f0	f
4	54	157	Información de Socios y Contribuciones	67cd79bce165d47974f6c8f2	t
5	54	158	Selección del CEO	67cd79bce165d47974f6c8f4	\N
6	54	159	Información del Solicitante	67cd79bce165d47974f6c8fc	f
1	58	178	Selección de Residencia	67cd79bce165d47974f6c8e9	f
2	58	179	Selección de Tipo de Empresa	67cd79bce165d47974f6c8eb	f
3	58	180	Propósito Corporativo	67cd79bce165d47974f6c8f0	f
4	58	181	Información de Socios y Contribuciones	67cd79bce165d47974f6c8f2	t
5	58	182	Selección del CEO	67cd79bce165d47974f6c8f4	\N
6	58	183	Información del Solicitante	67cd79bce165d47974f6c8fc	f
1	59	184	Selección de Residencia	67cd79bce165d47974f6c8e9	f
2	59	185	Selección de Tipo de Empresa	67cd79bce165d47974f6c8eb	f
3	59	186	Propósito Corporativo	67cd79bce165d47974f6c8f0	f
4	59	187	Información de Socios y Contribuciones	67cd79bce165d47974f6c8f2	t
5	59	188	Selección del CEO	67cd79bce165d47974f6c8f4	\N
6	59	189	Información del Solicitante	67cd79bce165d47974f6c8fc	f
1	71	256	Selección de Residencia	67cd79bce165d47974f6c8e9	f
2	71	257	Selección de Tipo de Empresa	67cd79bce165d47974f6c8eb	f
3	71	258	Propósito Corporativo	67cd79bce165d47974f6c8f0	f
4	71	259	Información de Socios y Contribuciones	67cd79bce165d47974f6c8f2	t
5	71	260	Selección del CEO	67cd79bce165d47974f6c8f4	\N
6	71	261	Información del Solicitante	67cd79bce165d47974f6c8fc	f
1	72	262	Selección de Residencia	67cd79bce165d47974f6c8e9	f
2	72	263	Selección de Tipo de Empresa	67cd79bce165d47974f6c8eb	f
3	72	264	Propósito Corporativo	67cd79bce165d47974f6c8f0	f
4	72	265	Información de Socios y Contribuciones	67cd79bce165d47974f6c8f2	t
5	72	266	Selección del CEO	67cd79bce165d47974f6c8f4	\N
6	72	267	Información del Solicitante	67cd79bce165d47974f6c8fc	f
\.


--
-- Data for Name: _pages_v_blocks_form_block_multi_step_steps_fields; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public._pages_v_blocks_form_block_multi_step_steps_fields (_order, _parent_id, id, field_name, _uuid) FROM stdin;
1	154	671	residenceType	67cd79bce165d47974f6c8e8
1	155	672	companyType	67cd79bce165d47974f6c8ea
1	156	673	corporatePurpose	67cd79bce165d47974f6c8ec
2	156	674	suggestedName1	67cd79bce165d47974f6c8ed
3	156	675	suggestedName2	67cd79bce165d47974f6c8ee
4	156	676	suggestedName3	67cd79bce165d47974f6c8ef
1	157	677	numberOfPartners	67cd79bce165d47974f6c8f1
1	158	678	ceoSelection	67cd79bce165d47974f6c8f3
1	159	679	firstName	67cd79bce165d47974f6c8f5
2	159	680	lastName	67cd79bce165d47974f6c8f6
3	159	681	documentType	67cd79bce165d47974f6c8f7
4	159	682	documentNumber	67cd79bce165d47974f6c8f8
5	159	683	email	67cd79bce165d47974f6c8f9
6	159	684	countryCode	67cd79bce165d47974f6c8fa
7	159	685	phone	67cd79bce165d47974f6c8fb
1	178	731	residenceType	67cd79bce165d47974f6c8e8
1	179	732	companyType	67cd79bce165d47974f6c8ea
1	180	733	corporatePurpose	67cd79bce165d47974f6c8ec
2	180	734	suggestedName1	67cd79bce165d47974f6c8ed
3	180	735	suggestedName2	67cd79bce165d47974f6c8ee
4	180	736	suggestedName3	67cd79bce165d47974f6c8ef
1	181	737	numberOfPartners	67cd79bce165d47974f6c8f1
1	182	738	ceoSelection	67cd79bce165d47974f6c8f3
1	183	739	firstName	67cd79bce165d47974f6c8f5
2	183	740	lastName	67cd79bce165d47974f6c8f6
3	183	741	documentType	67cd79bce165d47974f6c8f7
4	183	742	documentNumber	67cd79bce165d47974f6c8f8
5	183	743	email	67cd79bce165d47974f6c8f9
6	183	744	countryCode	67cd79bce165d47974f6c8fa
7	183	745	phone	67cd79bce165d47974f6c8fb
1	184	746	residenceType	67cd79bce165d47974f6c8e8
1	185	747	companyType	67cd79bce165d47974f6c8ea
1	186	748	corporatePurpose	67cd79bce165d47974f6c8ec
2	186	749	suggestedName1	67cd79bce165d47974f6c8ed
3	186	750	suggestedName2	67cd79bce165d47974f6c8ee
4	186	751	suggestedName3	67cd79bce165d47974f6c8ef
1	187	752	numberOfPartners	67cd79bce165d47974f6c8f1
1	188	753	ceoSelection	67cd79bce165d47974f6c8f3
1	189	754	firstName	67cd79bce165d47974f6c8f5
2	189	755	lastName	67cd79bce165d47974f6c8f6
3	189	756	documentType	67cd79bce165d47974f6c8f7
4	189	757	documentNumber	67cd79bce165d47974f6c8f8
5	189	758	email	67cd79bce165d47974f6c8f9
6	189	759	countryCode	67cd79bce165d47974f6c8fa
7	189	760	phone	67cd79bce165d47974f6c8fb
1	256	926	residenceType	67cd79bce165d47974f6c8e8
1	257	927	companyType	67cd79bce165d47974f6c8ea
1	258	928	corporatePurpose	67cd79bce165d47974f6c8ec
2	258	929	suggestedName1	67cd79bce165d47974f6c8ed
3	258	930	suggestedName2	67cd79bce165d47974f6c8ee
4	258	931	suggestedName3	67cd79bce165d47974f6c8ef
1	259	932	numberOfPartners	67cd79bce165d47974f6c8f1
1	260	933	ceoSelection	67cd79bce165d47974f6c8f3
1	261	934	firstName	67cd79bce165d47974f6c8f5
2	261	935	lastName	67cd79bce165d47974f6c8f6
3	261	936	documentType	67cd79bce165d47974f6c8f7
4	261	937	documentNumber	67cd79bce165d47974f6c8f8
5	261	938	email	67cd79bce165d47974f6c8f9
6	261	939	countryCode	67cd79bce165d47974f6c8fa
7	261	940	phone	67cd79bce165d47974f6c8fb
1	262	941	residenceType	67cd79bce165d47974f6c8e8
1	263	942	companyType	67cd79bce165d47974f6c8ea
1	264	943	corporatePurpose	67cd79bce165d47974f6c8ec
2	264	944	suggestedName1	67cd79bce165d47974f6c8ed
3	264	945	suggestedName2	67cd79bce165d47974f6c8ee
4	264	946	suggestedName3	67cd79bce165d47974f6c8ef
1	265	947	numberOfPartners	67cd79bce165d47974f6c8f1
1	266	948	ceoSelection	67cd79bce165d47974f6c8f3
1	267	949	firstName	67cd79bce165d47974f6c8f5
2	267	950	lastName	67cd79bce165d47974f6c8f6
3	267	951	documentType	67cd79bce165d47974f6c8f7
4	267	952	documentNumber	67cd79bce165d47974f6c8f8
5	267	953	email	67cd79bce165d47974f6c8f9
6	267	954	countryCode	67cd79bce165d47974f6c8fa
7	267	955	phone	67cd79bce165d47974f6c8fb
\.


--
-- Data for Name: _pages_v_blocks_media_block; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public._pages_v_blocks_media_block (_order, _parent_id, _path, id, media_id, _uuid, block_name) FROM stdin;
2	2	version.layout	1	7	67cd4ec5073bbe0ba022953d	Media Block
\.


--
-- Data for Name: _pages_v_rels; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public._pages_v_rels (id, "order", parent_id, path, pages_id, posts_id, categories_id) FROM stdin;
272	\N	51	version.hero.links.0.link.reference	11	\N	\N
273	\N	51	version.layout.1.links.0.link.reference	11	\N	\N
274	\N	52	version.hero.links.0.link.reference	11	\N	\N
275	\N	52	version.layout.1.links.0.link.reference	11	\N	\N
277	\N	53	version.hero.links.0.link.reference	11	\N	\N
278	\N	54	version.hero.links.0.link.reference	11	\N	\N
280	\N	55	version.layout.0.links.0.link.reference	11	\N	\N
281	\N	56	version.layout.0.links.0.link.reference	11	\N	\N
288	\N	59	version.hero.links.0.link.reference	11	\N	\N
289	\N	59	version.layout.1.links.0.link.reference	11	\N	\N
290	\N	60	version.hero.links.0.link.reference	11	\N	\N
291	\N	60	version.layout.1.links.0.link.reference	11	\N	\N
299	\N	61	version.hero.links.0.link.reference	11	\N	\N
300	\N	62	version.hero.links.0.link.reference	11	\N	\N
302	\N	63	version.layout.0.links.0.link.reference	11	\N	\N
303	\N	64	version.layout.0.links.0.link.reference	11	\N	\N
\.


--
-- Data for Name: _pages_v_version_hero_links; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public._pages_v_version_hero_links (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label, link_appearance, _uuid) FROM stdin;
1	2	1	custom	\N	/posts	All posts	default	67cd4ec5073bbe0ba0229534
2	2	2	custom	\N	/contact	Contact	outline	67cd4ec5073bbe0ba0229535
1	50	305	custom	\N	/	Conoce más	default	67cd79bce165d47974f6c8e6
2	50	306	custom	\N	/contact	Contacto	outline	67cd79bce165d47974f6c8e7
1	15	9	custom	\N	/posts	All posts	default	67cd4ec5073bbe0ba0229534
2	15	10	custom	\N	/contact	Contact	outline	67cd4ec5073bbe0ba0229535
1	16	11	custom	\N	/posts	All posts	default	67cd4ec5073bbe0ba0229534
2	16	12	custom	\N	/contact	Contact	outline	67cd4ec5073bbe0ba0229535
1	51	312	reference	\N	/posts	Registra tu Empresa 🚀	default	67cd4ec5073bbe0ba0229534
1	52	313	reference	\N	/posts	Registra tu Empresa 🚀	default	67cd4ec5073bbe0ba0229534
1	53	323	reference	\N	\N	Registra tu Empresa 🚀	default	67cd57ed066bc40058165b09
1	54	324	reference	\N	\N	Registra tu Empresa 🚀	default	67cd57ed066bc40058165b09
1	22	31	custom	\N	/posts	All posts	default	67cd4ec5073bbe0ba0229534
2	22	32	custom	\N	/contact	Contact	outline	67cd4ec5073bbe0ba0229535
1	23	33	custom	\N	/posts	All posts	default	67cd4ec5073bbe0ba0229534
2	23	34	custom	\N	/contact	Contact	outline	67cd4ec5073bbe0ba0229535
1	57	331	custom	\N	/	Conoce más	default	67cd79bce165d47974f6c8e6
2	57	332	custom	\N	/contact	Contacto	outline	67cd79bce165d47974f6c8e7
1	58	333	custom	\N	/	Conoce más	default	67cd79bce165d47974f6c8e6
2	58	334	custom	\N	/contact	Contacto	outline	67cd79bce165d47974f6c8e7
1	59	338	reference	t	/posts	Registra tu Empresa 🚀	default	67cd4ec5073bbe0ba0229534
1	60	339	reference	t	/posts	Registra tu Empresa 🚀	default	67cd4ec5073bbe0ba0229534
1	20	248	reference	\N	\N	Registra tu Empresa 🚀	default	67cd57ed066bc40058165b09
1	28	249	reference	\N	\N	Registra tu Empresa 🚀	default	67cd57ed066bc40058165b09
1	29	251	reference	\N	\N	Registra tu Empresa 🚀	default	67cd57ed066bc40058165b09
1	30	252	reference	\N	\N	Registra tu Empresa 🚀	default	67cd57ed066bc40058165b09
1	31	254	reference	\N	\N	Registra tu Empresa 🚀	default	67cd57ed066bc40058165b09
1	24	53	reference	\N	/posts	Registra tu Empresa 🚀	default	67cd4ec5073bbe0ba0229534
1	25	54	reference	\N	/posts	Registra tu Empresa 🚀	default	67cd4ec5073bbe0ba0229534
1	32	255	reference	\N	\N	Registra tu Empresa 🚀	default	67cd57ed066bc40058165b09
1	33	257	reference	\N	\N	Registra tu Empresa 🚀	default	67cd57ed066bc40058165b09
1	34	258	reference	\N	\N	Registra tu Empresa 🚀	default	67cd57ed066bc40058165b09
1	61	347	reference	t	\N	Registra tu Empresa 🚀	default	67cd57ed066bc40058165b09
1	62	348	reference	t	\N	Registra tu Empresa 🚀	default	67cd57ed066bc40058165b09
1	26	129	reference	\N	/posts	Registra tu Empresa 🚀	default	67cd4ec5073bbe0ba0229534
1	27	130	reference	\N	/posts	Registra tu Empresa 🚀	default	67cd4ec5073bbe0ba0229534
1	65	371	custom	\N	/	Conoce más	default	67cd79bce165d47974f6c8e6
2	65	372	custom	\N	/contact	Contacto	outline	67cd79bce165d47974f6c8e7
1	66	373	custom	\N	/	Conoce más	default	67cd79bce165d47974f6c8e6
2	66	374	custom	\N	/contact	Contacto	outline	67cd79bce165d47974f6c8e7
\.


--
-- Data for Name: _posts_v; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public._posts_v (id, parent_id, version_title, version_hero_image_id, version_content, version_meta_title, version_meta_image_id, version_meta_description, version_published_at, version_slug, version_slug_lock, version_updated_at, version_created_at, version__status, created_at, updated_at, latest, autosave) FROM stdin;
5	3	Digital Horizons: A Glimpse into Tomorrow	5	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dive into the marvels of modern innovation, where the only constant is change. A journey where pixels and data converge to craft the future.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "block", "fields": {"id": "67cd4eb0073bbe0ba022951c", "style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Disclaimer:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " This content is fabricated and for demonstration purposes only. To edit this post, ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "navigate to the admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}, "blockName": "Disclaimer", "blockType": "banner"}, "format": "", "version": 2}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The Rise of AI and Machine Learning", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We find ourselves in a transformative era where artificial intelligence (AI) stands at the forefront of technological evolution. The ripple effects of its advancements are reshaping industries at an unprecedented pace. No longer are businesses bound by the limitations of tedious, manual processes. Instead, sophisticated machines, fueled by vast amounts of historical data, are now capable of making decisions previously left to human intuition. These intelligent systems are not only optimizing operations but also pioneering innovative approaches, heralding a new age of business transformation worldwide. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "To demonstrate basic AI functionality, here is a javascript snippet that makes a POST request to a generic AI API in order to generate text based on a prompt. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "block", "fields": {"id": "67cd4eb0073bbe0ba022951d", "code": "async function generateText(prompt) {\\n    const apiKey = 'your-api-key';\\n    const apiUrl = 'https://api.example.com/generate-text';\\n\\n    const response = await fetch(apiUrl, {\\n        method: 'POST',\\n        headers: {\\n            'Content-Type': 'application/json',\\n            'Authorization': `Bearer ${apiKey}`\\n        },\\n        body: JSON.stringify({\\n            model: 'text-generation-model',\\n            prompt: prompt,\\n            max_tokens: 50\\n        })\\n    });\\n\\n    const data = await response.json();\\n    console.log(data.choices[0].text.trim());\\n}\\n\\n// Example usage\\ngenerateText(\\"Once upon a time in a faraway land,\\");\\n", "language": "javascript", "blockName": "Generate Text", "blockType": "code"}, "format": "", "version": 2}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "IoT: Connecting the World Around Us", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "In today's rapidly evolving technological landscape, the Internet of Things (IoT) stands out as a revolutionary force. From transforming our residences with smart home systems to redefining transportation through connected cars, IoT's influence is palpable in nearly every facet of our daily lives.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This technology hinges on the seamless integration of devices and systems, allowing them to communicate and collaborate effortlessly. With each connected device, we move a step closer to a world where convenience and efficiency are embedded in the very fabric of our existence. As a result, we're transitioning into an era where our surroundings intuitively respond to our needs, heralding a smarter and more interconnected global community.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "block", "fields": {"id": "67cd4eb0073bbe0ba022951e", "media": 7, "blockName": "", "blockType": "mediaBlock"}, "format": "", "version": 2}, {"type": "block", "fields": {"id": "67cd4eb0073bbe0ba022951f", "style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This content above is completely dynamic using custom layout building blocks configured in the CMS. This can be anything you'd like from rich text and images, to highly designed, complex components.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}, "blockName": "Dynamic Components", "blockType": "banner"}, "format": "", "version": 2}], "direction": "ltr"}}	Digital Horizons: A Glimpse into Tomorrow	5	Dive into the marvels of modern innovation, where the only constant is change. A journey where pixels and data converge to craft the future.	2025-03-09 08:17:42.775+00	digital-horizons	t	2025-03-09 08:17:52.605+00	2025-03-09 08:17:43.534+00	published	2025-03-09 08:17:53.535+00	2025-03-09 08:17:53.535+00	t	f
2	3	Digital Horizons: A Glimpse into Tomorrow	5	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dive into the marvels of modern innovation, where the only constant is change. A journey where pixels and data converge to craft the future.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "block", "fields": {"style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Disclaimer:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " This content is fabricated and for demonstration purposes only. To edit this post, ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "navigate to the admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}, "blockName": "Disclaimer", "blockType": "banner"}, "format": "", "version": 2}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The Rise of AI and Machine Learning", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We find ourselves in a transformative era where artificial intelligence (AI) stands at the forefront of technological evolution. The ripple effects of its advancements are reshaping industries at an unprecedented pace. No longer are businesses bound by the limitations of tedious, manual processes. Instead, sophisticated machines, fueled by vast amounts of historical data, are now capable of making decisions previously left to human intuition. These intelligent systems are not only optimizing operations but also pioneering innovative approaches, heralding a new age of business transformation worldwide. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "To demonstrate basic AI functionality, here is a javascript snippet that makes a POST request to a generic AI API in order to generate text based on a prompt. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "block", "fields": {"code": "async function generateText(prompt) {\\n    const apiKey = 'your-api-key';\\n    const apiUrl = 'https://api.example.com/generate-text';\\n\\n    const response = await fetch(apiUrl, {\\n        method: 'POST',\\n        headers: {\\n            'Content-Type': 'application/json',\\n            'Authorization': `Bearer ${apiKey}`\\n        },\\n        body: JSON.stringify({\\n            model: 'text-generation-model',\\n            prompt: prompt,\\n            max_tokens: 50\\n        })\\n    });\\n\\n    const data = await response.json();\\n    console.log(data.choices[0].text.trim());\\n}\\n\\n// Example usage\\ngenerateText(\\"Once upon a time in a faraway land,\\");\\n", "language": "javascript", "blockName": "Generate Text", "blockType": "code"}, "format": "", "version": 2}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "IoT: Connecting the World Around Us", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "In today's rapidly evolving technological landscape, the Internet of Things (IoT) stands out as a revolutionary force. From transforming our residences with smart home systems to redefining transportation through connected cars, IoT's influence is palpable in nearly every facet of our daily lives.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This technology hinges on the seamless integration of devices and systems, allowing them to communicate and collaborate effortlessly. With each connected device, we move a step closer to a world where convenience and efficiency are embedded in the very fabric of our existence. As a result, we're transitioning into an era where our surroundings intuitively respond to our needs, heralding a smarter and more interconnected global community.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "block", "fields": {"media": 7, "blockName": "", "blockType": "mediaBlock"}, "format": "", "version": 2}, {"type": "block", "fields": {"style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This content above is completely dynamic using custom layout building blocks configured in the CMS. This can be anything you'd like from rich text and images, to highly designed, complex components.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}, "blockName": "Dynamic Components", "blockType": "banner"}, "format": "", "version": 2}], "direction": "ltr"}}	Digital Horizons: A Glimpse into Tomorrow	5	Dive into the marvels of modern innovation, where the only constant is change. A journey where pixels and data converge to craft the future.	2025-03-09 08:17:42.775+00	digital-horizons	t	2025-03-09 08:17:42.776+00	2025-03-09 08:17:43.534+00	published	2025-03-09 08:17:43.415+00	2025-03-09 08:17:43.416+00	f	f
6	4	Global Gaze: Beyond the Headlines	7	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Explore the untold and overlooked. A magnified view into the corners of the world, where every story deserves its spotlight.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "block", "fields": {"id": "67cd4eb7073bbe0ba0229526", "style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Disclaimer:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " This content is fabricated and for demonstration purposes only. To edit this post, ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "navigate to the admin dashboard.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr", "textFormat": 1}], "direction": "ltr"}}, "blockName": "Disclaimer", "blockType": "banner"}, "format": "", "version": 2}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The Power of Resilience: Stories of Recovery and Hope", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Throughout history, regions across the globe have faced the devastating impact of natural disasters, the turbulence of political unrest, and the challenging ripples of economic downturns. In these moments of profound crisis, an often-underestimated force emerges: the indomitable resilience of the human spirit. These aren't just tales of mere survival, but stories of communities forging bonds, uniting with a collective purpose, and demonstrating an innate ability to overcome.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "block", "fields": {"id": "67cd4eb7073bbe0ba0229527", "media": 6, "blockName": "", "blockType": "mediaBlock"}, "format": "", "version": 2}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "From neighbors forming makeshift rescue teams during floods to entire cities rallying to rebuild after economic collapse, the essence of humanity is most evident in these acts of solidarity. As we delve into these narratives, we witness the transformative power of community spirit, where adversity becomes a catalyst for growth, unity, and a brighter, rebuilt future.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "block", "fields": {"id": "67cd4eb7073bbe0ba0229528", "style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This content above is completely dynamic using custom layout building blocks configured in the CMS. This can be anything you'd like from rich text and images, to highly designed, complex components.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}, "blockName": "Dynamic components", "blockType": "banner"}, "format": "", "version": 2}], "direction": "ltr"}}	Global Gaze: Beyond the Headlines	7	Explore the untold and overlooked. A magnified view into the corners of the world, where every story deserves its spotlight.	2025-03-09 08:17:45.832+00	global-gaze	t	2025-03-09 08:17:59.636+00	2025-03-09 08:17:46.494+00	published	2025-03-09 08:18:00.533+00	2025-03-09 08:18:00.534+00	t	f
3	4	Global Gaze: Beyond the Headlines	7	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Explore the untold and overlooked. A magnified view into the corners of the world, where every story deserves its spotlight.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "block", "fields": {"style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Disclaimer:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " This content is fabricated and for demonstration purposes only. To edit this post, ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "navigate to the admin dashboard.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr", "textFormat": 1}], "direction": "ltr"}}, "blockName": "Disclaimer", "blockType": "banner"}, "format": "", "version": 2}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The Power of Resilience: Stories of Recovery and Hope", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Throughout history, regions across the globe have faced the devastating impact of natural disasters, the turbulence of political unrest, and the challenging ripples of economic downturns. In these moments of profound crisis, an often-underestimated force emerges: the indomitable resilience of the human spirit. These aren't just tales of mere survival, but stories of communities forging bonds, uniting with a collective purpose, and demonstrating an innate ability to overcome.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "block", "fields": {"media": 6, "blockName": "", "blockType": "mediaBlock"}, "format": "", "version": 2}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "From neighbors forming makeshift rescue teams during floods to entire cities rallying to rebuild after economic collapse, the essence of humanity is most evident in these acts of solidarity. As we delve into these narratives, we witness the transformative power of community spirit, where adversity becomes a catalyst for growth, unity, and a brighter, rebuilt future.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "block", "fields": {"style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This content above is completely dynamic using custom layout building blocks configured in the CMS. This can be anything you'd like from rich text and images, to highly designed, complex components.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}, "blockName": "Dynamic components", "blockType": "banner"}, "format": "", "version": 2}], "direction": "ltr"}}	Global Gaze: Beyond the Headlines	7	Explore the untold and overlooked. A magnified view into the corners of the world, where every story deserves its spotlight.	2025-03-09 08:17:45.832+00	global-gaze	t	2025-03-09 08:17:45.834+00	2025-03-09 08:17:46.494+00	published	2025-03-09 08:17:46.544+00	2025-03-09 08:17:46.544+00	f	f
7	5	Dollar and Sense: The Financial Forecast	6	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "block", "fields": {"id": "67cd4ebc073bbe0ba022952c", "style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Disclaimer: ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "This content is fabricated and for demonstration purposes only. To edit this post, ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "navigate to the admin dashboard.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr", "textFormat": 1}], "direction": "ltr"}}, "blockName": "Disclaimer", "blockType": "banner"}, "format": "", "version": 2}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Money isn't just currency; ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "it's a language. ", "type": "text", "style": "", "detail": 0, "format": 2, "version": 1}, {"mode": "normal", "text": "Dive deep into its nuances, where strategy meets intuition in the vast sea of finance.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Money, in its essence, transcends the mere concept of coins and paper notes; it becomes a profound language that speaks of value, trust, and societal structures. Like any language, it possesses intricate nuances and subtleties that require a discerning understanding. It's in these depths where the calculated world of financial strategy collides with the raw, instinctive nature of human intuition. Just as a seasoned linguist might dissect the syntax and semantics of a sentence, a financial expert navigates the vast and tumultuous ocean of finance, guided not only by logic and data but also by gut feelings and foresight. Every transaction, investment, and financial decision becomes a dialogue in this expansive lexicon of commerce and value.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "block", "fields": {"id": "67cd4ebc073bbe0ba022952d", "media": 5, "blockName": "", "blockType": "mediaBlock"}, "format": "", "version": 2}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Stock Market Dynamics: Bulls, Bears, and the Uncertain Middle", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The stock market is a realm of vast opportunity but also poses risks. Discover the forces that drive market trends and the strategies employed by top traders to navigate this complex ecosystem. From market analysis to understanding investor psychology, get a comprehensive insight into the world of stocks.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The stock market, often visualized as a bustling arena of numbers and ticker tapes, is as much about human behavior as it is about economics. It's a place where optimism, represented by the bullish rally, meets the caution of bearish downturns, with each vying to dictate the market's direction. But between these two extremes lies an uncertain middle ground, a zone populated by traders and investors who constantly weigh hope against fear. Successful navigation requires more than just financial acumen; it demands an understanding of collective sentiments and the ability to predict not just market movements, but also the reactions of other market participants. In this intricate dance of numbers and nerves, the most astute players are those who master both the hard data and the soft nuances of human behavior.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "block", "fields": {"id": "67cd4ebc073bbe0ba022952e", "style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This content above is completely dynamic using custom layout building blocks configured in the CMS. This can be anything you'd like from rich text and images, to highly designed, complex components.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}, "blockName": "Dynamic components", "blockType": "banner"}, "format": "", "version": 2}], "direction": "ltr"}}	Dollar and Sense: The Financial Forecast	6	Money isn't just currency; it's a language. Dive deep into its nuances, where strategy meets intuition in the vast sea of finance.	2025-03-09 08:17:48.732+00	dollar-and-sense-the-financial-forecast	t	2025-03-09 08:18:05.441+00	2025-03-09 08:17:49.495+00	published	2025-03-09 08:18:06.378+00	2025-03-09 08:18:06.379+00	t	f
4	5	Dollar and Sense: The Financial Forecast	6	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "block", "fields": {"style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Disclaimer: ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "This content is fabricated and for demonstration purposes only. To edit this post, ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "navigate to the admin dashboard.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr", "textFormat": 1}], "direction": "ltr"}}, "blockName": "Disclaimer", "blockType": "banner"}, "format": "", "version": 2}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Money isn't just currency; ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "it's a language. ", "type": "text", "style": "", "detail": 0, "format": 2, "version": 1}, {"mode": "normal", "text": "Dive deep into its nuances, where strategy meets intuition in the vast sea of finance.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Money, in its essence, transcends the mere concept of coins and paper notes; it becomes a profound language that speaks of value, trust, and societal structures. Like any language, it possesses intricate nuances and subtleties that require a discerning understanding. It's in these depths where the calculated world of financial strategy collides with the raw, instinctive nature of human intuition. Just as a seasoned linguist might dissect the syntax and semantics of a sentence, a financial expert navigates the vast and tumultuous ocean of finance, guided not only by logic and data but also by gut feelings and foresight. Every transaction, investment, and financial decision becomes a dialogue in this expansive lexicon of commerce and value.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "block", "fields": {"media": 5, "blockName": "", "blockType": "mediaBlock"}, "format": "", "version": 2}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Stock Market Dynamics: Bulls, Bears, and the Uncertain Middle", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The stock market is a realm of vast opportunity but also poses risks. Discover the forces that drive market trends and the strategies employed by top traders to navigate this complex ecosystem. From market analysis to understanding investor psychology, get a comprehensive insight into the world of stocks.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The stock market, often visualized as a bustling arena of numbers and ticker tapes, is as much about human behavior as it is about economics. It's a place where optimism, represented by the bullish rally, meets the caution of bearish downturns, with each vying to dictate the market's direction. But between these two extremes lies an uncertain middle ground, a zone populated by traders and investors who constantly weigh hope against fear. Successful navigation requires more than just financial acumen; it demands an understanding of collective sentiments and the ability to predict not just market movements, but also the reactions of other market participants. In this intricate dance of numbers and nerves, the most astute players are those who master both the hard data and the soft nuances of human behavior.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "block", "fields": {"style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This content above is completely dynamic using custom layout building blocks configured in the CMS. This can be anything you'd like from rich text and images, to highly designed, complex components.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}, "blockName": "Dynamic components", "blockType": "banner"}, "format": "", "version": 2}], "direction": "ltr"}}	Dollar and Sense: The Financial Forecast	6	Money isn't just currency; it's a language. Dive deep into its nuances, where strategy meets intuition in the vast sea of finance.	2025-03-09 08:17:48.732+00	dollar-and-sense-the-financial-forecast	t	2025-03-09 08:17:48.734+00	2025-03-09 08:17:49.495+00	published	2025-03-09 08:17:49.294+00	2025-03-09 08:17:49.296+00	f	f
\.


--
-- Data for Name: _posts_v_rels; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public._posts_v_rels (id, "order", parent_id, path, posts_id, categories_id, users_id) FROM stdin;
2	1	2	version.authors	\N	\N	3
3	1	3	version.authors	\N	\N	3
4	1	4	version.authors	\N	\N	3
5	1	5	version.relatedPosts	4	\N	\N
6	2	5	version.relatedPosts	5	\N	\N
7	1	5	version.authors	\N	\N	3
8	1	6	version.relatedPosts	3	\N	\N
9	2	6	version.relatedPosts	5	\N	\N
10	1	6	version.authors	\N	\N	3
11	1	7	version.relatedPosts	3	\N	\N
12	2	7	version.relatedPosts	4	\N	\N
13	1	7	version.authors	\N	\N	3
\.


--
-- Data for Name: _posts_v_version_populated_authors; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public._posts_v_version_populated_authors (_order, _parent_id, id, _uuid, name) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.categories (id, title, slug, slug_lock, parent_id, updated_at, created_at) FROM stdin;
7	Technology	technology	t	\N	2025-03-09 08:17:36.491+00	2025-03-09 08:17:36.135+00
8	News	news	t	\N	2025-03-09 08:17:36.504+00	2025-03-09 08:17:36.174+00
9	Engineering	engineering	t	\N	2025-03-09 08:17:36.656+00	2025-03-09 08:17:36.131+00
10	Finance	finance	t	\N	2025-03-09 08:17:37.045+00	2025-03-09 08:17:36.601+00
11	Software	software	t	\N	2025-03-09 08:17:37.049+00	2025-03-09 08:17:36.604+00
12	Design	design	t	\N	2025-03-09 08:17:37.057+00	2025-03-09 08:17:36.624+00
\.


--
-- Data for Name: categories_breadcrumbs; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.categories_breadcrumbs (_order, _parent_id, id, doc_id, url, label) FROM stdin;
1	8	67cd4ea0073bbe0ba0229503	8	/news	News
1	7	67cd4ea0073bbe0ba0229502	7	/technology	Technology
1	9	67cd4ea0073bbe0ba0229504	9	/engineering	Engineering
1	10	67cd4ea1073bbe0ba0229505	10	/finance	Finance
1	11	67cd4ea1073bbe0ba0229506	11	/software	Software
1	12	67cd4ea1073bbe0ba0229507	12	/design	Design
\.


--
-- Data for Name: footer; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.footer (id, updated_at, created_at) FROM stdin;
1	2025-03-10 16:09:02.226+00	2025-03-09 08:17:13.026+00
\.


--
-- Data for Name: footer_nav_items; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.footer_nav_items (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label) FROM stdin;
1	1	67cd55929d34cf53bcb98d22	reference	t	\N	Registra tu Empresa
2	1	67cd557f9d34cf53bcb98d20	reference	\N	\N	About Us
3	1	67cd558b9d34cf53bcb98d21	reference	\N	\N	Contact
4	1	67cd4eca073bbe0ba0229544	custom	\N	/admin	Admin
\.


--
-- Data for Name: footer_rels; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.footer_rels (id, "order", parent_id, path, pages_id, posts_id) FROM stdin;
16	\N	1	navItems.0.link.reference	11	\N
17	\N	1	navItems.1.link.reference	4	\N
18	\N	1	navItems.2.link.reference	1	\N
\.


--
-- Data for Name: form_submissions; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.form_submissions (id, form_id, updated_at, created_at, payment_field, payment_status, payment_amount, payment_payment_processor, payment_credit_card_token, payment_credit_card_brand, payment_credit_card_number) FROM stdin;
8	10	2025-03-09 11:56:29.107+00	2025-03-09 11:56:29.496+00	\N	\N	\N	\N	\N	\N	\N
9	10	2025-03-09 12:02:01.915+00	2025-03-09 12:02:01.784+00	\N	\N	\N	\N	\N	\N	\N
10	10	2025-03-09 12:15:08.621+00	2025-03-09 12:15:08.459+00	\N	\N	\N	\N	\N	\N	\N
11	10	2025-03-10 16:39:54.248+00	2025-03-10 16:39:54.034+00	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: form_submissions_submission_data; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.form_submissions_submission_data (_order, _parent_id, id, field, value) FROM stdin;
1	10	67cd864cdd414b0003c457b4	residenceType	peru
2	10	67cd864cdd414b0003c457b5	companyType	sac
3	10	67cd864cdd414b0003c457b6	corporatePurpose	Ghkk
4	10	67cd864cdd414b0003c457b7	suggestedName1	Rgj
5	10	67cd864cdd414b0003c457b8	suggestedName2	
6	10	67cd864cdd414b0003c457b9	suggestedName3	
7	10	67cd864cdd414b0003c457ba	numberOfPartners	2
8	10	67cd864cdd414b0003c457bb	partner1FirstName	Rodrigo
9	10	67cd864cdd414b0003c457bc	partner1LastName	Vásquez de Velasco
10	10	67cd864cdd414b0003c457bd	partner1Nationality	urePperuano
11	10	67cd864cdd414b0003c457be	partner1DocumentType	dni
12	10	67cd864cdd414b0003c457bf	partner1DocumentNumber	09696607
13	10	67cd864cdd414b0003c457c0	partner1Email	rodrigovdev01@gmail.com
14	10	67cd864cdd414b0003c457c1	partner1Phone	949833976
15	10	67cd864cdd414b0003c457c2	partner1MonetaryContribution	5000
16	10	67cd864cdd414b0003c457c3	partner1Currency	pen
17	10	67cd864cdd414b0003c457c4	partner1NonMonetaryDescription	
18	10	67cd864cdd414b0003c457c5	partner1NonMonetaryValue	0
19	10	67cd864cdd414b0003c457c6	partner1NonMonetaryCurrency	pen
20	10	67cd864cdd414b0003c457c7	partner1ExecutiveRole	ceo
21	10	67cd864cdd414b0003c457c8	partner2FirstName	otreblA
22	10	67cd864cdd414b0003c457c9	partner2LastName	Saco
23	10	67cd864cdd414b0003c457ca	partner2Nationality	onaurePperuano
24	10	67cd864cdd414b0003c457cb	partner2DocumentType	dni
25	10	67cd864cdd414b0003c457cc	partner2DocumentNumber	95959595607
26	10	67cd864cdd414b0003c457cd	partner2Email	rodrigovdev01@gmail.com
27	10	67cd864cdd414b0003c457ce	partner2Phone	949833976
28	10	67cd864cdd414b0003c457cf	partner2MonetaryContribution	5000
29	10	67cd864cdd414b0003c457d0	partner2Currency	pen
30	10	67cd864cdd414b0003c457d1	partner2NonMonetaryDescription	
31	10	67cd864cdd414b0003c457d2	partner2NonMonetaryValue	0
32	10	67cd864cdd414b0003c457d3	partner2NonMonetaryCurrency	pen
33	10	67cd864cdd414b0003c457d4	partner2ExecutiveRole	cfo
34	10	67cd864cdd414b0003c457d5	partner3FirstName	
35	10	67cd864cdd414b0003c457d6	partner3LastName	
36	10	67cd864cdd414b0003c457d7	partner3Nationality	peruano
37	10	67cd864cdd414b0003c457d8	partner3DocumentType	dni
38	10	67cd864cdd414b0003c457d9	partner3DocumentNumber	
39	10	67cd864cdd414b0003c457da	partner3Email	
40	10	67cd864cdd414b0003c457db	partner3Phone	
41	10	67cd864cdd414b0003c457dc	partner3MonetaryContribution	0
42	10	67cd864cdd414b0003c457dd	partner3Currency	pen
43	10	67cd864cdd414b0003c457de	partner3NonMonetaryDescription	
44	10	67cd864cdd414b0003c457df	partner3NonMonetaryValue	0
45	10	67cd864cdd414b0003c457e0	partner3NonMonetaryCurrency	pen
46	10	67cd864cdd414b0003c457e1	partner3ExecutiveRole	none
47	10	67cd864cdd414b0003c457e2	partner4FirstName	
48	10	67cd864cdd414b0003c457e3	partner4LastName	
49	10	67cd864cdd414b0003c457e4	partner4Nationality	peruano
50	10	67cd864cdd414b0003c457e5	partner4DocumentType	dni
51	10	67cd864cdd414b0003c457e6	partner4DocumentNumber	
52	10	67cd864cdd414b0003c457e7	partner4Email	
53	10	67cd864cdd414b0003c457e8	partner4Phone	
54	10	67cd864cdd414b0003c457e9	partner4MonetaryContribution	0
55	10	67cd864cdd414b0003c457ea	partner4Currency	pen
56	10	67cd864cdd414b0003c457eb	partner4NonMonetaryDescription	
57	10	67cd864cdd414b0003c457ec	partner4NonMonetaryValue	0
58	10	67cd864cdd414b0003c457ed	partner4NonMonetaryCurrency	pen
59	10	67cd864cdd414b0003c457ee	partner4ExecutiveRole	none
60	10	67cd864cdd414b0003c457ef	partner5FirstName	
61	10	67cd864cdd414b0003c457f0	partner5LastName	
62	10	67cd864cdd414b0003c457f1	partner5Nationality	peruano
63	10	67cd864cdd414b0003c457f2	partner5DocumentType	dni
64	10	67cd864cdd414b0003c457f3	partner5DocumentNumber	
65	10	67cd864cdd414b0003c457f4	partner5Email	
66	10	67cd864cdd414b0003c457f5	partner5Phone	
67	10	67cd864cdd414b0003c457f6	partner5MonetaryContribution	0
68	10	67cd864cdd414b0003c457f7	partner5Currency	pen
69	10	67cd864cdd414b0003c457f8	partner5NonMonetaryDescription	
70	10	67cd864cdd414b0003c457f9	partner5NonMonetaryValue	0
71	10	67cd864cdd414b0003c457fa	partner5NonMonetaryCurrency	pen
72	10	67cd864cdd414b0003c457fb	partner5ExecutiveRole	none
73	10	67cd864cdd414b0003c457fc	ceoSelection	partner1
74	10	67cd864cdd414b0003c457fd	newCEOFirstName	
75	10	67cd864cdd414b0003c457fe	newCEOLastName	
76	10	67cd864cdd414b0003c457ff	newCEONationality	peruano
77	10	67cd864cdd414b0003c45800	newCEODocumentType	dni
78	10	67cd864cdd414b0003c45801	newCEODocumentNumber	
79	10	67cd864cdd414b0003c45802	newCEOEmail	
80	10	67cd864cdd414b0003c45803	newCEOPhone	
81	10	67cd864cdd414b0003c45804	firstName	Rodrigo
82	10	67cd864cdd414b0003c45805	lastName	Vásquez de Velasco
83	10	67cd864cdd414b0003c45806	documentType	dni
84	10	67cd864cdd414b0003c45807	documentNumber	70669690
85	10	67cd864cdd414b0003c45808	email	rodrigovdev01@gmail.com
86	10	67cd864cdd414b0003c45809	countryCode	+51
87	10	67cd864cdd414b0003c4580a	phone	949833976
1	11	67cf15dae9ff490003127932	residenceType	peru
2	11	67cf15dae9ff490003127933	companyType	sac
3	11	67cf15dae9ff490003127934	corporatePurpose	disfjsdoifuo
4	11	67cf15dae9ff490003127935	suggestedName1	eiofusdof
5	11	67cf15dae9ff490003127936	suggestedName2	oidsufs
6	11	67cf15dae9ff490003127937	suggestedName3	osdifu
7	11	67cf15dae9ff490003127938	numberOfPartners	2
8	11	67cf15dae9ff490003127939	partner1FirstName	Rodrigo
9	11	67cf15dae9ff49000312793a	partner1LastName	Vásquez de Velasco
10	11	67cf15dae9ff49000312793b	partner1Nationality	peruano
11	11	67cf15dae9ff49000312793c	partner1DocumentType	dni
12	11	67cf15dae9ff49000312793d	partner1DocumentNumber	70669690
13	11	67cf15dae9ff49000312793e	partner1Email	rodrigovdev01@gmail.com
14	11	67cf15dae9ff49000312793f	partner1Phone	949833976
15	11	67cf15dae9ff490003127940	partner1MonetaryContribution	2000
16	11	67cf15dae9ff490003127941	partner1Currency	pen
17	11	67cf15dae9ff490003127942	partner1NonMonetaryDescription	
18	11	67cf15dae9ff490003127943	partner1NonMonetaryValue	0
19	11	67cf15dae9ff490003127944	partner1NonMonetaryCurrency	pen
20	11	67cf15dae9ff490003127945	partner1ExecutiveRole	ceo
21	11	67cf15dae9ff490003127946	partner2FirstName	Alberto
22	11	67cf15dae9ff490003127947	partner2LastName	Saco
23	11	67cf15dae9ff490003127948	partner2Nationality	peruano
24	11	67cf15dae9ff490003127949	partner2DocumentType	dni
25	11	67cf15dae9ff49000312794a	partner2DocumentNumber	70668595
26	11	67cf15dae9ff49000312794b	partner2Email	betosaco@gmail.com
27	11	67cf15dae9ff49000312794c	partner2Phone	999999999
28	11	67cf15dae9ff49000312794d	partner2MonetaryContribution	10000
29	11	67cf15dae9ff49000312794e	partner2Currency	pen
30	11	67cf15dae9ff49000312794f	partner2NonMonetaryDescription	
31	11	67cf15dae9ff490003127950	partner2NonMonetaryValue	0
32	11	67cf15dae9ff490003127951	partner2NonMonetaryCurrency	pen
33	11	67cf15dae9ff490003127952	partner2ExecutiveRole	coo
34	11	67cf15dae9ff490003127953	partner3FirstName	
1	8	67cd81ec2cd4fe2f24cbec58	residenceType	peru
2	8	67cd81ec2cd4fe2f24cbec59	companyType	sac
3	8	67cd81ec2cd4fe2f24cbec5a	corporatePurpose	dfsdgf
4	8	67cd81ec2cd4fe2f24cbec5b	suggestedName1	adf
5	8	67cd81ec2cd4fe2f24cbec5c	suggestedName2	df
6	8	67cd81ec2cd4fe2f24cbec5d	suggestedName3	fgs
7	8	67cd81ec2cd4fe2f24cbec5e	numberOfPartners	2
8	8	67cd81ec2cd4fe2f24cbec5f	partner1FirstName	Rodrigo
9	8	67cd81ec2cd4fe2f24cbec60	partner1LastName	Vásquez de Velasco
10	8	67cd81ec2cd4fe2f24cbec61	partner1Nationality	peruano
11	8	67cd81ec2cd4fe2f24cbec62	partner1DocumentType	dni
12	8	67cd81ec2cd4fe2f24cbec63	partner1DocumentNumber	70669690
13	8	67cd81ec2cd4fe2f24cbec64	partner1Email	rodrigovdev01@gmail.com
14	8	67cd81ec2cd4fe2f24cbec65	partner1Phone	949833976
15	8	67cd81ec2cd4fe2f24cbec66	partner1MonetaryContribution	2000
16	8	67cd81ec2cd4fe2f24cbec67	partner1Currency	pen
17	8	67cd81ec2cd4fe2f24cbec68	partner1NonMonetaryDescription	
18	8	67cd81ec2cd4fe2f24cbec69	partner1NonMonetaryValue	0
19	8	67cd81ec2cd4fe2f24cbec6a	partner1NonMonetaryCurrency	pen
20	8	67cd81ec2cd4fe2f24cbec6b	partner1ExecutiveRole	ceo
21	8	67cd81ec2cd4fe2f24cbec6c	partner2FirstName	Beto
22	8	67cd81ec2cd4fe2f24cbec6d	partner2LastName	Saco
23	8	67cd81ec2cd4fe2f24cbec6e	partner2Nationality	peruano
24	8	67cd81ec2cd4fe2f24cbec6f	partner2DocumentType	dni
25	8	67cd81ec2cd4fe2f24cbec70	partner2DocumentNumber	79797898
26	8	67cd81ec2cd4fe2f24cbec71	partner2Email	betosaco@gmail.com
27	8	67cd81ec2cd4fe2f24cbec72	partner2Phone	949896463
28	8	67cd81ec2cd4fe2f24cbec73	partner2MonetaryContribution	10000
29	8	67cd81ec2cd4fe2f24cbec74	partner2Currency	pen
30	8	67cd81ec2cd4fe2f24cbec75	partner2NonMonetaryDescription	
31	8	67cd81ec2cd4fe2f24cbec76	partner2NonMonetaryValue	0
32	8	67cd81ec2cd4fe2f24cbec77	partner2NonMonetaryCurrency	pen
33	8	67cd81ec2cd4fe2f24cbec78	partner2ExecutiveRole	none
34	8	67cd81ec2cd4fe2f24cbec79	partner3FirstName	
35	8	67cd81ec2cd4fe2f24cbec7a	partner3LastName	
36	8	67cd81ec2cd4fe2f24cbec7b	partner3Nationality	peruano
37	8	67cd81ec2cd4fe2f24cbec7c	partner3DocumentType	dni
38	8	67cd81ec2cd4fe2f24cbec7d	partner3DocumentNumber	
39	8	67cd81ec2cd4fe2f24cbec7e	partner3Email	
40	8	67cd81ec2cd4fe2f24cbec7f	partner3Phone	
41	8	67cd81ec2cd4fe2f24cbec80	partner3MonetaryContribution	0
42	8	67cd81ec2cd4fe2f24cbec81	partner3Currency	pen
43	8	67cd81ec2cd4fe2f24cbec82	partner3NonMonetaryDescription	
44	8	67cd81ec2cd4fe2f24cbec83	partner3NonMonetaryValue	0
45	8	67cd81ec2cd4fe2f24cbec84	partner3NonMonetaryCurrency	pen
46	8	67cd81ec2cd4fe2f24cbec85	partner3ExecutiveRole	none
47	8	67cd81ec2cd4fe2f24cbec86	partner4FirstName	
48	8	67cd81ec2cd4fe2f24cbec87	partner4LastName	
49	8	67cd81ec2cd4fe2f24cbec88	partner4Nationality	peruano
50	8	67cd81ec2cd4fe2f24cbec89	partner4DocumentType	dni
51	8	67cd81ec2cd4fe2f24cbec8a	partner4DocumentNumber	
52	8	67cd81ec2cd4fe2f24cbec8b	partner4Email	
53	8	67cd81ec2cd4fe2f24cbec8c	partner4Phone	
54	8	67cd81ec2cd4fe2f24cbec8d	partner4MonetaryContribution	0
55	8	67cd81ec2cd4fe2f24cbec8e	partner4Currency	pen
56	8	67cd81ec2cd4fe2f24cbec8f	partner4NonMonetaryDescription	
57	8	67cd81ec2cd4fe2f24cbec90	partner4NonMonetaryValue	0
58	8	67cd81ec2cd4fe2f24cbec91	partner4NonMonetaryCurrency	pen
59	8	67cd81ec2cd4fe2f24cbec92	partner4ExecutiveRole	none
60	8	67cd81ec2cd4fe2f24cbec93	partner5FirstName	
61	8	67cd81ec2cd4fe2f24cbec94	partner5LastName	
62	8	67cd81ec2cd4fe2f24cbec95	partner5Nationality	peruano
63	8	67cd81ec2cd4fe2f24cbec96	partner5DocumentType	dni
64	8	67cd81ec2cd4fe2f24cbec97	partner5DocumentNumber	
65	8	67cd81ec2cd4fe2f24cbec98	partner5Email	
66	8	67cd81ec2cd4fe2f24cbec99	partner5Phone	
67	8	67cd81ec2cd4fe2f24cbec9a	partner5MonetaryContribution	0
68	8	67cd81ec2cd4fe2f24cbec9b	partner5Currency	pen
69	8	67cd81ec2cd4fe2f24cbec9c	partner5NonMonetaryDescription	
70	8	67cd81ec2cd4fe2f24cbec9d	partner5NonMonetaryValue	0
71	8	67cd81ec2cd4fe2f24cbec9e	partner5NonMonetaryCurrency	pen
72	8	67cd81ec2cd4fe2f24cbec9f	partner5ExecutiveRole	none
73	8	67cd81ec2cd4fe2f24cbeca0	ceoSelection	partner1
74	8	67cd81ec2cd4fe2f24cbeca1	newCEOFirstName	
75	8	67cd81ec2cd4fe2f24cbeca2	newCEOLastName	
76	8	67cd81ec2cd4fe2f24cbeca3	newCEONationality	peruano
77	8	67cd81ec2cd4fe2f24cbeca4	newCEODocumentType	dni
78	8	67cd81ec2cd4fe2f24cbeca5	newCEODocumentNumber	
79	8	67cd81ec2cd4fe2f24cbeca6	newCEOEmail	
80	8	67cd81ec2cd4fe2f24cbeca7	newCEOPhone	
81	8	67cd81ec2cd4fe2f24cbeca8	firstName	Rodrigo
82	8	67cd81ec2cd4fe2f24cbeca9	lastName	Vásquez de Velasco
83	8	67cd81ec2cd4fe2f24cbecaa	documentType	dni
84	8	67cd81ec2cd4fe2f24cbecab	documentNumber	70669690
85	8	67cd81ec2cd4fe2f24cbecac	email	rodrigovdev01@gmail.com
86	8	67cd81ec2cd4fe2f24cbecad	countryCode	+51
87	8	67cd81ec2cd4fe2f24cbecae	phone	949833976
1	9	67cd8339dd414b0003c4575d	residenceType	peru
2	9	67cd8339dd414b0003c4575e	companyType	sac
3	9	67cd8339dd414b0003c4575f	corporatePurpose	dgsfdgqdf
4	9	67cd8339dd414b0003c45760	suggestedName1	scvs
5	9	67cd8339dd414b0003c45761	suggestedName2	sv
6	9	67cd8339dd414b0003c45762	suggestedName3	sfb
7	9	67cd8339dd414b0003c45763	numberOfPartners	2
8	9	67cd8339dd414b0003c45764	partner1FirstName	Rodrigo
9	9	67cd8339dd414b0003c45765	partner1LastName	Vásquez de Velasco
10	9	67cd8339dd414b0003c45766	partner1Nationality	peruano
11	9	67cd8339dd414b0003c45767	partner1DocumentType	dni
12	9	67cd8339dd414b0003c45768	partner1DocumentNumber	70669690
13	9	67cd8339dd414b0003c45769	partner1Email	rodrigovdev01@gmail.com
14	9	67cd8339dd414b0003c4576a	partner1Phone	949833976
15	9	67cd8339dd414b0003c4576b	partner1MonetaryContribution	6000
16	9	67cd8339dd414b0003c4576c	partner1Currency	pen
17	9	67cd8339dd414b0003c4576d	partner1NonMonetaryDescription	
18	9	67cd8339dd414b0003c4576e	partner1NonMonetaryValue	0
19	9	67cd8339dd414b0003c4576f	partner1NonMonetaryCurrency	pen
20	9	67cd8339dd414b0003c45770	partner1ExecutiveRole	ceo
21	9	67cd8339dd414b0003c45771	partner2FirstName	Alberto
22	9	67cd8339dd414b0003c45772	partner2LastName	Saco
23	9	67cd8339dd414b0003c45773	partner2Nationality	peruano
24	9	67cd8339dd414b0003c45774	partner2DocumentType	dni
25	9	67cd8339dd414b0003c45775	partner2DocumentNumber	70669690
26	9	67cd8339dd414b0003c45776	partner2Email	betosaco@gmail.com
27	9	67cd8339dd414b0003c45777	partner2Phone	949755231
28	9	67cd8339dd414b0003c45778	partner2MonetaryContribution	5000
29	9	67cd8339dd414b0003c45779	partner2Currency	pen
30	9	67cd8339dd414b0003c4577a	partner2NonMonetaryDescription	
31	9	67cd8339dd414b0003c4577b	partner2NonMonetaryValue	0
32	9	67cd8339dd414b0003c4577c	partner2NonMonetaryCurrency	pen
33	9	67cd8339dd414b0003c4577d	partner2ExecutiveRole	cfo
34	9	67cd8339dd414b0003c4577e	partner3FirstName	
35	9	67cd8339dd414b0003c4577f	partner3LastName	
36	9	67cd8339dd414b0003c45780	partner3Nationality	peruano
37	9	67cd8339dd414b0003c45781	partner3DocumentType	dni
38	9	67cd8339dd414b0003c45782	partner3DocumentNumber	
39	9	67cd8339dd414b0003c45783	partner3Email	
40	9	67cd8339dd414b0003c45784	partner3Phone	
41	9	67cd8339dd414b0003c45785	partner3MonetaryContribution	0
42	9	67cd8339dd414b0003c45786	partner3Currency	pen
43	9	67cd8339dd414b0003c45787	partner3NonMonetaryDescription	
44	9	67cd8339dd414b0003c45788	partner3NonMonetaryValue	0
45	9	67cd8339dd414b0003c45789	partner3NonMonetaryCurrency	pen
46	9	67cd8339dd414b0003c4578a	partner3ExecutiveRole	none
47	9	67cd8339dd414b0003c4578b	partner4FirstName	
48	9	67cd8339dd414b0003c4578c	partner4LastName	
49	9	67cd8339dd414b0003c4578d	partner4Nationality	peruano
50	9	67cd8339dd414b0003c4578e	partner4DocumentType	dni
51	9	67cd8339dd414b0003c4578f	partner4DocumentNumber	
52	9	67cd8339dd414b0003c45790	partner4Email	
53	9	67cd8339dd414b0003c45791	partner4Phone	
54	9	67cd8339dd414b0003c45792	partner4MonetaryContribution	0
55	9	67cd8339dd414b0003c45793	partner4Currency	pen
56	9	67cd8339dd414b0003c45794	partner4NonMonetaryDescription	
57	9	67cd8339dd414b0003c45795	partner4NonMonetaryValue	0
58	9	67cd8339dd414b0003c45796	partner4NonMonetaryCurrency	pen
59	9	67cd8339dd414b0003c45797	partner4ExecutiveRole	none
60	9	67cd8339dd414b0003c45798	partner5FirstName	
61	9	67cd8339dd414b0003c45799	partner5LastName	
62	9	67cd8339dd414b0003c4579a	partner5Nationality	peruano
63	9	67cd8339dd414b0003c4579b	partner5DocumentType	dni
64	9	67cd8339dd414b0003c4579c	partner5DocumentNumber	
65	9	67cd8339dd414b0003c4579d	partner5Email	
66	9	67cd8339dd414b0003c4579e	partner5Phone	
67	9	67cd8339dd414b0003c4579f	partner5MonetaryContribution	0
68	9	67cd8339dd414b0003c457a0	partner5Currency	pen
69	9	67cd8339dd414b0003c457a1	partner5NonMonetaryDescription	
70	9	67cd8339dd414b0003c457a2	partner5NonMonetaryValue	0
71	9	67cd8339dd414b0003c457a3	partner5NonMonetaryCurrency	pen
72	9	67cd8339dd414b0003c457a4	partner5ExecutiveRole	none
73	9	67cd8339dd414b0003c457a5	ceoSelection	partner1
74	9	67cd8339dd414b0003c457a6	newCEOFirstName	
75	9	67cd8339dd414b0003c457a7	newCEOLastName	
76	9	67cd8339dd414b0003c457a8	newCEONationality	peruano
77	9	67cd8339dd414b0003c457a9	newCEODocumentType	dni
78	9	67cd8339dd414b0003c457aa	newCEODocumentNumber	
79	9	67cd8339dd414b0003c457ab	newCEOEmail	
80	9	67cd8339dd414b0003c457ac	newCEOPhone	
81	9	67cd8339dd414b0003c457ad	firstName	Rodrigo
82	9	67cd8339dd414b0003c457ae	lastName	Vásquez de Velasco
83	9	67cd8339dd414b0003c457af	documentType	dni
84	9	67cd8339dd414b0003c457b0	documentNumber	70669690
85	9	67cd8339dd414b0003c457b1	email	rodrigovdev01@gmail.com
86	9	67cd8339dd414b0003c457b2	countryCode	+51
87	9	67cd8339dd414b0003c457b3	phone	949833976
35	11	67cf15dae9ff490003127954	partner3LastName	
36	11	67cf15dae9ff490003127955	partner3Nationality	peruano
37	11	67cf15dae9ff490003127956	partner3DocumentType	dni
38	11	67cf15dae9ff490003127957	partner3DocumentNumber	
39	11	67cf15dae9ff490003127958	partner3Email	
40	11	67cf15dae9ff490003127959	partner3Phone	
41	11	67cf15dae9ff49000312795a	partner3MonetaryContribution	0
42	11	67cf15dae9ff49000312795b	partner3Currency	pen
43	11	67cf15dae9ff49000312795c	partner3NonMonetaryDescription	
44	11	67cf15dae9ff49000312795d	partner3NonMonetaryValue	0
45	11	67cf15dae9ff49000312795e	partner3NonMonetaryCurrency	pen
46	11	67cf15dae9ff49000312795f	partner3ExecutiveRole	none
47	11	67cf15dae9ff490003127960	partner4FirstName	
48	11	67cf15dae9ff490003127961	partner4LastName	
49	11	67cf15dae9ff490003127962	partner4Nationality	peruano
50	11	67cf15dae9ff490003127963	partner4DocumentType	dni
51	11	67cf15dae9ff490003127964	partner4DocumentNumber	
52	11	67cf15dae9ff490003127965	partner4Email	
53	11	67cf15dae9ff490003127966	partner4Phone	
54	11	67cf15dae9ff490003127967	partner4MonetaryContribution	0
55	11	67cf15dae9ff490003127968	partner4Currency	pen
56	11	67cf15dae9ff490003127969	partner4NonMonetaryDescription	
57	11	67cf15dae9ff49000312796a	partner4NonMonetaryValue	0
58	11	67cf15dae9ff49000312796b	partner4NonMonetaryCurrency	pen
59	11	67cf15dae9ff49000312796c	partner4ExecutiveRole	none
60	11	67cf15dae9ff49000312796d	partner5FirstName	
61	11	67cf15dae9ff49000312796e	partner5LastName	
62	11	67cf15dae9ff49000312796f	partner5Nationality	peruano
63	11	67cf15dae9ff490003127970	partner5DocumentType	dni
64	11	67cf15dae9ff490003127971	partner5DocumentNumber	
65	11	67cf15dae9ff490003127972	partner5Email	
66	11	67cf15dae9ff490003127973	partner5Phone	
67	11	67cf15dae9ff490003127974	partner5MonetaryContribution	0
68	11	67cf15dae9ff490003127975	partner5Currency	pen
69	11	67cf15dae9ff490003127976	partner5NonMonetaryDescription	
70	11	67cf15dae9ff490003127977	partner5NonMonetaryValue	0
71	11	67cf15dae9ff490003127978	partner5NonMonetaryCurrency	pen
72	11	67cf15dae9ff490003127979	partner5ExecutiveRole	none
73	11	67cf15dae9ff49000312797a	ceoSelection	partner1
74	11	67cf15dae9ff49000312797b	newCEOFirstName	
75	11	67cf15dae9ff49000312797c	newCEOLastName	
76	11	67cf15dae9ff49000312797d	newCEONationality	peruano
77	11	67cf15dae9ff49000312797e	newCEODocumentType	dni
78	11	67cf15dae9ff49000312797f	newCEODocumentNumber	
79	11	67cf15dae9ff490003127980	newCEOEmail	
80	11	67cf15dae9ff490003127981	newCEOPhone	
81	11	67cf15dae9ff490003127982	firstName	Rodrigo
82	11	67cf15dae9ff490003127983	lastName	Vásquez de Velasco
83	11	67cf15dae9ff490003127984	documentType	dni
84	11	67cf15dae9ff490003127985	documentNumber	70669690
85	11	67cf15dae9ff490003127986	email	rodrigovdev01@gmail.com
86	11	67cf15dae9ff490003127987	countryCode	+51
87	11	67cf15dae9ff490003127988	phone	949833976
\.


--
-- Data for Name: forms; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.forms (id, title, submit_button_label, confirmation_type, confirmation_message, redirect_url, updated_at, created_at) FROM stdin;
1	Contact Form	Submit	message	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The contact form has been submitted successfully.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	2025-03-09 08:18:11.12+00	2023-01-12 21:47:41.374+00
10	Formulario de Registro de Empresa	Enviar	message	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Su solicitud de registro de empresa ha sido enviada exitosamente.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	2025-03-09 11:21:29.605+00	2023-01-12 21:47:41.374+00
\.


--
-- Data for Name: forms_blocks_checkbox; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.forms_blocks_checkbox (_order, _parent_id, _path, id, name, label, width, required, default_value, block_name) FROM stdin;
\.


--
-- Data for Name: forms_blocks_country; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.forms_blocks_country (_order, _parent_id, _path, id, name, label, width, required, block_name) FROM stdin;
\.


--
-- Data for Name: forms_blocks_email; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.forms_blocks_email (_order, _parent_id, _path, id, name, label, width, required, block_name) FROM stdin;
2	1	fields	67cd4ec3073bbe0ba0229530	email	Email	100	t	email
6	10	fields	67cd79b9e165d47974f6c879	email	Correo Electrónico	100	t	email
20	10	fields	67cd79b9e165d47974f6c895	partner1Email	Socio 1: Correo Electrónico	50	t	partner1Email
27	10	fields	67cd79b9e165d47974f6c8a1	partner2Email	Socio 2: Correo Electrónico	50	t	partner2Email
34	10	fields	67cd79b9e165d47974f6c8ad	partner3Email	Socio 3: Correo Electrónico	50	f	partner3Email
41	10	fields	67cd79b9e165d47974f6c8b9	partner4Email	Socio 4: Correo Electrónico	50	f	partner4Email
48	10	fields	67cd79b9e165d47974f6c8c5	partner5Email	Socio 5: Correo Electrónico	50	f	partner5Email
56	10	fields	67cd79b9e165d47974f6c8d1	newCEOEmail	Nuevo CEO: Correo Electrónico	50	f	newCEOEmail
\.


--
-- Data for Name: forms_blocks_message; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.forms_blocks_message (_order, _parent_id, _path, id, message, block_name) FROM stdin;
\.


--
-- Data for Name: forms_blocks_number; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.forms_blocks_number (_order, _parent_id, _path, id, name, label, width, default_value, required, block_name) FROM stdin;
3	1	fields	67cd4ec3073bbe0ba0229531	phone	Phone	100	\N	f	phone
58	10	fields	67cd79b9e165d47974f6c8d3	partner1MonetaryContribution	Socio 1: Contribución Monetaria	50	\N	t	partner1MonetaryContribution
61	10	fields	67cd79b9e165d47974f6c8d8	partner1NonMonetaryValue	Socio 1: Valor de Contribución No Monetaria	25	\N	f	partner1NonMonetaryValue
63	10	fields	67cd79b9e165d47974f6c8dc	partner2MonetaryContribution	Socio 2: Contribución Monetaria	50	\N	t	partner2MonetaryContribution
66	10	fields	67cd79b9e165d47974f6c8e1	partner2NonMonetaryValue	Socio 2: Valor de Contribución No Monetaria	25	\N	f	partner2NonMonetaryValue
\.


--
-- Data for Name: forms_blocks_payment; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.forms_blocks_payment (_order, _parent_id, _path, id, name, label, width, base_price, required, block_name) FROM stdin;
\.


--
-- Data for Name: forms_blocks_payment_price_conditions; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.forms_blocks_payment_price_conditions (_order, _parent_id, id, field_to_use, condition, value_for_condition, operator, value_type, value_for_operator) FROM stdin;
\.


--
-- Data for Name: forms_blocks_select; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.forms_blocks_select (_order, _parent_id, _path, id, name, label, width, default_value, required, block_name) FROM stdin;
1	10	fields	67cd79b9e165d47974f6c871	residenceType	Residencia	100	\N	t	residenceType
4	10	fields	67cd79b9e165d47974f6c877	documentType	Tipo de Documento	50	\N	t	documentType
7	10	fields	67cd79b9e165d47974f6c87d	countryCode	Código de País	30	\N	t	countryCode
9	10	fields	67cd79b9e165d47974f6c881	companyType	Tipo de Empresa	100	\N	t	companyType
14	10	fields	67cd79b9e165d47974f6c88a	numberOfPartners	Número de Socios	100	\N	t	numberOfPartners
17	10	fields	67cd79b9e165d47974f6c88f	partner1Nationality	Socio 1: Nacionalidad	100	\N	t	partner1Nationality
18	10	fields	67cd79b9e165d47974f6c893	partner1DocumentType	Socio 1: Tipo de Documento	50	\N	t	partner1DocumentType
24	10	fields	67cd79b9e165d47974f6c89b	partner2Nationality	Socio 2: Nacionalidad	100	\N	t	partner2Nationality
25	10	fields	67cd79b9e165d47974f6c89f	partner2DocumentType	Socio 2: Tipo de Documento	50	\N	t	partner2DocumentType
31	10	fields	67cd79b9e165d47974f6c8a7	partner3Nationality	Socio 3: Nacionalidad	100	\N	f	partner3Nationality
32	10	fields	67cd79b9e165d47974f6c8ab	partner3DocumentType	Socio 3: Tipo de Documento	50	\N	f	partner3DocumentType
38	10	fields	67cd79b9e165d47974f6c8b3	partner4Nationality	Socio 4: Nacionalidad	100	\N	f	partner4Nationality
39	10	fields	67cd79b9e165d47974f6c8b7	partner4DocumentType	Socio 4: Tipo de Documento	50	\N	f	partner4DocumentType
45	10	fields	67cd79b9e165d47974f6c8bf	partner5Nationality	Socio 5: Nacionalidad	100	\N	f	partner5Nationality
46	10	fields	67cd79b9e165d47974f6c8c3	partner5DocumentType	Socio 5: Tipo de Documento	50	\N	f	partner5DocumentType
53	10	fields	67cd79b9e165d47974f6c8cb	newCEONationality	Nuevo CEO: Nacionalidad	100	\N	f	newCEONationality
54	10	fields	67cd79b9e165d47974f6c8cf	newCEODocumentType	Nuevo CEO: Tipo de Documento	50	\N	f	newCEODocumentType
59	10	fields	67cd79b9e165d47974f6c8d6	partner1Currency	Socio 1: Moneda	50	\N	t	partner1Currency
62	10	fields	67cd79b9e165d47974f6c8db	partner1NonMonetaryCurrency	Socio 1: Moneda de Contribución No Monetaria	25	\N	f	partner1NonMonetaryCurrency
64	10	fields	67cd79b9e165d47974f6c8df	partner2Currency	Socio 2: Moneda	50	\N	t	partner2Currency
67	10	fields	67cd79b9e165d47974f6c8e4	partner2NonMonetaryCurrency	Socio 2: Moneda de Contribución No Monetaria	25	\N	f	partner2NonMonetaryCurrency
\.


--
-- Data for Name: forms_blocks_select_options; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.forms_blocks_select_options (_order, _parent_id, id, label, value) FROM stdin;
1	67cd79b9e165d47974f6c871	67cd79b9e165d47974f6c86f	Perú	peru
2	67cd79b9e165d47974f6c871	67cd79b9e165d47974f6c870	Extranjero	extranjero
1	67cd79b9e165d47974f6c877	67cd79b9e165d47974f6c874	DNI	dni
2	67cd79b9e165d47974f6c877	67cd79b9e165d47974f6c875	Carnet de Extranjería	carnet
3	67cd79b9e165d47974f6c877	67cd79b9e165d47974f6c876	Pasaporte	pasaporte
1	67cd79b9e165d47974f6c87d	67cd79b9e165d47974f6c87a	Perú (+51)	+51
2	67cd79b9e165d47974f6c87d	67cd79b9e165d47974f6c87b	España (+34)	+34
3	67cd79b9e165d47974f6c87d	67cd79b9e165d47974f6c87c	Estados Unidos (+1)	+1
1	67cd79b9e165d47974f6c881	67cd79b9e165d47974f6c87f	SAC - Sociedad Anónima Cerrada	sac
2	67cd79b9e165d47974f6c881	67cd79b9e165d47974f6c880	SA - Sociedad Anónima	sa
1	67cd79b9e165d47974f6c88a	67cd79b9e165d47974f6c886	2 socios	2
2	67cd79b9e165d47974f6c88a	67cd79b9e165d47974f6c887	3 socios	3
3	67cd79b9e165d47974f6c88a	67cd79b9e165d47974f6c888	4 socios	4
4	67cd79b9e165d47974f6c88a	67cd79b9e165d47974f6c889	5 socios	5
1	67cd79b9e165d47974f6c88f	67cd79b9e165d47974f6c88d	Peruano	peruano
2	67cd79b9e165d47974f6c88f	67cd79b9e165d47974f6c88e	Extranjero	extranjero
1	67cd79b9e165d47974f6c893	67cd79b9e165d47974f6c890	DNI	dni
2	67cd79b9e165d47974f6c893	67cd79b9e165d47974f6c891	Carnet de Extranjería	carnet
3	67cd79b9e165d47974f6c893	67cd79b9e165d47974f6c892	Pasaporte	pasaporte
1	67cd79b9e165d47974f6c89b	67cd79b9e165d47974f6c899	Peruano	peruano
2	67cd79b9e165d47974f6c89b	67cd79b9e165d47974f6c89a	Extranjero	extranjero
1	67cd79b9e165d47974f6c89f	67cd79b9e165d47974f6c89c	DNI	dni
2	67cd79b9e165d47974f6c89f	67cd79b9e165d47974f6c89d	Carnet de Extranjería	carnet
3	67cd79b9e165d47974f6c89f	67cd79b9e165d47974f6c89e	Pasaporte	pasaporte
1	67cd79b9e165d47974f6c8a7	67cd79b9e165d47974f6c8a5	Peruano	peruano
2	67cd79b9e165d47974f6c8a7	67cd79b9e165d47974f6c8a6	Extranjero	extranjero
1	67cd79b9e165d47974f6c8ab	67cd79b9e165d47974f6c8a8	DNI	dni
2	67cd79b9e165d47974f6c8ab	67cd79b9e165d47974f6c8a9	Carnet de Extranjería	carnet
3	67cd79b9e165d47974f6c8ab	67cd79b9e165d47974f6c8aa	Pasaporte	pasaporte
1	67cd79b9e165d47974f6c8b3	67cd79b9e165d47974f6c8b1	Peruano	peruano
2	67cd79b9e165d47974f6c8b3	67cd79b9e165d47974f6c8b2	Extranjero	extranjero
1	67cd79b9e165d47974f6c8b7	67cd79b9e165d47974f6c8b4	DNI	dni
2	67cd79b9e165d47974f6c8b7	67cd79b9e165d47974f6c8b5	Carnet de Extranjería	carnet
3	67cd79b9e165d47974f6c8b7	67cd79b9e165d47974f6c8b6	Pasaporte	pasaporte
1	67cd79b9e165d47974f6c8bf	67cd79b9e165d47974f6c8bd	Peruano	peruano
2	67cd79b9e165d47974f6c8bf	67cd79b9e165d47974f6c8be	Extranjero	extranjero
1	67cd79b9e165d47974f6c8c3	67cd79b9e165d47974f6c8c0	DNI	dni
2	67cd79b9e165d47974f6c8c3	67cd79b9e165d47974f6c8c1	Carnet de Extranjería	carnet
3	67cd79b9e165d47974f6c8c3	67cd79b9e165d47974f6c8c2	Pasaporte	pasaporte
1	67cd79b9e165d47974f6c8cb	67cd79b9e165d47974f6c8c9	Peruano	peruano
2	67cd79b9e165d47974f6c8cb	67cd79b9e165d47974f6c8ca	Extranjero	extranjero
1	67cd79b9e165d47974f6c8cf	67cd79b9e165d47974f6c8cc	DNI	dni
2	67cd79b9e165d47974f6c8cf	67cd79b9e165d47974f6c8cd	Carnet de Extranjería	carnet
3	67cd79b9e165d47974f6c8cf	67cd79b9e165d47974f6c8ce	Pasaporte	pasaporte
1	67cd79b9e165d47974f6c8d6	67cd79b9e165d47974f6c8d4	Soles (PEN)	pen
2	67cd79b9e165d47974f6c8d6	67cd79b9e165d47974f6c8d5	Dólares (USD)	usd
1	67cd79b9e165d47974f6c8db	67cd79b9e165d47974f6c8d9	Soles (PEN)	pen
2	67cd79b9e165d47974f6c8db	67cd79b9e165d47974f6c8da	Dólares (USD)	usd
1	67cd79b9e165d47974f6c8df	67cd79b9e165d47974f6c8dd	Soles (PEN)	pen
2	67cd79b9e165d47974f6c8df	67cd79b9e165d47974f6c8de	Dólares (USD)	usd
1	67cd79b9e165d47974f6c8e4	67cd79b9e165d47974f6c8e2	Soles (PEN)	pen
2	67cd79b9e165d47974f6c8e4	67cd79b9e165d47974f6c8e3	Dólares (USD)	usd
\.


--
-- Data for Name: forms_blocks_state; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.forms_blocks_state (_order, _parent_id, _path, id, name, label, width, required, block_name) FROM stdin;
\.


--
-- Data for Name: forms_blocks_text; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.forms_blocks_text (_order, _parent_id, _path, id, name, label, width, default_value, required, block_name) FROM stdin;
1	1	fields	67cd4ec3073bbe0ba022952f	full-name	Full Name	100	\N	t	full-name
2	10	fields	67cd79b9e165d47974f6c872	firstName	Nombre	50	\N	t	firstName
3	10	fields	67cd79b9e165d47974f6c873	lastName	Apellidos	50	\N	t	lastName
5	10	fields	67cd79b9e165d47974f6c878	documentNumber	Número de Documento	50	\N	t	documentNumber
8	10	fields	67cd79b9e165d47974f6c87e	phone	Teléfono	70	\N	t	phone
11	10	fields	67cd79b9e165d47974f6c883	suggestedName1	Sugerencia de Nombre 1	100	\N	t	suggestedName1
12	10	fields	67cd79b9e165d47974f6c884	suggestedName2	Sugerencia de Nombre 2	100	\N	f	suggestedName2
13	10	fields	67cd79b9e165d47974f6c885	suggestedName3	Sugerencia de Nombre 3	100	\N	f	suggestedName3
15	10	fields	67cd79b9e165d47974f6c88b	partner1FirstName	Socio 1: Nombre	50	\N	t	partner1FirstName
16	10	fields	67cd79b9e165d47974f6c88c	partner1LastName	Socio 1: Apellidos	50	\N	t	partner1LastName
19	10	fields	67cd79b9e165d47974f6c894	partner1DocumentNumber	Socio 1: Número de Documento	50	\N	t	partner1DocumentNumber
21	10	fields	67cd79b9e165d47974f6c896	partner1Phone	Socio 1: Teléfono	50	\N	t	partner1Phone
22	10	fields	67cd79b9e165d47974f6c897	partner2FirstName	Socio 2: Nombre	50	\N	t	partner2FirstName
23	10	fields	67cd79b9e165d47974f6c898	partner2LastName	Socio 2: Apellidos	50	\N	t	partner2LastName
26	10	fields	67cd79b9e165d47974f6c8a0	partner2DocumentNumber	Socio 2: Número de Documento	50	\N	t	partner2DocumentNumber
28	10	fields	67cd79b9e165d47974f6c8a2	partner2Phone	Socio 2: Teléfono	50	\N	t	partner2Phone
29	10	fields	67cd79b9e165d47974f6c8a3	partner3FirstName	Socio 3: Nombre	50	\N	f	partner3FirstName
30	10	fields	67cd79b9e165d47974f6c8a4	partner3LastName	Socio 3: Apellidos	50	\N	f	partner3LastName
33	10	fields	67cd79b9e165d47974f6c8ac	partner3DocumentNumber	Socio 3: Número de Documento	50	\N	f	partner3DocumentNumber
35	10	fields	67cd79b9e165d47974f6c8ae	partner3Phone	Socio 3: Teléfono	50	\N	f	partner3Phone
36	10	fields	67cd79b9e165d47974f6c8af	partner4FirstName	Socio 4: Nombre	50	\N	f	partner4FirstName
37	10	fields	67cd79b9e165d47974f6c8b0	partner4LastName	Socio 4: Apellidos	50	\N	f	partner4LastName
40	10	fields	67cd79b9e165d47974f6c8b8	partner4DocumentNumber	Socio 4: Número de Documento	50	\N	f	partner4DocumentNumber
42	10	fields	67cd79b9e165d47974f6c8ba	partner4Phone	Socio 4: Teléfono	50	\N	f	partner4Phone
43	10	fields	67cd79b9e165d47974f6c8bb	partner5FirstName	Socio 5: Nombre	50	\N	f	partner5FirstName
44	10	fields	67cd79b9e165d47974f6c8bc	partner5LastName	Socio 5: Apellidos	50	\N	f	partner5LastName
47	10	fields	67cd79b9e165d47974f6c8c4	partner5DocumentNumber	Socio 5: Número de Documento	50	\N	f	partner5DocumentNumber
49	10	fields	67cd79b9e165d47974f6c8c6	partner5Phone	Socio 5: Teléfono	50	\N	f	partner5Phone
51	10	fields	67cd79b9e165d47974f6c8c7	newCEOFirstName	Nuevo CEO: Nombre	50	\N	f	newCEOFirstName
52	10	fields	67cd79b9e165d47974f6c8c8	newCEOLastName	Nuevo CEO: Apellidos	50	\N	f	newCEOLastName
55	10	fields	67cd79b9e165d47974f6c8d0	newCEODocumentNumber	Nuevo CEO: Número de Documento	50	\N	f	newCEODocumentNumber
57	10	fields	67cd79b9e165d47974f6c8d2	newCEOPhone	Nuevo CEO: Teléfono	50	\N	f	newCEOPhone
60	10	fields	67cd79b9e165d47974f6c8d7	partner1NonMonetaryDescription	Socio 1: Descripción de Contribución No Monetaria	50	\N	f	partner1NonMonetaryDescription
65	10	fields	67cd79b9e165d47974f6c8e0	partner2NonMonetaryDescription	Socio 2: Descripción de Contribución No Monetaria	50	\N	f	partner2NonMonetaryDescription
\.


--
-- Data for Name: forms_blocks_textarea; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.forms_blocks_textarea (_order, _parent_id, _path, id, name, label, width, default_value, required, block_name) FROM stdin;
4	1	fields	67cd4ec3073bbe0ba0229532	message	Message	100	\N	t	message
10	10	fields	67cd79b9e165d47974f6c882	corporatePurpose	Propósito Corporativo	100	\N	t	corporatePurpose
\.


--
-- Data for Name: forms_emails; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.forms_emails (_order, _parent_id, id, email_to, cc, bcc, reply_to, email_from, subject, message) FROM stdin;
1	1	67cd4ec3073bbe0ba0229533	{{email}}	\N	\N	\N	"Payload" <demo@payloadcms.com>	You've received a new message.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Your contact form submission was successfully received.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}
1	10	67cd79b9e165d47974f6c8e5	{{email}}	\N	\N	\N	"Nuolat" <info@nuolat.com>	Solicitud de Registro de Empresa Recibida	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Hemos recibido su solicitud de registro de empresa. Un representante se pondrá en contacto con usted pronto.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}
\.


--
-- Data for Name: header; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.header (id, updated_at, created_at) FROM stdin;
1	2025-03-10 16:08:54.518+00	2025-03-09 08:17:13.079+00
\.


--
-- Data for Name: header_nav_items; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.header_nav_items (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label) FROM stdin;
1	1	67cd55b29d34cf53bcb98d23	reference	t	\N	Registra tu Empresa
2	1	67cd555d9d34cf53bcb98d1f	reference	\N	\N	Nosotros
3	1	67cd4eca073bbe0ba0229543	reference	\N	\N	Contacto
4	1	67cd4eca073bbe0ba0229542	custom	\N	/posts	Artículos
\.


--
-- Data for Name: header_rels; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.header_rels (id, "order", parent_id, path, pages_id, posts_id) FROM stdin;
34	\N	1	navItems.0.link.reference	11	\N
35	\N	1	navItems.1.link.reference	4	\N
36	\N	1	navItems.2.link.reference	1	\N
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.media (id, alt, caption, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) FROM stdin;
5	Curving abstract shapes with an orange and blue gradient	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Photo by ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://unsplash.com/@kirp", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "Andrew Kliatskyi", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " on Unsplash.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	2025-03-09 08:17:41.504+00	2025-03-09 08:17:42.52+00	\N	\N	image-post1.webp	image/webp	15924	1920	1080	50	50	\N	300	169	image/webp	1506	image-post1-300x169.webp	\N	500	500	image/webp	3718	image-post1-500x500.webp	\N	600	338	image/webp	3506	image-post1-600x338.webp	\N	900	506	image/webp	5718	image-post1-900x506.webp	\N	1400	788	image/webp	9810	image-post1-1400x788.webp	\N	1920	1080	image/webp	15924	image-post1-1920x1080.webp	\N	1200	630	image/webp	7798	image-post1-1200x630.webp
6	Curving abstract shapes with an orange and blue gradient	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Photo by ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://unsplash.com/@kirp", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "Andrew Kliatskyi", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " on Unsplash.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	2025-03-09 08:17:41.582+00	2025-03-09 08:17:42.575+00	\N	\N	image-post3.webp	image/webp	14662	1920	1080	50	50	\N	300	169	image/webp	1234	image-post3-300x169.webp	\N	500	500	image/webp	2668	image-post3-500x500.webp	\N	600	338	image/webp	3012	image-post3-600x338.webp	\N	900	506	image/webp	4988	image-post3-900x506.webp	\N	1400	788	image/webp	8998	image-post3-1400x788.webp	\N	1920	1080	image/webp	14662	image-post3-1920x1080.webp	\N	1200	630	image/webp	6820	image-post3-1200x630.webp
7	Curving abstract shapes with an orange and blue gradient	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Photo by ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://unsplash.com/@kirp", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "Andrew Kliatskyi", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": " on Unsplash.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}	2025-03-09 08:17:41.983+00	2025-03-09 08:17:42.884+00	\N	\N	image-post2.webp	image/webp	22332	1920	1080	50	50	\N	300	169	image/webp	2168	image-post2-300x169.webp	\N	500	500	image/webp	4816	image-post2-500x500.webp	\N	600	338	image/webp	4932	image-post2-600x338.webp	\N	900	506	image/webp	7826	image-post2-900x506.webp	\N	1400	788	image/webp	13594	image-post2-1400x788.webp	\N	1920	1080	image/webp	22332	image-post2-1920x1080.webp	\N	1200	630	image/webp	10686	image-post2-1200x630.webp
8	Straight metallic shapes with a blue gradient	\N	2025-03-09 08:17:42.147+00	2025-03-09 08:17:43.07+00	\N	\N	image-hero1.webp	image/webp	49432	3200	1800	50	50	\N	300	169	image/webp	2532	image-hero1-300x169.webp	\N	500	500	image/webp	4716	image-hero1-500x500.webp	\N	600	338	image/webp	5712	image-hero1-600x338.webp	\N	900	506	image/webp	9382	image-hero1-900x506.webp	\N	1400	788	image/webp	16214	image-hero1-1400x788.webp	\N	1920	1080	image/webp	24174	image-hero1-1920x1080.webp	\N	1200	630	image/webp	12690	image-hero1-1200x630.webp
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.pages (id, title, hero_type, hero_rich_text, hero_media_id, hero_show_form, hero_form_id, hero_form_background_color, meta_title, meta_image_id, meta_description, published_at, slug, slug_lock, updated_at, created_at, _status) FROM stdin;
4	About Us	mediumImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Softlandero Evoluciona, el futuro es ahora.", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Somos NUO", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Hacemos que el crecimiento de tu empresa en nuevos mercados sea ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "ágil", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "estratégico ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "y ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "sin fricciones", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Porque ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "expandirse ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "no debería ser complicado, sino una ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "oportunidad ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "para escalar con", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": " inteligencia", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " y ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "sin límites", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	\N	\N	transparent	\N	\N	\N	2025-03-09 08:46:13.591+00	about-us	t	2025-03-10 16:10:33.88+00	2025-03-09 08:45:55.775+00	published
1	Contact	highImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Estamos aquí para ayudarte!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Si tienes alguna pregunta o necesitas más información, no dudes en contactarnos. Puedes escribirnos a:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"id": "67cd51c3ece25ca3df7a6475", "type": "link", "fields": {"url": "mailto:hola@nuo.lat", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "hola@nuo.lat", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "+51925573697", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "DISHUB - Calle Alcanfores 425, Miraflores, 15048, Lima, Perú.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "O bien, completa el formulario y uno de nuestros asesores se pondrá en contacto contigo.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	t	1	transparent	Contact NUO LAT	\N	\N	2025-03-09 08:22:18.525+00	contact	t	2025-03-10 16:10:48.926+00	2025-03-09 08:17:59.614+00	published
2	Home	highImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Expande tu negocio en Latinoamérica sin complicaciones!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Nos encargamos de todo: desde la apertura de tu cuenta bancaria hasta la contabilidad, para que conquistes nuevos mercados sin preocupaciones.", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	8	\N	\N	transparent	NUO LAT	8	An open-source website built with Payload and Next.js.	2025-03-09 08:33:52.454+00	home	t	2025-03-10 16:10:09.604+00	2025-03-09 08:18:13.954+00	published
11	Registro de Empresa	lowImpact	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Comienza tu Registro de Empresa", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Completa el formulario paso a paso para iniciar el proceso de registro de tu empresa en Perú de manera sencilla y guiada.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	8	\N	\N	transparent	Registro de Empresa - Nuolat	\N	Proceso de registro de empresa en Perú con Nuolat	2025-03-10 16:08:43.989+00	registro-de-empresa	t	2025-03-10 16:51:50.603+00	2025-03-09 11:21:33.279+00	published
\.


--
-- Data for Name: pages_blocks_archive; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.pages_blocks_archive (_order, _parent_id, _path, id, intro_content, populate_by, relation_to, "limit", block_name) FROM stdin;
\.


--
-- Data for Name: pages_blocks_content; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.pages_blocks_content (_order, _parent_id, _path, id, block_name) FROM stdin;
1	2	layout	67cd4ec5073bbe0ba022953c	Content Block
1	4	layout	67cd5808066bc40058165b0a	Slogan
2	4	layout	67cd5837066bc40058165b11	¿Qué hay de Nuevo?
\.


--
-- Data for Name: pages_blocks_content_columns; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.pages_blocks_content_columns (_order, _parent_id, id, size, rich_text, enable_link, link_type, link_new_tab, link_url, link_label, link_appearance) FROM stdin;
1	67cd4ec5073bbe0ba022953c	67cd4ec5073bbe0ba0229536	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Servicios que Impulsan tu Expansión", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default
2	67cd4ec5073bbe0ba022953c	67cd4ec5073bbe0ba0229537	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Constitución de Empresas", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Registro Rápido y Eficiente en México, Colombia y Perú. Para que inicies operaciones sin retrasos.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default
3	67cd4ec5073bbe0ba022953c	67cd4ec5073bbe0ba0229538	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Apertura de Cuenta Corriente Empresarial", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Te ayudamos a abrir cuentas bancarias en cada país, facilitando la gestión financiera desde el primer día.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default
4	67cd4ec5073bbe0ba022953c	67cd4ec5073bbe0ba0229539	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Representación Legal", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Ofrecemos Representación Legal en cada país, asegurando el cumplimiento logcal y protegiendo tus intereses internacionales.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default
5	67cd4ec5073bbe0ba022953c	67cd4ec5073bbe0ba022953a	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Checklists Regulatorios y Cumplimiento Legal", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Realizamos un Checklist legal para asegurar el cumplimiento en tu nuevo mercado y te asesoramos en obtener permisos y licencias necesarias para industrias reguladas.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default
6	67cd4ec5073bbe0ba022953c	67cd4ec5073bbe0ba022953b	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dashboard Administrativo", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Con herramientas avanzadas y una interfaz amigable, el Dashboard te permite mantener el control total sobre tu plataforma, facilitando la toma de decisiones estratégicas para seguir creciendo en nuevos mercados.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	f	reference	\N	\N	\N	default
1	67cd5808066bc40058165b0a	67cd580f066bc40058165b0b	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Donde StartUps y empresas crecen de manera estratégica y sin complicaciones", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default
1	67cd5837066bc40058165b11	67cd5846066bc40058165b12	full	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¿Qué hay de nuevo?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default
2	67cd5837066bc40058165b11	67cd584f066bc40058165b13	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"id": "67cd585fde3ef816dd4e1932", "type": "link", "fields": {"doc": {"value": 11, "relationTo": "pages"}, "newTab": true, "linkType": "internal"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Onboarding 100% Digital", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Expande tu negocio a mercados clave de manera simple y eficiente.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default
3	67cd5837066bc40058165b11	67cd5887066bc40058165b14	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Servicios Escenciales", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Representación legal, domicilio fiscal y acompañamiento estratégico para un crecimiento sin fricciones.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default
4	67cd5837066bc40058165b11	67cd5891066bc40058165b15	oneThird	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dashboard centralizado", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Accede a toda la información operativa en un solo lugar.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	reference	\N	\N	\N	default
\.


--
-- Data for Name: pages_blocks_cta; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.pages_blocks_cta (_order, _parent_id, _path, id, rich_text, block_name) FROM stdin;
2	2	layout	67cd4ec5073bbe0ba0229540	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Da el salto hacia la expansión internacional con NUO!", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Con nuestras soluciones integrales, llevar tu negocio a Latinoamérica es más sencillo que nunca. Desde la constitución de tu empresa hasta la gestión legal y contable en México, Colombia y Perú, nos encargamos de todo para que puedas concentrarte en crecer.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	CTA
1	1	layout	67cd5078a4557c10ecf4fc83	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "¡Da el salto hacia la expansión internacional con NUO!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Con nuestras soluciones integrales, llevar tu negocio a Latinoamérica es más sencillo que nunca. Desde la constitución de tu empresa hasta la gestión legal y contable en México, Colombia y Perú, nos encargamos de todo para que puedas concentrarte en crecer.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	Registra tu Empresa
\.


--
-- Data for Name: pages_blocks_cta_links; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.pages_blocks_cta_links (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label, link_appearance) FROM stdin;
1	67cd4ec5073bbe0ba0229540	67cd4ec5073bbe0ba022953f	reference	t	/posts	Registra tu Empresa 🚀	default
1	67cd5078a4557c10ecf4fc83	67cd50a9a4557c10ecf4fc85	reference	t	\N	Registra tu Empresa 🚀	default
\.


--
-- Data for Name: pages_blocks_form_block; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.pages_blocks_form_block (_order, _parent_id, _path, id, form_id, enable_intro, intro_content, background_color, multi_step_enabled, block_name) FROM stdin;
1	11	layout	67cd79bce165d47974f6c8fd	10	t	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Formulario de Registro de Empresa", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Complete todos los pasos del formulario para iniciar el proceso de registro de su empresa. Nuestro equipo se pondrá en contacto con usted en breve para continuar con el proceso.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	white	t	Registro de Empresa
\.


--
-- Data for Name: pages_blocks_form_block_multi_step_steps; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.pages_blocks_form_block_multi_step_steps (_order, _parent_id, id, title, is_partners_step) FROM stdin;
1	67cd79bce165d47974f6c8fd	67cd79bce165d47974f6c8e9	Selección de Residencia	f
2	67cd79bce165d47974f6c8fd	67cd79bce165d47974f6c8eb	Selección de Tipo de Empresa	f
3	67cd79bce165d47974f6c8fd	67cd79bce165d47974f6c8f0	Propósito Corporativo	f
4	67cd79bce165d47974f6c8fd	67cd79bce165d47974f6c8f2	Información de Socios y Contribuciones	t
5	67cd79bce165d47974f6c8fd	67cd79bce165d47974f6c8f4	Selección del CEO	\N
6	67cd79bce165d47974f6c8fd	67cd79bce165d47974f6c8fc	Información del Solicitante	f
\.


--
-- Data for Name: pages_blocks_form_block_multi_step_steps_fields; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.pages_blocks_form_block_multi_step_steps_fields (_order, _parent_id, id, field_name) FROM stdin;
1	67cd79bce165d47974f6c8e9	67cd79bce165d47974f6c8e8	residenceType
1	67cd79bce165d47974f6c8eb	67cd79bce165d47974f6c8ea	companyType
1	67cd79bce165d47974f6c8f0	67cd79bce165d47974f6c8ec	corporatePurpose
2	67cd79bce165d47974f6c8f0	67cd79bce165d47974f6c8ed	suggestedName1
3	67cd79bce165d47974f6c8f0	67cd79bce165d47974f6c8ee	suggestedName2
4	67cd79bce165d47974f6c8f0	67cd79bce165d47974f6c8ef	suggestedName3
1	67cd79bce165d47974f6c8f2	67cd79bce165d47974f6c8f1	numberOfPartners
1	67cd79bce165d47974f6c8f4	67cd79bce165d47974f6c8f3	ceoSelection
1	67cd79bce165d47974f6c8fc	67cd79bce165d47974f6c8f5	firstName
2	67cd79bce165d47974f6c8fc	67cd79bce165d47974f6c8f6	lastName
3	67cd79bce165d47974f6c8fc	67cd79bce165d47974f6c8f7	documentType
4	67cd79bce165d47974f6c8fc	67cd79bce165d47974f6c8f8	documentNumber
5	67cd79bce165d47974f6c8fc	67cd79bce165d47974f6c8f9	email
6	67cd79bce165d47974f6c8fc	67cd79bce165d47974f6c8fa	countryCode
7	67cd79bce165d47974f6c8fc	67cd79bce165d47974f6c8fb	phone
\.


--
-- Data for Name: pages_blocks_media_block; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.pages_blocks_media_block (_order, _parent_id, _path, id, media_id, block_name) FROM stdin;
\.


--
-- Data for Name: pages_hero_links; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.pages_hero_links (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label, link_appearance) FROM stdin;
1	2	67cd4ec5073bbe0ba0229534	reference	t	/posts	Registra tu Empresa 🚀	default
1	4	67cd57ed066bc40058165b09	reference	t	\N	Registra tu Empresa 🚀	default
1	11	67cd79bce165d47974f6c8e6	custom	\N	/	Conoce más	default
2	11	67cd79bce165d47974f6c8e7	custom	\N	/contact	Contacto	outline
\.


--
-- Data for Name: pages_rels; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.pages_rels (id, "order", parent_id, path, pages_id, posts_id, categories_id) FROM stdin;
18	\N	2	hero.links.0.link.reference	11	\N	\N
19	\N	2	layout.1.links.0.link.reference	11	\N	\N
20	\N	4	hero.links.0.link.reference	11	\N	\N
21	\N	1	layout.0.links.0.link.reference	11	\N	\N
\.


--
-- Data for Name: payload_jobs; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.payload_jobs (id, input, completed_at, total_tried, has_error, error, task_slug, queue, wait_until, processing, updated_at, created_at) FROM stdin;
\.


--
-- Data for Name: payload_jobs_log; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.payload_jobs_log (_order, _parent_id, id, executed_at, completed_at, task_slug, task_i_d, input, output, state, error) FROM stdin;
\.


--
-- Data for Name: payload_locked_documents; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.payload_locked_documents (id, global_slug, updated_at, created_at) FROM stdin;
24	\N	2025-03-09 08:29:34.38+00	2025-03-09 08:29:35.296+00
163	\N	2025-03-09 09:45:17.677+00	2025-03-09 09:45:18.636+00
26	\N	2025-03-09 08:29:45.516+00	2025-03-09 08:29:46.459+00
29	\N	2025-03-09 08:30:47.482+00	2025-03-09 08:30:48.414+00
34	\N	2025-03-09 08:33:33.349+00	2025-03-09 08:33:34.253+00
\.


--
-- Data for Name: payload_locked_documents_rels; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.payload_locked_documents_rels (id, "order", parent_id, path, pages_id, posts_id, media_id, categories_id, users_id, redirects_id, forms_id, form_submissions_id, search_id, payload_jobs_id) FROM stdin;
\.


--
-- Data for Name: payload_migrations; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.payload_migrations (id, name, batch, updated_at, created_at) FROM stdin;
1	dev	-1	2025-03-11 00:45:56.8+00	2025-03-09 08:10:15.562+00
\.


--
-- Data for Name: payload_preferences; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.payload_preferences (id, key, value, updated_at, created_at) FROM stdin;
2	forms-list	{"limit": 10}	2025-03-09 08:21:39.129+00	2025-03-09 08:13:03.97+00
5	collection-forms-1	{"fields": {"fields": {"collapsed": ["67cd4ec3073bbe0ba022952f", "67cd4ec3073bbe0ba0229530", "67cd4ec3073bbe0ba0229531", "67cd4ec3073bbe0ba0229532"]}}}	2025-03-09 08:22:00.881+00	2025-03-09 08:21:58.163+00
7	media-list	{}	2025-03-09 08:26:54.93+00	2025-03-09 08:26:55.836+00
3	posts-list	{"limit": 10}	2025-03-09 08:33:05.661+00	2025-03-09 08:18:20.516+00
1	pages-list	{"limit": 10}	2025-03-09 11:05:16.867+00	2025-03-09 08:11:32.985+00
10	global-header	{"fields": {"navItems": {"collapsed": ["67cd555d9d34cf53bcb98d1f", "67cd4eca073bbe0ba0229543", "67cd4eca073bbe0ba0229542"]}}}	2025-03-09 11:29:13.662+00	2025-03-09 08:47:55.342+00
16	collection-form-submissions-8	{"fields": {"submissionData": {"collapsed": ["67cd81ec2cd4fe2f24cbec58", "67cd81ec2cd4fe2f24cbec59", "67cd81ec2cd4fe2f24cbec5a", "67cd81ec2cd4fe2f24cbec5b", "67cd81ec2cd4fe2f24cbec5c", "67cd81ec2cd4fe2f24cbec5d", "67cd81ec2cd4fe2f24cbec5e", "67cd81ec2cd4fe2f24cbec5f", "67cd81ec2cd4fe2f24cbec60", "67cd81ec2cd4fe2f24cbec61", "67cd81ec2cd4fe2f24cbec62", "67cd81ec2cd4fe2f24cbec63", "67cd81ec2cd4fe2f24cbec64", "67cd81ec2cd4fe2f24cbec65", "67cd81ec2cd4fe2f24cbec66", "67cd81ec2cd4fe2f24cbec67", "67cd81ec2cd4fe2f24cbec68", "67cd81ec2cd4fe2f24cbec69", "67cd81ec2cd4fe2f24cbec6a", "67cd81ec2cd4fe2f24cbec6b", "67cd81ec2cd4fe2f24cbec6c", "67cd81ec2cd4fe2f24cbec6d", "67cd81ec2cd4fe2f24cbec6e", "67cd81ec2cd4fe2f24cbec6f", "67cd81ec2cd4fe2f24cbec70", "67cd81ec2cd4fe2f24cbec71", "67cd81ec2cd4fe2f24cbec72", "67cd81ec2cd4fe2f24cbec73", "67cd81ec2cd4fe2f24cbec74", "67cd81ec2cd4fe2f24cbec75", "67cd81ec2cd4fe2f24cbec76", "67cd81ec2cd4fe2f24cbec77", "67cd81ec2cd4fe2f24cbec78", "67cd81ec2cd4fe2f24cbec79", "67cd81ec2cd4fe2f24cbec7a", "67cd81ec2cd4fe2f24cbec7b", "67cd81ec2cd4fe2f24cbec7c", "67cd81ec2cd4fe2f24cbec7d", "67cd81ec2cd4fe2f24cbec7e", "67cd81ec2cd4fe2f24cbec7f", "67cd81ec2cd4fe2f24cbec80", "67cd81ec2cd4fe2f24cbec81", "67cd81ec2cd4fe2f24cbec82", "67cd81ec2cd4fe2f24cbec83", "67cd81ec2cd4fe2f24cbec84", "67cd81ec2cd4fe2f24cbec85", "67cd81ec2cd4fe2f24cbec86", "67cd81ec2cd4fe2f24cbec87", "67cd81ec2cd4fe2f24cbec88", "67cd81ec2cd4fe2f24cbec89", "67cd81ec2cd4fe2f24cbec8a", "67cd81ec2cd4fe2f24cbec8b", "67cd81ec2cd4fe2f24cbec8c", "67cd81ec2cd4fe2f24cbec8d", "67cd81ec2cd4fe2f24cbec8e", "67cd81ec2cd4fe2f24cbec8f", "67cd81ec2cd4fe2f24cbec90", "67cd81ec2cd4fe2f24cbec91", "67cd81ec2cd4fe2f24cbec92", "67cd81ec2cd4fe2f24cbec93", "67cd81ec2cd4fe2f24cbec94", "67cd81ec2cd4fe2f24cbec95", "67cd81ec2cd4fe2f24cbec96", "67cd81ec2cd4fe2f24cbec97", "67cd81ec2cd4fe2f24cbec98", "67cd81ec2cd4fe2f24cbec99", "67cd81ec2cd4fe2f24cbec9a", "67cd81ec2cd4fe2f24cbec9b", "67cd81ec2cd4fe2f24cbec9c", "67cd81ec2cd4fe2f24cbec9d", "67cd81ec2cd4fe2f24cbec9e", "67cd81ec2cd4fe2f24cbec9f", "67cd81ec2cd4fe2f24cbeca0", "67cd81ec2cd4fe2f24cbeca1", "67cd81ec2cd4fe2f24cbeca2", "67cd81ec2cd4fe2f24cbeca3", "67cd81ec2cd4fe2f24cbeca4", "67cd81ec2cd4fe2f24cbeca5", "67cd81ec2cd4fe2f24cbeca6", "67cd81ec2cd4fe2f24cbeca7", "67cd81ec2cd4fe2f24cbeca8", "67cd81ec2cd4fe2f24cbeca9", "67cd81ec2cd4fe2f24cbecaa", "67cd81ec2cd4fe2f24cbecab", "67cd81ec2cd4fe2f24cbecac", "67cd81ec2cd4fe2f24cbecad", "67cd81ec2cd4fe2f24cbecae"]}}}	2025-03-09 12:03:44.834+00	2025-03-09 12:03:44.843+00
15	form-submissions-list	{"limit": 10}	2025-03-09 18:41:25.635+00	2025-03-09 10:43:33.29+00
17	collection-form-submissions-10	{"fields": {"submissionData": {"collapsed": ["67cd864cdd414b0003c457b4", "67cd864cdd414b0003c457b5", "67cd864cdd414b0003c457b6", "67cd864cdd414b0003c457b7"]}}}	2025-03-09 18:41:55.713+00	2025-03-09 18:41:51.508+00
9	global-footer	{"fields": {"navItems": {"collapsed": ["67cd557f9d34cf53bcb98d20", "67cd558b9d34cf53bcb98d21", "67cd4eca073bbe0ba0229544"]}}}	2025-03-10 16:09:00.244+00	2025-03-09 08:47:28.326+00
8	collection-pages-2	{"fields": {"layout": {"collapsed": []}, "_index-1": {"tabIndex": 0}, "hero.links": {"collapsed": []}, "layout.1.links": {"collapsed": []}, "layout.0.columns": {"collapsed": ["67cd4ec5073bbe0ba0229539", "67cd4ec5073bbe0ba022953a", "67cd4ec5073bbe0ba022953b"]}}}	2025-03-10 16:10:05.214+00	2025-03-09 08:33:24.979+00
11	collection-pages-4	{"fields": {"layout": {"collapsed": []}, "_index-1": {"tabIndex": 1}, "hero.links": {"collapsed": []}, "layout.0.columns": {"collapsed": []}, "layout.1.columns": {"collapsed": []}}}	2025-03-10 16:10:23.314+00	2025-03-09 08:50:28.56+00
6	collection-pages-1	{"fields": {"layout": {"collapsed": ["67cd5078a4557c10ecf4fc83"]}, "_index-1": {"tabIndex": 1}, "layout.0.links": {"collapsed": []}}}	2025-03-10 16:11:39.332+00	2025-03-09 08:22:10.339+00
18	collection-forms-10	{"fields": {"fields": {"collapsed": ["67cd79b9e165d47974f6c871", "67cd79b9e165d47974f6c872", "67cd79b9e165d47974f6c873", "67cd79b9e165d47974f6c877", "67cd79b9e165d47974f6c878", "67cd79b9e165d47974f6c879", "67cd79b9e165d47974f6c87d", "67cd79b9e165d47974f6c87e", "67cd79b9e165d47974f6c881", "67cd79b9e165d47974f6c882", "67cd79b9e165d47974f6c883", "67cd79b9e165d47974f6c884", "67cd79b9e165d47974f6c885", "67cd79b9e165d47974f6c88a", "67cd79b9e165d47974f6c88b", "67cd79b9e165d47974f6c88c", "67cd79b9e165d47974f6c88f", "67cd79b9e165d47974f6c893", "67cd79b9e165d47974f6c894", "67cd79b9e165d47974f6c895", "67cd79b9e165d47974f6c896", "67cd79b9e165d47974f6c897", "67cd79b9e165d47974f6c898", "67cd79b9e165d47974f6c89b", "67cd79b9e165d47974f6c89f", "67cd79b9e165d47974f6c8a0", "67cd79b9e165d47974f6c8a1", "67cd79b9e165d47974f6c8a2", "67cd79b9e165d47974f6c8a3", "67cd79b9e165d47974f6c8a4", "67cd79b9e165d47974f6c8a7", "67cd79b9e165d47974f6c8ab", "67cd79b9e165d47974f6c8ac", "67cd79b9e165d47974f6c8ad", "67cd79b9e165d47974f6c8ae", "67cd79b9e165d47974f6c8af", "67cd79b9e165d47974f6c8b0", "67cd79b9e165d47974f6c8b3", "67cd79b9e165d47974f6c8b7", "67cd79b9e165d47974f6c8b8", "67cd79b9e165d47974f6c8b9", "67cd79b9e165d47974f6c8ba", "67cd79b9e165d47974f6c8bb", "67cd79b9e165d47974f6c8bc", "67cd79b9e165d47974f6c8bf", "67cd79b9e165d47974f6c8c3", "67cd79b9e165d47974f6c8c4", "67cd79b9e165d47974f6c8c5", "67cd79b9e165d47974f6c8c6", "67cd79b9e165d47974f6c8c7", "67cd79b9e165d47974f6c8c8", "67cd79b9e165d47974f6c8cb", "67cd79b9e165d47974f6c8cf", "67cd79b9e165d47974f6c8d0", "67cd79b9e165d47974f6c8d1", "67cd79b9e165d47974f6c8d2", "67cd79b9e165d47974f6c8d3", "67cd79b9e165d47974f6c8d6", "67cd79b9e165d47974f6c8d7", "67cd79b9e165d47974f6c8d8", "67cd79b9e165d47974f6c8db", "67cd79b9e165d47974f6c8dc", "67cd79b9e165d47974f6c8df", "67cd79b9e165d47974f6c8e0", "67cd79b9e165d47974f6c8e1", "67cd79b9e165d47974f6c8e4"]}}}	2025-03-10 16:51:00.755+00	2025-03-10 16:51:00.765+00
19	collection-pages-11	{"fields": {"layout": {"collapsed": ["67cd79bce165d47974f6c8fd"]}, "_index-1": {"tabIndex": 1}, "layout.0.multiStep.steps": {"collapsed": ["67cd79bce165d47974f6c8e9", "67cd79bce165d47974f6c8eb", "67cd79bce165d47974f6c8f0", "67cd79bce165d47974f6c8f2", "67cd79bce165d47974f6c8f4", "67cd79bce165d47974f6c8fc"]}}}	2025-03-10 16:51:57.712+00	2025-03-10 16:51:24.991+00
20	nav	{"groups": {"Globals": {"open": false}, "Collections": {"open": true}}}	2025-03-10 16:58:38.597+00	2025-03-10 16:58:37.467+00
21	users-list	{}	2025-03-11 00:52:48.996+00	2025-03-11 00:52:49.139+00
\.


--
-- Data for Name: payload_preferences_rels; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.payload_preferences_rels (id, "order", parent_id, path, users_id) FROM stdin;
6	\N	2	user	1
10	\N	5	user	1
20	\N	7	user	1
29	\N	3	user	1
206	\N	1	user	1
211	\N	10	user	1
222	\N	16	user	1
223	\N	15	user	1
227	\N	17	user	1
229	\N	9	user	1
230	\N	8	user	1
235	\N	11	user	1
236	\N	6	user	1
237	\N	18	user	1
241	\N	19	user	1
244	\N	20	user	1
245	\N	21	user	6
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.posts (id, title, hero_image_id, content, meta_title, meta_image_id, meta_description, published_at, slug, slug_lock, updated_at, created_at, _status) FROM stdin;
3	Digital Horizons: A Glimpse into Tomorrow	5	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dive into the marvels of modern innovation, where the only constant is change. A journey where pixels and data converge to craft the future.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "block", "fields": {"id": "67cd4eb0073bbe0ba022951c", "style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Disclaimer:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " This content is fabricated and for demonstration purposes only. To edit this post, ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "navigate to the admin dashboard", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}, "blockName": "Disclaimer", "blockType": "banner"}, "format": "", "version": 2}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The Rise of AI and Machine Learning", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We find ourselves in a transformative era where artificial intelligence (AI) stands at the forefront of technological evolution. The ripple effects of its advancements are reshaping industries at an unprecedented pace. No longer are businesses bound by the limitations of tedious, manual processes. Instead, sophisticated machines, fueled by vast amounts of historical data, are now capable of making decisions previously left to human intuition. These intelligent systems are not only optimizing operations but also pioneering innovative approaches, heralding a new age of business transformation worldwide. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "To demonstrate basic AI functionality, here is a javascript snippet that makes a POST request to a generic AI API in order to generate text based on a prompt. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "block", "fields": {"id": "67cd4eb0073bbe0ba022951d", "code": "async function generateText(prompt) {\\n    const apiKey = 'your-api-key';\\n    const apiUrl = 'https://api.example.com/generate-text';\\n\\n    const response = await fetch(apiUrl, {\\n        method: 'POST',\\n        headers: {\\n            'Content-Type': 'application/json',\\n            'Authorization': `Bearer ${apiKey}`\\n        },\\n        body: JSON.stringify({\\n            model: 'text-generation-model',\\n            prompt: prompt,\\n            max_tokens: 50\\n        })\\n    });\\n\\n    const data = await response.json();\\n    console.log(data.choices[0].text.trim());\\n}\\n\\n// Example usage\\ngenerateText(\\"Once upon a time in a faraway land,\\");\\n", "language": "javascript", "blockName": "Generate Text", "blockType": "code"}, "format": "", "version": 2}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "IoT: Connecting the World Around Us", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "In today's rapidly evolving technological landscape, the Internet of Things (IoT) stands out as a revolutionary force. From transforming our residences with smart home systems to redefining transportation through connected cars, IoT's influence is palpable in nearly every facet of our daily lives.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This technology hinges on the seamless integration of devices and systems, allowing them to communicate and collaborate effortlessly. With each connected device, we move a step closer to a world where convenience and efficiency are embedded in the very fabric of our existence. As a result, we're transitioning into an era where our surroundings intuitively respond to our needs, heralding a smarter and more interconnected global community.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "block", "fields": {"id": "67cd4eb0073bbe0ba022951e", "media": 7, "blockName": "", "blockType": "mediaBlock"}, "format": "", "version": 2}, {"type": "block", "fields": {"id": "67cd4eb0073bbe0ba022951f", "style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This content above is completely dynamic using custom layout building blocks configured in the CMS. This can be anything you'd like from rich text and images, to highly designed, complex components.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}, "blockName": "Dynamic Components", "blockType": "banner"}, "format": "", "version": 2}], "direction": "ltr"}}	Digital Horizons: A Glimpse into Tomorrow	5	Dive into the marvels of modern innovation, where the only constant is change. A journey where pixels and data converge to craft the future.	2025-03-09 08:17:42.775+00	digital-horizons	t	2025-03-09 08:17:52.605+00	2025-03-09 08:17:43.534+00	published
4	Global Gaze: Beyond the Headlines	7	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Explore the untold and overlooked. A magnified view into the corners of the world, where every story deserves its spotlight.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "block", "fields": {"id": "67cd4eb7073bbe0ba0229526", "style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Disclaimer:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " This content is fabricated and for demonstration purposes only. To edit this post, ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "navigate to the admin dashboard.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr", "textFormat": 1}], "direction": "ltr"}}, "blockName": "Disclaimer", "blockType": "banner"}, "format": "", "version": 2}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The Power of Resilience: Stories of Recovery and Hope", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Throughout history, regions across the globe have faced the devastating impact of natural disasters, the turbulence of political unrest, and the challenging ripples of economic downturns. In these moments of profound crisis, an often-underestimated force emerges: the indomitable resilience of the human spirit. These aren't just tales of mere survival, but stories of communities forging bonds, uniting with a collective purpose, and demonstrating an innate ability to overcome.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "block", "fields": {"id": "67cd4eb7073bbe0ba0229527", "media": 6, "blockName": "", "blockType": "mediaBlock"}, "format": "", "version": 2}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "From neighbors forming makeshift rescue teams during floods to entire cities rallying to rebuild after economic collapse, the essence of humanity is most evident in these acts of solidarity. As we delve into these narratives, we witness the transformative power of community spirit, where adversity becomes a catalyst for growth, unity, and a brighter, rebuilt future.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "block", "fields": {"id": "67cd4eb7073bbe0ba0229528", "style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This content above is completely dynamic using custom layout building blocks configured in the CMS. This can be anything you'd like from rich text and images, to highly designed, complex components.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}, "blockName": "Dynamic components", "blockType": "banner"}, "format": "", "version": 2}], "direction": "ltr"}}	Global Gaze: Beyond the Headlines	7	Explore the untold and overlooked. A magnified view into the corners of the world, where every story deserves its spotlight.	2025-03-09 08:17:45.832+00	global-gaze	t	2025-03-09 08:17:59.636+00	2025-03-09 08:17:46.494+00	published
5	Dollar and Sense: The Financial Forecast	6	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "block", "fields": {"id": "67cd4ebc073bbe0ba022952c", "style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Disclaimer: ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "This content is fabricated and for demonstration purposes only. To edit this post, ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "/admin", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "navigate to the admin dashboard.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr", "textFormat": 1}], "direction": "ltr"}}, "blockName": "Disclaimer", "blockType": "banner"}, "format": "", "version": 2}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Money isn't just currency; ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "it's a language. ", "type": "text", "style": "", "detail": 0, "format": 2, "version": 1}, {"mode": "normal", "text": "Dive deep into its nuances, where strategy meets intuition in the vast sea of finance.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Money, in its essence, transcends the mere concept of coins and paper notes; it becomes a profound language that speaks of value, trust, and societal structures. Like any language, it possesses intricate nuances and subtleties that require a discerning understanding. It's in these depths where the calculated world of financial strategy collides with the raw, instinctive nature of human intuition. Just as a seasoned linguist might dissect the syntax and semantics of a sentence, a financial expert navigates the vast and tumultuous ocean of finance, guided not only by logic and data but also by gut feelings and foresight. Every transaction, investment, and financial decision becomes a dialogue in this expansive lexicon of commerce and value.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "block", "fields": {"id": "67cd4ebc073bbe0ba022952d", "media": 5, "blockName": "", "blockType": "mediaBlock"}, "format": "", "version": 2}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Stock Market Dynamics: Bulls, Bears, and the Uncertain Middle", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The stock market is a realm of vast opportunity but also poses risks. Discover the forces that drive market trends and the strategies employed by top traders to navigate this complex ecosystem. From market analysis to understanding investor psychology, get a comprehensive insight into the world of stocks.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The stock market, often visualized as a bustling arena of numbers and ticker tapes, is as much about human behavior as it is about economics. It's a place where optimism, represented by the bullish rally, meets the caution of bearish downturns, with each vying to dictate the market's direction. But between these two extremes lies an uncertain middle ground, a zone populated by traders and investors who constantly weigh hope against fear. Successful navigation requires more than just financial acumen; it demands an understanding of collective sentiments and the ability to predict not just market movements, but also the reactions of other market participants. In this intricate dance of numbers and nerves, the most astute players are those who master both the hard data and the soft nuances of human behavior.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}, {"type": "block", "fields": {"id": "67cd4ebc073bbe0ba022952e", "style": "info", "content": {"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This content above is completely dynamic using custom layout building blocks configured in the CMS. This can be anything you'd like from rich text and images, to highly designed, complex components.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 0}], "direction": "ltr"}}, "blockName": "Dynamic components", "blockType": "banner"}, "format": "", "version": 2}], "direction": "ltr"}}	Dollar and Sense: The Financial Forecast	6	Money isn't just currency; it's a language. Dive deep into its nuances, where strategy meets intuition in the vast sea of finance.	2025-03-09 08:17:48.732+00	dollar-and-sense-the-financial-forecast	t	2025-03-09 08:18:05.441+00	2025-03-09 08:17:49.495+00	published
\.


--
-- Data for Name: posts_populated_authors; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.posts_populated_authors (_order, _parent_id, id, name) FROM stdin;
\.


--
-- Data for Name: posts_rels; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.posts_rels (id, "order", parent_id, path, posts_id, categories_id, users_id) FROM stdin;
5	1	3	relatedPosts	4	\N	\N
6	2	3	relatedPosts	5	\N	\N
7	1	3	authors	\N	\N	3
8	1	4	relatedPosts	3	\N	\N
9	2	4	relatedPosts	5	\N	\N
10	1	4	authors	\N	\N	3
11	1	5	relatedPosts	3	\N	\N
12	2	5	relatedPosts	4	\N	\N
13	1	5	authors	\N	\N	3
\.


--
-- Data for Name: redirects; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.redirects (id, "from", to_type, to_url, updated_at, created_at) FROM stdin;
\.


--
-- Data for Name: redirects_rels; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.redirects_rels (id, "order", parent_id, path, pages_id, posts_id) FROM stdin;
\.


--
-- Data for Name: search; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.search (id, title, priority, slug, meta_title, meta_description, meta_image_id, updated_at, created_at) FROM stdin;
1	Digital Horizons: A Glimpse into Tomorrow	0	digital-horizons	Digital Horizons: A Glimpse into Tomorrow	Dive into the marvels of modern innovation, where the only constant is change. A journey where pixels and data converge to craft the future.	\N	2025-03-09 08:17:30.221+00	2025-03-09 08:17:29.123+00
2	Digital Horizons: A Glimpse into Tomorrow	0	digital-horizons	Digital Horizons: A Glimpse into Tomorrow	Dive into the marvels of modern innovation, where the only constant is change. A journey where pixels and data converge to craft the future.	5	2025-03-09 08:17:57.225+00	2025-03-09 08:17:43.534+00
3	Global Gaze: Beyond the Headlines	0	global-gaze	Global Gaze: Beyond the Headlines	Explore the untold and overlooked. A magnified view into the corners of the world, where every story deserves its spotlight.	7	2025-03-09 08:18:03.206+00	2025-03-09 08:17:46.494+00
4	Dollar and Sense: The Financial Forecast	0	dollar-and-sense-the-financial-forecast	Dollar and Sense: The Financial Forecast	Money isn't just currency; it's a language. Dive deep into its nuances, where strategy meets intuition in the vast sea of finance.	6	2025-03-09 08:18:09.687+00	2025-03-09 08:17:49.495+00
\.


--
-- Data for Name: search_categories; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.search_categories (_order, _parent_id, id, relation_to, title) FROM stdin;
\.


--
-- Data for Name: search_rels; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.search_rels (id, "order", parent_id, path, posts_id) FROM stdin;
5	\N	2	doc	3
6	\N	3	doc	4
7	\N	4	doc	5
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.users (id, name, updated_at, created_at, email, reset_password_token, reset_password_expiration, salt, hash, login_attempts, lock_until) FROM stdin;
3	Demo Author	2025-03-09 08:17:37.182+00	2025-03-09 08:17:36.133+00	demo-author@example.com	\N	\N	29d65d81b13ba5e038ce06ace37bbb4c7d05f2db89ec0db1545b5de520f943ab	c2794f9a740d6ca396cc98742a9e509a2dfa28d8d7cd493e02d30e9c5b8999f8cac80430eb9bf33aadcedfe4b1b8a6a520e692b95e92cbe63faf6316ee1048e30462a8cbfa1b4af66074e79ed8071e38903cd273f32fa734fbb3f44a92f378ea329ee0fe842c95d202761215acb3d6713a34fa59f513f93b40a9127d65a126a78354df36a159d123437e015e796a07ba30f3b241be6d857adb0628c6b0324f0af2628117e78a6845dd8c1e79686c51c5a6f1c8bc93a7b8f24d1a7f20266c45fd1ddcd7ad21fbf7679f7121026c4a685dc187f995c339082be05eeef6ea5635b62e2ad1c9a347cb96e21e02daa2c5fa334d7d2a8417b833a65b4bb765a9dbc5ae7b0a82259d3614643e8bab8049df2e86ff3d721e31716a540c6931eef75615e10b4f43381a7fab16d5b3ac3563787a1b306c48c6eb5015273323f2fcfd1908b066631cc9745a54fc18c01a8611fe4798a85838287f420e3683ba7f122b90e34b66ee4ee1215ef048b79f502d0a2284687fafe3db06392bc466e48d1a3789882ce392da3bd231f2cace0e1e4a3ee1edc20ac87cea906e2091a04baf1e159df711fe22378b7f90fc747a4605d125f4a62b1a91255c5233740a86d9ed14f7fdac34295c7cd0f264942048cfe863753fe20205c8c865496763cc59f1cc8eb7ebd39922d09dc120027365e070ba2262120906adf927834c55a9809d933025efc91771	0	\N
1	Rodrigo	2025-03-11 00:50:18.056+00	2025-03-09 08:11:29.455+00	rodrigovdev01@gmail.com	\N	\N	a84d1d5786fc7bfea23ae3db307f0864fe1ae35ecf97197f6e36c68f41c372d3	4d1bd2cef78356253cba5f1480c0161230860d223e936753ba4de05df4ff315d1af46e76d4695e500827291e0066b6ae0f5f0ab0ae6af6166fbc2963dfdfebce2817687cb955e436faf5681264eb659dfe9ed7ddf498e78b3fd3b7be70dd494229947ebe2b8f21c2b39501efa58ac338ba1f8dd12662c0b7d2eabfde73c0c5619ffdc8a644e9cdd35f5f71fd706e3a9ef3704e577286a7b8ba27ff60baaa812b5378d134b55bfdd85191941fc2a609f70868674dde94342aa87b13e25a5275528cefce226f8a3feb14920cb65e87f2c4544892fcd6c81cb3d0c166cff1fda6a3a235fb9c5a5db82a21cad6c51dc568a1d98f6bd0416d3ccc00b8268ce3ef865306a2e44c3fc21716183099515bcd4bc77fd800791e6c5194ebfb23faa38f69e16981f86882ca92b44b5c9e37b171de8ea0b38b47e3f62aafe2199b72d60517cbee94ef22f2a8c8b76b42f829a4273a6129e35fdc71d2b558f9126219bd5a2a8eebe6ee00539c946adadc186b90c2ec953d537f0639bf039d6827d97268ab6669888e9aec3a215cb8eb9074a5114ec230293cd7211bf0cd212ac8e17b5baa3ffdca51a11a75f1c5344396077869c4c3616384e82e22b79a9d7aafcf93f4f1fefa70ea9ca1bcddbe8b3e062a446fae1b2670814b31d6da8cd491ca306d3a3deeab57309cb3ffbd4de463b5a2aaccdf0c0d6777e59e11af160e28f8dfcc6ea84710	3	\N
6	Alberto Saco	2025-03-11 00:52:01.871+00	2025-03-11 00:50:23.475+00	betosaco@gmail.com	726e5ccee6770ea4e09cabc104fc5e6a4cec5118	2025-03-11 00:52:01.871+00	4cfe3684aac5e0ef408098ec43b5a47b1dd4a5c760cfc5b42948dab2755d4393	47ca7513a52530f29053450b35e7811c9057e4abf77fbc2d37b8d588097916fa052608012adf72d292c7ce8613bc9505c0cb75052d47b4cb04dffa23d18b10652eb8e4fbf1d866c3030f4849f7e94e7fe4d6c77a1901e581a94307a60dddba7eac9a9b46613272c1d3d6c820592a208c9cf7131233de07b1154c14b32d20c6934c4bf00cd554aa63649f68958ac6650a9d2caaf5b1075cbe1b1f0f0cd699a3c3e54cd284857261453fe23d86e162ac8ddf788096948e5da1bb6bb1a1383c33c46386d79ab1e74de29d14d5bcdf2c77a9211c978dfc564d4712b6f34e23c82d6a901229875b5aeaab734106499b5b277e370a99d94c1ee4a8990ac2cddd4d116c165a34804e91820f94de2707fa0f27235b541a5a0c8ae493cb010ef626c3d86626b52da1a6bbaf78ae42218e5abb6f90e911654294a3a41aad367182c531a8cf45d7a11a6e50bbe7472681e88bfd6931f1114653d56bad400910ba54809ce8ce7ed29f616b271bccad02b42f9f4a3bc0998cee15400567f087ff1c676307ad40347ada9b0b332f319b0f41bdd139f9bfb65f094c948ab5e76dc1a2c19965d791fb5a56daea776690fed890cf4bfdc24d106ca8af26723480f9f3e6b3c3e9ad8e9f693734ffa29ac816440e1ef74d8cae7ae91a1a97fd023a7ef672e4a436f7f3d4e368b42fca3f541c54f39c00933778fd91215eb65fa3addaef135aef01fd5b	2	\N
\.


--
-- Name: _pages_v_blocks_archive_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public._pages_v_blocks_archive_id_seq', 96, true);


--
-- Name: _pages_v_blocks_content_columns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public._pages_v_blocks_content_columns_id_seq', 1178, true);


--
-- Name: _pages_v_blocks_content_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public._pages_v_blocks_content_id_seq', 362, true);


--
-- Name: _pages_v_blocks_cta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public._pages_v_blocks_cta_id_seq', 196, true);


--
-- Name: _pages_v_blocks_cta_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public._pages_v_blocks_cta_links_id_seq', 188, true);


--
-- Name: _pages_v_blocks_form_block_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public._pages_v_blocks_form_block_id_seq', 72, true);


--
-- Name: _pages_v_blocks_form_block_multi_step_steps_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public._pages_v_blocks_form_block_multi_step_steps_fields_id_seq', 955, true);


--
-- Name: _pages_v_blocks_form_block_multi_step_steps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public._pages_v_blocks_form_block_multi_step_steps_id_seq', 267, true);


--
-- Name: _pages_v_blocks_media_block_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public._pages_v_blocks_media_block_id_seq', 1, true);


--
-- Name: _pages_v_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public._pages_v_id_seq', 66, true);


--
-- Name: _pages_v_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public._pages_v_rels_id_seq', 303, true);


--
-- Name: _pages_v_version_hero_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public._pages_v_version_hero_links_id_seq', 374, true);


--
-- Name: _posts_v_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public._posts_v_id_seq', 7, true);


--
-- Name: _posts_v_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public._posts_v_rels_id_seq', 13, true);


--
-- Name: _posts_v_version_populated_authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public._posts_v_version_populated_authors_id_seq', 1, false);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.categories_id_seq', 12, true);


--
-- Name: footer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.footer_id_seq', 1, true);


--
-- Name: footer_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.footer_rels_id_seq', 18, true);


--
-- Name: form_submissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.form_submissions_id_seq', 11, true);


--
-- Name: forms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.forms_id_seq', 10, true);


--
-- Name: header_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.header_id_seq', 1, true);


--
-- Name: header_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.header_rels_id_seq', 36, true);


--
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.media_id_seq', 8, true);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.pages_id_seq', 11, true);


--
-- Name: pages_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.pages_rels_id_seq', 21, true);


--
-- Name: payload_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.payload_jobs_id_seq', 1, false);


--
-- Name: payload_locked_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.payload_locked_documents_id_seq', 204, true);


--
-- Name: payload_locked_documents_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.payload_locked_documents_rels_id_seq', 390, true);


--
-- Name: payload_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.payload_migrations_id_seq', 1, true);


--
-- Name: payload_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.payload_preferences_id_seq', 21, true);


--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.payload_preferences_rels_id_seq', 245, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.posts_id_seq', 5, true);


--
-- Name: posts_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.posts_rels_id_seq', 13, true);


--
-- Name: redirects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.redirects_id_seq', 1, false);


--
-- Name: redirects_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.redirects_rels_id_seq', 1, false);


--
-- Name: search_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.search_id_seq', 4, true);


--
-- Name: search_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.search_rels_id_seq', 7, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- Name: _pages_v_blocks_archive _pages_v_blocks_archive_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_blocks_archive
    ADD CONSTRAINT _pages_v_blocks_archive_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_content_columns _pages_v_blocks_content_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_blocks_content_columns
    ADD CONSTRAINT _pages_v_blocks_content_columns_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_content _pages_v_blocks_content_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_blocks_content
    ADD CONSTRAINT _pages_v_blocks_content_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_cta_links _pages_v_blocks_cta_links_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_blocks_cta_links
    ADD CONSTRAINT _pages_v_blocks_cta_links_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_cta _pages_v_blocks_cta_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_blocks_cta
    ADD CONSTRAINT _pages_v_blocks_cta_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_form_block_multi_step_steps_fields _pages_v_blocks_form_block_multi_step_steps_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_blocks_form_block_multi_step_steps_fields
    ADD CONSTRAINT _pages_v_blocks_form_block_multi_step_steps_fields_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_form_block_multi_step_steps _pages_v_blocks_form_block_multi_step_steps_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_blocks_form_block_multi_step_steps
    ADD CONSTRAINT _pages_v_blocks_form_block_multi_step_steps_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_form_block _pages_v_blocks_form_block_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_blocks_form_block
    ADD CONSTRAINT _pages_v_blocks_form_block_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_media_block _pages_v_blocks_media_block_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_blocks_media_block
    ADD CONSTRAINT _pages_v_blocks_media_block_pkey PRIMARY KEY (id);


--
-- Name: _pages_v _pages_v_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v
    ADD CONSTRAINT _pages_v_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_rels _pages_v_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_rels
    ADD CONSTRAINT _pages_v_rels_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_version_hero_links _pages_v_version_hero_links_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_version_hero_links
    ADD CONSTRAINT _pages_v_version_hero_links_pkey PRIMARY KEY (id);


--
-- Name: _posts_v _posts_v_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._posts_v
    ADD CONSTRAINT _posts_v_pkey PRIMARY KEY (id);


--
-- Name: _posts_v_rels _posts_v_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._posts_v_rels
    ADD CONSTRAINT _posts_v_rels_pkey PRIMARY KEY (id);


--
-- Name: _posts_v_version_populated_authors _posts_v_version_populated_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._posts_v_version_populated_authors
    ADD CONSTRAINT _posts_v_version_populated_authors_pkey PRIMARY KEY (id);


--
-- Name: categories_breadcrumbs categories_breadcrumbs_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.categories_breadcrumbs
    ADD CONSTRAINT categories_breadcrumbs_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: footer_nav_items footer_nav_items_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.footer_nav_items
    ADD CONSTRAINT footer_nav_items_pkey PRIMARY KEY (id);


--
-- Name: footer footer_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.footer
    ADD CONSTRAINT footer_pkey PRIMARY KEY (id);


--
-- Name: footer_rels footer_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.footer_rels
    ADD CONSTRAINT footer_rels_pkey PRIMARY KEY (id);


--
-- Name: form_submissions form_submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.form_submissions
    ADD CONSTRAINT form_submissions_pkey PRIMARY KEY (id);


--
-- Name: form_submissions_submission_data form_submissions_submission_data_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.form_submissions_submission_data
    ADD CONSTRAINT form_submissions_submission_data_pkey PRIMARY KEY (id);


--
-- Name: forms_blocks_checkbox forms_blocks_checkbox_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.forms_blocks_checkbox
    ADD CONSTRAINT forms_blocks_checkbox_pkey PRIMARY KEY (id);


--
-- Name: forms_blocks_country forms_blocks_country_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.forms_blocks_country
    ADD CONSTRAINT forms_blocks_country_pkey PRIMARY KEY (id);


--
-- Name: forms_blocks_email forms_blocks_email_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.forms_blocks_email
    ADD CONSTRAINT forms_blocks_email_pkey PRIMARY KEY (id);


--
-- Name: forms_blocks_message forms_blocks_message_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.forms_blocks_message
    ADD CONSTRAINT forms_blocks_message_pkey PRIMARY KEY (id);


--
-- Name: forms_blocks_number forms_blocks_number_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.forms_blocks_number
    ADD CONSTRAINT forms_blocks_number_pkey PRIMARY KEY (id);


--
-- Name: forms_blocks_payment forms_blocks_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.forms_blocks_payment
    ADD CONSTRAINT forms_blocks_payment_pkey PRIMARY KEY (id);


--
-- Name: forms_blocks_payment_price_conditions forms_blocks_payment_price_conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.forms_blocks_payment_price_conditions
    ADD CONSTRAINT forms_blocks_payment_price_conditions_pkey PRIMARY KEY (id);


--
-- Name: forms_blocks_select_options forms_blocks_select_options_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.forms_blocks_select_options
    ADD CONSTRAINT forms_blocks_select_options_pkey PRIMARY KEY (id);


--
-- Name: forms_blocks_select forms_blocks_select_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.forms_blocks_select
    ADD CONSTRAINT forms_blocks_select_pkey PRIMARY KEY (id);


--
-- Name: forms_blocks_state forms_blocks_state_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.forms_blocks_state
    ADD CONSTRAINT forms_blocks_state_pkey PRIMARY KEY (id);


--
-- Name: forms_blocks_text forms_blocks_text_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.forms_blocks_text
    ADD CONSTRAINT forms_blocks_text_pkey PRIMARY KEY (id);


--
-- Name: forms_blocks_textarea forms_blocks_textarea_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.forms_blocks_textarea
    ADD CONSTRAINT forms_blocks_textarea_pkey PRIMARY KEY (id);


--
-- Name: forms_emails forms_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.forms_emails
    ADD CONSTRAINT forms_emails_pkey PRIMARY KEY (id);


--
-- Name: forms forms_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.forms
    ADD CONSTRAINT forms_pkey PRIMARY KEY (id);


--
-- Name: header_nav_items header_nav_items_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.header_nav_items
    ADD CONSTRAINT header_nav_items_pkey PRIMARY KEY (id);


--
-- Name: header header_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.header
    ADD CONSTRAINT header_pkey PRIMARY KEY (id);


--
-- Name: header_rels header_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.header_rels
    ADD CONSTRAINT header_rels_pkey PRIMARY KEY (id);


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_archive pages_blocks_archive_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages_blocks_archive
    ADD CONSTRAINT pages_blocks_archive_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_content_columns pages_blocks_content_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages_blocks_content_columns
    ADD CONSTRAINT pages_blocks_content_columns_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_content pages_blocks_content_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages_blocks_content
    ADD CONSTRAINT pages_blocks_content_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_cta_links pages_blocks_cta_links_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages_blocks_cta_links
    ADD CONSTRAINT pages_blocks_cta_links_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_cta pages_blocks_cta_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages_blocks_cta
    ADD CONSTRAINT pages_blocks_cta_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_form_block_multi_step_steps_fields pages_blocks_form_block_multi_step_steps_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages_blocks_form_block_multi_step_steps_fields
    ADD CONSTRAINT pages_blocks_form_block_multi_step_steps_fields_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_form_block_multi_step_steps pages_blocks_form_block_multi_step_steps_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages_blocks_form_block_multi_step_steps
    ADD CONSTRAINT pages_blocks_form_block_multi_step_steps_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_form_block pages_blocks_form_block_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages_blocks_form_block
    ADD CONSTRAINT pages_blocks_form_block_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_media_block pages_blocks_media_block_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages_blocks_media_block
    ADD CONSTRAINT pages_blocks_media_block_pkey PRIMARY KEY (id);


--
-- Name: pages_hero_links pages_hero_links_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages_hero_links
    ADD CONSTRAINT pages_hero_links_pkey PRIMARY KEY (id);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: pages_rels pages_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages_rels
    ADD CONSTRAINT pages_rels_pkey PRIMARY KEY (id);


--
-- Name: payload_jobs_log payload_jobs_log_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.payload_jobs_log
    ADD CONSTRAINT payload_jobs_log_pkey PRIMARY KEY (id);


--
-- Name: payload_jobs payload_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.payload_jobs
    ADD CONSTRAINT payload_jobs_pkey PRIMARY KEY (id);


--
-- Name: payload_locked_documents payload_locked_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.payload_locked_documents
    ADD CONSTRAINT payload_locked_documents_pkey PRIMARY KEY (id);


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_pkey PRIMARY KEY (id);


--
-- Name: payload_migrations payload_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.payload_migrations
    ADD CONSTRAINT payload_migrations_pkey PRIMARY KEY (id);


--
-- Name: payload_preferences payload_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.payload_preferences
    ADD CONSTRAINT payload_preferences_pkey PRIMARY KEY (id);


--
-- Name: payload_preferences_rels payload_preferences_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: posts_populated_authors posts_populated_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.posts_populated_authors
    ADD CONSTRAINT posts_populated_authors_pkey PRIMARY KEY (id);


--
-- Name: posts_rels posts_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.posts_rels
    ADD CONSTRAINT posts_rels_pkey PRIMARY KEY (id);


--
-- Name: redirects redirects_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.redirects
    ADD CONSTRAINT redirects_pkey PRIMARY KEY (id);


--
-- Name: redirects_rels redirects_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.redirects_rels
    ADD CONSTRAINT redirects_rels_pkey PRIMARY KEY (id);


--
-- Name: search_categories search_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.search_categories
    ADD CONSTRAINT search_categories_pkey PRIMARY KEY (id);


--
-- Name: search search_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.search
    ADD CONSTRAINT search_pkey PRIMARY KEY (id);


--
-- Name: search_rels search_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.search_rels
    ADD CONSTRAINT search_rels_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_autosave_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_autosave_idx ON public._pages_v USING btree (autosave);


--
-- Name: _pages_v_blocks_archive_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_blocks_archive_order_idx ON public._pages_v_blocks_archive USING btree (_order);


--
-- Name: _pages_v_blocks_archive_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_blocks_archive_parent_id_idx ON public._pages_v_blocks_archive USING btree (_parent_id);


--
-- Name: _pages_v_blocks_archive_path_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_blocks_archive_path_idx ON public._pages_v_blocks_archive USING btree (_path);


--
-- Name: _pages_v_blocks_content_columns_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_blocks_content_columns_order_idx ON public._pages_v_blocks_content_columns USING btree (_order);


--
-- Name: _pages_v_blocks_content_columns_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_blocks_content_columns_parent_id_idx ON public._pages_v_blocks_content_columns USING btree (_parent_id);


--
-- Name: _pages_v_blocks_content_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_blocks_content_order_idx ON public._pages_v_blocks_content USING btree (_order);


--
-- Name: _pages_v_blocks_content_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_blocks_content_parent_id_idx ON public._pages_v_blocks_content USING btree (_parent_id);


--
-- Name: _pages_v_blocks_content_path_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_blocks_content_path_idx ON public._pages_v_blocks_content USING btree (_path);


--
-- Name: _pages_v_blocks_cta_links_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_blocks_cta_links_order_idx ON public._pages_v_blocks_cta_links USING btree (_order);


--
-- Name: _pages_v_blocks_cta_links_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_blocks_cta_links_parent_id_idx ON public._pages_v_blocks_cta_links USING btree (_parent_id);


--
-- Name: _pages_v_blocks_cta_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_blocks_cta_order_idx ON public._pages_v_blocks_cta USING btree (_order);


--
-- Name: _pages_v_blocks_cta_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_blocks_cta_parent_id_idx ON public._pages_v_blocks_cta USING btree (_parent_id);


--
-- Name: _pages_v_blocks_cta_path_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_blocks_cta_path_idx ON public._pages_v_blocks_cta USING btree (_path);


--
-- Name: _pages_v_blocks_form_block_form_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_blocks_form_block_form_idx ON public._pages_v_blocks_form_block USING btree (form_id);


--
-- Name: _pages_v_blocks_form_block_multi_step_steps_fields_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_blocks_form_block_multi_step_steps_fields_order_idx ON public._pages_v_blocks_form_block_multi_step_steps_fields USING btree (_order);


--
-- Name: _pages_v_blocks_form_block_multi_step_steps_fields_parent_id_id; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_blocks_form_block_multi_step_steps_fields_parent_id_id ON public._pages_v_blocks_form_block_multi_step_steps_fields USING btree (_parent_id);


--
-- Name: _pages_v_blocks_form_block_multi_step_steps_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_blocks_form_block_multi_step_steps_order_idx ON public._pages_v_blocks_form_block_multi_step_steps USING btree (_order);


--
-- Name: _pages_v_blocks_form_block_multi_step_steps_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_blocks_form_block_multi_step_steps_parent_id_idx ON public._pages_v_blocks_form_block_multi_step_steps USING btree (_parent_id);


--
-- Name: _pages_v_blocks_form_block_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_blocks_form_block_order_idx ON public._pages_v_blocks_form_block USING btree (_order);


--
-- Name: _pages_v_blocks_form_block_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_blocks_form_block_parent_id_idx ON public._pages_v_blocks_form_block USING btree (_parent_id);


--
-- Name: _pages_v_blocks_form_block_path_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_blocks_form_block_path_idx ON public._pages_v_blocks_form_block USING btree (_path);


--
-- Name: _pages_v_blocks_media_block_media_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_blocks_media_block_media_idx ON public._pages_v_blocks_media_block USING btree (media_id);


--
-- Name: _pages_v_blocks_media_block_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_blocks_media_block_order_idx ON public._pages_v_blocks_media_block USING btree (_order);


--
-- Name: _pages_v_blocks_media_block_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_blocks_media_block_parent_id_idx ON public._pages_v_blocks_media_block USING btree (_parent_id);


--
-- Name: _pages_v_blocks_media_block_path_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_blocks_media_block_path_idx ON public._pages_v_blocks_media_block USING btree (_path);


--
-- Name: _pages_v_created_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_created_at_idx ON public._pages_v USING btree (created_at);


--
-- Name: _pages_v_latest_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_latest_idx ON public._pages_v USING btree (latest);


--
-- Name: _pages_v_parent_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_parent_idx ON public._pages_v USING btree (parent_id);


--
-- Name: _pages_v_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_rels_categories_id_idx ON public._pages_v_rels USING btree (categories_id);


--
-- Name: _pages_v_rels_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_rels_order_idx ON public._pages_v_rels USING btree ("order");


--
-- Name: _pages_v_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_rels_pages_id_idx ON public._pages_v_rels USING btree (pages_id);


--
-- Name: _pages_v_rels_parent_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_rels_parent_idx ON public._pages_v_rels USING btree (parent_id);


--
-- Name: _pages_v_rels_path_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_rels_path_idx ON public._pages_v_rels USING btree (path);


--
-- Name: _pages_v_rels_posts_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_rels_posts_id_idx ON public._pages_v_rels USING btree (posts_id);


--
-- Name: _pages_v_updated_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_updated_at_idx ON public._pages_v USING btree (updated_at);


--
-- Name: _pages_v_version_hero_links_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_version_hero_links_order_idx ON public._pages_v_version_hero_links USING btree (_order);


--
-- Name: _pages_v_version_hero_links_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_version_hero_links_parent_id_idx ON public._pages_v_version_hero_links USING btree (_parent_id);


--
-- Name: _pages_v_version_hero_version_hero_form_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_version_hero_version_hero_form_idx ON public._pages_v USING btree (version_hero_form_id);


--
-- Name: _pages_v_version_hero_version_hero_media_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_version_hero_version_hero_media_idx ON public._pages_v USING btree (version_hero_media_id);


--
-- Name: _pages_v_version_meta_version_meta_image_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_version_meta_version_meta_image_idx ON public._pages_v USING btree (version_meta_image_id);


--
-- Name: _pages_v_version_version__status_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_version_version__status_idx ON public._pages_v USING btree (version__status);


--
-- Name: _pages_v_version_version_created_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_version_version_created_at_idx ON public._pages_v USING btree (version_created_at);


--
-- Name: _pages_v_version_version_slug_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_version_version_slug_idx ON public._pages_v USING btree (version_slug);


--
-- Name: _pages_v_version_version_updated_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _pages_v_version_version_updated_at_idx ON public._pages_v USING btree (version_updated_at);


--
-- Name: _posts_v_autosave_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _posts_v_autosave_idx ON public._posts_v USING btree (autosave);


--
-- Name: _posts_v_created_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _posts_v_created_at_idx ON public._posts_v USING btree (created_at);


--
-- Name: _posts_v_latest_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _posts_v_latest_idx ON public._posts_v USING btree (latest);


--
-- Name: _posts_v_parent_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _posts_v_parent_idx ON public._posts_v USING btree (parent_id);


--
-- Name: _posts_v_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _posts_v_rels_categories_id_idx ON public._posts_v_rels USING btree (categories_id);


--
-- Name: _posts_v_rels_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _posts_v_rels_order_idx ON public._posts_v_rels USING btree ("order");


--
-- Name: _posts_v_rels_parent_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _posts_v_rels_parent_idx ON public._posts_v_rels USING btree (parent_id);


--
-- Name: _posts_v_rels_path_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _posts_v_rels_path_idx ON public._posts_v_rels USING btree (path);


--
-- Name: _posts_v_rels_posts_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _posts_v_rels_posts_id_idx ON public._posts_v_rels USING btree (posts_id);


--
-- Name: _posts_v_rels_users_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _posts_v_rels_users_id_idx ON public._posts_v_rels USING btree (users_id);


--
-- Name: _posts_v_updated_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _posts_v_updated_at_idx ON public._posts_v USING btree (updated_at);


--
-- Name: _posts_v_version_meta_version_meta_image_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _posts_v_version_meta_version_meta_image_idx ON public._posts_v USING btree (version_meta_image_id);


--
-- Name: _posts_v_version_populated_authors_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _posts_v_version_populated_authors_order_idx ON public._posts_v_version_populated_authors USING btree (_order);


--
-- Name: _posts_v_version_populated_authors_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _posts_v_version_populated_authors_parent_id_idx ON public._posts_v_version_populated_authors USING btree (_parent_id);


--
-- Name: _posts_v_version_version__status_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _posts_v_version_version__status_idx ON public._posts_v USING btree (version__status);


--
-- Name: _posts_v_version_version_created_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _posts_v_version_version_created_at_idx ON public._posts_v USING btree (version_created_at);


--
-- Name: _posts_v_version_version_hero_image_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _posts_v_version_version_hero_image_idx ON public._posts_v USING btree (version_hero_image_id);


--
-- Name: _posts_v_version_version_slug_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _posts_v_version_version_slug_idx ON public._posts_v USING btree (version_slug);


--
-- Name: _posts_v_version_version_updated_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX _posts_v_version_version_updated_at_idx ON public._posts_v USING btree (version_updated_at);


--
-- Name: categories_breadcrumbs_doc_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX categories_breadcrumbs_doc_idx ON public.categories_breadcrumbs USING btree (doc_id);


--
-- Name: categories_breadcrumbs_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX categories_breadcrumbs_order_idx ON public.categories_breadcrumbs USING btree (_order);


--
-- Name: categories_breadcrumbs_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX categories_breadcrumbs_parent_id_idx ON public.categories_breadcrumbs USING btree (_parent_id);


--
-- Name: categories_created_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX categories_created_at_idx ON public.categories USING btree (created_at);


--
-- Name: categories_parent_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX categories_parent_idx ON public.categories USING btree (parent_id);


--
-- Name: categories_slug_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX categories_slug_idx ON public.categories USING btree (slug);


--
-- Name: categories_updated_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX categories_updated_at_idx ON public.categories USING btree (updated_at);


--
-- Name: footer_nav_items_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX footer_nav_items_order_idx ON public.footer_nav_items USING btree (_order);


--
-- Name: footer_nav_items_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX footer_nav_items_parent_id_idx ON public.footer_nav_items USING btree (_parent_id);


--
-- Name: footer_rels_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX footer_rels_order_idx ON public.footer_rels USING btree ("order");


--
-- Name: footer_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX footer_rels_pages_id_idx ON public.footer_rels USING btree (pages_id);


--
-- Name: footer_rels_parent_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX footer_rels_parent_idx ON public.footer_rels USING btree (parent_id);


--
-- Name: footer_rels_path_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX footer_rels_path_idx ON public.footer_rels USING btree (path);


--
-- Name: footer_rels_posts_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX footer_rels_posts_id_idx ON public.footer_rels USING btree (posts_id);


--
-- Name: form_submissions_created_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX form_submissions_created_at_idx ON public.form_submissions USING btree (created_at);


--
-- Name: form_submissions_form_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX form_submissions_form_idx ON public.form_submissions USING btree (form_id);


--
-- Name: form_submissions_submission_data_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX form_submissions_submission_data_order_idx ON public.form_submissions_submission_data USING btree (_order);


--
-- Name: form_submissions_submission_data_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX form_submissions_submission_data_parent_id_idx ON public.form_submissions_submission_data USING btree (_parent_id);


--
-- Name: form_submissions_updated_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX form_submissions_updated_at_idx ON public.form_submissions USING btree (updated_at);


--
-- Name: forms_blocks_checkbox_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_checkbox_order_idx ON public.forms_blocks_checkbox USING btree (_order);


--
-- Name: forms_blocks_checkbox_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_checkbox_parent_id_idx ON public.forms_blocks_checkbox USING btree (_parent_id);


--
-- Name: forms_blocks_checkbox_path_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_checkbox_path_idx ON public.forms_blocks_checkbox USING btree (_path);


--
-- Name: forms_blocks_country_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_country_order_idx ON public.forms_blocks_country USING btree (_order);


--
-- Name: forms_blocks_country_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_country_parent_id_idx ON public.forms_blocks_country USING btree (_parent_id);


--
-- Name: forms_blocks_country_path_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_country_path_idx ON public.forms_blocks_country USING btree (_path);


--
-- Name: forms_blocks_email_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_email_order_idx ON public.forms_blocks_email USING btree (_order);


--
-- Name: forms_blocks_email_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_email_parent_id_idx ON public.forms_blocks_email USING btree (_parent_id);


--
-- Name: forms_blocks_email_path_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_email_path_idx ON public.forms_blocks_email USING btree (_path);


--
-- Name: forms_blocks_message_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_message_order_idx ON public.forms_blocks_message USING btree (_order);


--
-- Name: forms_blocks_message_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_message_parent_id_idx ON public.forms_blocks_message USING btree (_parent_id);


--
-- Name: forms_blocks_message_path_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_message_path_idx ON public.forms_blocks_message USING btree (_path);


--
-- Name: forms_blocks_number_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_number_order_idx ON public.forms_blocks_number USING btree (_order);


--
-- Name: forms_blocks_number_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_number_parent_id_idx ON public.forms_blocks_number USING btree (_parent_id);


--
-- Name: forms_blocks_number_path_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_number_path_idx ON public.forms_blocks_number USING btree (_path);


--
-- Name: forms_blocks_payment_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_payment_order_idx ON public.forms_blocks_payment USING btree (_order);


--
-- Name: forms_blocks_payment_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_payment_parent_id_idx ON public.forms_blocks_payment USING btree (_parent_id);


--
-- Name: forms_blocks_payment_path_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_payment_path_idx ON public.forms_blocks_payment USING btree (_path);


--
-- Name: forms_blocks_payment_price_conditions_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_payment_price_conditions_order_idx ON public.forms_blocks_payment_price_conditions USING btree (_order);


--
-- Name: forms_blocks_payment_price_conditions_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_payment_price_conditions_parent_id_idx ON public.forms_blocks_payment_price_conditions USING btree (_parent_id);


--
-- Name: forms_blocks_select_options_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_select_options_order_idx ON public.forms_blocks_select_options USING btree (_order);


--
-- Name: forms_blocks_select_options_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_select_options_parent_id_idx ON public.forms_blocks_select_options USING btree (_parent_id);


--
-- Name: forms_blocks_select_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_select_order_idx ON public.forms_blocks_select USING btree (_order);


--
-- Name: forms_blocks_select_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_select_parent_id_idx ON public.forms_blocks_select USING btree (_parent_id);


--
-- Name: forms_blocks_select_path_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_select_path_idx ON public.forms_blocks_select USING btree (_path);


--
-- Name: forms_blocks_state_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_state_order_idx ON public.forms_blocks_state USING btree (_order);


--
-- Name: forms_blocks_state_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_state_parent_id_idx ON public.forms_blocks_state USING btree (_parent_id);


--
-- Name: forms_blocks_state_path_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_state_path_idx ON public.forms_blocks_state USING btree (_path);


--
-- Name: forms_blocks_text_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_text_order_idx ON public.forms_blocks_text USING btree (_order);


--
-- Name: forms_blocks_text_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_text_parent_id_idx ON public.forms_blocks_text USING btree (_parent_id);


--
-- Name: forms_blocks_text_path_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_text_path_idx ON public.forms_blocks_text USING btree (_path);


--
-- Name: forms_blocks_textarea_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_textarea_order_idx ON public.forms_blocks_textarea USING btree (_order);


--
-- Name: forms_blocks_textarea_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_textarea_parent_id_idx ON public.forms_blocks_textarea USING btree (_parent_id);


--
-- Name: forms_blocks_textarea_path_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_blocks_textarea_path_idx ON public.forms_blocks_textarea USING btree (_path);


--
-- Name: forms_created_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_created_at_idx ON public.forms USING btree (created_at);


--
-- Name: forms_emails_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_emails_order_idx ON public.forms_emails USING btree (_order);


--
-- Name: forms_emails_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_emails_parent_id_idx ON public.forms_emails USING btree (_parent_id);


--
-- Name: forms_updated_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX forms_updated_at_idx ON public.forms USING btree (updated_at);


--
-- Name: header_nav_items_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX header_nav_items_order_idx ON public.header_nav_items USING btree (_order);


--
-- Name: header_nav_items_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX header_nav_items_parent_id_idx ON public.header_nav_items USING btree (_parent_id);


--
-- Name: header_rels_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX header_rels_order_idx ON public.header_rels USING btree ("order");


--
-- Name: header_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX header_rels_pages_id_idx ON public.header_rels USING btree (pages_id);


--
-- Name: header_rels_parent_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX header_rels_parent_idx ON public.header_rels USING btree (parent_id);


--
-- Name: header_rels_path_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX header_rels_path_idx ON public.header_rels USING btree (path);


--
-- Name: header_rels_posts_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX header_rels_posts_id_idx ON public.header_rels USING btree (posts_id);


--
-- Name: media_created_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX media_created_at_idx ON public.media USING btree (created_at);


--
-- Name: media_filename_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE UNIQUE INDEX media_filename_idx ON public.media USING btree (filename);


--
-- Name: media_sizes_large_sizes_large_filename_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX media_sizes_large_sizes_large_filename_idx ON public.media USING btree (sizes_large_filename);


--
-- Name: media_sizes_medium_sizes_medium_filename_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX media_sizes_medium_sizes_medium_filename_idx ON public.media USING btree (sizes_medium_filename);


--
-- Name: media_sizes_og_sizes_og_filename_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX media_sizes_og_sizes_og_filename_idx ON public.media USING btree (sizes_og_filename);


--
-- Name: media_sizes_small_sizes_small_filename_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX media_sizes_small_sizes_small_filename_idx ON public.media USING btree (sizes_small_filename);


--
-- Name: media_sizes_square_sizes_square_filename_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX media_sizes_square_sizes_square_filename_idx ON public.media USING btree (sizes_square_filename);


--
-- Name: media_sizes_thumbnail_sizes_thumbnail_filename_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX media_sizes_thumbnail_sizes_thumbnail_filename_idx ON public.media USING btree (sizes_thumbnail_filename);


--
-- Name: media_sizes_xlarge_sizes_xlarge_filename_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX media_sizes_xlarge_sizes_xlarge_filename_idx ON public.media USING btree (sizes_xlarge_filename);


--
-- Name: media_updated_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX media_updated_at_idx ON public.media USING btree (updated_at);


--
-- Name: pages__status_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages__status_idx ON public.pages USING btree (_status);


--
-- Name: pages_blocks_archive_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_blocks_archive_order_idx ON public.pages_blocks_archive USING btree (_order);


--
-- Name: pages_blocks_archive_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_blocks_archive_parent_id_idx ON public.pages_blocks_archive USING btree (_parent_id);


--
-- Name: pages_blocks_archive_path_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_blocks_archive_path_idx ON public.pages_blocks_archive USING btree (_path);


--
-- Name: pages_blocks_content_columns_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_blocks_content_columns_order_idx ON public.pages_blocks_content_columns USING btree (_order);


--
-- Name: pages_blocks_content_columns_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_blocks_content_columns_parent_id_idx ON public.pages_blocks_content_columns USING btree (_parent_id);


--
-- Name: pages_blocks_content_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_blocks_content_order_idx ON public.pages_blocks_content USING btree (_order);


--
-- Name: pages_blocks_content_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_blocks_content_parent_id_idx ON public.pages_blocks_content USING btree (_parent_id);


--
-- Name: pages_blocks_content_path_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_blocks_content_path_idx ON public.pages_blocks_content USING btree (_path);


--
-- Name: pages_blocks_cta_links_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_blocks_cta_links_order_idx ON public.pages_blocks_cta_links USING btree (_order);


--
-- Name: pages_blocks_cta_links_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_blocks_cta_links_parent_id_idx ON public.pages_blocks_cta_links USING btree (_parent_id);


--
-- Name: pages_blocks_cta_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_blocks_cta_order_idx ON public.pages_blocks_cta USING btree (_order);


--
-- Name: pages_blocks_cta_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_blocks_cta_parent_id_idx ON public.pages_blocks_cta USING btree (_parent_id);


--
-- Name: pages_blocks_cta_path_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_blocks_cta_path_idx ON public.pages_blocks_cta USING btree (_path);


--
-- Name: pages_blocks_form_block_form_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_blocks_form_block_form_idx ON public.pages_blocks_form_block USING btree (form_id);


--
-- Name: pages_blocks_form_block_multi_step_steps_fields_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_blocks_form_block_multi_step_steps_fields_order_idx ON public.pages_blocks_form_block_multi_step_steps_fields USING btree (_order);


--
-- Name: pages_blocks_form_block_multi_step_steps_fields_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_blocks_form_block_multi_step_steps_fields_parent_id_idx ON public.pages_blocks_form_block_multi_step_steps_fields USING btree (_parent_id);


--
-- Name: pages_blocks_form_block_multi_step_steps_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_blocks_form_block_multi_step_steps_order_idx ON public.pages_blocks_form_block_multi_step_steps USING btree (_order);


--
-- Name: pages_blocks_form_block_multi_step_steps_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_blocks_form_block_multi_step_steps_parent_id_idx ON public.pages_blocks_form_block_multi_step_steps USING btree (_parent_id);


--
-- Name: pages_blocks_form_block_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_blocks_form_block_order_idx ON public.pages_blocks_form_block USING btree (_order);


--
-- Name: pages_blocks_form_block_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_blocks_form_block_parent_id_idx ON public.pages_blocks_form_block USING btree (_parent_id);


--
-- Name: pages_blocks_form_block_path_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_blocks_form_block_path_idx ON public.pages_blocks_form_block USING btree (_path);


--
-- Name: pages_blocks_media_block_media_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_blocks_media_block_media_idx ON public.pages_blocks_media_block USING btree (media_id);


--
-- Name: pages_blocks_media_block_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_blocks_media_block_order_idx ON public.pages_blocks_media_block USING btree (_order);


--
-- Name: pages_blocks_media_block_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_blocks_media_block_parent_id_idx ON public.pages_blocks_media_block USING btree (_parent_id);


--
-- Name: pages_blocks_media_block_path_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_blocks_media_block_path_idx ON public.pages_blocks_media_block USING btree (_path);


--
-- Name: pages_created_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_created_at_idx ON public.pages USING btree (created_at);


--
-- Name: pages_hero_hero_form_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_hero_hero_form_idx ON public.pages USING btree (hero_form_id);


--
-- Name: pages_hero_hero_media_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_hero_hero_media_idx ON public.pages USING btree (hero_media_id);


--
-- Name: pages_hero_links_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_hero_links_order_idx ON public.pages_hero_links USING btree (_order);


--
-- Name: pages_hero_links_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_hero_links_parent_id_idx ON public.pages_hero_links USING btree (_parent_id);


--
-- Name: pages_meta_meta_image_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_meta_meta_image_idx ON public.pages USING btree (meta_image_id);


--
-- Name: pages_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_rels_categories_id_idx ON public.pages_rels USING btree (categories_id);


--
-- Name: pages_rels_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_rels_order_idx ON public.pages_rels USING btree ("order");


--
-- Name: pages_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_rels_pages_id_idx ON public.pages_rels USING btree (pages_id);


--
-- Name: pages_rels_parent_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_rels_parent_idx ON public.pages_rels USING btree (parent_id);


--
-- Name: pages_rels_path_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_rels_path_idx ON public.pages_rels USING btree (path);


--
-- Name: pages_rels_posts_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_rels_posts_id_idx ON public.pages_rels USING btree (posts_id);


--
-- Name: pages_slug_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_slug_idx ON public.pages USING btree (slug);


--
-- Name: pages_updated_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX pages_updated_at_idx ON public.pages USING btree (updated_at);


--
-- Name: payload_jobs_completed_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_jobs_completed_at_idx ON public.payload_jobs USING btree (completed_at);


--
-- Name: payload_jobs_created_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_jobs_created_at_idx ON public.payload_jobs USING btree (created_at);


--
-- Name: payload_jobs_has_error_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_jobs_has_error_idx ON public.payload_jobs USING btree (has_error);


--
-- Name: payload_jobs_log_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_jobs_log_order_idx ON public.payload_jobs_log USING btree (_order);


--
-- Name: payload_jobs_log_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_jobs_log_parent_id_idx ON public.payload_jobs_log USING btree (_parent_id);


--
-- Name: payload_jobs_processing_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_jobs_processing_idx ON public.payload_jobs USING btree (processing);


--
-- Name: payload_jobs_queue_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_jobs_queue_idx ON public.payload_jobs USING btree (queue);


--
-- Name: payload_jobs_task_slug_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_jobs_task_slug_idx ON public.payload_jobs USING btree (task_slug);


--
-- Name: payload_jobs_total_tried_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_jobs_total_tried_idx ON public.payload_jobs USING btree (total_tried);


--
-- Name: payload_jobs_updated_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_jobs_updated_at_idx ON public.payload_jobs USING btree (updated_at);


--
-- Name: payload_jobs_wait_until_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_jobs_wait_until_idx ON public.payload_jobs USING btree (wait_until);


--
-- Name: payload_locked_documents_created_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_locked_documents_created_at_idx ON public.payload_locked_documents USING btree (created_at);


--
-- Name: payload_locked_documents_global_slug_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_locked_documents_global_slug_idx ON public.payload_locked_documents USING btree (global_slug);


--
-- Name: payload_locked_documents_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_locked_documents_rels_categories_id_idx ON public.payload_locked_documents_rels USING btree (categories_id);


--
-- Name: payload_locked_documents_rels_form_submissions_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_locked_documents_rels_form_submissions_id_idx ON public.payload_locked_documents_rels USING btree (form_submissions_id);


--
-- Name: payload_locked_documents_rels_forms_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_locked_documents_rels_forms_id_idx ON public.payload_locked_documents_rels USING btree (forms_id);


--
-- Name: payload_locked_documents_rels_media_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_locked_documents_rels_media_id_idx ON public.payload_locked_documents_rels USING btree (media_id);


--
-- Name: payload_locked_documents_rels_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_locked_documents_rels_order_idx ON public.payload_locked_documents_rels USING btree ("order");


--
-- Name: payload_locked_documents_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_locked_documents_rels_pages_id_idx ON public.payload_locked_documents_rels USING btree (pages_id);


--
-- Name: payload_locked_documents_rels_parent_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_locked_documents_rels_parent_idx ON public.payload_locked_documents_rels USING btree (parent_id);


--
-- Name: payload_locked_documents_rels_path_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_locked_documents_rels_path_idx ON public.payload_locked_documents_rels USING btree (path);


--
-- Name: payload_locked_documents_rels_payload_jobs_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_locked_documents_rels_payload_jobs_id_idx ON public.payload_locked_documents_rels USING btree (payload_jobs_id);


--
-- Name: payload_locked_documents_rels_posts_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_locked_documents_rels_posts_id_idx ON public.payload_locked_documents_rels USING btree (posts_id);


--
-- Name: payload_locked_documents_rels_redirects_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_locked_documents_rels_redirects_id_idx ON public.payload_locked_documents_rels USING btree (redirects_id);


--
-- Name: payload_locked_documents_rels_search_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_locked_documents_rels_search_id_idx ON public.payload_locked_documents_rels USING btree (search_id);


--
-- Name: payload_locked_documents_rels_users_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_locked_documents_rels_users_id_idx ON public.payload_locked_documents_rels USING btree (users_id);


--
-- Name: payload_locked_documents_updated_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_locked_documents_updated_at_idx ON public.payload_locked_documents USING btree (updated_at);


--
-- Name: payload_migrations_created_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_migrations_created_at_idx ON public.payload_migrations USING btree (created_at);


--
-- Name: payload_migrations_updated_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_migrations_updated_at_idx ON public.payload_migrations USING btree (updated_at);


--
-- Name: payload_preferences_created_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_preferences_created_at_idx ON public.payload_preferences USING btree (created_at);


--
-- Name: payload_preferences_key_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_preferences_key_idx ON public.payload_preferences USING btree (key);


--
-- Name: payload_preferences_rels_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_preferences_rels_order_idx ON public.payload_preferences_rels USING btree ("order");


--
-- Name: payload_preferences_rels_parent_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_preferences_rels_parent_idx ON public.payload_preferences_rels USING btree (parent_id);


--
-- Name: payload_preferences_rels_path_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_preferences_rels_path_idx ON public.payload_preferences_rels USING btree (path);


--
-- Name: payload_preferences_rels_users_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_preferences_rels_users_id_idx ON public.payload_preferences_rels USING btree (users_id);


--
-- Name: payload_preferences_updated_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX payload_preferences_updated_at_idx ON public.payload_preferences USING btree (updated_at);


--
-- Name: posts__status_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX posts__status_idx ON public.posts USING btree (_status);


--
-- Name: posts_created_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX posts_created_at_idx ON public.posts USING btree (created_at);


--
-- Name: posts_hero_image_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX posts_hero_image_idx ON public.posts USING btree (hero_image_id);


--
-- Name: posts_meta_meta_image_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX posts_meta_meta_image_idx ON public.posts USING btree (meta_image_id);


--
-- Name: posts_populated_authors_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX posts_populated_authors_order_idx ON public.posts_populated_authors USING btree (_order);


--
-- Name: posts_populated_authors_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX posts_populated_authors_parent_id_idx ON public.posts_populated_authors USING btree (_parent_id);


--
-- Name: posts_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX posts_rels_categories_id_idx ON public.posts_rels USING btree (categories_id);


--
-- Name: posts_rels_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX posts_rels_order_idx ON public.posts_rels USING btree ("order");


--
-- Name: posts_rels_parent_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX posts_rels_parent_idx ON public.posts_rels USING btree (parent_id);


--
-- Name: posts_rels_path_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX posts_rels_path_idx ON public.posts_rels USING btree (path);


--
-- Name: posts_rels_posts_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX posts_rels_posts_id_idx ON public.posts_rels USING btree (posts_id);


--
-- Name: posts_rels_users_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX posts_rels_users_id_idx ON public.posts_rels USING btree (users_id);


--
-- Name: posts_slug_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX posts_slug_idx ON public.posts USING btree (slug);


--
-- Name: posts_updated_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX posts_updated_at_idx ON public.posts USING btree (updated_at);


--
-- Name: redirects_created_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX redirects_created_at_idx ON public.redirects USING btree (created_at);


--
-- Name: redirects_from_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX redirects_from_idx ON public.redirects USING btree ("from");


--
-- Name: redirects_rels_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX redirects_rels_order_idx ON public.redirects_rels USING btree ("order");


--
-- Name: redirects_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX redirects_rels_pages_id_idx ON public.redirects_rels USING btree (pages_id);


--
-- Name: redirects_rels_parent_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX redirects_rels_parent_idx ON public.redirects_rels USING btree (parent_id);


--
-- Name: redirects_rels_path_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX redirects_rels_path_idx ON public.redirects_rels USING btree (path);


--
-- Name: redirects_rels_posts_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX redirects_rels_posts_id_idx ON public.redirects_rels USING btree (posts_id);


--
-- Name: redirects_updated_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX redirects_updated_at_idx ON public.redirects USING btree (updated_at);


--
-- Name: search_categories_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX search_categories_order_idx ON public.search_categories USING btree (_order);


--
-- Name: search_categories_parent_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX search_categories_parent_id_idx ON public.search_categories USING btree (_parent_id);


--
-- Name: search_created_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX search_created_at_idx ON public.search USING btree (created_at);


--
-- Name: search_meta_meta_image_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX search_meta_meta_image_idx ON public.search USING btree (meta_image_id);


--
-- Name: search_rels_order_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX search_rels_order_idx ON public.search_rels USING btree ("order");


--
-- Name: search_rels_parent_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX search_rels_parent_idx ON public.search_rels USING btree (parent_id);


--
-- Name: search_rels_path_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX search_rels_path_idx ON public.search_rels USING btree (path);


--
-- Name: search_rels_posts_id_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX search_rels_posts_id_idx ON public.search_rels USING btree (posts_id);


--
-- Name: search_slug_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX search_slug_idx ON public.search USING btree (slug);


--
-- Name: search_updated_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX search_updated_at_idx ON public.search USING btree (updated_at);


--
-- Name: users_created_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX users_created_at_idx ON public.users USING btree (created_at);


--
-- Name: users_email_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE UNIQUE INDEX users_email_idx ON public.users USING btree (email);


--
-- Name: users_updated_at_idx; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX users_updated_at_idx ON public.users USING btree (updated_at);


--
-- Name: _pages_v_blocks_archive _pages_v_blocks_archive_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_blocks_archive
    ADD CONSTRAINT _pages_v_blocks_archive_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_content_columns _pages_v_blocks_content_columns_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_blocks_content_columns
    ADD CONSTRAINT _pages_v_blocks_content_columns_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v_blocks_content(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_content _pages_v_blocks_content_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_blocks_content
    ADD CONSTRAINT _pages_v_blocks_content_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_cta_links _pages_v_blocks_cta_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_blocks_cta_links
    ADD CONSTRAINT _pages_v_blocks_cta_links_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v_blocks_cta(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_cta _pages_v_blocks_cta_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_blocks_cta
    ADD CONSTRAINT _pages_v_blocks_cta_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_form_block _pages_v_blocks_form_block_form_id_forms_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_blocks_form_block
    ADD CONSTRAINT _pages_v_blocks_form_block_form_id_forms_id_fk FOREIGN KEY (form_id) REFERENCES public.forms(id) ON DELETE SET NULL;


--
-- Name: _pages_v_blocks_form_block_multi_step_steps_fields _pages_v_blocks_form_block_multi_step_steps_fields_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_blocks_form_block_multi_step_steps_fields
    ADD CONSTRAINT _pages_v_blocks_form_block_multi_step_steps_fields_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v_blocks_form_block_multi_step_steps(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_form_block_multi_step_steps _pages_v_blocks_form_block_multi_step_steps_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_blocks_form_block_multi_step_steps
    ADD CONSTRAINT _pages_v_blocks_form_block_multi_step_steps_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v_blocks_form_block(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_form_block _pages_v_blocks_form_block_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_blocks_form_block
    ADD CONSTRAINT _pages_v_blocks_form_block_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_media_block _pages_v_blocks_media_block_media_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_blocks_media_block
    ADD CONSTRAINT _pages_v_blocks_media_block_media_id_media_id_fk FOREIGN KEY (media_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _pages_v_blocks_media_block _pages_v_blocks_media_block_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_blocks_media_block
    ADD CONSTRAINT _pages_v_blocks_media_block_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v _pages_v_parent_id_pages_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v
    ADD CONSTRAINT _pages_v_parent_id_pages_id_fk FOREIGN KEY (parent_id) REFERENCES public.pages(id) ON DELETE SET NULL;


--
-- Name: _pages_v_rels _pages_v_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_rels
    ADD CONSTRAINT _pages_v_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: _pages_v_rels _pages_v_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_rels
    ADD CONSTRAINT _pages_v_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: _pages_v_rels _pages_v_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_rels
    ADD CONSTRAINT _pages_v_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_rels _pages_v_rels_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_rels
    ADD CONSTRAINT _pages_v_rels_posts_fk FOREIGN KEY (posts_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: _pages_v _pages_v_version_hero_form_id_forms_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v
    ADD CONSTRAINT _pages_v_version_hero_form_id_forms_id_fk FOREIGN KEY (version_hero_form_id) REFERENCES public.forms(id) ON DELETE SET NULL;


--
-- Name: _pages_v_version_hero_links _pages_v_version_hero_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v_version_hero_links
    ADD CONSTRAINT _pages_v_version_hero_links_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v _pages_v_version_hero_media_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v
    ADD CONSTRAINT _pages_v_version_hero_media_id_media_id_fk FOREIGN KEY (version_hero_media_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _pages_v _pages_v_version_meta_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._pages_v
    ADD CONSTRAINT _pages_v_version_meta_image_id_media_id_fk FOREIGN KEY (version_meta_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _posts_v _posts_v_parent_id_posts_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._posts_v
    ADD CONSTRAINT _posts_v_parent_id_posts_id_fk FOREIGN KEY (parent_id) REFERENCES public.posts(id) ON DELETE SET NULL;


--
-- Name: _posts_v_rels _posts_v_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._posts_v_rels
    ADD CONSTRAINT _posts_v_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: _posts_v_rels _posts_v_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._posts_v_rels
    ADD CONSTRAINT _posts_v_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public._posts_v(id) ON DELETE CASCADE;


--
-- Name: _posts_v_rels _posts_v_rels_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._posts_v_rels
    ADD CONSTRAINT _posts_v_rels_posts_fk FOREIGN KEY (posts_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: _posts_v_rels _posts_v_rels_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._posts_v_rels
    ADD CONSTRAINT _posts_v_rels_users_fk FOREIGN KEY (users_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: _posts_v _posts_v_version_hero_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._posts_v
    ADD CONSTRAINT _posts_v_version_hero_image_id_media_id_fk FOREIGN KEY (version_hero_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _posts_v _posts_v_version_meta_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._posts_v
    ADD CONSTRAINT _posts_v_version_meta_image_id_media_id_fk FOREIGN KEY (version_meta_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _posts_v_version_populated_authors _posts_v_version_populated_authors_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public._posts_v_version_populated_authors
    ADD CONSTRAINT _posts_v_version_populated_authors_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._posts_v(id) ON DELETE CASCADE;


--
-- Name: categories_breadcrumbs categories_breadcrumbs_doc_id_categories_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.categories_breadcrumbs
    ADD CONSTRAINT categories_breadcrumbs_doc_id_categories_id_fk FOREIGN KEY (doc_id) REFERENCES public.categories(id) ON DELETE SET NULL;


--
-- Name: categories_breadcrumbs categories_breadcrumbs_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.categories_breadcrumbs
    ADD CONSTRAINT categories_breadcrumbs_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: categories categories_parent_id_categories_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_parent_id_categories_id_fk FOREIGN KEY (parent_id) REFERENCES public.categories(id) ON DELETE SET NULL;


--
-- Name: footer_nav_items footer_nav_items_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.footer_nav_items
    ADD CONSTRAINT footer_nav_items_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.footer(id) ON DELETE CASCADE;


--
-- Name: footer_rels footer_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.footer_rels
    ADD CONSTRAINT footer_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: footer_rels footer_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.footer_rels
    ADD CONSTRAINT footer_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.footer(id) ON DELETE CASCADE;


--
-- Name: footer_rels footer_rels_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.footer_rels
    ADD CONSTRAINT footer_rels_posts_fk FOREIGN KEY (posts_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: form_submissions form_submissions_form_id_forms_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.form_submissions
    ADD CONSTRAINT form_submissions_form_id_forms_id_fk FOREIGN KEY (form_id) REFERENCES public.forms(id) ON DELETE SET NULL;


--
-- Name: form_submissions_submission_data form_submissions_submission_data_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.form_submissions_submission_data
    ADD CONSTRAINT form_submissions_submission_data_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.form_submissions(id) ON DELETE CASCADE;


--
-- Name: forms_blocks_checkbox forms_blocks_checkbox_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.forms_blocks_checkbox
    ADD CONSTRAINT forms_blocks_checkbox_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms_blocks_country forms_blocks_country_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.forms_blocks_country
    ADD CONSTRAINT forms_blocks_country_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms_blocks_email forms_blocks_email_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.forms_blocks_email
    ADD CONSTRAINT forms_blocks_email_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms_blocks_message forms_blocks_message_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.forms_blocks_message
    ADD CONSTRAINT forms_blocks_message_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms_blocks_number forms_blocks_number_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.forms_blocks_number
    ADD CONSTRAINT forms_blocks_number_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms_blocks_payment forms_blocks_payment_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.forms_blocks_payment
    ADD CONSTRAINT forms_blocks_payment_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms_blocks_payment_price_conditions forms_blocks_payment_price_conditions_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.forms_blocks_payment_price_conditions
    ADD CONSTRAINT forms_blocks_payment_price_conditions_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms_blocks_payment(id) ON DELETE CASCADE;


--
-- Name: forms_blocks_select_options forms_blocks_select_options_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.forms_blocks_select_options
    ADD CONSTRAINT forms_blocks_select_options_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms_blocks_select(id) ON DELETE CASCADE;


--
-- Name: forms_blocks_select forms_blocks_select_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.forms_blocks_select
    ADD CONSTRAINT forms_blocks_select_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms_blocks_state forms_blocks_state_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.forms_blocks_state
    ADD CONSTRAINT forms_blocks_state_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms_blocks_text forms_blocks_text_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.forms_blocks_text
    ADD CONSTRAINT forms_blocks_text_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms_blocks_textarea forms_blocks_textarea_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.forms_blocks_textarea
    ADD CONSTRAINT forms_blocks_textarea_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms_emails forms_emails_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.forms_emails
    ADD CONSTRAINT forms_emails_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: header_nav_items header_nav_items_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.header_nav_items
    ADD CONSTRAINT header_nav_items_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.header(id) ON DELETE CASCADE;


--
-- Name: header_rels header_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.header_rels
    ADD CONSTRAINT header_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: header_rels header_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.header_rels
    ADD CONSTRAINT header_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.header(id) ON DELETE CASCADE;


--
-- Name: header_rels header_rels_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.header_rels
    ADD CONSTRAINT header_rels_posts_fk FOREIGN KEY (posts_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_archive pages_blocks_archive_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages_blocks_archive
    ADD CONSTRAINT pages_blocks_archive_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_content_columns pages_blocks_content_columns_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages_blocks_content_columns
    ADD CONSTRAINT pages_blocks_content_columns_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages_blocks_content(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_content pages_blocks_content_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages_blocks_content
    ADD CONSTRAINT pages_blocks_content_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_cta_links pages_blocks_cta_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages_blocks_cta_links
    ADD CONSTRAINT pages_blocks_cta_links_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages_blocks_cta(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_cta pages_blocks_cta_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages_blocks_cta
    ADD CONSTRAINT pages_blocks_cta_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_form_block pages_blocks_form_block_form_id_forms_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages_blocks_form_block
    ADD CONSTRAINT pages_blocks_form_block_form_id_forms_id_fk FOREIGN KEY (form_id) REFERENCES public.forms(id) ON DELETE SET NULL;


--
-- Name: pages_blocks_form_block_multi_step_steps_fields pages_blocks_form_block_multi_step_steps_fields_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages_blocks_form_block_multi_step_steps_fields
    ADD CONSTRAINT pages_blocks_form_block_multi_step_steps_fields_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages_blocks_form_block_multi_step_steps(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_form_block_multi_step_steps pages_blocks_form_block_multi_step_steps_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages_blocks_form_block_multi_step_steps
    ADD CONSTRAINT pages_blocks_form_block_multi_step_steps_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages_blocks_form_block(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_form_block pages_blocks_form_block_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages_blocks_form_block
    ADD CONSTRAINT pages_blocks_form_block_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_media_block pages_blocks_media_block_media_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages_blocks_media_block
    ADD CONSTRAINT pages_blocks_media_block_media_id_media_id_fk FOREIGN KEY (media_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: pages_blocks_media_block pages_blocks_media_block_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages_blocks_media_block
    ADD CONSTRAINT pages_blocks_media_block_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages pages_hero_form_id_forms_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_hero_form_id_forms_id_fk FOREIGN KEY (hero_form_id) REFERENCES public.forms(id) ON DELETE SET NULL;


--
-- Name: pages_hero_links pages_hero_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages_hero_links
    ADD CONSTRAINT pages_hero_links_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages pages_hero_media_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_hero_media_id_media_id_fk FOREIGN KEY (hero_media_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: pages pages_meta_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_meta_image_id_media_id_fk FOREIGN KEY (meta_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: pages_rels pages_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages_rels
    ADD CONSTRAINT pages_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: pages_rels pages_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages_rels
    ADD CONSTRAINT pages_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_rels pages_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages_rels
    ADD CONSTRAINT pages_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_rels pages_rels_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.pages_rels
    ADD CONSTRAINT pages_rels_posts_fk FOREIGN KEY (posts_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: payload_jobs_log payload_jobs_log_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.payload_jobs_log
    ADD CONSTRAINT payload_jobs_log_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.payload_jobs(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_form_submissions_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_form_submissions_fk FOREIGN KEY (form_submissions_id) REFERENCES public.form_submissions(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_forms_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_forms_fk FOREIGN KEY (forms_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_media_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_media_fk FOREIGN KEY (media_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.payload_locked_documents(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_payload_jobs_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_payload_jobs_fk FOREIGN KEY (payload_jobs_id) REFERENCES public.payload_jobs(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_posts_fk FOREIGN KEY (posts_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_redirects_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_redirects_fk FOREIGN KEY (redirects_id) REFERENCES public.redirects(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_search_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_search_fk FOREIGN KEY (search_id) REFERENCES public.search(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_users_fk FOREIGN KEY (users_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: payload_preferences_rels payload_preferences_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.payload_preferences(id) ON DELETE CASCADE;


--
-- Name: payload_preferences_rels payload_preferences_rels_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_users_fk FOREIGN KEY (users_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: posts posts_hero_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_hero_image_id_media_id_fk FOREIGN KEY (hero_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: posts posts_meta_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_meta_image_id_media_id_fk FOREIGN KEY (meta_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: posts_populated_authors posts_populated_authors_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.posts_populated_authors
    ADD CONSTRAINT posts_populated_authors_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: posts_rels posts_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.posts_rels
    ADD CONSTRAINT posts_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: posts_rels posts_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.posts_rels
    ADD CONSTRAINT posts_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: posts_rels posts_rels_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.posts_rels
    ADD CONSTRAINT posts_rels_posts_fk FOREIGN KEY (posts_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: posts_rels posts_rels_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.posts_rels
    ADD CONSTRAINT posts_rels_users_fk FOREIGN KEY (users_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: redirects_rels redirects_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.redirects_rels
    ADD CONSTRAINT redirects_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: redirects_rels redirects_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.redirects_rels
    ADD CONSTRAINT redirects_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.redirects(id) ON DELETE CASCADE;


--
-- Name: redirects_rels redirects_rels_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.redirects_rels
    ADD CONSTRAINT redirects_rels_posts_fk FOREIGN KEY (posts_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: search_categories search_categories_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.search_categories
    ADD CONSTRAINT search_categories_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.search(id) ON DELETE CASCADE;


--
-- Name: search search_meta_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.search
    ADD CONSTRAINT search_meta_image_id_media_id_fk FOREIGN KEY (meta_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: search_rels search_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.search_rels
    ADD CONSTRAINT search_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.search(id) ON DELETE CASCADE;


--
-- Name: search_rels search_rels_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.search_rels
    ADD CONSTRAINT search_rels_posts_fk FOREIGN KEY (posts_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: neondb_owner
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT CREATE ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

