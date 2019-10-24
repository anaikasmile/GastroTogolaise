--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: togokuizine_user
--
CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO togokuizine_user;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO togokuizine_user;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO togokuizine_user;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO togokuizine_user;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO togokuizine_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO togokuizine_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO togokuizine_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO togokuizine_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO togokuizine_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO togokuizine_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: blog_category; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.blog_category (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    update_at timestamp with time zone NOT NULL,
    slug character varying(50) NOT NULL
);


ALTER TABLE public.blog_category OWNER TO togokuizine_user;

--
-- Name: blog_category_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.blog_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_category_id_seq OWNER TO togokuizine_user;

--
-- Name: blog_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.blog_category_id_seq OWNED BY public.blog_category.id;


--
-- Name: blog_post; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.blog_post (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    text text NOT NULL,
    image character varying(100),
    video character varying(200),
    view integer,
    "like" integer,
    created_at timestamp with time zone NOT NULL,
    update_at timestamp with time zone NOT NULL,
    published_at timestamp with time zone,
    slug character varying(50) NOT NULL,
    author_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.blog_post OWNER TO togokuizine_user;

--
-- Name: blog_post_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.blog_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_post_id_seq OWNER TO togokuizine_user;

--
-- Name: blog_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.blog_post_id_seq OWNED BY public.blog_post.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO togokuizine_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO togokuizine_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_comment_flags; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.django_comment_flags (
    id integer NOT NULL,
    flag character varying(30) NOT NULL,
    flag_date timestamp with time zone NOT NULL,
    comment_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.django_comment_flags OWNER TO togokuizine_user;

--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.django_comment_flags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_comment_flags_id_seq OWNER TO togokuizine_user;

--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.django_comment_flags_id_seq OWNED BY public.django_comment_flags.id;


--
-- Name: django_comments; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.django_comments (
    id integer NOT NULL,
    object_pk text NOT NULL,
    user_name character varying(50) NOT NULL,
    user_email character varying(254) NOT NULL,
    user_url character varying(200) NOT NULL,
    comment text NOT NULL,
    submit_date timestamp with time zone NOT NULL,
    ip_address inet,
    is_public boolean NOT NULL,
    is_removed boolean NOT NULL,
    content_type_id integer NOT NULL,
    site_id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.django_comments OWNER TO togokuizine_user;

--
-- Name: django_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.django_comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_comments_id_seq OWNER TO togokuizine_user;

--
-- Name: django_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.django_comments_id_seq OWNED BY public.django_comments.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO togokuizine_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO togokuizine_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_flatpage; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.django_flatpage (
    id integer NOT NULL,
    url character varying(100) NOT NULL,
    title character varying(200) NOT NULL,
    content text NOT NULL,
    enable_comments boolean NOT NULL,
    template_name character varying(70) NOT NULL,
    registration_required boolean NOT NULL
);


ALTER TABLE public.django_flatpage OWNER TO togokuizine_user;

--
-- Name: django_flatpage_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.django_flatpage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_flatpage_id_seq OWNER TO togokuizine_user;

--
-- Name: django_flatpage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.django_flatpage_id_seq OWNED BY public.django_flatpage.id;


--
-- Name: django_flatpage_sites; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.django_flatpage_sites (
    id integer NOT NULL,
    flatpage_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.django_flatpage_sites OWNER TO togokuizine_user;

--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.django_flatpage_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_flatpage_sites_id_seq OWNER TO togokuizine_user;

--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.django_flatpage_sites_id_seq OWNED BY public.django_flatpage_sites.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO togokuizine_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO togokuizine_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_redirect; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.django_redirect (
    id integer NOT NULL,
    site_id integer NOT NULL,
    old_path character varying(200) NOT NULL,
    new_path character varying(200) NOT NULL
);


ALTER TABLE public.django_redirect OWNER TO togokuizine_user;

--
-- Name: django_redirect_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.django_redirect_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_redirect_id_seq OWNER TO togokuizine_user;

--
-- Name: django_redirect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.django_redirect_id_seq OWNED BY public.django_redirect.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO togokuizine_user;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO togokuizine_user;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO togokuizine_user;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: newsletter_article; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.newsletter_article (
    id integer NOT NULL,
    sortorder integer NOT NULL,
    title character varying(200) NOT NULL,
    text text NOT NULL,
    url character varying(200),
    image character varying(100),
    post_id integer NOT NULL,
    CONSTRAINT newsletter_article_sortorder_check CHECK ((sortorder >= 0))
);


ALTER TABLE public.newsletter_article OWNER TO togokuizine_user;

--
-- Name: newsletter_article_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.newsletter_article_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.newsletter_article_id_seq OWNER TO togokuizine_user;

--
-- Name: newsletter_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.newsletter_article_id_seq OWNED BY public.newsletter_article.id;


--
-- Name: newsletter_message; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.newsletter_message (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    slug character varying(50) NOT NULL,
    date_create timestamp with time zone NOT NULL,
    date_modify timestamp with time zone NOT NULL,
    newsletter_id integer NOT NULL
);


ALTER TABLE public.newsletter_message OWNER TO togokuizine_user;

--
-- Name: newsletter_message_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.newsletter_message_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.newsletter_message_id_seq OWNER TO togokuizine_user;

--
-- Name: newsletter_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.newsletter_message_id_seq OWNED BY public.newsletter_message.id;


--
-- Name: newsletter_newsletter; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.newsletter_newsletter (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    slug character varying(50) NOT NULL,
    email character varying(254) NOT NULL,
    sender character varying(200) NOT NULL,
    visible boolean NOT NULL,
    send_html boolean NOT NULL
);


ALTER TABLE public.newsletter_newsletter OWNER TO togokuizine_user;

--
-- Name: newsletter_newsletter_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.newsletter_newsletter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.newsletter_newsletter_id_seq OWNER TO togokuizine_user;

--
-- Name: newsletter_newsletter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.newsletter_newsletter_id_seq OWNED BY public.newsletter_newsletter.id;


--
-- Name: newsletter_newsletter_site; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.newsletter_newsletter_site (
    id integer NOT NULL,
    newsletter_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.newsletter_newsletter_site OWNER TO togokuizine_user;

--
-- Name: newsletter_newsletter_site_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.newsletter_newsletter_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.newsletter_newsletter_site_id_seq OWNER TO togokuizine_user;

--
-- Name: newsletter_newsletter_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.newsletter_newsletter_site_id_seq OWNED BY public.newsletter_newsletter_site.id;


--
-- Name: newsletter_submission; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.newsletter_submission (
    id integer NOT NULL,
    publish_date timestamp with time zone,
    publish boolean NOT NULL,
    prepared boolean NOT NULL,
    sent boolean NOT NULL,
    sending boolean NOT NULL,
    message_id integer NOT NULL,
    newsletter_id integer NOT NULL
);


ALTER TABLE public.newsletter_submission OWNER TO togokuizine_user;

--
-- Name: newsletter_submission_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.newsletter_submission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.newsletter_submission_id_seq OWNER TO togokuizine_user;

--
-- Name: newsletter_submission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.newsletter_submission_id_seq OWNED BY public.newsletter_submission.id;


--
-- Name: newsletter_submission_subscriptions; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.newsletter_submission_subscriptions (
    id integer NOT NULL,
    submission_id integer NOT NULL,
    subscription_id integer NOT NULL
);


ALTER TABLE public.newsletter_submission_subscriptions OWNER TO togokuizine_user;

--
-- Name: newsletter_submission_subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.newsletter_submission_subscriptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.newsletter_submission_subscriptions_id_seq OWNER TO togokuizine_user;

--
-- Name: newsletter_submission_subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.newsletter_submission_subscriptions_id_seq OWNED BY public.newsletter_submission_subscriptions.id;


--
-- Name: newsletter_subscription; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.newsletter_subscription (
    id integer NOT NULL,
    name character varying(30),
    email character varying(254),
    ip inet,
    create_date timestamp with time zone NOT NULL,
    activation_code character varying(40) NOT NULL,
    subscribed boolean NOT NULL,
    subscribe_date timestamp with time zone,
    unsubscribed boolean NOT NULL,
    unsubscribe_date timestamp with time zone,
    newsletter_id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.newsletter_subscription OWNER TO togokuizine_user;

--
-- Name: newsletter_subscription_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.newsletter_subscription_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.newsletter_subscription_id_seq OWNER TO togokuizine_user;

--
-- Name: newsletter_subscription_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.newsletter_subscription_id_seq OWNED BY public.newsletter_subscription.id;


--
-- Name: notify_notification; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.notify_notification (
    id integer NOT NULL,
    actor_object_id integer,
    actor_text character varying(50),
    actor_url_text character varying(200),
    verb character varying(50) NOT NULL,
    description character varying(255),
    nf_type character varying(20) NOT NULL,
    target_object_id integer,
    target_text character varying(50),
    target_url_text character varying(200),
    obj_object_id integer,
    obj_text character varying(50),
    obj_url_text character varying(200),
    extra jsonb,
    created timestamp with time zone NOT NULL,
    read boolean NOT NULL,
    deleted boolean NOT NULL,
    actor_content_type_id integer,
    obj_content_type_id integer,
    recipient_id integer NOT NULL,
    target_content_type_id integer,
    CONSTRAINT notify_notification_actor_object_id_check CHECK ((actor_object_id >= 0)),
    CONSTRAINT notify_notification_obj_object_id_check CHECK ((obj_object_id >= 0)),
    CONSTRAINT notify_notification_target_object_id_check CHECK ((target_object_id >= 0))
);


ALTER TABLE public.notify_notification OWNER TO togokuizine_user;

--
-- Name: notify_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.notify_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notify_notification_id_seq OWNER TO togokuizine_user;

--
-- Name: notify_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.notify_notification_id_seq OWNED BY public.notify_notification.id;


--
-- Name: recipe_category; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.recipe_category (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    update_at timestamp with time zone NOT NULL,
    slug character varying(50) NOT NULL
);


ALTER TABLE public.recipe_category OWNER TO togokuizine_user;

--
-- Name: recipe_category_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.recipe_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipe_category_id_seq OWNER TO togokuizine_user;

--
-- Name: recipe_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.recipe_category_id_seq OWNED BY public.recipe_category.id;


--
-- Name: recipe_categoryvideo; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.recipe_categoryvideo (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    update_at timestamp with time zone NOT NULL,
    slug character varying(50) NOT NULL
);


ALTER TABLE public.recipe_categoryvideo OWNER TO togokuizine_user;

--
-- Name: recipe_categoryvideo_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.recipe_categoryvideo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipe_categoryvideo_id_seq OWNER TO togokuizine_user;

--
-- Name: recipe_categoryvideo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.recipe_categoryvideo_id_seq OWNED BY public.recipe_categoryvideo.id;


--
-- Name: recipe_origin; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.recipe_origin (
    id integer NOT NULL,
    ethnic character varying(200) NOT NULL,
    country character varying(2),
    created_at timestamp with time zone NOT NULL,
    update_at timestamp with time zone NOT NULL
);


ALTER TABLE public.recipe_origin OWNER TO togokuizine_user;

--
-- Name: recipe_origin_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.recipe_origin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipe_origin_id_seq OWNER TO togokuizine_user;

--
-- Name: recipe_origin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.recipe_origin_id_seq OWNED BY public.recipe_origin.id;


--
-- Name: recipe_recipe; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.recipe_recipe (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    description text,
    prepare_time interval,
    cooking_time interval,
    total_time interval,
    ingredient text NOT NULL,
    preparation text NOT NULL,
    image character varying(100),
    image_1 character varying(100),
    image_2 character varying(100),
    image_3 character varying(100),
    view integer,
    "like" integer,
    created_at timestamp with time zone NOT NULL,
    update_at timestamp with time zone NOT NULL,
    published_at timestamp with time zone,
    slug character varying(50) NOT NULL,
    author_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.recipe_recipe OWNER TO togokuizine_user;

--
-- Name: recipe_recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.recipe_recipe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipe_recipe_id_seq OWNER TO togokuizine_user;

--
-- Name: recipe_recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.recipe_recipe_id_seq OWNED BY public.recipe_recipe.id;


--
-- Name: recipe_recipe_origin; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.recipe_recipe_origin (
    id integer NOT NULL,
    recipe_id integer NOT NULL,
    origin_id integer NOT NULL
);


ALTER TABLE public.recipe_recipe_origin OWNER TO togokuizine_user;

--
-- Name: recipe_recipe_origin_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.recipe_recipe_origin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipe_recipe_origin_id_seq OWNER TO togokuizine_user;

--
-- Name: recipe_recipe_origin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.recipe_recipe_origin_id_seq OWNED BY public.recipe_recipe_origin.id;


--
-- Name: recipe_video; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.recipe_video (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    description text,
    video character varying(200) NOT NULL,
    view integer,
    "like" integer,
    created_at timestamp with time zone NOT NULL,
    update_at timestamp with time zone NOT NULL,
    published_at timestamp with time zone,
    slug character varying(50) NOT NULL,
    author_id integer NOT NULL,
    category_id integer
);


ALTER TABLE public.recipe_video OWNER TO togokuizine_user;

--
-- Name: recipe_video_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.recipe_video_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipe_video_id_seq OWNER TO togokuizine_user;

--
-- Name: recipe_video_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.recipe_video_id_seq OWNED BY public.recipe_video.id;


--
-- Name: recipe_video_origin; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.recipe_video_origin (
    id integer NOT NULL,
    video_id integer NOT NULL,
    origin_id integer NOT NULL
);


ALTER TABLE public.recipe_video_origin OWNER TO togokuizine_user;

--
-- Name: recipe_video_origin_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.recipe_video_origin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipe_video_origin_id_seq OWNER TO togokuizine_user;

--
-- Name: recipe_video_origin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.recipe_video_origin_id_seq OWNED BY public.recipe_video_origin.id;


--
-- Name: restaurant_category; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.restaurant_category (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    update_at timestamp with time zone NOT NULL,
    slug character varying(50) NOT NULL
);


ALTER TABLE public.restaurant_category OWNER TO togokuizine_user;

--
-- Name: restaurant_category_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.restaurant_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurant_category_id_seq OWNER TO togokuizine_user;

--
-- Name: restaurant_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.restaurant_category_id_seq OWNED BY public.restaurant_category.id;


--
-- Name: restaurant_restaurant; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.restaurant_restaurant (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    description text,
    tel character varying(50),
    fb_id character varying(50),
    insta_id character varying(50),
    twit_id character varying(50),
    lind_id character varying(50),
    address character varying(200),
    web_site character varying(100),
    image character varying(100),
    enabled character varying(5) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    update_at timestamp with time zone NOT NULL,
    slug character varying(50) NOT NULL,
    author_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.restaurant_restaurant OWNER TO togokuizine_user;

--
-- Name: restaurant_restaurant_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.restaurant_restaurant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurant_restaurant_id_seq OWNER TO togokuizine_user;

--
-- Name: restaurant_restaurant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.restaurant_restaurant_id_seq OWNED BY public.restaurant_restaurant.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO togokuizine_user;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO togokuizine_user;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO togokuizine_user;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO togokuizine_user;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id integer NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO togokuizine_user;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO togokuizine_user;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO togokuizine_user;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO togokuizine_user;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- Name: star_ratings_rating; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.star_ratings_rating (
    id integer NOT NULL,
    count integer NOT NULL,
    total integer NOT NULL,
    average numeric(6,3) NOT NULL,
    object_id integer,
    content_type_id integer,
    CONSTRAINT star_ratings_rating_count_check CHECK ((count >= 0)),
    CONSTRAINT star_ratings_rating_object_id_check CHECK ((object_id >= 0)),
    CONSTRAINT star_ratings_rating_total_check CHECK ((total >= 0))
);


ALTER TABLE public.star_ratings_rating OWNER TO togokuizine_user;

--
-- Name: star_ratings_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.star_ratings_rating_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_ratings_rating_id_seq OWNER TO togokuizine_user;

--
-- Name: star_ratings_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.star_ratings_rating_id_seq OWNED BY public.star_ratings_rating.id;


--
-- Name: star_ratings_userrating; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.star_ratings_userrating (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    ip inet,
    score smallint NOT NULL,
    rating_id integer NOT NULL,
    user_id integer,
    CONSTRAINT star_ratings_userrating_score_check CHECK ((score >= 0))
);


ALTER TABLE public.star_ratings_userrating OWNER TO togokuizine_user;

--
-- Name: star_ratings_userrating_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.star_ratings_userrating_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_ratings_userrating_id_seq OWNER TO togokuizine_user;

--
-- Name: star_ratings_userrating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.star_ratings_userrating_id_seq OWNED BY public.star_ratings_userrating.id;


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE public.taggit_tag OWNER TO togokuizine_user;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.taggit_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_tag_id_seq OWNER TO togokuizine_user;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.taggit_tag_id_seq OWNED BY public.taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.taggit_taggeditem OWNER TO togokuizine_user;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.taggit_taggeditem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_taggeditem_id_seq OWNER TO togokuizine_user;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.taggit_taggeditem_id_seq OWNED BY public.taggit_taggeditem.id;


--
-- Name: threadedcomments_comment; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.threadedcomments_comment (
    comment_ptr_id integer NOT NULL,
    title text NOT NULL,
    tree_path character varying(500) NOT NULL,
    last_child_id integer,
    parent_id integer,
    newest_activity timestamp with time zone
);


ALTER TABLE public.threadedcomments_comment OWNER TO togokuizine_user;

--
-- Name: thumbnail_kvstore; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.thumbnail_kvstore (
    key character varying(200) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.thumbnail_kvstore OWNER TO togokuizine_user;

--
-- Name: userprofile_profile; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.userprofile_profile (
    sexe character varying(10) NOT NULL,
    user_id integer NOT NULL,
    bio text NOT NULL,
    country character varying(2),
    tel character varying(50) NOT NULL,
    photo character varying(100),
    linkedin character varying(250) NOT NULL,
    facebook character varying(250) NOT NULL,
    twitter character varying(250) NOT NULL,
    gplus character varying(250) NOT NULL,
    instagram character varying(250) NOT NULL,
    created_at timestamp with time zone,
    update_at timestamp with time zone,
    slug character varying(50) NOT NULL,
    job character varying(50)
);


ALTER TABLE public.userprofile_profile OWNER TO togokuizine_user;

--
-- Name: userprofile_user; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.userprofile_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    is_contributor boolean NOT NULL,
    is_staff_member boolean NOT NULL
);


ALTER TABLE public.userprofile_user OWNER TO togokuizine_user;

--
-- Name: userprofile_user_groups; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.userprofile_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.userprofile_user_groups OWNER TO togokuizine_user;

--
-- Name: userprofile_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.userprofile_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofile_user_groups_id_seq OWNER TO togokuizine_user;

--
-- Name: userprofile_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.userprofile_user_groups_id_seq OWNED BY public.userprofile_user_groups.id;


--
-- Name: userprofile_user_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.userprofile_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofile_user_id_seq OWNER TO togokuizine_user;

--
-- Name: userprofile_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.userprofile_user_id_seq OWNED BY public.userprofile_user.id;


--
-- Name: userprofile_user_user_permissions; Type: TABLE; Schema: public; Owner: togokuizine_user
--

CREATE TABLE public.userprofile_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.userprofile_user_user_permissions OWNER TO togokuizine_user;

--
-- Name: userprofile_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: togokuizine_user
--

CREATE SEQUENCE public.userprofile_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofile_user_user_permissions_id_seq OWNER TO togokuizine_user;

--
-- Name: userprofile_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togokuizine_user
--

ALTER SEQUENCE public.userprofile_user_user_permissions_id_seq OWNED BY public.userprofile_user_user_permissions.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: blog_category id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.blog_category ALTER COLUMN id SET DEFAULT nextval('public.blog_category_id_seq'::regclass);


--
-- Name: blog_post id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.blog_post ALTER COLUMN id SET DEFAULT nextval('public.blog_post_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_comment_flags id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_comment_flags ALTER COLUMN id SET DEFAULT nextval('public.django_comment_flags_id_seq'::regclass);


--
-- Name: django_comments id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_comments ALTER COLUMN id SET DEFAULT nextval('public.django_comments_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_flatpage id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_flatpage ALTER COLUMN id SET DEFAULT nextval('public.django_flatpage_id_seq'::regclass);


--
-- Name: django_flatpage_sites id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_flatpage_sites ALTER COLUMN id SET DEFAULT nextval('public.django_flatpage_sites_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_redirect id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_redirect ALTER COLUMN id SET DEFAULT nextval('public.django_redirect_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: newsletter_article id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.newsletter_article ALTER COLUMN id SET DEFAULT nextval('public.newsletter_article_id_seq'::regclass);


--
-- Name: newsletter_message id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.newsletter_message ALTER COLUMN id SET DEFAULT nextval('public.newsletter_message_id_seq'::regclass);


--
-- Name: newsletter_newsletter id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.newsletter_newsletter ALTER COLUMN id SET DEFAULT nextval('public.newsletter_newsletter_id_seq'::regclass);


--
-- Name: newsletter_newsletter_site id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.newsletter_newsletter_site ALTER COLUMN id SET DEFAULT nextval('public.newsletter_newsletter_site_id_seq'::regclass);


--
-- Name: newsletter_submission id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.newsletter_submission ALTER COLUMN id SET DEFAULT nextval('public.newsletter_submission_id_seq'::regclass);


--
-- Name: newsletter_submission_subscriptions id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.newsletter_submission_subscriptions ALTER COLUMN id SET DEFAULT nextval('public.newsletter_submission_subscriptions_id_seq'::regclass);


--
-- Name: newsletter_subscription id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.newsletter_subscription ALTER COLUMN id SET DEFAULT nextval('public.newsletter_subscription_id_seq'::regclass);


--
-- Name: notify_notification id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.notify_notification ALTER COLUMN id SET DEFAULT nextval('public.notify_notification_id_seq'::regclass);


--
-- Name: recipe_category id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.recipe_category ALTER COLUMN id SET DEFAULT nextval('public.recipe_category_id_seq'::regclass);


--
-- Name: recipe_categoryvideo id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.recipe_categoryvideo ALTER COLUMN id SET DEFAULT nextval('public.recipe_categoryvideo_id_seq'::regclass);


--
-- Name: recipe_origin id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.recipe_origin ALTER COLUMN id SET DEFAULT nextval('public.recipe_origin_id_seq'::regclass);


--
-- Name: recipe_recipe id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.recipe_recipe ALTER COLUMN id SET DEFAULT nextval('public.recipe_recipe_id_seq'::regclass);


--
-- Name: recipe_recipe_origin id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.recipe_recipe_origin ALTER COLUMN id SET DEFAULT nextval('public.recipe_recipe_origin_id_seq'::regclass);


--
-- Name: recipe_video id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.recipe_video ALTER COLUMN id SET DEFAULT nextval('public.recipe_video_id_seq'::regclass);


--
-- Name: recipe_video_origin id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.recipe_video_origin ALTER COLUMN id SET DEFAULT nextval('public.recipe_video_origin_id_seq'::regclass);


--
-- Name: restaurant_category id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.restaurant_category ALTER COLUMN id SET DEFAULT nextval('public.restaurant_category_id_seq'::regclass);


--
-- Name: restaurant_restaurant id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.restaurant_restaurant ALTER COLUMN id SET DEFAULT nextval('public.restaurant_restaurant_id_seq'::regclass);


--
-- Name: socialaccount_socialaccount id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: socialaccount_socialapp id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- Name: socialaccount_socialapp_sites id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: socialaccount_socialtoken id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- Name: star_ratings_rating id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.star_ratings_rating ALTER COLUMN id SET DEFAULT nextval('public.star_ratings_rating_id_seq'::regclass);


--
-- Name: star_ratings_userrating id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.star_ratings_userrating ALTER COLUMN id SET DEFAULT nextval('public.star_ratings_userrating_id_seq'::regclass);


--
-- Name: taggit_tag id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.taggit_tag ALTER COLUMN id SET DEFAULT nextval('public.taggit_tag_id_seq'::regclass);


--
-- Name: taggit_taggeditem id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('public.taggit_taggeditem_id_seq'::regclass);


--
-- Name: userprofile_user id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.userprofile_user ALTER COLUMN id SET DEFAULT nextval('public.userprofile_user_id_seq'::regclass);


--
-- Name: userprofile_user_groups id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.userprofile_user_groups ALTER COLUMN id SET DEFAULT nextval('public.userprofile_user_groups_id_seq'::regclass);


--
-- Name: userprofile_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.userprofile_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.userprofile_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
3	hermann.kass@gmail.com	f	t	3
10	togokuizine@gmail.com	t	f	1
11	klausyakpa@gmail.com	t	t	11
12	vincmsk@gmail.com	f	t	12
13	briceklaus@gmail.com	f	t	13
17	eliora20147@gmail.com	t	t	17
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add site	6	add_site
17	Can change site	6	change_site
18	Can delete site	6	delete_site
19	Can add flat page	7	add_flatpage
20	Can change flat page	7	change_flatpage
21	Can delete flat page	7	delete_flatpage
22	Can add redirect	8	add_redirect
23	Can change redirect	8	change_redirect
24	Can delete redirect	8	delete_redirect
25	Can add kv store	9	add_kvstore
26	Can change kv store	9	change_kvstore
27	Can delete kv store	9	delete_kvstore
28	Can add Threaded comment	10	add_threadedcomment
29	Can change Threaded comment	10	change_threadedcomment
30	Can delete Threaded comment	10	delete_threadedcomment
31	Can add comment flag	11	add_commentflag
32	Can change comment flag	11	change_commentflag
33	Can delete comment flag	11	delete_commentflag
34	Can add comment	12	add_comment
35	Can change comment	12	change_comment
36	Can delete comment	12	delete_comment
37	Can moderate comments	12	can_moderate
38	Can add Tagged Item	13	add_taggeditem
39	Can change Tagged Item	13	change_taggeditem
40	Can delete Tagged Item	13	delete_taggeditem
41	Can add Tag	14	add_tag
42	Can change Tag	14	change_tag
43	Can delete Tag	14	delete_tag
44	Can add user rating	15	add_userrating
45	Can change user rating	15	change_userrating
46	Can delete user rating	15	delete_userrating
47	Can add rating	16	add_rating
48	Can change rating	16	change_rating
49	Can delete rating	16	delete_rating
50	Can add email confirmation	17	add_emailconfirmation
51	Can change email confirmation	17	change_emailconfirmation
52	Can delete email confirmation	17	delete_emailconfirmation
53	Can add email address	18	add_emailaddress
54	Can change email address	18	change_emailaddress
55	Can delete email address	18	delete_emailaddress
56	Can add social application	19	add_socialapp
57	Can change social application	19	change_socialapp
58	Can delete social application	19	delete_socialapp
59	Can add social account	20	add_socialaccount
60	Can change social account	20	change_socialaccount
61	Can delete social account	20	delete_socialaccount
62	Can add social application token	21	add_socialtoken
63	Can change social application token	21	change_socialtoken
64	Can delete social application token	21	delete_socialtoken
65	Can add category	22	add_category
66	Can change category	22	change_category
67	Can delete category	22	delete_category
68	Can add recipe	23	add_recipe
69	Can change recipe	23	change_recipe
70	Can delete recipe	23	delete_recipe
71	Can add video	24	add_video
72	Can change video	24	change_video
73	Can delete video	24	delete_video
74	Can add origin	25	add_origin
75	Can change origin	25	change_origin
76	Can delete origin	25	delete_origin
77	Can add category	26	add_category
78	Can change category	26	change_category
79	Can delete category	26	delete_category
80	Can add post	27	add_post
81	Can change post	27	change_post
82	Can delete post	27	delete_post
83	Can add profile	28	add_profile
84	Can change profile	28	change_profile
85	Can delete profile	28	delete_profile
86	Can add user	29	add_user
87	Can change user	29	change_user
88	Can delete user	29	delete_user
89	Can add restaurant	30	add_restaurant
90	Can change restaurant	30	change_restaurant
91	Can delete restaurant	30	delete_restaurant
92	Can add category	31	add_category
93	Can change category	31	change_category
94	Can delete category	31	delete_category
95	Can add notification	32	add_notification
96	Can change notification	32	change_notification
97	Can delete notification	32	delete_notification
98	Can add category video	33	add_categoryvideo
99	Can change category video	33	change_categoryvideo
100	Can delete category video	33	delete_categoryvideo
101	Can add subscription	34	add_subscription
102	Can change subscription	34	change_subscription
103	Can delete subscription	34	delete_subscription
104	Can add submission	35	add_submission
105	Can change submission	35	change_submission
106	Can delete submission	35	delete_submission
107	Can add newsletter	36	add_newsletter
108	Can change newsletter	36	change_newsletter
109	Can delete newsletter	36	delete_newsletter
110	Can add message	37	add_message
111	Can change message	37	change_message
112	Can delete message	37	delete_message
113	Can add article	38	add_article
114	Can change article	38	change_article
115	Can delete article	38	delete_article
\.


--
-- Data for Name: blog_category; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.blog_category (id, name, created_at, update_at, slug) FROM stdin;
5	Astuces	2019-09-22 22:55:30.710425+00	2019-09-22 22:55:30.710463+00	astuces
6	Découvertes	2019-09-22 22:55:39.007422+00	2019-09-22 22:55:39.007448+00	decouvertes
7	Santé	2019-09-22 22:55:46.64747+00	2019-09-22 22:55:46.647497+00	sante
\.


--
-- Data for Name: blog_post; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.blog_post (id, title, text, image, video, view, "like", created_at, update_at, published_at, slug, author_id, category_id) FROM stdin;
3	Comment réussir la cuisson de son riz?	<p>Vous en avez marre de toujours rater la cuisson de votre riz? Il est soit trop cuit et collant, soit trop dur ? Soyez rasssur&eacute;, avec&nbsp; nos conseils, vous r&eacute;ussirez votre riz &agrave; coup s&ucirc;r.</p>\r\n\r\n<ul>\r\n\t<li><span style="font-size:14px"><strong>Choisissez un bon riz</strong></span></li>\r\n</ul>\r\n\r\n<p>Optez de pr&eacute;f&eacute;rence pour un riz long grain thaii ou basmati.</p>\r\n\r\n<ul>\r\n\t<li><span style="font-size:14px"><strong>Les&nbsp;quantit&eacute;s</strong></span></li>\r\n</ul>\r\n\r\n<p>Pour 1 tasse de riz, il vous faut trois tasses d&#39;eau.</p>\r\n\r\n<ul>\r\n\t<li><span style="font-size:14px"><strong>Rincez votre riz</strong></span></li>\r\n</ul>\r\n\r\n<p style="text-align:justify">Avant la cuisson, passez votre riz plusieurs fois sous&nbsp;l&#39;eau jusqu&#39;&agrave; ce que l&#39;eau&nbsp;soit plus claire. Ce proc&eacute;d&eacute; vous permettra de vous d&eacute;barasser de l&#39;amidon qu&#39;il contient. Essorez dans dans une passoire.</p>\r\n\r\n<ul>\r\n\t<li style="text-align: justify;"><span style="font-size:14px"><strong>La cuisson</strong></span></li>\r\n</ul>\r\n\r\n<p style="text-align:justify">Dans une casserole faites fondre un peu de beurre (ou de l&#39;huile) qui va recouvrir toute la paroi de votre casserole. Ajoutez de l&#39;eau. Lorsque, l&#39;eau&nbsp;commence &agrave; bouillir , ajoutez votre riz et laissez cuire. Au bout de 15 min environ v&eacute;rifiez votre cuisson si l&#39;eau commence par tarir,&nbsp;laissez cuire le riz &agrave; feux doux pendant 5 min. Eteignez et laissez reposer environ 5&nbsp;min&nbsp;toujours avec le couvercle. Le riz se d&eacute;collera facilement de la paroi de la casserole.</p>	blog/cooked-1239311_1280.jpg		7	0	2019-10-18 16:26:22.221134+00	2019-10-23 15:26:54.86563+00	2019-10-18 16:27:12.461799+00	comment-reussir-la-cuisson-de-son-riz	1	5
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-11-24 17:02:15.061571+00	1	TogoKuizine	1	[{"added": {}}]	19	1
2	2018-11-24 17:03:17.709782+00	1	TogoKuizine	2	[]	19	1
3	2018-11-24 17:05:05.220035+00	1	root	2	[{"changed": {"fields": ["is_staff_member"]}}]	29	1
4	2018-11-24 17:05:35.436407+00	1	eliora20147@gmail.com (root)	2	[{"changed": {"fields": ["verified"]}}]	18	1
5	2018-11-24 17:26:33.666111+00	1	Restaurants	1	[{"added": {}}]	31	1
6	2018-11-24 17:27:02.861398+00	2	Service Traiteurs	1	[{"added": {}}]	31	1
7	2018-11-25 10:59:43.601641+00	2	Log_Google	1	[{"added": {}}]	19	1
8	2018-11-25 11:00:14.783429+00	2	Google	2	[{"changed": {"fields": ["name"]}}]	19	1
9	2018-12-05 11:30:25.347323+00	1	Facebook	2	[{"changed": {"fields": ["name"]}}]	19	1
10	2018-12-05 11:31:20.104535+00	2	togokuizine.com	2	[{"changed": {"fields": ["domain", "name"]}}]	6	1
11	2018-12-05 11:36:33.708688+00	1	Facebook	2	[{"changed": {"fields": ["client_id", "secret"]}}]	19	1
12	2018-12-05 11:46:01.848901+00	1	Facebook	2	[{"changed": {"fields": ["client_id"]}}]	19	1
13	2018-12-05 11:54:32.77183+00	1	Facebook	2	[{"changed": {"fields": ["secret"]}}]	19	1
14	2018-12-05 11:59:20.172285+00	1	Facebook	2	[{"changed": {"fields": ["client_id", "secret"]}}]	19	1
15	2019-01-03 16:09:44.345607+00	2	anaika	2	[{"changed": {"fields": ["is_staff_member"]}}]	29	1
16	2019-01-03 16:13:21.622232+00	6	togo	2	[{"changed": {"fields": ["is_staff_member"]}}]	29	1
17	2019-01-03 16:16:53.724154+00	1	Facebook	2	[{"changed": {"fields": ["client_id", "secret"]}}]	19	1
18	2019-01-05 19:19:53.392338+00	4	larisseadewui	3		29	1
19	2019-01-29 19:59:45.12562+00	1	eliora20147@gmail.com (root)	3		18	1
20	2019-01-29 20:06:29.882948+00	7	eliora20147@gmail.com (eliora20147)	3		18	1
21	2019-01-29 20:07:02.541622+00	8	eliora20147	3		29	1
22	2019-02-21 11:41:12.351187+00	7	larisse	3		29	1
23	2019-03-03 21:17:05.591522+00	3	kabyè	3		25	1
24	2019-03-03 21:17:05.594901+00	2	Naouda	3		25	1
25	2019-03-03 21:17:05.596248+00	1	Lama	3		25	1
26	2019-03-03 21:17:28.544547+00	4	Desserts	3		22	1
27	2019-03-03 21:17:28.54664+00	3	Entrées	3		22	1
28	2019-03-03 21:17:28.547886+00	2	Plats	3		22	1
29	2019-03-03 21:17:54.946927+00	3	Découverte	3		26	1
30	2019-03-03 21:17:54.948966+00	2	Sante	3		26	1
31	2019-03-03 21:17:54.950261+00	1	Astuces	3		26	1
32	2019-03-03 21:18:40.459618+00	9	eliora20147	3		29	1
33	2019-03-03 21:18:40.461518+00	6	togo	3		29	1
34	2019-03-03 21:18:40.462831+00	2	anaika	3		29	1
35	2019-03-03 21:26:13.592567+00	10	lakignan	2	[{"changed": {"fields": ["is_staff_member"]}}]	29	1
36	2019-03-03 22:45:27.352501+00	5	Une bonne salade colorée	2	[{"changed": {"fields": ["published_at", "tags"]}}]	23	1
37	2019-03-04 12:02:39.909615+00	5	Une bonne salade colorée	2	[{"changed": {"fields": ["ingredient", "tags"]}}]	23	1
38	2019-09-25 21:00:18.820268+00	10	togokuizine@gmail.com (root)	1	[{"added": {}}]	18	1
39	2019-10-03 14:10:19.953316+00	2	Love Africa Bar-Restaurant	2	[{"changed": {"fields": ["description", "fb_id", "insta_id"]}}]	30	1
40	2019-10-06 22:10:52.120041+00	5	hermann	3		29	1
41	2019-10-14 19:46:23.525399+00	9	eliora20147@gmail.com (lakignan)	3		18	1
42	2019-10-14 19:47:15.861172+00	10	lakignan	3		29	1
43	2019-10-14 20:03:03.85909+00	14	eliora20147@gmail.com (eliora20147)	3		18	1
44	2019-10-14 20:03:24.375047+00	14	eliora20147	3		29	1
45	2019-10-17 17:09:39.190425+00	1	/about/ -- about	1	[{"added": {}}]	7	1
46	2019-10-17 17:20:20.936549+00	1	/about/ -- about	2	[{"changed": {"fields": ["content"]}}]	7	1
47	2019-10-17 17:23:31.995522+00	1	/about/ -- about	2	[{"changed": {"fields": ["content"]}}]	7	1
48	2019-10-17 17:24:36.03138+00	1	/about/ -- about	2	[{"changed": {"fields": ["content"]}}]	7	1
49	2019-10-17 23:53:55.200263+00	1	/about/ -- about	2	[{"changed": {"fields": ["content"]}}]	7	1
50	2019-10-18 14:00:22.586624+00	1	/about/ -- about	2	[{"changed": {"fields": ["content"]}}]	7	1
51	2019-10-18 14:05:18.823495+00	1	/about/ -- about	2	[{"changed": {"fields": ["content"]}}]	7	1
52	2019-10-18 19:17:15.977437+00	1	/about/ -- about	2	[{"changed": {"fields": ["content"]}}]	7	1
53	2019-10-20 20:56:15.578111+00	16	eliora20147@gmail.com (lakignan)	3		18	1
54	2019-10-20 20:56:15.580567+00	15	eliora20147@gmqil.com (eliora20147)	3		18	1
55	2019-10-20 20:57:57.848283+00	15	eliora20147	3		29	1
56	2019-10-20 21:01:13.162116+00	16	lakignan	3		29	1
\.


--
-- Data for Name: django_comment_flags; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.django_comment_flags (id, flag, flag_date, comment_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_comments; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.django_comments (id, object_pk, user_name, user_email, user_url, comment, submit_date, ip_address, is_public, is_removed, content_type_id, site_id, user_id) FROM stdin;
1	1	toto	toto@g.com		azeetrttytyyt	2018-11-25 16:59:58.060264+00	\N	t	f	27	2	\N
2	1	koffi	eliora20147@gmail.com		ok	2018-12-02 21:40:27.221628+00	\N	t	f	23	2	\N
3	1	root	eliora20147@gmail.com		ok	2018-12-02 21:41:51.662425+00	\N	t	f	23	2	1
4	4	Anaika Smile	anaiika92@yahoo.fr		j'aime cette recette	2019-01-03 16:51:07.136708+00	\N	t	f	23	2	\N
5	7	Sonia	anaiika92@yahoo.fr		Je valide	2019-10-09 19:37:28.804558+00	\N	t	f	23	2	\N
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	sites	site
7	flatpages	flatpage
8	redirects	redirect
9	thumbnail	kvstore
10	threadedcomments	threadedcomment
11	django_comments	commentflag
12	django_comments	comment
13	taggit	taggeditem
14	taggit	tag
15	star_ratings	userrating
16	star_ratings	rating
17	account	emailconfirmation
18	account	emailaddress
19	socialaccount	socialapp
20	socialaccount	socialaccount
21	socialaccount	socialtoken
22	recipe	category
23	recipe	recipe
24	recipe	video
25	recipe	origin
26	blog	category
27	blog	post
28	userprofile	profile
29	userprofile	user
30	restaurant	restaurant
31	restaurant	category
32	notify	notification
33	recipe	categoryvideo
34	newsletter	subscription
35	newsletter	submission
36	newsletter	newsletter
37	newsletter	message
38	newsletter	article
\.


--
-- Data for Name: django_flatpage; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.django_flatpage (id, url, title, content, enable_comments, template_name, registration_required) FROM stdin;
1	/about/	about	<h3>C&#39;est l&#39;histoire d&#39;une rencontre entre des jeunes passionn&eacute;s de cuisine : tous amoureux de la cuisine togolaise et de sa diversit&eacute;!</h3>\r\n\r\n<p>Tout a commenc&eacute; par une envie de d&eacute;couvrir les recettes de certaines&nbsp;localit&eacute;s de notre pays,&nbsp;le Togo. Le Togo est un petit pays de l&#39;Afrique de l&#39;Ouest mais qui dispose d&#39;une&nbsp; grande richesse culturelle. L&#39;une de ces richesses est la cuisine gr&acirc;ce &agrave; la&nbsp; diversit&eacute; ethnique du pays.&nbsp;Dans la recherche de nouvelles exp&eacute;riences, de nouvelles saveurs, on a d&eacute;couvert qu&#39;il y&#39;avait une multitude de plats authentiques et gourmands dans chaque localit&eacute; du&nbsp;pays, mais dont les recettes &eacute;taient m&eacute;connues aussi bien sur le plan national qu&#39; international. Alors, nous nous sommes dit pourquoi ne pas mettre en place un espace communautaire non seulement de partage de&nbsp;recettes mais aussi d&#39;astuces, &eacute;v&eacute;nements et informations sur la gastronomie togolaise et africaine.&nbsp;</p>\r\n\r\n<p><strong>Togokuizine </strong>souhaite rassembler de nombreuses contributions et avis qu&rsquo;ils &eacute;manent de professionnels, d&rsquo;amateurs, de passionn&eacute;s de cuisine, de nutritionnistes et faire &eacute;galement la promotion des produits agroalimentaires locaux. Togokuizine&nbsp;veut vous faire d&eacute;couvrir des plats&nbsp;vari&eacute;s, authentiques, revisit&eacute;s et gourmands.</p>\r\n\r\n<p><em>&quot;<strong>Transmettre sa culture culinaire, c&rsquo;est &agrave; la fois la maintenir et s&rsquo;ouvrir &agrave; l&rsquo;autre</strong>&quot;</em><strong>.</strong>&nbsp; Rejoignez nous comme simple utilisateur ou comme contributeur en partageant vos id&eacute;es de recettes avec nous <a href="http://togokuizine.com/recipe/add/">ici</a>.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>Comment contribuer?</h3>\r\n\r\n<p>Togokuizine est accessible &agrave; toute personne d&eacute;sireuse de partager ses recettes. Pour cela, il suffit de cr&eacute;er un compte sur la&nbsp;<a href="http://togokuizine.com/recipe/add/">plateforme</a>. Voici le&nbsp;<a href="http://togokuizine.com/static/assets/files/Guide.pdf">guide du manuel d&#39;utilisation</a>&nbsp;des contributeurs.</p>	f		f
\.


--
-- Data for Name: django_flatpage_sites; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.django_flatpage_sites (id, flatpage_id, site_id) FROM stdin;
1	1	2
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-11-24 16:29:55.529597+00
2	contenttypes	0002_remove_content_type_name	2018-11-24 16:29:55.54332+00
3	auth	0001_initial	2018-11-24 16:29:55.587584+00
4	auth	0002_alter_permission_name_max_length	2018-11-24 16:29:55.596955+00
5	auth	0003_alter_user_email_max_length	2018-11-24 16:29:55.607173+00
6	auth	0004_alter_user_username_opts	2018-11-24 16:29:55.620225+00
7	auth	0005_alter_user_last_login_null	2018-11-24 16:29:55.629972+00
8	auth	0006_require_contenttypes_0002	2018-11-24 16:29:55.631929+00
9	auth	0007_alter_validators_add_error_messages	2018-11-24 16:29:55.641109+00
10	auth	0008_alter_user_username_max_length	2018-11-24 16:29:55.651464+00
11	userprofile	0001_initial	2018-11-24 16:29:55.740403+00
12	account	0001_initial	2018-11-24 16:29:55.794037+00
13	account	0002_email_max_length	2018-11-24 16:29:55.81572+00
14	account	0003_auto_20181101_1604	2018-11-24 16:29:55.817767+00
15	account	0004_auto_20181101_1605	2018-11-24 16:29:55.819699+00
16	admin	0001_initial	2018-11-24 16:29:55.851256+00
17	admin	0002_logentry_remove_auto_add	2018-11-24 16:29:55.874668+00
18	admin	0003_auto_20181101_1608	2018-11-24 16:29:55.876695+00
19	taggit	0001_initial	2018-11-24 16:29:55.92762+00
20	taggit	0002_auto_20150616_2121	2018-11-24 16:29:55.952389+00
21	blog	0001_initial	2018-11-24 16:29:56.000201+00
22	sites	0001_initial	2018-11-24 16:29:56.010566+00
23	django_comments	0001_initial	2018-11-24 16:29:56.135108+00
24	django_comments	0002_update_user_email_field_length	2018-11-24 16:29:56.170141+00
25	django_comments	0003_add_submit_date_index	2018-11-24 16:29:56.203353+00
26	django_comments	0004_auto_20181101_1615	2018-11-24 16:29:56.205397+00
27	flatpages	0001_initial	2018-11-24 16:29:56.254643+00
28	notify	0001_initial	2018-11-24 16:29:56.31028+00
29	notify	0002_auto_20151221_0737	2018-11-24 16:29:57.104855+00
30	notify	0003_auto_20160325_1920	2018-11-24 16:29:57.21074+00
31	notify	0004_auto_20181101_1619	2018-11-24 16:29:57.213278+00
32	notify	0005_auto_20181101_1640	2018-11-24 16:29:57.215439+00
33	recipe	0001_initial	2018-11-24 16:29:57.384184+00
34	redirects	0001_initial	2018-11-24 16:29:57.449744+00
35	restaurant	0001_initial	2018-11-24 16:29:57.53596+00
36	sessions	0001_initial	2018-11-24 16:29:57.556589+00
37	sites	0002_alter_domain_unique	2018-11-24 16:29:57.616775+00
38	socialaccount	0001_initial	2018-11-24 16:29:58.023653+00
39	socialaccount	0002_token_max_lengths	2018-11-24 16:29:58.244623+00
40	socialaccount	0003_extra_data_default_dict	2018-11-24 16:29:58.303344+00
41	socialaccount	0004_auto_20181101_1621	2018-11-24 16:29:58.305584+00
42	star_ratings	0001_initial	2018-11-24 16:29:58.553133+00
43	star_ratings	0002_auto_20160608_1119	2018-11-24 16:29:58.709191+00
44	star_ratings	0003_auto_20160721_1127	2018-11-24 16:29:58.789231+00
45	star_ratings	0004_auto_20181101_1622	2018-11-24 16:29:58.791444+00
46	threadedcomments	0001_initial	2018-11-24 16:29:58.957446+00
47	threadedcomments	0002_auto_20150521_2011	2018-11-24 16:29:59.048676+00
48	threadedcomments	0003_threadedcomment_newest_activity	2018-11-24 16:29:59.110042+00
49	threadedcomments	0004_auto_20181101_1624	2018-11-24 16:29:59.112215+00
50	thumbnail	0001_initial	2018-11-24 16:29:59.12664+00
51	blog	0002_auto_20190108_2119	2019-01-08 21:20:38.945286+00
52	newsletter	0001_initial	2019-01-08 21:20:39.697049+00
53	newsletter	0002_auto_20150416_1555	2019-01-08 21:20:39.975337+00
54	newsletter	0003_auto_20160226_1518	2019-01-08 21:20:40.161746+00
55	newsletter	0004_auto_20180407_1043	2019-01-08 21:20:40.25626+00
56	recipe	0002_auto_20190108_2119	2019-01-08 21:20:41.601295+00
57	restaurant	0002_auto_20190108_2119	2019-01-08 21:20:41.79116+00
58	userprofile	0002_auto_20190108_2119	2019-01-08 21:20:41.935236+00
\.


--
-- Data for Name: django_redirect; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.django_redirect (id, site_id, old_path, new_path) FROM stdin;
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
q1u5yzxxe6obyfu8zsvjkvkulbizngyr	NjczMWU3NjJkMTE4YTE3YWUxMzBiOTI4NTExMTgyMzMxMWQzMmRhZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjM4OTQ2ODcwNDQ4ZjQzMDdiZGViMzg0ZGFkNmIxOTllOWVhNWMwNDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-12-08 16:32:04.894694+00
npxza2m1ux5qywmfh5sz2x4yc495z0t3	NGM2Yjk3NmZkN2JmYWFiNzA5Zjk5YTliMDkwOTYwYzcxOTI1YzY0MDp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIwMTdoNXpUeURVOTdQSW1nMlNWU0lDNDV5T0taVDM3aiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2018-12-08 17:05:59.955408+00
medrvv015kvrgsymend6kxul3oenc3wl	YTkxZTVmZjVkYzUzMWIyYjQ2MmY0NDkzMTM1YzRhZTc4OWY2ZjJlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjM4OTQ2ODcwNDQ4ZjQzMDdiZGViMzg0ZGFkNmIxOTllOWVhNWMwNDkiLCJhbGxhdXRoX2ZhY2Vib29rX25vbmNlIjoiRFhqaENRU3VqV0Uzb0VvbzRSdkxJR3pxUDBnYUpHeDgiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-12-08 17:11:52.696425+00
12lex0jd5w7748t55srf40oaj5qfnhrk	ZGE0YjM4ZTU4MDJiN2MzYTg4NTcyYjYzNjVlYWFhNmFiNTkyMjcwYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJQV3FqaVlqbjdSOEsxekxKMjBnYVdpeEx3UWlzamxpUCJ9	2018-12-08 17:41:56.202107+00
v97bmv8zrd7sf6q44lfcoehmejvxr2i5	YWM1NTZjNDc3ZGM2NGE4ZmEyNjQ5NGViNTk3YTE2NzFiOTNkYTI1NTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJMc3h0ZTdBdnZ1a1RlNURaeHJvSElaUGNUMkdDSEE4NiJ9	2018-12-08 20:04:07.759803+00
cp39y3h0rvjt7aiskfskshhlgvlq2r1w	N2FlYWY0OGMwZjUyZTE0NmRkMGI2MmZhZGMwYTVkNzk1YmIxNTk0Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ0U3YzMGFaSllQQ2JVMlo3dkl4UzBHcEpqVG1lbDE1aSJ9	2018-12-08 20:40:05.369138+00
sdr4zkzk642bupidswm6gg2nhkz3ug48	YjRiZTEyNTgyYTg4YjAxZTM5MDU0MzBjZDcyMDllYjNjNDAwYzY2Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJraHI2ZHRMcWhuZ3JGelNLVkxGMGdoU2l0Z3dHNGVDMiIsInNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiQnVQak5UM3U2RVE5Il19	2018-12-08 21:25:00.840571+00
honk3zx0px8p7v1dsekx6fdbykdsa2yh	NzgzOTM3YzZiOWJmM2FhY2Y2NDIyMWQwOTJiZjRjNGE5NzgzNTcyMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJxYmQ2TDZvSlE4ZEg5WnpKbUlYZWUwSVRtcDJCd252ayJ9	2018-12-08 21:34:43.01579+00
m51mf9svh7qnahdoqgn7iuj8df2hoimr	NjgzMmU1N2EzODBiNTliMjQ1NTk3MzExYjBjOWY0Mzg0ZjQ4ZmZiYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJCQVpzY2pudFBVcTdZSTlZZ2E4UXJoc3lidDhFenM3eSJ9	2018-12-08 23:17:29.927869+00
iitmdi8yg8cl1rdfia8h5ptaicl4vj5a	N2RjNzA4OGQ0MmUxMWZmNjE0Y2VmMTRlNDkyZDcwNDgyZDIzM2E4Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI3ajlOUEgyWU55SGpVYXBVYXdHYkVpbHhVZUZsVUZvOCJ9	2018-12-08 23:34:34.956651+00
jd674uphjkiutwdgium5153zbplt5o9u	OGJiNGRmMDU5ZTc1ZDk3MDNlMzMyNzNiNTU5NzUyZTliMzgxZDY4MDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJCVVUzM3ZNV2VYa2VUVG81VnBBaTdrTzV0VjB3VWV0VSJ9	2018-12-08 23:34:35.117972+00
2fdl9ikplzjp38dx6z0qidqu3khgmuhi	MzAxY2RhN2I2NjljMTg0YWRiZDQwNThkZjM0Yzc1NmVhNzliNTUwOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJYV1hHNXI2V0VKUGsyWHUwYmxPTWJxeFVwQnZPSjVkSiJ9	2018-12-08 23:42:06.715675+00
hfs04ah7czixqo5mit0ztso7rdsih94f	M2UzMjNmNTc5YjhjNTZhZDM3OTY1YjhmZGUxOTg0MzMyMjdmM2NlODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI5SEZpWEdNU1l5SlJmODFYRDNycmlmZjI5bWVtVWE4MCJ9	2018-12-08 23:55:52.196612+00
ujl0m77hl3s0eki8gic2j621r9zudv38	ZDg5NGI5YTcxNGQwY2QxOGQ3YmMyMjcxM2E0NDQ1OGU3YzJlMzNmODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJTM1BGWTIxMTNGVnZzdGhsTU15RkUydEhiRXdxSnBJayJ9	2018-12-09 00:08:23.711711+00
51cqbn3lu6ibxkxmx0ic7t5u1g5m69so	ZTU1ZWY3NzM1NTdhOGQyN2VmODVjMGM0MzhmNTkzZDk0Y2IxZTBhZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI0T0ZvbzFHaTBVV0lLU2lQbVF4bVFmN3NXUVd3ak1MSiJ9	2018-12-09 02:01:36.522794+00
rlicgarlbrgcf81z2fi83jh8o1w22pwc	YzA0MjFkNGJkYzM1YTM3YmI2YzAzMTM1NTgxMDZjNWQyMmEyODliMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJRejM3VUxtRkQycHJwbzB4RGo3T2lORHdQV1NYd0JVZSJ9	2018-12-09 02:12:27.920307+00
s79ce7k09z8cixcto316m2d17iax0jfj	YTRiNzc5ODljMzZhNjFiMWM2YjNiOTNiOWIxYTcyODgwYWYyYTU0Mzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIybjZkdXJETldMOTg1TFY1N09saVZUSkExVDBLeFBGaSJ9	2018-12-09 02:18:49.932981+00
1zwp2yrs0rgbffxhcvlygiwlbrfmmvmz	YjliNDAxZjcwMTNjOGJkM2IxMjEzM2E0ZmY0MTA4MGQzOTU5NGVmODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJsRkpDckVkbHpxNlJuakxvUEZlb3Bzd0oyVUpNOWpkZiJ9	2018-12-09 03:12:26.828133+00
7nebsgln9fgdt2qqzoj3v3ypxjqybt6d	MWU2NmQzYjIyZjcxZDRlMWM2MzcxOWRlMGQ2NWViZmExYmY2Y2JlNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJOODkzNDVaaDZRTjZXc21NNno5cDlLQ0lRVVVWdzc4YyJ9	2018-12-09 03:30:45.874664+00
90f1acqgevptw8znrg9pufy2jxu391h7	YjU2NzFmMzIxYjIzMWE2OTYwZDI0OWQzY2ZjMjQ4ZDYxOGZkNjBiMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI3aEZQV3ZRWTJpOEdrZUZkMVptVzU3V1R6d0FtbEtObyJ9	2018-12-09 03:35:12.372116+00
ipw5aq0luq52c8qj7l0315ibafl8nb06	NzI3N2E2Y2YxOTI3YWIwMmFkNzZkZThjZmE3NWVlYmEwNWU4YThlOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJQbE9pRjZHMTRNTHJWalZGdDhjekhzMnhGV1M1UUtRUCJ9	2018-12-09 04:02:58.5574+00
n3kxqdi0nfb8fms3az63xnbjasxp01x9	Mjk0Mzc5NGM1OWFiYmE4OTljMTkyNGIxZmFmMmU1YTgyMTg2ZmJhZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJiRnNGNjloTjliS2pKa1BYVk1GY0xWNDBJZUVXTTZlUyJ9	2018-12-09 05:24:44.099713+00
u0b70o6srsb0ixtlw3prn4vhyhnwu28y	OTMxZGRmOTg0YjYzZmZkZTQ3OTM1YjlmZDQxMzFhZDY5MjBjZDk5ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ2eG9FaWxTTTg0NnE2MzlIUGo1eVRKMnNxMnJnU2hhNSJ9	2018-12-09 05:41:25.458725+00
itxsq5b01brkk05e8cmzx31xkx92ne4l	NzFkMWI3ZmRkNjQ4OGIxODI1ZjI4ZTY5OTg5YjA4NmIxMTA3N2ViZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJpcGlaZUF1WlFJZFdqVGNFemx0TUdTMXhhcWVya2lXZCJ9	2018-12-09 07:24:20.539611+00
hb8ppffukakw0s5ceece093i60eswqcv	NmVmY2U2Yzk5ZTQzYTU1ZjZiOTZhYjJjMDFkOTIzOWIwYjhmNmQxNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ3Vml1cGNlSGxZV1RGenQzYVFoOFJlZnlqY0l5TndNYSJ9	2018-12-09 08:07:23.838692+00
p5b31pq2eko70pl8901c1q0irasoguil	ZjE5ZDgzZjdlNjQ1MDQzMTVlYjE0MDNmNjRmZTYzZWM1YzJhZmFhNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIyZzJ5RkZxYlo3ZVpycnBjdkFzVm1aZkNPbldsMFJtQiIsInNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiNGd3aDhacnlxd3VGIl19	2018-12-19 20:28:49.007658+00
zdsobi1668boz02e7eap6d3ow0mfkz60	ZDJmZTAwNDIzMDNiNjllMTVjY2Q4OTc1ZjMwNDlmYWEyM2Q1MWRlYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJWc3RFVnhzbmZWWXZsUFpDN0d0czlWZG1QdlZvdE53RSJ9	2018-12-09 09:59:30.649486+00
jhe8mrc96c4pu2i6xem6i19kp2mrth2l	MmFhNjJmNWEzOTY4MTNlNjQyMGZlOWJmYjZhNDU0NWJkNjRjNTUwYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJIWWVBczc0dnNUV01ZbFA3eTdLc2hLTEVQNFcySXphTSJ9	2018-12-09 10:03:50.867422+00
7pzdstdlbdemyjfgzjz7mu1x2xy08jrr	NGRiMWI2MzI5YjI3MTY1MjBjYmEwMTc3NjFiNzIyZDk2N2E5YWI5Njp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ0dmZrNlJKZDF2UDdQMWJUdUFKMmF4c0NPWVJQUzdNdCJ9	2018-12-09 11:21:05.467035+00
j37yjt78geoym3uzyevttvn68bt73ge7	ZjIxM2Q2NTIwZWYwMDAwYmQ0MDMwN2IwMjc2YzYwYzFhNTlkMjU1Njp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJqWE40ZlBUN2dPU3ZHOXlyWGx0NThmb3E4SmRNZ1N6MCIsInNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwidVBtUlhleVpoY01SIl19	2018-12-09 11:40:01.249687+00
6svij0n3xy3bbejvtk9ywqfnpfrkf1op	NWYyN2EwM2QxOGY0MDU2NDRiNjUyOGI3YTIyOWRlYWEwODllYmM4NDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIyVDBpd0dPUlVxa05uRmc4SHhYMFJEMjA2c0xjZGU5OSJ9	2018-12-09 11:53:43.163765+00
kd22jba7vqw838ex3ilkwagthft9a40x	NWIwOGY1YTI2OWNhNDQ1NzhkOWViZGY5MmY2YzYwNzJiNDFmMjAzNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ5WWpQelFzbW5kZlJXNW40QzZCa3Q3a1pLbHpmTkM0ViJ9	2018-12-09 11:54:24.846675+00
3ysib0a0of7pxq2jp1u45q8hpoogpyoc	NTYzODYxNWZkMjgxMWZmYTU4Yjg1NmEyYWI0MjFmMDcwODE5MWRkMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJQMjhyamt1U3k3RlM3UFNMbG5QajBOejVYSG11bzR1ZSJ9	2018-12-09 13:30:30.196655+00
3gnnnxxfw28g987ntsvhhls18e2klu9s	YTljNDlmYTRiMTEyMjllMzAyODgwMzVlNjhmYzczMTZmNjkwNjQ4Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI3bTJkbHR0U1UyOVJ1R0lUN2VYMU9IQjZpTkxSd3R0NSJ9	2018-12-09 14:33:45.061146+00
f6u1m7syac4k3mio6j2fdfndqttp15ua	N2NjOWMyODA5MTg3ZmQxM2M4MWFkZTk1MzU2YmNhZDk2MTEzNmE2YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJZanVNUlViMEJ2alFZbEZXMms5SjlPWXIxVTJMR1NlaiJ9	2018-12-09 14:44:22.667273+00
aeguhx48f0lxz13h8wno7d6l0zzpppom	ZmRhMzJmYzk1NDI3MGRiNWMzMDI0YTI5MWRhNjU2ZGYyMzI4MTNkNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJOMUZYTjBLSHhVSEp3dHY4a3Y5ZXU3YzU4SVc4MktsdiJ9	2018-12-09 15:22:45.545681+00
o1v2xltpudvuoxtd6zs342e0uze69d3n	ZTNmMjVjYTAyODkyMjQ1NzUwM2EyZmJjYTU5NGI5MzU0YTQ2YmU3Njp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJQd2hNVVR6bGVrOWc2blNDd0EzNURkT2dwZXM5VGdnVCJ9	2018-12-09 15:49:24.137911+00
ywqfawwtct11e94y7ja2zpbibxym9q60	Y2NhODc0MjE5NDRmMDAzN2U1MjZkNWQ2YjQ0ZWE5Y2E0ZDg0NmNiODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJiODV3bVZZaG5FcFA1YUtONWNUQzdoUTZoZUE0ck9QdSJ9	2018-12-09 16:29:54.137249+00
fmh6ym0xtttgbsdgqe0mnsu926csxusw	NmRjYmVmYzk2MzJlMzY5YmJmNWU0NjQ3OGNlNjc1YzJiNmNiOGFjMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJrSENaYU9NQlRIa2hjbWpkWWc4d3lRS2tDbzQ2Qzk3NCJ9	2018-12-09 17:15:09.461818+00
cd5t4yhoemay84mewe54v0t8npql9455	NTI0Y2QzOWZlZDk2Zjk0M2VlYmE5NTk3YTQzN2JhMWE3MzljNjgwMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJldEVTVmRlbHUwNkVUWTNiRTQzYUdZN1J2Vnp1bmFYWCJ9	2018-12-09 17:35:47.90484+00
x4t17prk1lgwi4ubegmxyufzt7d85u0k	ZTBlMmU0ODc2OTkyNDEzYjI5ZTM4YzY3YTFmZGUyOTlmY2Y5ZTFlZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJUakczejFRNWlwN3YyOHdaNzNVNHJUbEdhcVJQR3N2MiJ9	2018-12-09 19:01:08.852563+00
cb5t2oir2l4x0eugh80nrnhidata0ax8	YzJkNjZjMGFjZjNmNDU4YjFiNzYzOWU3NmE3NjlkZDAyMzkyN2I3ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJlbmxlQVg5aDVYM1p0MHJxMXZwR1NEdDNQN1RDMTBUZiJ9	2018-12-09 20:05:01.272545+00
3b44z8jjuo81mgmarxdydbgsayl6zvg3	NmU0N2VlZDYxZTFkMTUwNTk0MTRhZmNiNDMwZWExYWJlYTU0YTFiYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJrN0hBamFxeGZxbXgyR1FHZFpkcFZOZ1NicWRvc2R2TiJ9	2018-12-09 20:34:16.9418+00
82q45wstnon1bbbwws0ou1cfv3mwtzxk	YzExOTJlZThlMjZlZmQxZWEyYWFkMGQ2YjMyYTAwZTgxY2VkZjJkMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJnclJqSmhhQkpzUEFJRE9PR1ViQWxSWmw5NDVSWURwNyJ9	2018-12-09 21:17:05.531654+00
kl6577imp2ekt7owyiafw2fofffwyv7y	MTU2Y2I4OGQ1YjExYmU1NWRhZDE0M2Y1YmIyMmMxODNmMGI5MDEyODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJMRWFFWTM1Qzd5T1RUbTFYRTdsQ1FQc3d1MUZZV3JwTSJ9	2018-12-09 21:22:20.141913+00
mehk7nvr05070a2ih86c7kzi3rgkdc2f	YjQzZjBiMGVkOTgzMDUyNWMyMTgxYmFlNTVjYzAwNGJlNjE5NDdmYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI4bkV5SGV1dE1CSW9jeENMUVdVbFN2Vzh2S0JmcUdJdSJ9	2018-12-09 21:22:20.15043+00
k8az2xkgigeqtwpfxjw7eyld031j437y	YmIwZWM3OTk1M2VhY2U4NjJlODkwMWQwZWM2ZTRhODIzYjMxNzFkODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJDTnBmMlVzVzNGVzRHYUpWMnBaYzZmM3Q3ODJVdVdVZCJ9	2018-12-09 21:24:06.110113+00
v11zxk8ve5x98vu1dzynd0txlvzn72sq	NjZjMzVkOTI5MGFhYWQyYzU2ZTQ3OGQwY2I1OWIwZTYxMGRmZDVhZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJLcUdkTTg0WjlJazBVenhrQzVTc1RKRElLS2hVU2JLbSJ9	2018-12-09 21:24:08.900472+00
zuslkeoke1prnp3m7w56r4emvof6z41a	ZDI2NmJmOTY4NDkxZjBhNTlhNDFlODI5OWY2ZDNjYjc3NTBmMzI1Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIwNEV2Tk1qa3JGalozVWdQNThBdHFUMGlhOXhMaGZKciJ9	2018-12-09 21:31:34.340508+00
ws4shbpbjvtr9s7e3hokyj4p87ucuwvc	ZDI4ZGY2MjVjNzQ5NWU0NTRkYWZjOWQ3ZDY3YzI5NzQwY2Y0NGU5NTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIyNHF2VlhSaXg5NVUxNWl5dWF4MUZpZnZRWVVRdUYxdiJ9	2018-12-09 21:49:58.675466+00
nh04f10f2849ht0i43uh7jixhwse7qni	OTA1OThlZmExMWU0OTczMzE5OTZhZjU5N2UyOGZlZGZjNjNmNmY4Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJSDBSM09OQjQ2VVVDSFRzejYyYlUzb0JZVEFPYUc0NiJ9	2018-12-09 23:01:50.679505+00
2iqt7fe22awvjo2rzs0u34bpqgutg64y	NjcwYzRiYTY0MDcyNjRjNWRlZmQ4Zjg5MTg0M2E2NGVjNGRhZWY3Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJlWW51TnIzZW90bUVrMVU0YkZKaHhYZ0hHQlJKM0l6USJ9	2018-12-09 23:13:25.630765+00
2tnsdd3genx6ccvhl7isgm2k1btj8sfv	NjU5N2NkMGM4OGUyNDY4NGFlNTkxMzM2ZDdhN2QwNjM3Y2U1MmNmODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJheG9UTjN1c3hBTkhQWmo3RUZldElGdFp2Sk1EMUltMSJ9	2018-12-10 00:05:39.988276+00
o95l4e29b7uehwn9x5kxj14texs4rijw	M2MzMTE3Y2EyMDhhNWY3ZjczZWY1YTIwMjlkMGQyZjEzMDc5MGIyMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ3ZlVnaElvZmlKRjNEV2k4QjAyRUNZV2E4SkZNOGZMTCJ9	2018-12-10 00:56:38.89671+00
owln1mpxqvfkkywkdufxfwn151m05zj0	NTQ1Zjc2ZGY0ZTMxZWU4Zjg3MmEzMWUxZTVkOGE0ZTQxMTMyMTY0MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJBMEVVUmkwYzZtbEY5emxPUVNpWmwyN2pjVTNSYldjUSJ9	2018-12-10 01:20:54.983749+00
65r7fgg28j0biuxkcbfxs5ijt92xlqgi	YWEzZjM2N2M0ZTkxYmE3ZjNkZDhkZjUwNmQ3OWNkZjAzZTZmZmUwODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJOdHBlUGNtNWduUHRLeWxmR0poZW1kZGRmQUdZY0YzUSJ9	2018-12-10 01:50:34.756274+00
bcg308d4uwixsz8cs42hyiw8armkf9bh	NDQwNGIyYjc0NjU3OGFhY2Y0OTMwNGMyZjJiYzY5OTIxOTQ2YTkyZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJxS0lJZGRob1JhSFFTekdpZkh5a1FrSWUwNU42cWVTVCJ9	2018-12-10 03:56:24.188641+00
tubznxm5voeys6rt5u6x928cvl4n020q	MzRmOWNmNjI3M2FmNjNmODkyZjQ2ZTZlMjk1YTBkMGM4YmY5N2MyMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ4WnkxRGdlanFzdDV4Z0drbHVieDhGQmxodURLNThPUSJ9	2018-12-10 05:12:17.408197+00
crjasgj4qhsjf8cd4mhf0pr750elqw4o	MmI0Njk1ZGRiODFmNjg3ZjRmNDQ2YjIwOTc5OTc3NjNmZTg0NzdlNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI3ZUNXZFhDeVZUTFBzZWI5WDVLYWxsczlLQUFyaWZjbSJ9	2018-12-10 05:15:40.099172+00
qvjhwboq89uvvn6qefhmbuw204923fde	ZmUxMjBhZTVlNzM0M2YwNmRhMzNhNzEzY2MxNjFhN2IyNGFhZmM2Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJaNkYybmtYTldCaG5HUlVXQTJqdG12dWkzNnZ4dUJKUiJ9	2018-12-10 05:37:39.484515+00
7e76jfnxi0w4xlb4da6pb0yuzrjnvlvy	YjgwOTAwODM5MGNlZmUxZDQxYTYzNDAxOWQ5YTNmM2M5YTU1ZWQ4ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJjMXgxMTJjOEczZFhFOFk0cnE1MEJ5SFJMeExjanltOSJ9	2018-12-10 05:39:09.620893+00
niol0ezbh1kenly7ryvuxjr5dinx8svc	ZTU2MDk4YjBhYTY5NWJhOTZiMjVlOWIwZGU2ZjU5Nzk4NjA5ODc3YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJmN0JycTRGOVRnMkFoNlpKU0ZCNUhUMnhsdU9uSHdVWSJ9	2018-12-10 08:49:38.419896+00
atx5x9qd753j1dxapuxnk6hv6zr1a1gq	YWE2M2M3OTNmYmMyZjIzOWJjNTE2MDI0YTBhNmU5OWZmNjAzNmJkYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJwcWlEaVdsa0VMNUU3VmRoUG1mS2hCdTllQ0E4SHUxaSJ9	2018-12-10 08:54:36.787726+00
tlxl05imac2d9iybcgrkzwxqzlwgvgcv	MmFiMjVmMWViYWI5MDYyYTY5YmNiZWEwM2U0NTYwMGFjYjRiNzBmZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIwZGQ5bTVmR05VaDZtSmMyQWVYbld2SFFhVThzcGRGMCJ9	2018-12-10 08:55:12.255063+00
k5y3b7415curb713mepgr5qhwd0shijt	OWRkNTg1Mzc5NjYxZTA0MTg1NjM1ZTYzMzQwNDFmOGYzZGZjZDBjZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJEUnFYeTJMOXRwVmwwQVZ2UlBDbnNCT01qRTFaNkhDQSJ9	2018-12-10 09:52:40.374806+00
nllnv09ykgiof4bvjgqdhfv86vgqc29z	N2Q3YjQ5NjYzYWFkNjdmOThhMzA5MTM5OTZhYWE5Y2JjMmZlNTlmZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJwREpVVE50SnlGMFJFS21sSVFTbm9ZUWtpQTA2MUhTaSJ9	2018-12-10 09:57:19.433312+00
yvaxedbj6jjn8xebfbfmi12slzu42dxm	YjE1Mzc3OGM4Y2U1NGQ0OWY1MDliYjMwOWJlMDMyYzkxYmI0NzBlNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ3M1lCcEZEa21iQ3pNckRQMjZMS3JDNE53dGRmWE9hNyJ9	2018-12-10 10:10:37.008118+00
llyscpvbwywappjc4mweye8es464gjcr	MTI2ZTRkZTMzNThjN2E4MTE3YTgyMzgxYTQ3MTE0ZWQ3ZWFkNjQ3ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJNQmRCY295MTlvZUZ5RUxkTDRTa3p4dHByZ2lEWlp0QyJ9	2018-12-10 12:20:33.626601+00
24znerx1zis9yfby1fgjc0yoyze7md5e	M2ExOTBhMTkyNmFjYTVlMzkyNzRhYTNiNjBiOTllMGY1YmU0N2QzNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJQejh3U0RVbjE3ZFY1NkZHaTZnVnFZQTFLVDFSRGttZCJ9	2018-12-10 12:39:47.210164+00
jucpe2ca72i2y9va8w3hmxuinvn13dz4	ZDdlN2U1MWFlM2ZhNjllNjg1OTI0NDc4NjExNGNkM2QzNDY5YTc2YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJHejR0SjdrSWdaM1haSXNmYTRkcW1EWUhKcUhvVlQ5cSJ9	2018-12-10 13:18:45.680829+00
ajvu2ih5wz0eof5okmvr0hozqiq8mdsd	NTk5MjI3MWExN2I0NWY0OWE5ODFiMzk3ZDA2NWZjYTkyNzM2ZmEyMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIzRFhXV2pVeXJ0MzBzZWR1cFdxRUN2VkRoSUd0M3kyMSJ9	2018-12-10 13:46:35.962125+00
6njjpprerhzxqg65hcnsdh1ocn6t2s6o	N2RjZDg1ZDYwMGIzMTBhYmQ5MzQ4ZjllZGYzMjRmZmYxNDJjNjBkZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJBbDdxNUM4YWFrT3I4QTZ4VzVlZk9ScmRJZ0Vub1J6ZyJ9	2018-12-10 15:03:06.34602+00
1ji4g4dwkrjtdq3flfntnl4wttyoy74x	YTNmODk0ZjljZmVkZTZmNzRkNTFhZWI0Njc2MzBjMWE1OTVjZjk2NDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI5bzlsaDZYODBkN2pwWWJRRERjOEIwZWJKcjNWTE1ReiJ9	2018-12-10 16:02:53.575622+00
fu42gx2g1pq95mea597z2uy9t2339j47	MDMzMWU1NWEzMGNiOTU3ZmRkZThkYmRiOTgxMTE3ZTA5MDg5YWNjOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI1S2locFVVOUFNUGNaRTY0NmFlOXB4ckE4b3ZCclVrSiJ9	2018-12-10 16:55:24.863964+00
6lbg6ak5igmj60leu5kbycc5jj994h6w	MmFkYzM0NWM3MjAyYjY2MzYzY2Q1NGJkNGUzNDBmMjU4ZDA5MzM1Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJrM0dOQkFDMmJyTEdPbFZsZjhySzc1WjN4a2ExZDNNbiJ9	2018-12-10 16:59:38.555359+00
b3xw0zxyagtzguvibn3nv5gu54iem2z0	NDZjYmU2OGJjNjlkMmY0MWQyMzI2YjI4MTUzN2YzOTQ5YTg0ZDg4ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI4T2pDT0xHaGlia3VUQ2l4RkNMdHE2OVAwNGoxSHhLMiJ9	2018-12-10 17:13:41.779625+00
ki3bk35d3gt7dbklasaxkq7ognl4mnim	NjEyZmI2YWIyZDhiNGIzNzRjOGQ1NzIzNGFjOWE5Y2FlNTFkN2FhNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI1TGpVY3hUWVZhbDd1elRRdWZ5ZEpaR3dTZzdzTHBZYiJ9	2018-12-10 17:28:33.270699+00
zgpzm7fqipccx6umnlls01ea6h4rfutt	ZmYwZTRmZTkzNTQzMjc3ZTRmMjQ5N2UwNzA5M2YyNDVmMDY4ZDNiYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI2OExVU3ZVVFNTS2VlUzlSUEF2bWlIZElDdWlia0NIUCJ9	2018-12-10 17:49:42.203867+00
d4ozhosfn9x5lvpb3nbw2fptssdbj2z4	NWY3ZjcwZWQ4YmYzNzlhZDNjZWFjZWQ4MzY4NzcxOWRhYWQ5YmQzMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJoY1Jzd0phME1PdWFQM2M5ellTUllkRTkzQUpRVlc3NCJ9	2018-12-10 18:58:09.269158+00
4favjsg4pydhcylosqbuwhcbxt81udcc	MDgxMmI1MmE2MzExNGU2MTA4NDVhOGJlOGZjNTk1NzgyZDBhNWIyODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJheGZ3S2NIdGZob0ZRS0NwbDQwT2h0S0JyT2hYVkxGbSJ9	2018-12-10 19:59:17.731805+00
jo1dc1fw5ldtkf4drkq2p89lr1g285pm	YmY1N2UzOTdhZjUzYmMyNjYzY2E1MGFiMzI4ODE1MTJmNTgwZWQ0Mzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJSa243c0tVRWw1dXd6b2ZUUUluYVBoM3FTZG1JSkFHUCJ9	2018-12-10 20:37:21.335683+00
hl38fyyeoxeaxuznsxmb296d4ppshyku	NGU1NmRkYWU4Njc1YTVhZDU0ZGM5YjcxYWYyMzBhZmY5Yzg1ZmNlMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJWd25DUkFzUDBMSjF6RE1KdDhSMzhBang1SHlGZ1FQWiJ9	2018-12-10 22:16:52.063426+00
yxbl8d3seudxqf89ojhsei879l3jisdk	MTQ1NDEzOTYwMzc1Y2I0YzY1YTI3YmYzNTg5MTY1NmZiYjU3MWFlODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJwRXpFT0FWNlc5dWRYNzVMckpRc2E1WlZORElpN2hBVSJ9	2018-12-10 22:48:38.287635+00
zpkygsfl0x5bsvdh5fjvawrkh8smxtxe	MmY5OWI1NDNkOGFkMmMzMjE1NjdjOTFkY2FiNGQ0ZjdlZTk2NzYzNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJCN0JuYm9IMlk4VTZkMXhGUGtmWDdDNnF3czkxN1p5RSJ9	2018-12-11 00:50:08.535804+00
kcr45mtxt1f2ki2rpddcp87jc6m2myx3	ZjcxMmIxZGNmMGI5NzJhMjBjMTI4ODNmOWQ4YTU4NTM5MDVkOWQ3ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzYXRxSEF1UnFQQkpNYUk1bWoyTEM3a1FoUVR5S3QxcCJ9	2018-12-11 00:57:45.310083+00
tp6lifif6rmwk0ufrxl6dy52314uix72	OTUwMTI4NjNmNGFjNmY5YjcwMjE3NGM1MzJiOTMwNjkzNTA1NmY4MDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI2dVZrRzFYckZ4cWpjVXlBTEdZUXNDNVNXZW1Vc0dMSSJ9	2018-12-11 01:52:14.731794+00
io2pae8vlfudr68fzwf04woa4y4enoxl	YjBmNmQwYWFmOWUxN2Q5N2QzN2YyODZjMGUwODkyZmUyODFkMjc0ZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJvVFZwNG1IRXREa1dqeGZsTFZYOFVySlpVMVROOTdWVCJ9	2018-12-11 02:35:34.801207+00
vcldq2wmurof6h7a69f4kyz0rnt6hcyq	NTZhM2UzNmI2NTUwNjI3ZTI0NzEwMzQ1MTMzY2Q5N2ZhNzg2OWEyYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJaUnVxYkFvdmszSXVGTm5XWldlcmE0RmpFNjhkYWM4ZyJ9	2018-12-11 03:36:03.327447+00
adinwanb74s18higy77t1bsbvcg8uxg7	ZmU5ZWRiOTQ3MzU3MDhhNzkyOTg0YWMyYjA2OTZlMzRiNjQ4MmIyZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJhRDl2SW1POXhJaFdsRXZoMUxibEZkc2tSb1BLUXp0WCJ9	2018-12-11 05:55:39.788469+00
0zutsm3qgy36uzgrazvaq3nnmc1d7zmq	NzU2MmIzOTU0NDk1ZDFhNjI5MWZmN2JiMTQ0MWZmMTMxN2M5YjBmMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ0UlNCM05BUEQzbUYwOGsxNXd5N1prWDF6STQ2bXVnZiJ9	2018-12-11 07:32:32.167799+00
icntc7owiatx6u9p8vt3ijjxculnojx3	MTczZjNjZTdjOWE4MmUzMjcxNzJjMDQwMDEyMjdlMmU5YmNkNmRhYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzbDk0NExYYWRXVDBkRlg0bzloa0FXNHdPSDd2bWEyNCJ9	2018-12-11 07:34:31.279834+00
zcqlnso729b6e6xjd9b8lvff4inynlu6	NTUyZGJjZTI4M2YwMDlhY2IxNzcwMTQ2NjlkOWYxNTZhZTJiOGQyZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI3SnJHM1A2b2Q0bWxleFRNNlBCRFFwMFZZOHQ0WkVMWCJ9	2018-12-11 08:14:15.85308+00
usajbfyyje2ia7l0uxbj18c1zlq5ybo6	MWQ4ZmM2NTk3OWU4NzJlNGI1OGY4YzcxNDQ4OTJkNTIzMDFjNTA3Mzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJNV1NXNlVpMkk5UFZwSHdHa1NJUW8xRWE1cU1BRmhsaiJ9	2018-12-11 08:19:37.862797+00
vj86t6wqm6320u8edojzapcwn5tkbfpq	YzkxMTRlMGQwY2U0MTZmYTBmOTQ1ZDAyYTBmNTlhMmExYTA0YTdiZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ4TjVIR1d4TFN4akpOVFZSNDlrWmtXcDJVemk2MEJOViJ9	2018-12-11 08:36:19.082724+00
3oxgexdjx2m26ane73erdy8xve1vyf10	ZGZjZDY4NGQ5ZmFjMjMxMDRhOGUzMTQ4MmM3MGIxNDRjMDBiM2RkZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJjSlZPaUppV0JmbDFPV2tRZTcwNzI5TjhUYUljNDRibCJ9	2018-12-11 09:40:15.131706+00
x6sfk3lhpdfsbzhcf6pbab5g8bh52z32	NWQ1ZTU5NDgwMzVlNjg3MjhjMjEzNzBlN2JhYjljOThkMmMyZTk5Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzU3pZWk00aVVpUFZnUENrNHRxT0R1UGN5cjNhaUlJMiJ9	2018-12-11 10:13:52.656351+00
bh46x5yiwl4u3juh136az9n4ndbsrw4e	OTdiMWE1NzFlNjQ5ODk4MzE3ZDUwN2E3NzNmZDFiY2FiNWMxNzIxYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJUSVNVT3JHWURkQmhVTTFpOGc5ekx2ejVIOUZYTzNiayJ9	2018-12-11 11:58:13.081649+00
qv7gn1i3816ygpvgx42lssy0edm3vgg9	OTJmMTFjZDhiMjAwYzcxMzdmYmIxZGU2MWJkYTZlOGU5YmExMGM0ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJDa2FsUHUxRkcxWEJNVVFOQnBhdjZhdEgzQ3gxWW1UVSJ9	2018-12-11 12:18:54.235087+00
opkv1lwy897h0gbg94vfmmlqqlvqzyb8	YTQ4NTE2NTZlOGY1NDk4OTIxYzcyYTBlMjJiOGExOWM3MWJkZmZmZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ2RTlzOEdtWVgwdWE4TDdLemp1aWV1QTBKcDY4aVF3RiJ9	2018-12-11 14:20:41.617461+00
e5nvdxio2x2gkwj8lhsaolz70qmkpbas	YTZhODIzOWVhMzZjOGUzZGZlMzE3MzI1YzE2ZWI4MWZiMTJkNzVkOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJUSVFjcFR0WjVKeTZoc2ZpY0hWZE9GeW5FSkFUNmRTYyJ9	2018-12-11 15:32:08.540831+00
i8bfnavw1b12n37jttt7s4jl93u1wvas	YjZjNjIzZDM5ZDZkNzkyMzJiMzdjNjUxODdhMmYyNGQ4MmNlYWYzMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJWV0o5SnFvRGtFZU5kazdXeDFoRE9hVjZmcEpBZUNqdyJ9	2018-12-11 15:38:17.539442+00
y5mwr0utnoiyd30vws06y4mg0h6zh0lp	NjY3OTUwYjUxMDdkMTU0MGE2NjUwYzQ1MzkyMzEyMTAzOTAyZDY2MDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ2ZkExbHBDdmluQUlZRjNTSTBLYkhFZ29sNFJQMnV0MCJ9	2018-12-11 15:52:01.53332+00
gu6j21jxeeenu1yituykbrctge6g5ss3	NmExNmM4ZWY5MWZmMDllMjExNDY3MWNiZDM5OWI3NWEzMjZlMTA3MDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJkY1hhWWpHakprWWdaMUR3bmZ2YzJtNE92U0FzblR2YiJ9	2018-12-11 15:58:59.88664+00
jmzn09ro45mf8klly5qdbvooquuh1yjd	ZjZiODk2MjkzODk2NGEwNjViNDFmMzM1YTdhYWUyZjY0Y2Y4M2IzNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ2SG5rbnRUYzlZMlczS1UzV3pBYUtkZE4zOGJxWERkbyIsInNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiMUJmSGo5dUZPOFdtIl19	2018-12-11 16:06:06.291407+00
f6dph9jcvvtwq6ltvlmzu5e2j48s8fov	NTg4NTI3MTJmMzAxODI0YmNiOTNjMmZjNzY3MzRhMjM5MGU3NTEyZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJvRWVPVmtDTjhud29QVzFTOWdnQTVtTWpCbWJwUU1WOSJ9	2018-12-11 19:25:38.058796+00
yvllr4rb8un481rt2ig3yqm2g4bf3iif	NzEwNDM2N2ZmMDZmNDRmN2ZmOTE0NDVkNjdkM2Y0Nzg4ZDdiN2I2Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ1ZXBySVpOWlRpUnNROHQycEIyS0pGVlVEcWhWSmFJRSJ9	2018-12-11 20:45:42.616076+00
8r4iwmijz7tsx3kmxmly4tdirg6hp6rh	MjU3MDE1ZmJhYmM3NDg5ZTRmMmJiYTA0OWY4NGMzZjkwYzFjYzFhZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJFbVk3ODhDTHRzaEpHYkl5WnhwTzRZZUg2amxlc1ZNNSJ9	2018-12-11 20:51:26.946282+00
c54z3g6ym4xiz10h79m3zqb70iy1fca3	M2EwZmExNzEwZjY5MGVlOGU1NjFjYWY2M2I3NDk2MTFlOTQ3MzcyODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzUm9jVUtYQkxzVTBjbDB6UzRkNDB5QnZPbjM5RkRMdiJ9	2018-12-11 21:33:54.872282+00
o1r8m081vz8npbs0vatff3yegp9b6olb	NzVkNTA5OWUxOGViMjYzNjllOTE2Mjc1MTZmM2FmNjYxYjBjMzM4ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJYNWFmN1UxNEdrZGMzQ0pyR21QcGtYZlRwNGNKcEExcyJ9	2018-12-11 21:33:55.635691+00
aa948uz2k2rwp41vxstqjahbzvybcd47	MjVjYjc2YjZkNDYzNTZkZDVlNmUzMmM5NDM0NmY0YWIyMGVjMmNiZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJBM3R5VXhmd0dtcnlVazl4U2psb3BIWm9SYUlvRkZOMCJ9	2018-12-11 22:23:46.086978+00
iz9i1cqhsskcg5blg2lni8p84vbiv1ov	NWMyMGI5YjUyZTUzMmJhNjRhMzA1NGM2MjdlZGUzZDA3OWFiZjFiMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJGY2s2WlVKeWIydDJONnR3cWFpdUNGeWN0elVNbERBMSJ9	2018-12-11 22:42:51.850859+00
fyc9va6kmm7widbv0pi4rlevqqew9iu4	NjI1MzIxNjVmZjkyZmZlZDI4MjE2MjAwZjRhZjRmNzQ3NjlkZjhkYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ1SWdhY3lvZVdkb2FkUjZjQVlGdm1iQmx2ZjAxOXlXbiJ9	2018-12-12 01:24:08.074071+00
63gojh0yb54uu30kz71o953zlu9f3v8p	NTRjOWY3YTgyNWE3YjY4NWYzOGM3ZmJiMjVmYTM5YTE4MTc0YjJmODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJOczUydmEyN21FMEhtYjBkQW5NZDRRTFFnd1VSWWcwSiJ9	2018-12-12 01:28:00.603924+00
jzjceysxh2ft2925sxuo5z0cx1eyhl36	N2I3OGQwNDEyOTdiOTQxN2UzZDgwYmM1Nzk1Yjc2OGYyZjhhOTBhNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJKN3JXQWhmODNsU2o5SnBBRm9JOEY1aDBmcDdyMEViWSJ9	2018-12-12 02:00:08.482351+00
uun663o62y6xurlv3olwxqqbu69lhael	NDYyYThmMWRmNTY0ZmVmZTkwNDgwZjViZmFmMDAyYTY0YWJiMDY4ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJNmJCZFdvQlg4TXFWN3ZmRjRkYnJLWFJuZE5PSzFMOSJ9	2018-12-12 02:45:05.452468+00
xwmodyj7g4upk4dc6jvotcq57j5o57tr	NTIzMzcyMzc0OWU1OGZlMDc0YjlhZjg4NDZhMGViYjUxYjY5OGYyYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJGblM3WW5naWhuVVFjS0NjdDlFM053c2tSVFdVUVZsaSJ9	2018-12-12 02:52:20.783848+00
70bs181pe8gy1jb3hryfmchw46aamuax	ZGU0NjE5M2M1OWIxZjBlMmZhYTliNzdkZGQ4Y2VjNTBiNGEzODBmYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJoNThuWGR0TmVnbmpDdHB1U0tvdVdqTEVpVHFrNFlNTyJ9	2018-12-12 04:15:05.738237+00
7ywl43w6ejgzw05mkdfczf7t6etrhmgj	MGE1MjAzZTE2ODViMmQ0MmJkMDA5MzdhMTA1ZjMxNjgxYzliMGM2ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJUT0FudHRtU3pFR2J6dDdkelVMUjIxR0pvYXJXZGVtQyJ9	2018-12-12 05:37:38.769682+00
d36akzbbsgipcmsvptdqn21wbvmp80m0	MzM3MWY3MmI5NDliZDIxYTVlNzQ1ZGViNWY2ZmZmNTZhNTM2ZjQ2Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJLTDlOZXlEajZ1eGFwOGJlb3ZKQVg4cFpWR3NCV1VBNCJ9	2018-12-12 06:57:33.623414+00
3udowrylpq9otunei7ie1n15igjcz18n	NmI0MWM5NDQ0NTZlZGQyMDk2YjEyMmRkNmQ5OGU5Y2ZmMmY5Y2YyYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJnRnk1cDFtS1N5WlRVa0JXQjQ3aU9kRkRtMERzZEJmZiJ9	2018-12-12 07:43:33.047113+00
4q1eug6deh5bpsqn15bdzbcagv3ldwu5	MzEzMzMzNjAxNDIwOWRkOTQyZTE3NDhlOTY3YjFhOTM3NzJlNmFmMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzODJQR1h1NlZVeHVvbURTdHh4cnYxRTNjRUpsZnVqcCJ9	2018-12-12 07:47:15.088865+00
1omfxyg8d16da46piwzrafezitk61qpq	ODdhNDdhYWQxODEzZjhkNDY1YjM1MmI4NzViZjllYzIxMTZiNGNhNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJhY1pFUU9pM3dHdVBiZldxbHVnM0hQeDB6aXFKQXh1ViJ9	2018-12-12 08:13:03.839421+00
yrbajvmwxwy3194qsszsto466xljwc3l	MDU3YmU3MTAzNjkyMmY2YzY3ZTdiNTA2ZDUzZTM3YzgyOTQ0NWQ3Mjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJCaFYwa2p4c0NvczkxSm0xZlFQWVdHaFFsZFhuVXRURSJ9	2018-12-12 09:13:26.890135+00
4qjzz01ziew4643lytu9tp2ebssj3xp3	YzM3YWFiOTBjOWY5ZDg2Yzg4NWM4OGJmZjU0ZDk2YTJhY2I2NmNkZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI4WFZNUE1mNm1TUGN0QThMYmdOaExiWnZMUmUwbUZhTiJ9	2018-12-12 10:39:16.791069+00
itaovaksbgmfinxnmu9ke2vyv9938idt	OGU4MTJjNzE0YmQxZGQwMTI0Nzk4NjBlODA4N2Q2MzY3MWMzYWM2ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJqVjNZTTBYdklsaHl3RmFZdDRmWUhEUVRtRjg1bnJ2TiJ9	2018-12-12 11:03:59.355566+00
2k8insn6vvucwf6s0wtu8elg7vs0h3g4	ZmUyMGIwYjExMmNjNjE5ZTMyMTdhYWYyOGU3YjIzYzFjNTIyZWJhYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJQWFBJdkxoU1ZrVFk2TmVhV0Q4a1lJbllZVkVBMVE4WiJ9	2018-12-12 11:33:00.700096+00
g36tw0s6xs2pwru9axz7aw9qsmdh6c0u	YThjOGM3NTk0ZmVkNTBkOTliMjE0YzJhNjhlNDJmYWIzY2I4ZDExMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJWQ1dMUmhxQUhDOGVNTVM5bDVKSkFnUXA0MTFBbnFkZSJ9	2018-12-12 11:48:05.589828+00
zf6oj2dxwkaqxvyb77l7k1mcxwm2kjkl	MzNlMDEyYmE0NTJjNWMzYTNiYWU1NjkxYTI5MDI5Y2UzOTE4NThhNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI5b3doVExER242d1BZQ05ZYmQ4bEE3dmY3ZE1XSTNSbiJ9	2018-12-12 13:33:17.365629+00
xdde2gxt20rvo7m6mffd8sf46ehrw8rz	MjRlOTMxMzNjNmNjMTVlNjhkZjZmZDZkNGM1YjFhZjE5NjAwNjI5Njp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzbEt0VkJZSVdydkJyWXJkcHZmemY0U0lNN2M1ZXhpbCJ9	2018-12-12 13:41:30.440767+00
btfij146jgr2inqboaa0kyaae7zb0vmy	NjQzOTFjMmU4M2RhMTQ5MGY5NmEzYjFjMmIzNWQ0NGU5MzU0N2IwNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI2bkFnSmZFY0hNM0ExMFRmUU96eEJkUUdUd2hNRHZNSCJ9	2018-12-12 13:59:01.519879+00
tf0tbcdkgvfgis4e1965rlqmyluvtfnh	MDQ2OGRhZThmNGRiMDhiODdlNTMwYTgxYzc5YzVmNTU5YTVlNTY5Njp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJnaWluR1J1M0hGYzRSb0JLME5BbkZ3RW5IaXdTM09hbCJ9	2018-12-12 16:52:59.780508+00
8lfu8dfmqh9atoj2iysdwzfv4g6osej3	OGU5ZjcyZGMxN2I3YTEzYzY4ZWFlNTA1MTMyZDExNTgzODIzODI3Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJnaExFQVREdmx1ZDQ4elR4d25SZ1F3QWc1ZjhHd0NMWCJ9	2018-12-12 16:54:47.931028+00
5pnk6mnmvu2l9inidsztgc663quz402z	MTIyNmRmZmY4NzUzMDZmYWYxYTRiZmM5ZjgwOWMzNzI0MWE0M2EyZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJIejN4U3JXTW5rb3BQMXpUM0hCc1JjczZBYno4ajhMNCJ9	2018-12-12 17:56:23.481466+00
kr2fibjw7qypriblxuwv7gmsk73v8e05	NzljMjQyMzk4NDk3ZTNmM2I4NDA4YjdhMmEzZjc1NDQ0NjU2NDM0ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJsSklnWFNVOWlvd2xXTmZTRHRLQ3lYWWwzUkRHYkRHdCJ9	2018-12-12 20:45:09.511845+00
5h84tv01qt2qwm5pipdmpc1yngrbukre	MWJhNGNhOTI4MTU3N2YwZDNiNjY5N2I0ZTNhMjQxZDA5YjY2NDlkYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJCSU9UTDFkSFY0QTBZc0VBM3lWNWVqZ013bzBGNUk1OCJ9	2018-12-12 21:41:34.828255+00
lc80jsah4zjdfkxt3t27z4f4x6fdh2m1	MGU1MmI4ZDM2YWM0OGM0MDUzMjk0MTQwNTY2MDJhNDBjYjRlYmQ3YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJyZ0hVSHo5NkdUalh5b01aRGxoZ3A0ZFQ4TmxXWk5UayJ9	2018-12-12 22:16:00.726365+00
1aw73aq2v6bu1t9wntomh2ht3wbikfas	MTY2Zjg3Y2M0OWNjOGU5Mzk5NWE3NTI4MzExMWUzMjRmZmI2NWVmNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJDTUdmUUNNR0h3THhOc3hSWG1CeHA3RGV4cE9teGpOTiJ9	2018-12-12 22:16:14.112481+00
8v6t1apzfxfjskr9tf1j5bwtvhaqdiuw	MDAwNTFmMTgxNTg3MTkzM2UyMjE2MTEyNTZhMWU5ZTIzMTU1ZGUxZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJwZ0hueTR0T01UVEM1OEt4WWttWFJOMlJtcm83WDRuSyJ9	2018-12-12 22:16:19.458564+00
qro0kuqkkqw03pyq56cz2zul4x1xuze9	YjE2ZTNhMTM1ZTgxOTA2NTdiN2U3ODBkYjA4YmMyYTU0MzZjNTQyNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJnY1NvSzRIWlBMRW5HdDBQWTFZVGFTWUxYbmhOVDN5dCJ9	2018-12-12 22:17:06.954876+00
vu8c0gpj94d5bnu37k0f41pepte0j70d	MGMwOWUyOGMzMDM4YzY0NWRkMmU3ZGQyZjZiMzY4Mjc1NzY3NzIzYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJPb1NpQk5YOUhvOWdBRGpuSXYzV3Fjd1A5NWpkQ0p6ciJ9	2018-12-12 22:17:07.32958+00
6xs2v9a4yohpp45grntzrtu5tqgnqfle	NjIyNmNhNzMzMmQ2ODEzMTc0YmVmZDRlNDU5NzZkZjE3OTlmZGI1NTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIzMkwydThhelFQQnpzSnljVURxdjJQMnZqc2hWMVFqMSJ9	2018-12-13 00:11:55.503008+00
v4grqe165wu80xozq1qyx7ogoipobhfi	ZGI1MDI0NjAzYjI0NjIyMTA3OTg2YThmMzc3YjQ5ZTc4YzdjYzQzOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJPcEVDUWhUd0pndVFZNlBrZGRBbmlQOVpoakRMUEc0QSJ9	2018-12-13 00:22:08.364251+00
0ghv8srmsktogrgbl0qxtg6zch8yamsh	N2RhODA2ZjFmZjU0YjE3MWIwMzg0NmU3ZjBmMTc3YWU0Njk0NTg5ZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJyeGZ3M1FKUnNSeENTS3dubjdhM0ZTbVhoVVpKUnJ0VSJ9	2018-12-13 01:26:56.769501+00
vyckubzd2xx5l9cfx7p27pec2xob7ds4	ZThjMmY3YTMyNTRlZDI4NDdiYTBiZDNmOTkxYTFhYTZkYTIzYmNhODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI2eFMwSDdKVjFRZ3JVaHFOWmw2OGF6SmFVQWJaeWhlWiJ9	2018-12-13 01:36:48.901754+00
mz9qicag74hzkvunucqa7ofbx70niq8x	NThhOTNmYzQ0NWUxY2FiZjMyOWRkMDZhZjVjYjFlM2MwODhhYWIxODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJhdmc1enhjUTZndEtrZk9EQnJWRTRhV2w4YVE0azE0MCJ9	2018-12-13 01:49:37.085615+00
fn6yiergfc9sui04tlxu6su7a78oe6nf	MGU0MGFjMDBiZDBmYTk0M2ZhNzM3Zjk3ZmU4ZWRmZWM2YzFiNjhmMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJXeUJhWm1qY1JpaFBReHRkNzFHYXcyWDFiQVVuRDgwRCJ9	2018-12-13 04:37:58.164001+00
b2hn4cprw9ctr58pt5ar2qn1uihs75sp	YWYzZWFiNWM4YjI0ZTdiMDU1YzJjMjQxMTZkNGYyM2M0YzdmMmMxMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJyTUtqd3RxYUxPMGIyUDhnTG9KdzVkRldMYmV2UEFvSyJ9	2018-12-13 04:41:52.940156+00
6nw60cbeoqwgpmzb3gprqbnbf0xfd0uw	Y2ZmZTUxM2IzMGIwY2Y5OGUxYzYxNTMwZjQ3YzVmNWM1YTc2NmM5Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzTzA0amxRU2JCWlczY2FweHpjS1gzZ003ZEpjNkg0YSJ9	2018-12-13 04:56:54.124294+00
rk3ymmt76bc8yhsp2gmbtxaj55dpxaue	N2JiYzY0NTg1Mjc4ZGYzZmI2ZWEyYzdmOTA5MDVkZmQwMjVkNmIzMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJmTURBQXJXOWtiZGMwWWtjTVNRMzVXYTNwUzRrQzAwMyJ9	2018-12-13 05:28:10.181139+00
0oukhdvclnoxj70lmj634m6k1tb06ny9	OTRjNDc4MDk4NGQwYmE1MWI5YWNlMjgwMWI4NjA5YmNkNWFiMDZkODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJTRUxFTndVR3VvU1BFbVdzYXFLT0V2WFdKQlo1QjJmTCJ9	2018-12-13 06:53:46.790181+00
5stp20hthfo9cris7v32qgvxy5d6fyty	NDVjNjcyNGQ4ZjdjNmNlODcwYjAxYTEyN2I4OWI2ZGRjNzg1ZWJkNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJianRUV2FqR0hEYzNwNDB5S0pHbEVOV0hYRFltZUN4bSJ9	2018-12-13 08:16:16.545807+00
4mcfbp8akgva04x7nbgzirdsncjnf1ym	ZWZmYzk0NDU2ZWNkMGMyZTcxYmVmMDYzZWE5ODU3YjgwMjBlN2E2MDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJmakkzbjYxckdSeDdIdjRsTER2QUYzbEcwczc5aFd2RyJ9	2018-12-13 08:17:46.921615+00
ay7tojyiftzokrohcwyes6frwfbh7b5s	ODU0ZDkxMDQxZDMyZDk0YTMxNDlkZDg5ZjdkNDdjNGYwYTFkMTczZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJQSFQ1U0Vpd0dwNmhIVUdwcWx6cElNOUVhb3hPRERxWCJ9	2018-12-13 08:37:02.486838+00
g4vexcts389snfbtozlvvnoogign8scp	Y2ZkYzhkYzljOTAxNDFkY2IwOTJmMmZmMzA5YTE5YjQ3NDY5ZjU1ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI0N3JLTXlOSXBiN0k0QzVGM1Q0NnVERnk5NThtd0xHbSJ9	2018-12-13 08:51:23.746041+00
uu59np7367awj7ri3zbua1y0n8wic3d8	MzAxNzdlOWNmZTU2NmUyNzIzYmNkNzU2ZjA1ZmJjZGYwODEwOTY3ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJyUTVMNGtRckNBdFZpYVNLdXZ1bFFMNEdCZE0xdFlMQSJ9	2018-12-13 10:18:37.111847+00
rezsflw8y7koiit7xjrdt1e5e1rbfotl	MDBlYWYzZjg2YzFmYTBhZjljMDg2ZDViODJkNTcyMDQxZjFmNmU0Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ1ZXFHMmlBbmxpekt0dlhINUNCcGRnYWF0dDJXb0ZJbSJ9	2018-12-13 11:39:41.30055+00
jyuaa6u95ns9hfrvv8ntbnt2wc1v1bxz	MmUwYzlhMjI1YTAzYWFkMDNkODNkNDg2Y2E4ZDY3NTE4Zjk2ODc1ZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIzcml6RUJUUjFKYjVjOFRPblBFZXRyY2FHS3h0M2JKSCJ9	2018-12-13 13:02:43.114145+00
7dzlao7v0kzqhngev2wd8mivbhx2v064	YTg5NDZiZjliMzJlYmMyZjI5NTIyMGEwYjBmZDkyMDA3MzYzZmM1YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ1QzBteGJNRHhFQ1NpZmxGTXdwUmNHR05USEFOQWFyTiJ9	2018-12-13 15:28:46.066499+00
4utlytn1nvuv6qup7hnzgfcgl9ql4tuj	M2I3NTYwNTBhZDU5MDhjNjEyOWE1OTJlMDI1ZWMyMWMxMTIwN2M4Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJoVzNnblA0WTZiMEpUaWhtNldaYm5QU05mRXF6ckhkZSJ9	2018-12-13 15:36:23.931786+00
6foults7z6kvloqi8m6zebd3x2ic4hjb	NTI5MjUwM2RmNmFiZDg3NDA4NzUwZDVlNTFkYWI5MjY5YTk1MTcyODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJUMDFBVlY2UDVqMkhEQWVrNUtQZTBoZWFyVFBZc09UaiJ9	2018-12-13 15:58:37.119548+00
vy852m3smvhejqcu2sc1rpwou5du7zxy	MTVjMzk2NDQ4ZGM5Yzg5ZmEzZjI0OGY1NjJiMTJhZDkzZTBkYjRkZjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJaFBoVnNJdEdhYmFkYUJjdmhEOWluM2RXZVBaZGptVCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2018-12-13 16:21:21.643839+00
x7cadfsm9b8p2q0koimmvxniv8lrq3t2	MDhlYWI3NTk1OWJiNjg5M2FmYmM1M2EzMzBkYmQzZjk5NjA0MjIwNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJqU1E2bnJrRkVqejBaSjUzeTZSMEFNU29GNWExd1ZVZiJ9	2018-12-13 16:40:45.148076+00
f8v0uohj9g1fp617s0s7s2sb1erdgljj	ZWYxMmY4N2E5Yzk1MDkxMzZkMTc1M2RiYTJkNjc3Mjk4MTk0N2M2ZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJEZHJmZEZCcjJxSTN1bEd4a1NwNTA3NWZZWHo5U2ZqWSJ9	2018-12-13 16:42:01.52612+00
79k63msshaa78jwn3x5dtwbwwrdc4cp7	MjBkNGNkZDE3NWM0NWQ5YzhlNDM3MmYyY2FkMTgzYzFkODlmMDUxYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJSZzNjeFpkblVuZE40ZXpjdWVrN1NYdEpiZHZhUURrbCJ9	2018-12-13 16:45:37.573766+00
req2mvhuukuypvv2ra89vn14yoyw9lmq	N2I0ZWMxZmM3OTI0MDI0Zjk4MzZkY2I3ZmUyNjA1MGMwZTE2NmJmYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIwSWk4RTdNWGRmZ0dyR1cyUEVSVFlYZ0p3OXZ2eFh4RCJ9	2018-12-13 16:54:12.655781+00
n0himklt6f4vsjz5cotdqyito0qsx9du	NjE5NTQ4MTNlZjc3ZWQwZTliMGRhNzRmYTU4MDNmZDFiNjAxNjU1ZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJZUlBSejNEdjYyeTBoUUpwVzZieVVNY3dBdjVWNDdJcSJ9	2018-12-13 18:49:09.551374+00
6d3brqz1a0ceg4rkbsbc7r0vb0x6zx8j	MzkxZGI1NTkxZGE0YTRiNmQxZDIzOGIyMTlkNjQ4MThmNTc3NTNjZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJNbmR4S2NUWUVwQkl1WUJFYmE0Uld6cHA2UXVJOGU5cSJ9	2018-12-13 21:09:27.543816+00
eopknk6gxqlhzliby9y2320k1ssrll4w	MGU2N2IzM2RkNmU5ZmM0MzBkMjg2OTIyYjk1MzMyOTc0Mzc3ZDRhMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJlV1E3ZEZOdXlMOUttd09ZbG10SXhZeG16aGRGWHBxeCJ9	2018-12-13 22:06:19.671961+00
99h5isjtc0itsqq7syibszow9uajwzr9	NTdhYTcxMmEyODMyNzg3N2I4MmVkMDcyZmY2OGE4YmQ3ZjM5OWNkZjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJLQlhsMUtWRGhCQWRFNnZIRzNSTGNnWTdWTUhEajJEdyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2018-12-13 23:22:55.146605+00
lg9q40t4skz0dq3myxygluz46dtq95w8	OWQ4MmM5ODliOWFiZThjZDIzYTcyYjRhZTljYWU3Njk1MjJmYTVmMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJiekw0d21aQ1g1MjNqS1BKNXZuUGRWVVRpZUg1U0o4VSJ9	2018-12-13 23:25:51.547261+00
k8zrw4qbvi49lqwsxwfokbir8vynim71	Yjk3NjUxNDgxYzI0MzQ0MDkzNGIyMDliZWM5YmRmNjcyY2JhYWZjNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJtS21oWEFucmM0RXVwQVhURmsyNkVpcWNaQ0pmcU42YSJ9	2018-12-13 23:25:51.567225+00
jt2vs7jju0qa8zs08b9ul6nan09m1doy	MWVkYjJiZTg5MGNmNjgyMzA0NGY0ODRkM2M1ZTk2YmE1N2IyZWE5NDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ1aG94dldRbEFlbEo4WkRNMDQwRkptWnFiMnltbEptRyJ9	2018-12-13 23:46:46.735029+00
mgk37y0z73ax9zezjjqtnqu3okfoeu3v	NjgzYWZhODhiNmYyZGQzYWFlYzcwY2Y3N2ZmOGM0M2IyYzEwYjY2NDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJrdkNRRm9CeUdjTmg1WTJHTkdBQmdOd1RYeGI1RDZmSSJ9	2018-12-14 00:05:47.735125+00
20lx5im2jig8lg68ztk1tpj8f65mg8hi	MGIwMzU1Y2VhNWQxZjMxMzVkNmU1OGEzZDY0NzBiNTJiNGU0ZDM4Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJYZ1B3Sm1EM1RWSzd1d0ZQWjA1NG1OUGJLWEtmN3dkRyJ9	2018-12-14 00:23:31.989428+00
363f28yqiztxlgepzfv44tljf9y70mmd	MDFhNGI0MGFjZGFhNmM1OTRkYjE5Yzg4MzU5OTJiZTNmOGFmYjg3Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJFd1o0ekY0dFIxOFJhQk1iaWlBY3lsaXQyR3V5eGVnNiJ9	2018-12-14 00:23:31.989947+00
r9n0gycyw3p4hdkhs1e63n9hlmf7cc0y	OTMyZTI5NTU0ZDNkOTc0YjZkMTE2NzIxNDYxNTgwNTI3ZGE1MmU2ZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIxNUhCaUlJRkZkTXdhZ0xtMlZOcDdMZnEwSlhuTjRTcSJ9	2018-12-14 00:29:52.371566+00
vxvyj8qm8n2z4j7d3s6jlt1p9jdqn473	ZDA3NGQwZDExMmY3YmY2YTVkOGUwODYzZjkyZGU4ZjhhN2YzNTgxMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI1QVBSQ0x6THowRGlwNml3NkxGV3QzdVlVdk1yZ1c5YSJ9	2018-12-14 00:49:55.333874+00
xnevc80qrsapiq4jyneibvxhgkuu3ejw	NWMxZmE3NGI5YzcxMjdjZTJjMzFjZmMyZmVjNWJlZmYzNzI2YzE4Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIydzNWb1hWOTJoWFhseEV6U01RMW5GWXBVOXVSWk1LUyJ9	2018-12-14 00:53:28.00853+00
q4dz8swzhu6tes3s82kms2tls8ksve83	YzVkZTZlNGM2MDE2ZjZiNWRmYjEwODg4NDQxODEyOGMyMDkyYmY1MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJXb3Q4ZzY4M280V2gxUEx3S2ljcEd3TmhmTmExTlZhUCJ9	2018-12-14 03:37:40.734287+00
vntc4bm7yn5lbsnu5q5sxqgvcgfyaik6	ZTRhZTg1YmFmYmMyNGZlYjY2NmU1MmE2YTFmMGE5MTBhNDA2ZGIyZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJHbzNmWTg3c2dkcFVySzdkQzFIS2FEWmJmWnlmeWpRNSJ9	2018-12-14 05:09:10.650026+00
fyck1oe0r9vvnp8km6ci3c49o16infbk	MjY4ZWZmYjUwN2IwZjUwNjA3OTc4OGJjNjkzNmUxN2NlNjVmNzVhZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJNQ3NqN3FyNkJ1Y05TQnY4d2lidTlmTUFQRWJOS1ZtYyJ9	2018-12-14 05:56:20.591912+00
t90726txrd4fi9cpmdjato9i437be3ux	N2Q3OGEyYWI3Yjg1OGZlNDJlZDEzMjUzNzgxODFmMzExZDdlMzEwNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJXSlJ4a0dPRkUwRTBoMmo4RUhDZjNaUE56QVZrM0szMCJ9	2018-12-14 08:10:07.004689+00
amp85yjpp4bef48owzniikpk3xuodo2o	MDFlNTM2OGRjZmE1M2VmOWRmNWIxZWY3MWQ0MjAwMjNhZjUzODFhYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJHZFA4UW9XYjVLS3dUYzNSWG53NFZKUHlaMGRoS0V3bSJ9	2018-12-14 08:10:24.467492+00
ltaewrqnc87hhb89sp3g0jxkb9d1y4hw	NjNjNzEyZGM2NGViYzBhMzg1NzMyNThkM2JkOGQ1N2U5MjY0OTA2ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJHYWNBaURKMjFVakJWeEp4S3lPZ2F4dDZGZ1NQeFF4TiJ9	2018-12-14 08:24:59.854423+00
b6zukh1s82tmjaxo41fjc4eemc701wnb	ODJiZGMxOThmMjRjNWMyYWM4YjYxM2FlYWRhNzlhMjJhM2Y1MzA5NTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIxM3l0d0hSb2hZcjBuMXczU25BZzMzWVpzeXVweDdKMyJ9	2018-12-14 08:25:01.576767+00
bwdcmqm4bdw0lhbgcvtigurfhom588a8	ZjY1ODcwMDlkNGQwMTMxN2IzMGI1ODU1OWQxMDc3NDQ1ZDRiOTM2Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJFMk01WDY4UGk4NUo5dmJ5RHJqSFdFVXFYWXZac1dUVSJ9	2018-12-14 08:25:10.477798+00
f3iodca9pam67zkj9syeuebgvrvidbu7	ODVhODBlMGEzYTM4NzJhOGVjZWQ1MWFjNjBkOTU5ZjE5MDM5OTdmYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJYdzZZRm9HejE1RUcyYkZnVFBkdmU3TmZQb3REalNaOSJ9	2018-12-14 08:25:34.014994+00
jndgrf04oqioq2mqyyoxrdhw3fy3rdi2	NWZlZWM5ZWU0OWY2MjY5OWIyOTNiMzZmMjRlZmQ3OTQ2Y2VkODMzODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJtQUNYMTR5R3d0TVhqcnh2Y21JWldCZWtqeVh2bU9wUCJ9	2018-12-14 08:25:37.407567+00
4i3d964zutf0zy81dsv6xbmxygqs6ym1	YjA4ZmQwZGVjMmFkMDMxYTNhY2Y0ZTdhZDMyNDliMGE2NDBlMzhmZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJaSGNJb0dnQWlkbDZmaXRLc0w0N1o4TGhXNGFQWjkxSyJ9	2018-12-14 09:13:19.599994+00
ngbme7gin1j4wjoz9gymd91aplp87s36	ZjUxNTY2Yzc5ZmVkMjIzYTQwMzY1OWFhMzdjMzk4ZTgzYzRlYjRkNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJZTlRFbEI2Q2ZRY1RHSm1CbEJPNmFrUWR4VFNodE5lRCJ9	2018-12-14 09:13:19.610622+00
3zh1f9meuhqa0bp7zbcqviguc3bwqsiu	NzlmYTQ1N2E5NzMxOTU1MDIyN2YwYzU5OGVhOTg4NmRkMTMzNjE0Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJUUEN0OHB5bVZLU25FNkIxckxjQTdTeFNwN3ByZEFhSyJ9	2018-12-14 10:02:32.441901+00
fuisjzt96dxc02twki60bmrj9im420kk	NTA5MTIzOWJiMWI1YzQyYTFmYzk5ZDI0MjMwZmViYjZiZDVkNmRhNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIwcUVEbWFncXdhZllxYWtsdEI5VWxYZkFGQ3ZCWTRsSyJ9	2018-12-14 11:26:50.875988+00
qqqcmv682vvixihn9oaujidvr5g2qu5d	NTRhZWMxMzkyM2M0MzI0NTYwMWYwMzRjNDcyNzBkZDYwNjE3Y2Q1Njp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJYdnJ4SWFwQmxjdEk1M05XakFwNWRtazZxUU1aWmViSiJ9	2018-12-14 12:25:59.18197+00
kwmo18g8wi5iufhcshmgw3uppccsdbxk	NjMxMjI0MDM4MDA0NGFiYTliM2MxZjU4ZDc1OGI5MzgxOTkwZTBhODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ5SlFsbm1yelZuTDkwdVk2VWphc1lDbWZoSnEweFBUTCJ9	2018-12-14 12:50:09.621381+00
3h8itge33nd4smjagk7yuy1lfta28tn0	NzQyMmIyYzI3ODcwZjY0NTg2Y2E0MWIyMzQxNDhkMWRhZWU1OTRlMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJnRXF3eXQ2Zll2bnZYVGRCUmVyWjJTaERJUVZoSXFnRiJ9	2018-12-14 13:02:07.917627+00
up1enhu87yp8stybp5uodd19a7xdqjbv	NGIzNjNiNmI0ZmZiYmYxZDM4YzkwZjdiODRjZjhlMzcxN2M4NGRjNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJDaDhoRmthbUhWUWpOdHYxSEFCUUZCUGI3aFZ2aENvciJ9	2018-12-14 15:04:36.940461+00
ihc3y0v59nar7kypars8dzvgy8j5nm2y	NDNhYmZlMzY5YTU4YzVmZWZhMWY3Nzc2MzE4OWM2YmRjNzAxMGRhODp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIzNUd1Vm0xWDEzNm03cFJZSWxJc1lsYzNIQzlRUXhYcCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2018-12-14 15:09:59.957772+00
t54kj0ck6rmdcdxvvce8sukh6ui7nkiz	YTllN2M3ODMyMDlmYTA4OGQwNmYxYTg0NmMzYmJhMzVkMGI2M2NkZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJIVVR4R21UeUl4RHZoTHNaNDVlN29jSVB4eWVwdTlYSyJ9	2018-12-14 16:07:17.328978+00
5g31n0zev96dyv5ofnmy4q5bk3csvo8b	NzgwYzJhMTc3ODIyMGViNzBhM2UyY2M5MmU4ZGMxOTIxYWIzM2YyYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJudU9scTk5c0tTUTBDbzZUenZLYkZ3UFZqeU51Q3ZOZSJ9	2018-12-14 17:16:25.083025+00
3pvvmd5x3b2c19g9et27n8c7f75oqlbe	NzJkOGVhM2ExZGMyMjRiNjliNDY1YjU1ZTM2NzZlZjRmODcyNTJmYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ6dEhUZG1zOEJ3OFBGMnkxZ0RleUtENW83Ulp1U05zaCJ9	2018-12-14 18:49:53.532028+00
rquev2c8zx88ww0d58wd1p3ilv267rpj	ZjA2YzAyZGQwY2U4YWNhNDI2NzgwNzliNGJkM2VmMTI5OTBiNmE4ZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJnelQ2eEdjVTdQbzdtVFk3QTZ3NkJYTjdjMmdvcFlSWiJ9	2018-12-14 19:52:56.758273+00
3zir2htor1ulfwqk6j9h81cpnxjm4xzc	MTg2ZDY5YzJmMmU3Y2YxMTYyMzI3YTBiODQ0ZmM3Mzk1ZDY3YzViNjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI2RjVqSVMyNENZWmU2THA1TE1MQldGOFhnVGxNOXNROCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2018-12-14 21:57:06.956258+00
9ig6vq7wosd3z7w4opp3q1t9xnfdguho	ODRiZjY3MmRiZTNlOWRhODhiMmVkMTMxOTExYzZkMzk1NjQ1MTU4MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIxS0hSekt2aTVDcmx6ZktJalZhYlQzckpNVjkxNFhTMSJ9	2018-12-14 22:38:38.016171+00
76b8dqdq0ost6i8yhu1secqqit6nh6xl	MzJhMDhhM2Q5YTQzYTY4NTAwMzhmNWU5OTgyMDU5NjAwMTg5Y2RhMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJuaHNLaEh4MEtOaUhNNmdVd3RZNzVOQ0hjZGVsdnVBMSJ9	2018-12-14 23:16:19.193064+00
jhzotsbuqwgwf2sb5dd8iouc4z464mbe	YTYzOTc2YmFjZmMyNTViNmE4NTcwODY4Y2ZmYmIzZTAyNDEyN2JlMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJnM2RhY2xCbm9jY0VvT1RGYlVTMW9FRmZOTWZCdk1WTCJ9	2018-12-15 02:01:02.789963+00
2dudno78yhh1a60gcxxxczuj4swg69j4	Nzc3ZTk3MzQxZjE1ZTg3ZGI2ZmUzNDQ2NjM5OTZlMDRkNTg0Njc5ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJCUkZ1UDVuOEF4NHVUV0tnR3I4VE9sWW1HSU5HV0ZuSiJ9	2018-12-15 02:03:12.884327+00
s2bu33xcpt8k6ag51qy7lfo0k49foojd	ODAyMDJlY2YyNzYyMGZiNGU4MzdjNTFhZGFkMDY2MWE0NmY1NGIwYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ1UTY2aGxEWFFJMU9qb2MydWZMZVk0UGk3eGdmdWZ5ViJ9	2018-12-15 02:33:58.607552+00
4w5saxaujor2yw26wbfb1drjnqh9uxpf	OTI3YWNjOTNhMDJlNDhiMWUzMDc0OTA3ZjQ5YWUyOTNkZmEyODBjMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ4dnJRdGxuSEhYUWU5SXdhdm56eEF4UE9sUnFsNktGaSJ9	2018-12-15 03:14:25.67872+00
37eb52cudf2w2u4juc1btqeyq5wjmvio	NTk2MzA2MmRkYWI5MjdmZWVjMTFjOTk2YmZhMzQxMzVkNGY5YzJiOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJkZjBGM2g0VVJUMWdyQk8zM1FIbG1zYzlYbVZTeEV4aiJ9	2018-12-15 03:15:05.17645+00
cwjrdln262nuzd4xd0h6mwel7v8y9enw	MDQyYTExODIwNjBhYjk2NGFkMzYyZDViNGQyYTM1YzFiNTBiY2Q4Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJFOWRUUEhOamZRRXJRaUNLeFZYOGltMjk2R0ZRM3lSWiJ9	2018-12-15 04:30:15.497101+00
su2swe62dh95ufzkb7fxsqb5pconiwsd	NjUxNGExOGJhMjgyYjdiZGY5ZGZhMDQxMTc1NjM2NWI3MWRlODZlMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIzemlOTHpoV3Z2RHlRbVNSQU1FUHZwVkVYcVRpODExbiJ9	2018-12-15 04:39:19.518597+00
1dzck01ve94wug43org4xs6a1zyev9pf	NjY2ZmVmNGRjNGUwNjc3OTE0MzVlMjZiOGViMjFiZDA1NjgyNTc0Njp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ2V3ZWNXZaU2sxS0RURUxkSDJZdmxsNzh4ZjFDblNOUCJ9	2018-12-15 04:58:47.517505+00
ys5bjh92haqxz3r6ya0mmy2c50gj2fpg	Mjg2ZTY0YWI3MWI2NzYzMmMyZThlMDMwMjIyZTBlNzQxNmI1ZGJlMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJaaVNWazkyaWZRVlNVdmg1ZW1ZdzhVZUJRVFhVRW5neCJ9	2018-12-15 05:01:38.433122+00
g3mhmi4ag5sasfbdmoi1f2njyz0bfkrt	MWFlNDI2ZjEyOWRhY2UyYzFkZjdhNTk1ZGUzY2FkNjlhNzNlNjdkNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJPSVp0OU5SbDBvT0NKczVENVhZMTRnZFliTUc0ejdnYiJ9	2018-12-15 05:24:21.667765+00
7t9rl2ok600zgt51qw7eugwgfp60dblb	YzRjYTIwMDgxMjIxYzFjMGY0ZTM0ZDY1OTA3ZjBmNmUwNjM0NDYyOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ3aVhsZm1HenRFWFd1dFozYXFSTDZ5V2JlZFlBUDZDTSJ9	2018-12-15 05:37:38.629044+00
t90azlebpkea7m6n3kd2z3gy3z5lv8yf	YjNhYTQ0ZTE4MTFkMzQ0Njk2YTk0ZjI5Zjk5OTk5MWMxYmE3YzBmZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJDd3VvbzltTUFpNVk3b1Vrc0pqeEdNVmRudkpiVldoSCJ9	2018-12-15 05:44:43.890758+00
er45df34ypcuu6783k5pjvtmtewxpnhz	YzdlNDQzMDEwYWUwZjJkZGFlZDQxMjY5YzE2Nzk1Zjk5ZWE0ZTg3MDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJhRWJwcGZ5VzRucGpocXV1aVFONDdkWkRXdlV1OTJEeiJ9	2018-12-15 06:11:27.524606+00
r7kjq9c9artmu4wxujekhqy976e15yg9	YzUwZjc0YzViMzE4MTY0MjVkOGY5ODQ3MWZlZDI3ODE1NzQ4NTBkMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJaSmt1cWo5cGM0UGh6aENzb0pDcGRsVUJvdFBITG40ciJ9	2018-12-15 08:34:49.461196+00
rjlqpzmbaroazxr05ajs697iz6sxprbx	Y2RiMzhiOTQ1YTJkMzA0NDhiNTRmZGJkNmMyZmQ5ZDE1NmM5NmU0Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIyNGxWTndhenZNaWZlcHl2SGpidFlhZFl2YjVHRnB3RyJ9	2018-12-15 11:34:26.029229+00
yynu9a0ign5tutoig17lsnu3bgxlkba0	MzVhMmU0NGRmNTY1NDAzZTAzYmUwMGI0ZGJhMjc0ODNkNGI5MzU3YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJaNW5PaGpJNHFmZ2F1MkhJa2pRVjUycFNRdjBIR3EwRCJ9	2018-12-15 11:39:58.450223+00
whpijx31e9ubjaffe02qe6ovyltbv299	OGQyZjhhM2Y1NWRhMTk3NTJjZjM5YTkzZjgwM2VmZGNhNDE4MjQwZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI0cktUaXB4RDcyeGp5eHR5NmxvS2sxMFl6a3VSbXdWOSJ9	2018-12-15 13:27:12.006349+00
9zmck2dzght60rm8x020oxtr4wpnycrm	YjZlMTEzYmNiMGQ1ZGYxMWMzMDg1ZTI2ODhjMTc1YzYzNDBlNWVlNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJmQjVKT1lqZFFFbE9GcENzcmZmd25tUllaZUpVb3E5ZyJ9	2018-12-15 14:02:51.602693+00
d198c2mtm7qxot9wb0ytcarctbeo20tx	ZmI1N2NhNzdlNGRmZGFiYzdjMjA1NTJlNjNiOTMzNzlkNmNhMjE0Mzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJYWnB4T3dESlZpWGpGaWJIa294Nm5NOWpzNE1iNnFuNyJ9	2018-12-15 14:19:31.302421+00
u1a3aldkme5avzg1fwonn73h012kmxt1	Y2Y0OGUyZmJiZmEwYTBmMzY5ZmJiY2M1ZjM2NmZjMDIwMDQ2YTdhNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJRU0FvaERNMkJ2ZXVoZDFxTG5IWU1lU05wRVpqSGNWYSJ9	2018-12-15 14:41:14.846409+00
68w37y2t2pwnuf3a7istz4nuv99wzujj	ZWMwOWQ3NTU0MjQ5ZjI5MDhjZDIzZDk1Y2YzZTIyMzcwOTIzMDFlMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJUWm5CdE1uM3NvMGFsSGRYS0tpNTZNbFJpZ2loYlR5VCJ9	2018-12-15 14:41:15.147973+00
jtu3zk68n9jh0gr0c5izccg4ov56p6pz	MmVmNjUyMjg3MDljN2E5NTY5ZjU4MWVlOGVmYzc3Y2M1MzI1ZDA5Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJlN1Z4RkhWYXhwWW41bTZDMk9IdzFpS0kxdXZ2NndYaSJ9	2018-12-15 15:01:12.11758+00
11dupurqh5ynn63o3s6oblxz6a52gd7v	YTVmNDE2ZmNiNjM3YTViYmExY2FlZTA0MTQ2MzQ2NDBkOTQ0ZDhjNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJpUFAzWGxqcGM1Vkl1a0hZdFZ0NnNOTlFBNjlIeW1sTyJ9	2018-12-15 15:01:12.402541+00
260fqice1aw56uqcns2g6sb2y5yug3hz	NGU3ZDY4NGYxMTY5ZWM1OTg2MTE4NjA3NGIyZDU4NTM3NTllYzRhZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJHbFZzNTZ0elFsNENKWWdhR3l0dWdkZTkzZzExQ2FyUiJ9	2018-12-15 15:35:19.012181+00
6hkfqukvalv6tougyb2i9n5enh4pm3ta	ZjdmNzVhYzFjNWIxYzliZjU2NWVmNDg4ZmEwMjM2NDI4YWRmZDhkNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJFUGdXdVBCNXd3WWV1YVpud0pRMUdEUTFYbDBNY3FFayJ9	2018-12-15 16:07:29.389637+00
0k45lzfajkrjftl7t3fao8u87lhau3rm	MGNjNzg4MGRmMmRjOGQwY2Y5NTQyNDlmMTNiNGRlNTQ5ODM2ZGE1MDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJxQ1hvSnhVMGhnRUNFYkZMSDZiQTJoeXlGYml4c2IwQiJ9	2018-12-15 16:39:29.22833+00
zw46uyo7i4hwyxt5qumsmzefats1n05i	Yjg1ZTA2ZTBlMWY1Y2E0ZDY4ZDk5MzAxODI2ZmRmOThhNjNhOTZjZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJtT1ByNlJVMG1qbXlaZHNFZkpYSFhqQUdReXFzblBMUCJ9	2018-12-15 17:02:07.486391+00
mgp073v90f0hqi0wrdsi8v3tntu4zrxw	YThiNTQxY2RkMGJjNjJiNTY0MDk3OTlhNmU2N2I4MDVkMGUzMjQ0Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJiUnMzYkRJMmxnOGxJdUFxamVNTHl6ZDdOMVhDendPSSJ9	2018-12-15 19:13:11.666267+00
1e2jupk4q6gpytvlra6u3cade10ykxj9	ZDM1OGRiN2M2YzllZDM2ZWYwNDFkOWQyZDgxNjRlNzJmYjk2MGYwNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJkSTNsaDNMVVhRN2dMekJ4djZ3d0hESkZ5NEUzTEk0UyJ9	2018-12-15 19:20:11.651418+00
nremlinj8tcpqugqanz7pz8lghx85on1	ZDkzNjAxZWQ2ODI1NjcwZjZiZmI4MjIyNDFkNWQ1MWEzNTZkZDBkYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJlNXIwbkNQZ1VvQ2hKSllGS24zdHE1OXYwZGlwS0w3eCJ9	2018-12-15 20:15:05.610259+00
a1z02rv49nrpverspxnz1v3ewxzpir3i	NDc3OWZkOWM0ODM2NTBiNzIwZTUyOGZkMzFjMTI5M2YyN2VmYjVlNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ0Z0NjT2k0alNnWWlhSUJydE5rUGJ5VGlTdURwTkZzMSJ9	2018-12-15 23:43:00.676995+00
w4owngp4i2snxmmh66alnz580cpzztx0	MDNhODBiNWQ4MTc1OTQxNDhjYTQ5NWI0MmI4ZTI3ZDUyN2U1NjkzMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJGTW1SMkNDRTVjUnpJY28wNnJXaEJxYnRsRUNyMzFlZyJ9	2018-12-16 00:09:39.050061+00
qw7kigqryui4cq9ev1u9xori9fbujl10	MDNhYTlkMGMyNGU1OTIxZWMyZDZjZmNjYzVhNDcwY2Q0MWRlYjcwOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJwVHZqUGZRT1RFZTJYTFh0OTRiSUQ1SUdtbFNyUkxMNyJ9	2018-12-16 00:09:39.060893+00
dx0ctwyl8b3qxdl8i8yms38kinsuaw14	NjMxZjgzOTBkZGVkMzM5NjljNzMzNjU3NThhZWYzNTk5NjkxYzgzMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ2U3lxYVBWY3BVTmdWN2xVbnpWM3kxWG9qZktkUHdSMSJ9	2018-12-16 02:28:44.50599+00
5aldqj8hz0ugussj0a8qqb8278q0jd63	ODg2MmRmY2M3Mjg3NWE3MDg5ODcxZTZlYjFiNTVjZDc0NjQ4MjNhNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJR1pqc0NReDFzY2FJVmhkRDI1ZjgwV3ZydXQzREwxUSJ9	2018-12-16 03:04:22.882371+00
4q9rl3x1kkj0ki0qeetessy9ohgs8g2u	YzQ4YmIwNTRkM2RlOTQzMjQ0ZDY3N2Q3YTBkNTZiYTFjOWM0YjlmMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJnejdQVExHS0hwUlJ1VmZ3TDN3OHBnZDQ4MzlHYk1yYyJ9	2018-12-16 04:41:27.932419+00
eqd5anpm5id712sz46y5vry2ir9f204r	ZDM3OGU5ZDQ1YWU3MjdhMTRhOGUyZWQ4NmU1ZmVhMjA5MmQyOWI1ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ5VDBtNTFFT2JRUVNJM1NUNFNMT0daanUzZ0NjR05KdCJ9	2018-12-16 04:54:18.639457+00
e48yjw4zypur3nr4an8b1thnhkhf9reo	YTE0OTE1M2JlNDdjYWI2M2FiNDZkNmZjN2I3ZTY2MTkyZTNmNTZjYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJPaDFzeXZoQjZVbjJ6ZlpqYmlGU3FzNWM5Y29aSW1KcCJ9	2018-12-16 04:54:18.916431+00
3olzru3wutcigh10db2gq9jhizje5hmh	NzcyNDliNTY2YmZiYjhmZDQ2ZGY3ZjI3ODEyNjViODNmNTJkZTdmMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJMcll1cWlyeUxmaGxQZERzd3FGeENLMjNRVkI2Y2xNRyJ9	2018-12-16 05:45:23.073659+00
wtzczpwv0ilnof0y3nn91i1kksre3nwo	NmVhYTBkMGMzZGEwZjY3NmZhOGIwNzBjZWRiZDgwNjJkMjQ2MjgxNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJObGY1VUh3MjJNcXlYcG1mRXN2ZjlkSEhUSXpoMXJJQyJ9	2018-12-16 09:08:36.551589+00
va49rh18zygulxgru3mm2kxhoyeedw9m	ODY5ZjAzNmY3MWZkNDJkNTM2NjQwMDRkNGRlN2Y3NGEyMzUyODViMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJLNmNrUGc3eXZET0l0THptN2VJYzFNTjdkbGJXeTh1NSJ9	2018-12-16 09:15:03.602319+00
hwio55k0e1s24b0nc9294k8qtnokgnj1	YmI1MzQ3MWRlMjJkYmM4OWMxMzUxYWE2MzRlNGY2ZjBhMzhlMGE0MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJCWGY3QzNVMVd0WXZhU0ZBT0pZbG5uaFJRZXBrZGhTQyJ9	2018-12-16 09:45:56.382621+00
3hbptw73nvurw560yhvqb2iaxpqh1hou	YmFhY2QwOTA1MzU0NDliMDY3MmMwMGNiMDMwNWRlNTFhN2I1ODE2MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzNGdnQ1c3MkJYQVZXSnFKcWdsYUJWdjhKQ2xBVFhOayJ9	2018-12-16 09:58:33.733669+00
7wl61yuijqaefr1c9per90sywwet24vw	MmFkY2YzMTYxZmUxODBlY2ZjY2ZjOGVkZTQzOWJjYjZjNDg3YmRmOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIyQzQzTmh6MzZCeVAzSHFoWlpwbEt4ZXd4anVWR1lIUiJ9	2018-12-16 11:25:30.975181+00
yznn5iz1rueeixnp960r0nq6vm4shk02	Njg3ZjBkZDQzNzUxZThkNzI2NWYwNTE3ZWQwNjczNTdhNGI2Y2FkNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJFTENQS2lHb3BaSFFJamxURllKWURvbHoyUXMxckxtTSJ9	2018-12-16 11:25:59.245264+00
3iqfjmsf9g1ln4rrq8l58tbqkhk1a1yg	YmQxNjA5N2Y1YTRjODczZDdhY2ZjYjA5NWQzMDVmYWM3YjRlZWQwNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ3b2FOVkxrVldZcURiNzlaZTB2SXJ0dGI5RnVZOXdxWCJ9	2018-12-16 11:41:16.704158+00
w178vsgvxkvfzcbc7ryy9bow19d94l9x	NzcxMTM2M2VhZDJhOTI2YjBkZTRjN2YzNTk0M2Y0OGE2YzU0MmYyNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJkZmtiMXByd09mY09nbmZJYkNwMndjVWRSOTNFNlZ5MyJ9	2018-12-16 11:44:23.065558+00
d6x5822ka9uk2sd2p44k8ocsxsribry2	YzJhYTA0NTJiZTA3N2MxYTYwNjNkZmUzOTczM2QyYTY2YjY5MzAwYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI2eGY5eXhZYWFoTGhHaVdrb1Zma1BNTXZBT2cxSUUyciJ9	2018-12-16 12:10:56.528568+00
myycl1mzybhtcdsm2dbvtnfwm04wl118	NzM1ODRkMzljYTgwNmUyOTFlZjkwNWFhN2NhOWNkYzU0Y2VmMzJlOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJreDVXcVNvVHRtMHFQd0drQWw1ZG5WY0xheE1tS1puSCJ9	2018-12-16 13:03:28.193771+00
7r6fa1qjg7khpn80cnc7k3jqfmg7rlkm	ZDlkZGEwNGNhNTZiNDNjYzE3ZTdjYTQ3OTk5YjM2ZGI2NzZhOTU0NTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJlb2FJYzdNaWlMaXdSc0kxNFpJdGQwdE13a3VaV3VnTiJ9	2018-12-16 13:38:32.283123+00
dzmzf3uredrezhjs6or4wqo5itc7jcdv	OTE1NzAxYzU0NDRiZjRmYmI5NTI0NDFhMDVhNjAxZWE1NmIxM2JkNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJodzFTTHlJeFV0dGliUFVNaVVIUUt1VnRWT3VDd3pTRyJ9	2018-12-16 15:07:09.192186+00
bdpu3583w4er2vk3utyp2alpzjuxjnsz	NzhmZjI2YTMwYWFmNTYyYzIzN2RlN2RiMTAxNTM3YTY0NmRjY2VlNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJvWG5Td0Y1SU53bzhXdVlOdDdPY2JHMzBIblpFYlA1ZSJ9	2018-12-16 17:06:00.124304+00
78wilo2us309xt2p35oiuxvaskkabz16	OTBmNWEzM2U0MzdiYWZlNTRjZTE0NDY4OGM5MDg5NGI4Y2VmNjQ0YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJEYVNmdTl6WWcycnlqbTVNYmNoYkduS0YwdXNGZ0tReiJ9	2018-12-16 17:55:52.820885+00
mynr1lhsyjj9ucp1f1vs8eboea3e0ffr	MDI5NGQyZWVjYjE2ZTE1ZDMxYjk4MTc5OGFiNDk3ZmI1MjQ1OGEzOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJHSFBMNko5a0lFem85WVpWNG91YWtRcGI3eWZFSG5uSyJ9	2018-12-16 19:01:14.259225+00
8fgl3anlm5fnk7w4xec2j26fqxrd87bo	ZmJjMTUwYTNlMzZjNDdhNTlkMDI2ZTkzNmU0NjYzZmQ5MTA2MTRmOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJCdUlkRENrcGhrdG1yVTJRenY2akRjSkdOZHlDRXBIViJ9	2018-12-16 19:13:44.420563+00
795xdc7epl8j9k41y91v78y0fj3lty73	NTQ2OWExMzhjZDgyMzZiNTM5M2JhNTJhN2UyYzk3YTNlMTg0ZmQ4MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJnU3dRMDVuZGNLTWJ6UnMwd255anZwT2dFVU42SWtUZyJ9	2018-12-16 20:59:12.577312+00
n4xpv0w32hxrjrs4cueh1g5ekmxy4w9m	ODg2M2VhOTZjYTUzNDE2ZTFhYWRkYzU2YWQ0ZDcxZmMwMWYzNzZmMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJrcGtTNjRTWXc4dndJWDR1SFlwcDltU0ZacGV1cjMwTyJ9	2018-12-16 21:08:14.324277+00
8qdkze12hwwdmx6mse32z85978c0viez	MjEyOWZjNTNjZGFkZTZjNTk0M2VlNjY5OWY5NmFkMDE0NjMzYjZlNzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ0YnJidG9JdXRKTkg1M05NY290RWZtdTJGejhWdmRpOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2018-12-16 21:41:19.476918+00
g33e9s5g8clwq78rs5n3ajpzop1avkhj	Yzk0MzE0OWQ3YmRiMzQwZDQ0OWI0ZDkwNTc1YzlmMzdhZWUyNDVhMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJMcENiZWJSS2ludERUTk0xY29PZG50VmNoVmpLU0FqUSJ9	2018-12-17 01:24:45.191327+00
nm4k5q3rxl7nwwimzrzkwjpeiaegxkd6	YzM5YjQ1MGZlMDVhY2ViNDdmODA3ZTg5YmQxYTMyNTcwZDI1YWNlZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJKcjAwbFJEOVEyaTNtT0VuZ09wYzZTbWRmcXljRVJmYiJ9	2018-12-17 03:02:55.924868+00
45uqh73qvw4ggwlls79ejjc60r3ml0m7	OGIzMTg3YzBiNWZmMDJlMDg3ZGE2NzQ4YWRmZDdkMTRhZGY1OTJhNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ4YzF3REM1MG05VmpqOHFETzBRUUdpYUlvNkNrY3NLZyJ9	2018-12-17 03:39:26.323853+00
f1ciqd5gh1fc0knk2p0khudsjcpaonk4	Y2Y5NjBlZmZhODRkZGNkYTEzZjI1Njk5ODJjY2E1ZDVhNmJjZTBmOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJRSkdGRzh3RjZhYnBBcVlGRlQ2YllOR3ZIMlZjOGd1RCJ9	2018-12-17 07:49:50.031594+00
h6l29f7oh2oevv24qu10tn5ta4o7s95m	NmM3NWY0ZjAyNDc0YWFjMGVmNzViNDhhZjdkY2YzZjhjOGI2ZGZmOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJxVFZtVTFFR2VTWHl6WHNiVmRaS2pUN0VSa21VVXpGaCJ9	2018-12-17 08:13:11.659894+00
emz0sw5sperkruy18dbekn1052qtbyq0	MzdmZGVjNjliNWY3ZjY3ZjE4N2Q4MjA4YzhkYmZkMjg5NmFmOWEwZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJUN2ZUWVZuVW5qbHY2SWJ6RG9xcWRKVVhqdnBDTkhhYyJ9	2018-12-17 08:41:10.662107+00
ne9jjlkfo2on9s8oogpjjbyb5u07jvke	YzAwZmM4MGEzMWNlMWVmNjBiNzE1MWZjNDZmN2IzMjFlNzliODNhOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJSTW5WejlCQVhZS1VxdWJYWWFCM1VGVENESm9Lb2tTdCJ9	2018-12-17 08:41:16.205737+00
jrapycu5f8mcomq5va6gaq9t8q0i0hjb	YzAzOTY3YmVjNzc3MWIwNTQ3MDg0MmVkN2FhZjE5Yzg3YzU1MTg2Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJCSHFMOGVwQ295TWhHZmdXcW1lUzcxMU9BQUNqdnpmdyJ9	2018-12-17 08:53:12.511737+00
r9ugq41f2j347v2qwdaxvm3gud913nkz	ZGY3ZmRiNzU5OGFiMTdiZTg3NTM0OGQwNDhkYTU5NWVmYzYwZWM1Njp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJMUnNtbUVRM3lDZWNEZGF5ckpObHVVdk1TNDNUU0E2cyJ9	2018-12-17 10:03:30.646951+00
eyoksui7s3ridz9jv0f8y3goeorxdfp0	MDQxODI3ZjIyMWNmY2Y2NjQ5NjAzZmE2NTFkZmUyMTY3N2MzZmEzMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJZMVhPRXB1UW5ma1lVaDBiamZWaTJ1TVJ1bDJhdWg5RSJ9	2018-12-17 11:00:37.990358+00
staydt056szgzerwf2lpt4hrzadru2vc	MWM5NGFkYTI1MjMzY2U0NDk4Y2ZkM2U1OWI4ZGRlZmEyYjY2Y2YxYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJqU3F1WW5UYnV0RWFNYjdxdndHakZSUFR3NTJQRE90RyJ9	2018-12-17 11:40:06.582696+00
54a8rih564c2mxz3lyn2zzozm5e7rujd	ZGJkMzdiNTU3NDRhMmE2MTcyMDJiM2ZiZjAzNmY2YzA4ZmEwMDAxMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJUUJzMHc4dXZ6QmZNYkJqV2sycUFOSnI2WWU2cEpKbSJ9	2018-12-17 11:41:45.764462+00
vj7b3p1u1qg1hbyu9jzemk3997rn235q	NjRmMTg0ZGJmYmE3NjE3YTQ5YjRhNmQ0YmJiODI0ZWVkMWQyZTlmZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJbHJiUnFHeW1GbFpQOWppUnZmZHNncUhDN0ZNOVhpOSJ9	2018-12-17 11:49:56.490768+00
vl3vv0ht0m7xixd4npr19rpxfj3uecro	ZDZmMmMzY2JmMDQxZDAzZWI4Y2YzZjc1NDJmZGE1MTk2YWU5MmJhNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJvTGlLd0xMaUt2dkk2YTUwb1FGUDNpY1F1U1BmQ3FrdSJ9	2018-12-17 11:51:13.317241+00
43hdw3jzbjku5t421zss3jpnhk8bh0ef	ZWQwYzExMGRhMDUxODYzZTg3YmQxN2JiMWNiZTBlMjkxYWU1NDI2NTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJMcWxUa0g5Mm9lYU1Fd0RmclVzQzhyOEd1dUNYOW9qeiJ9	2018-12-17 12:40:06.634687+00
3nabwse5wfovz0o4t17xtdaqnsvture1	NTgyMWI3MmQ1NmYwMmRhNTg0ZjUyYWVkMTNiYTJmZGVmMzY0YzdjMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJKb1JTSDZpN0N4UmdPM3pLakc4UkNzQmZ2eHNZcnBwNSJ9	2018-12-18 09:11:40.898011+00
m1o0el4wci35pab6mgki5wawt4eqsps2	MGI0NDljYmE1YzEyMjgwOTJlNDU3NDhjMjQwMTU2OWJhMWRhOWYxMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJtcDZvOFRDeWY5bGtRVEcxcTFFUHo0d0VZdmMzVENaTiJ9	2018-12-18 10:13:08.382499+00
oeubd6ccucz6c36salejhfac2cnby3v3	ODUyZmY4ZDY4YjEyM2NhZjk0MDY5ZTUwMDk4MzBkMDE1ZDg0NTgxNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzTkVDY05QTHplTllIRXQ4YzV6NWNXUlBhVzRvdThrVCJ9	2018-12-17 13:33:07.546399+00
z4ow62hrv20q7nbmdhrs4x2twqd95at4	YTg3MTgzOGVhNzc1N2RiNzUwMDRmY2Q0NDJhZmFkMjY3OGEyYWI0Mzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI0Y0JPck96bG1GalVmNE92d2oyWEV6dGdUemVvdHVkbCJ9	2018-12-17 13:37:05.805591+00
09453hsfpd1vroxcx1ijw21y6sycuddw	OWQ0NDEwYjhkMjQ0OTJlNzhmYmI1MTk1MTA3ODkxMjc3YTgxMjg4MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIxWlFHYjY4UWZvcm5JbnF0MlFaWGtQSENyaUhsUnRLTSJ9	2018-12-17 13:40:04.410071+00
omjylswte2xnf5cu1ooo07yioaolj4w7	ODYwZDNjZGNmZWZiMjNmNjM2ZTIzNWM5MGQ3NDM1NWE1ZWZhYTg0YTp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJMMHc2ZnBUck9EZDljU0JjRzFJS09GeWV5a1pXbHJNUiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2018-12-17 14:04:56.004503+00
v6aj12skkttggtitl6iyn1x77oxkonzl	OTUwYzA5YjdmNjMzMTUxNmI3NzM0N2QwYmYzODBmMDQwYzQ3NGExNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzbkE5RW5WRzRSakVGV2RoWm5FbmhvNzJ6aGw1MEVsRSJ9	2018-12-17 15:27:47.230318+00
076bryt16k7gj9284hr76ow5x313zctt	YTYwMGE5M2QwOTc1NjU1NzI4NGE1MDk5OGFjZjYxNTg1MzBlYzE3Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI0ZE93M00wbUN6ZlMzR1VYdnB3RThOV2xNT0RFcTlRVCJ9	2018-12-17 15:33:33.762131+00
tphl5te8vz5cpoyvqcemlws01a8qb176	YTRlYzI1NWY0N2MzODJjOTlmZGVkNGMyNjUxZDk4MGM4OTdmMTQ0Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJhbzhUQzlPRWRocWRQWFZISGFMcG9VM2lyaExac1AwZCJ9	2018-12-17 16:03:07.15593+00
p00paam5j16oiimjdzu1bn09l4e9piah	ODVkNGI5YzRhYjE5YzAxMTUzOTBjZjJkYzQwZjM1YzM0ZmJkOThlNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJYOTdVN2RWSTFiVWZ6WndrRFdPdkVsVGJSVkhBclhIOCJ9	2018-12-17 16:26:24.609175+00
aummib2v0darfziuil2rohzyl25wvo1h	ZjlhMmI0NzVhYjJmZTUwNGNmOGQzZjVhMjhhNGYzYzI5ZDVmZTM5YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ4QzhFZzIwVmtGRlhuQXo5WXBMSDRjMEJiY0g0RjEzZyJ9	2018-12-17 17:01:30.227374+00
tk7ndqnjrna6nc2w8wyydj0c4enqen9y	ZjRiZDU2ZDBjYTFiMTYxYjg0ZDYxOTY0NTMxYTRjZTE3YWI3ZjdiMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJxa1NYaHVDeXZuUkJKT2U4V2U4WmRnMHVvRmh0TWhyZyJ9	2018-12-17 17:55:11.489225+00
d0vmh6le7ydjyga5i78bsey1lqe5dhw1	YjU4OWYwYjAzM2ZhMjgyMjMzMzUwYzI5ZmRjYTg0M2NlMWNjZTYwMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI3MEl4ZnhwdnJXd3FEZFlSTjBNcDA3SU9rbFNVWXkyOSJ9	2018-12-17 18:19:44.31767+00
psx3osppc3s9xmyi0dqlbxk3ng178w9i	OTgwMDk1NTNkMTA3ZjkzMTIyNmFiMjllODIyMWYxMWMwODFlMGIzNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJLRkJ3bFE4Tk9BRTJFS2RuMkRBZHQ1TEhlOXI5aDVLTiJ9	2018-12-17 18:30:22.789027+00
12jv0sjchnppqdc4tuzq3kzcdm6tbcqd	MzUyNmZhMDc2YmUxYzZhMTUyMjViNGY3NzY5NjU0OTU2YTUwMDkwMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJqQW9Vd0k5MlVLcTJHVmZlTm5DVllYbHRxdFptVVhwcyJ9	2018-12-17 18:58:59.561224+00
kh3nnodkpddrv5tc60z5qu20ryz0un5e	YjI4YzQwZDMxOWJlMjhmNTA1NjE3MDE1MmRlYTUzODlkZGZlOTQ1OTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJHWXcwOElXUEhObW56T3VoRExZSGtYd1BzRGR4TnJpUiJ9	2018-12-17 19:29:32.728658+00
7x3g1rqz75160dmmbclf1oq2rvq7x245	YWEwMmFkODJkMjkyYTBiYjVhZTNiNDA3MTA5MjViNDc5Yjc0NWU2ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJRQTkxRmc4OW1Ha1RHR3lrMHE4dU5oeHBIVUpGWDdIMSJ9	2018-12-17 19:33:46.133538+00
y9za2dpz6pgimrr6lq1y0b3li3vljcqe	OGY1YjU0ODgxZmZjZWRlNzQwYTIyYTNiZDRlNTAxNTZkYjMxZTcwYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIxb0JFOTBBMWJLcVZ3bklQUklYeVYxdFg1Zm5FYTdncCJ9	2018-12-17 21:56:26.298189+00
5qep5asjxt0dxqmor0vfo9dq7gsdbg0p	MTRiMmE3YWU1NjhlZTg5MWYxMGM1MTQ2YjUyYmMxMzBkOGViYTI0Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIwQklNRzM2ZmpsWEEzZ0czZ2ZsMFVXNDRCeURIVXRWRiJ9	2018-12-17 22:18:01.548956+00
7yfyr95oo6d3bdipxp3ysa60ef9i17nq	ZjhhMDU3YTc3MzBhZDMwYmJiODU2ZGNjOTA1NzM5Y2MzOTlmMzIyMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJuWmd4YzZzUlZpU2ZXcDJOUVlWbzRVTXhFRjFmNzFuMiJ9	2018-12-17 22:36:09.934254+00
lsbf2wholhf71l0mx5nv39m2pjidqlxc	NDMzODY4NzE4YTcxYWFmMTE0MTAwMDkxOWM2NGE5OWNiODRkMDYyODp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJYcGtiZEx6TE5FbkoyajF6QTJraEFNRjZFcmhxT2N0eiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2018-12-17 23:10:03.375734+00
5fa5j78ign23rj56e063ixg4xmdvz58p	OGU3NjhlODQzNTlmMzYwZGNjNjVhYjI1MzA3YWQyYzE2Nzk2ZDNkYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ1Nm83OHJyS2RlVVBPSmdKR1I2QkQ0c2ZUZHZ4b2VMaSJ9	2018-12-18 00:50:13.767505+00
u5ik30c6vjl2wjwsm4jv77e29uytwmb3	YjE1MzUxNWZhMzk2NTJiZjcyZDU0NjVjNTIyZjcyODU2MDM4YmM4Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ5bWlGTG81RWJmc0xmU0pod2pCSUJlajM5THc1YTcwbiJ9	2018-12-18 01:40:53.374466+00
6nx3q6xc7304cb57bgpfmvsqmqrwu3ox	YTg5ZTAxOGVkOTUxN2I1YWQzYjBkZjQ5N2JkZjBkNWE1ZGJiNDA5MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJIRzN4TjBwZ05LSXliZ1RURVllRHQ2RGxLYkk4bjRsSCJ9	2018-12-18 02:17:55.877526+00
sblasu78ams4qnqjpmai5avrikiwxz9w	OTVhMWJhMTI1MWRiZmU1MzFjZThkZmNjMTM2YjcwNDI1YjM5MWRjNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJSZmhWQUtzNUFiVjZaYW11a3ZvZHBORUkyd08zQ0pUMCJ9	2018-12-18 03:40:04.673987+00
jj5wp92yidrcxfo2id9kc3genwa46dh9	ZmRjZTRjM2Y1NTcyNDcyZTc3ODRiOWQyZGY0NzM3MjU5ZTdjZWE1ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI5djJwSkJIdXlxQWdIMFVRVkpiWmppTlFhSExRSDJYSSJ9	2018-12-18 04:26:30.829247+00
fqjwhymrcxhqykl0qz9kgxgmmbnk0t8d	YjVkYWJlOTM0NWU5NDllM2M0OGQ4NTMxYTUyYWUyYTc2MDk0MTE3Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI2cUZnRGtYQndBeTFzd3J4U2p5Q0RNNXAyR1FSdEZOSCJ9	2018-12-18 05:25:08.319313+00
hb1478y2tvkojn3zqz4463ga2ytciu3k	ZWY4NmMzMmM5Y2ZiOGQ2OWU0ZjgyMTQwNTI3YWE2NTFjNWExMDA5Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJUQXV4ZHhGQXRkWm9MM0dHb1BqN3lVazEzWUJIaTlKciJ9	2018-12-18 05:46:19.549989+00
odyhmer2fdizekbfi5hn4b6wyzkzyg7k	NjVkNzM4MDhmYjZlN2U4ODJjOWQ1NTE2Zjg1MGZhNmZhMTAzMjNkZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ0TmtmbUVxYWFxOWJOMjhOWnFueUw4VlhQV1ZKZkFTeSJ9	2018-12-18 06:13:23.712166+00
8lmecz1jpwq7cy5q9p08nlh9jcgz03xi	YjJmOWEzYzg1NGMxM2EzZDU1MTM3NmU3MTliMGVjODRjYWY5MGUwZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ5ZjRDV1lRVmtSTU5rc1BBVVVLUzMxNDkxR2hKSFQyUyJ9	2018-12-18 06:17:53.611677+00
xh561dmamm1q41f90plxl0apsn3bnnit	OWM5OTIzMjgwYTM3MDE2NjNmMDMzNTg5MmM0ZDg3N2IwYzYwYjc3Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJHN2w3bkpJMXRkWGNwYWhtWmlPc0pBeWE5bzVlNEk2byJ9	2018-12-18 07:33:47.241212+00
hz3dv7c3m9lo38vin8k1voqp1f03wk7o	M2FlM2EyODE0OTE2N2MzZWVlMjMxYzAyMGEzOGY5YzIzZGMzYjU0YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJIM1RIS01oZUVKUHJNYW5SMHZJVGxZa1JZMnpseVlkQiJ9	2018-12-18 08:58:09.514342+00
ep8ixm0b627x5y5i17yhip4ai135eqym	ZGY4OGExMTY1YmIwNjllNzJiMDZkNDdlMzU5ZWY1YWM4NWQwY2YwZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJxM3dOdGZxSktjRnhHajl1RWVIcWZEalZCSlBjUmJ6WSJ9	2018-12-18 09:06:16.83136+00
b48uyvhp8bs65favp4foauz9wvztvape	MTFmYjFjMDM4M2UzZWRhZTBiMmRjNWUwNmIyZjdjYWE5NzhjNTk1ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJqS2I5OW1oVmY1RlJkVjBWcmwya3RMaWMzQnc1U29SaiJ9	2018-12-18 10:37:14.157886+00
io5dqyrv6rddfxcutfump3rf4mnzpzf0	MDQzYjZiNWYwYzgyNDRkMWIyZjc4MzRiNjA4YTRiNTI1ZTZkOWRjZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI2V2NPR3pSc0k3dmRxNVRyalVZZWd2R3dwRVFta2VzcCJ9	2018-12-18 10:40:42.352124+00
9a01o82667hya7n38y60smxrzfynie3c	ZDdjODBmNzBhZWM2Mzk4NzRkMjdkMmY5NDJiNGIzYTZmMzE5MWY1Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJYRUZtc3FCaFBrM0pBWTlaZVNyM2ZhdkxOTmE0VUltdyJ9	2018-12-18 11:22:24.727371+00
r3uv3y83ho8qn98xtv92wlt9u6ck1bu2	MzgzZmRiMTI3NWIzZjUwNDE5ZmZlZWI3YzZhY2JkYTdkZDQ4YzQ1ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJUMVZZZGQycTRjRXFFM1d3Wm5LdlZNZ3lscWpFMkFJbyJ9	2018-12-18 11:47:31.576964+00
zdk451osf3va49pwo7qtmg6vhrbxaref	NjVlMjM3OWNiZGY1ZWYzZjg3OWYxOTA5MzViMGJhMDBkYWYwOWYwNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJSd3k3WEhqb1NpWGlxeElGZ0lPY1ZETlVjdGpOblJRYyJ9	2018-12-18 11:55:35.965616+00
fw87r8z485xahgjcdl85n0nyemu0k512	ZTQxY2QyNzBiOGFhZGFmOTE3MmE1OWZhMWRiMzBiNzdiNDAyZjcwODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJZWUxEZU9jZzUyVVFoZ3lvcVRjUXdVQXJJUDlVMVhjbiJ9	2018-12-18 12:12:34.997524+00
9cy4zy9ao7sskxk6eecxwb7wb866d2k1	NDhjMTk1ZGY0OTc4MDJmNjZmNDFlYzRkYWM4ZmY4NzFhYWQ0YzdiZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIxSXNZY042ZUx4dzJmdlRLVlBHVXdHMmFycXZ1UDNUZyJ9	2018-12-18 12:22:46.608583+00
kdzmsana1j0fyxi9nu8kj0a4enrovsmx	NTdlMDk3YjUwY2I1ODhkYzIxYmI0NDRmODAzMWFkYjY4ZWFiOGVmZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJwZWM1MkZBSXhKNzhkc1lnZGUwVU4wWHVQaVplWmphdSJ9	2018-12-18 13:32:10.344443+00
txlug6xcw9r9nabfxyeyknrcyvzduord	YWRjNTA0YTE3YzM1NDU2NzQ2Yjc4NjczZDEyZTkxNWU2ODU1OTAxYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJwY0JPSElEQUNmaGFPUkRsRmRORjFwUUNzc1JYbWJhVCJ9	2018-12-18 13:45:35.273234+00
5w2dkdh5q8pmyzmew4miez7lvtkugk95	MWU0ZWEyODlkNTQzYzYyNTUyOWExYTJkOGE0OTMwM2JiYmY1NTM1Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJRMXJVelMxYUNZSWJCQ3QyZFFPUHduNERWR011Z1p0TCJ9	2018-12-18 16:23:31.708016+00
fjafa9t999v111ir44znmux2xa498h0u	NjYwOTFmZmNhOTBjYjA2NWI1NDE1MDU0YzYwMTVkMjdiNGM3ODYwOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJUaE9odDBIS01takNKYU9MYUNybGlxTENieDk0czVKRyJ9	2018-12-18 17:01:06.649443+00
9f0hcq0mmktxocjnnlfdtcb4yppf6qtu	NGFkYTAxZjZjMjIxZThlYzkwZmEyMTYwZWU5ZjdkMmRmZDZmNjljZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzZnU1WEVuWEZnb3MwMnhKc0pYdzZzTE1Kd01Rd0JndSJ9	2018-12-18 17:15:43.426801+00
djteayo24hp768f7ab4v3t7z9gcbyaqb	NTNmMDkzMjBjMjJhNjJmNGIzYWZmMTEwZTIwZTJlYzZhNGYxNGIxYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJUMEthc3E3V3R4MjlhcGQ3bzdBMmxqdEVxTnRaUzlnWiJ9	2018-12-18 17:38:32.31693+00
ydzu0rdkrjvjv1ucy1j8vtta0qgjldln	MDE5ZDBkZmE5YWJmZWIzZjg2NzAwZjQ2MzRkZWQ5ZGQ3Mjk1ZGIyMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJPUmU0NTlzODh0QklpT3NBSGlkTllVbEF4S3JoYWVFVCJ9	2018-12-18 17:47:48.551635+00
1tv9u7vubjqq9kmg5cgre1pxz00c1rer	NGFlZTY1ZTk5MjI3MGYzMTMwZmNiYmJjYTc3MThkNWQ4NDVhNjE0Njp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJSHd2MGNvUE1nTDk4dDFJWEFoOXIwZFNtUzVtQWNqUCJ9	2018-12-18 18:06:01.748586+00
co63iuy1v7i4s664zaw1c9v0j98acrb3	YjQ4OGUzMzE3M2RlZDFhYzYxYmQ3YTAyNTI2ZjAwNjQ2OTlhYmExYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI3dEFiNFU4MmtZY3E5VGhoRm9vVHRzZ2lxc2dDVTJzTiJ9	2018-12-18 18:06:56.770212+00
gvugmde5byjiauugv5sd1vxe4bsa3lvw	ODRmMTlmM2Q1ZDlhZTk5ZWRkYTc5ZTNmYTI5M2UxNDdhZGIzNGVlYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJxN053RHE2SnROZUtaTGZRZEJzcllnNHh6bmJWWlQ2UCJ9	2018-12-18 18:24:53.736429+00
xcct1o40eap3amedfknc1mxtuwvl5y8e	Y2FlYWQ3NzNkNzVkM2RhZmE1MDJiNWM3Y2QyMjQyYTkzZmY2Yzc1ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJleWZtUExHZFo3TlFxOEZwaEdMdWhiMm9aZVZDMUtqcCJ9	2018-12-18 19:35:06.608445+00
edkzfrhg3k0ze8x81qqljf1spm5m08t1	NmM2ZWY5YzI1NmE1MGM0YTU3YTU3ODQ5M2RkZmViNGMzODY1ZTZjMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJFWml4OFdWV2V6WE9EUjhwYWd2MkZiWkRRNURpZ2Y1aSJ9	2018-12-18 19:36:44.802073+00
80xj03detcd3ht2788hluyf6hi88k2a1	NDQ4NWM4NDUyNDUzZmE3NGIxMjk5OTI0MzEzZGMzMjBkYmJkNTVmMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJwd1VORkdWOEJhQmltMm1QSk1BT2JPQkVvY3J3dTVlSyJ9	2018-12-18 21:52:59.066159+00
2et5fjj0n5788z295yabuzj6uyisdrwl	OGIyMjU2OTM1MzY0MzM3OGMxZTdhMWRhMGQ5MzkyYjJhMWIxMTRkYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ2SGxnWm1FdDFNUkg3aFR3V2pBa3VSVEQ4bndNU1JUaCJ9	2018-12-18 22:48:09.438549+00
z9viehu36xfadf0yeb48t990fegzhzrq	MzBkZTYxYjdmOGI0YzZhMjMzOWMyNDJhZGYzYmU0M2ZhZDVkNjMwYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzN2ZkR09PVlBxcjhyN1BwWUpkU0diTHNDa3N0THpLaCJ9	2018-12-19 00:19:08.403493+00
ts9j89gct98hny1lsy5stvgf0qgnjeth	MWUxMWI2ZGJjMDMzZGZlMjNmMTAyZTRlMDUzODc0N2QzYjNiOTNmNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ0RGszZVdNR1FodVlmbGx1Z3Noc0ViVWtSYUZOMGVyMCJ9	2018-12-19 01:08:51.537035+00
nbgmum1nff24as6ogv38nm51xjrauft0	OWVlMTlmZTRmMjJhNjY4MzExYzUyNjFhNzkxNDNhZTE5MjBiMzlhOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ6NDdnNWh1UjB2eUE4eHdoYjkzaVVyRE5VQkNPS3RHZSJ9	2018-12-19 02:30:12.71986+00
7v83npge3cufu5j8ipo7gww5ia4x8xcy	ZGVkMWNhYzMyZWIwYmJjNmY0OTE3ZDg4Y2NkMTVlZWIyMTFlY2RkNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI3dmdGMkkzN2FpUHppTG9kZmlXWHFOM3ZQcG9hQmc3RyJ9	2018-12-19 02:31:07.732186+00
ccp9nkn3zgro1dz7mkmivg37kme7ed4i	ODBmYTdmMWM4MGU5ZTcwYTIwMWM5MTVjY2U1ZTFmYzQ1Y2VmNmY4MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ1ODNjUlNHWUhuemVib3U1REVwZmpwcVZHbEZZTk5iNSJ9	2018-12-19 02:38:13.702863+00
0i0mxbawciur2oyop8rkn6uupsuvaf5e	ZDYyM2VkZDcwOTU5Yzc0M2MxNTk4MjQ2YTVmZWUxOGYyZDk4MDIzMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJiSG5GNzdZa00zUHVDaWpWVW1nTlZIT0RWYm1IdVl5VSJ9	2018-12-19 04:14:41.819115+00
glcpj3zbgza14pp17arnk8ry8n4b747u	OWQwNGNiYzI2YTU4YzdmOTBjODQyYWMzMmQ2NjU4MmE4MmEyZTE4MDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIzNUdvRWIxZE0xdnFHNkdYc2V4TU1RSFdnRHBjazE0UCJ9	2018-12-19 05:36:14.690417+00
wybk3xyfe9s4p84pm5vs2ik7sph6tgqx	ODRkYThkMTI0ZmViMmQyOTVmMmNiMjQxODUyZTBmMDVkN2U5MjNiYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI3cE1ndFk1cXdxOFNMYVRJQmNIaEtWSE9uMGc5MkJzTCJ9	2018-12-19 08:25:19.088615+00
otl08diaygz89bw1xviu9ne5ucvcvizg	NjNlNzg5OGYyMWE4MWM1NjNjZThlNzIwNDNkMTYxYjcyYWM5ODUzMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJDb1lkUGpoR0ZrZVU4OWhyY2pFTHAyeVpIQ2VmbjNabyJ9	2018-12-19 08:38:52.632957+00
aqjixvnfnl6o1a4iwjntci98xotoi7dx	OGQ5ZTM4MmU2MGU5MmQzNzU4YjIxNjRlNWIyN2Y1ZDRiNGJiZmI2NTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJuTkM4S3ZsVWRGU21KWFM2R1MycTlDMHhpT0F6TERSeiJ9	2018-12-19 09:19:32.67096+00
w8jegnvt2s1sm8i56nyn08x54xsex38p	NDE5YmRhYTRmYTYzZGYzNDcyZGQ3MzJjNGUwYmRlMTNkMzc2ZTdhOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJvM2dNdVFNVDByNno0QmlkUGlLVnM2czBJVWZROWJLdiJ9	2018-12-19 10:45:05.285497+00
s12ekoqavs5pvweq7p98dyqwjshq2ode	MzhjMDcwYWM3YmExNWQ3OTIzZWE3YTdmZjExNGRmOGE5M2MwZjNhZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzRW5SUUFsMWY0U1dnRmdSdm15ZHhoVlpzeHpxb1FWaSJ9	2018-12-19 11:04:52.711803+00
y3c4yfr11qq9ll7sthpt2ozdvu5s3y9n	NWMzNTY2NmYxMjNiZjZhYjkzYzExZTQ4Y2Y3N2ZiNGE0ODZiNzJjZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjM4OTQ2ODcwNDQ4ZjQzMDdiZGViMzg0ZGFkNmIxOTllOWVhNWMwNDkiLCJhbGxhdXRoX2ZhY2Vib29rX25vbmNlIjoiWWV4UmhyN3REcmNpNXJKOVJYdGEyRG1ZcmJScTJXZksiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwic29jaWFsYWNjb3VudF9zdGF0ZSI6W3sicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIiLCJhdXRoX3BhcmFtcyI6IiJ9LCI3QlVrZG5uUnRtZ2kiXX0=	2018-12-19 11:25:50.307131+00
einrqnctg3g0fxpls85811txqlik5bev	NjFlYzA2NjA5MTQ2YmZmZDc3ZDcwMTkyZDMyNGUwMTdjYTFhOGY3Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzdUwzT09yYWJuZU1Bc2w5Z2ZKeW9iZGlzQmNxZXdtYiJ9	2018-12-20 10:46:06.561021+00
dk6p0g1gxafkwluqk8tzrz6b09fcc0gp	NzZhMGFhYzM3MjMyNjA5YWE0NThkNTNiOTk2MDRhMjIzN2I5MWI3Mjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJDVWpkWGtqVUNmcHhUV2RhbjlMWmJFbzhhR1RoVzdCNyJ9	2018-12-20 11:24:18.033473+00
h390e3tltyihuuwl2adcvnjg09coj65z	NTM4OGY5NzhiNjA4NjcxZDllMjY0OWEzYjNjYjIzOGZkYmJkZTU4Mjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI5OFBDR2Jkc3o3ZkNvWWdhTXN4eEVRSDlJWEFIZkg5MiJ9	2018-12-20 12:39:59.420331+00
zjzt5o82zl4jc3pnsa8bi779a6h54fy4	ODBkN2I2YWU1NWMwZDYwNGFiYzViZjIwOGUyZTI5OTRlYjBjNTAwYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIzNFlaYUlSMGVLZ0lxWmNUNTFjMFFHdHVKSmhvT21zQiJ9	2018-12-19 12:07:54.752889+00
iuftj1mj68wlyzj9f7h7hp5qfklotxau	NGQzY2M3NWQyYjYzYTQxMjBjMGUzODkwN2NiNjMyMTM0OWQ1NDhlZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJblY3YnVKdHI2SHp1VEZ5Y01vb280QzlDRDlCOTNpVSIsInNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiQ0tHbHFpcDB2eXl3Il19	2018-12-19 12:14:29.228988+00
adu0znu9z2trcl1mag61qc3kpmswt6zw	NzhhOTNlYTJhNWNkYmYwNzgxODVjNjAzNmRlM2FjMDBhNzNjNjg2OTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJtTjBSQXhDYndYWDN3ekZodUVpTWFMT1R3MWhMMUthWiJ9	2018-12-19 12:21:26.955552+00
gc789i3v3ob9ks8lr4i3d5crsumt4w5m	NGRhOTU5MDNjN2VlYmMzMjRjNTRlNmMzNjU4NGEwNGIxZmFlMWU3YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIyb1RZOU95NlNhYW8ySHUzR1d5WXNLdWFWaHcxSDhUSyJ9	2018-12-19 14:13:00.050386+00
xuu5tg7s7gpzlyaz21vmsy7chrg8b8ay	YWZmZjcyNmMyNjJkNDI4NjRmNDYxMjIxMzRiMWQxYWFiYmVlZTJkNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJrVDVpNTFuekhMeEFld0dadmNDc2poQzZSd0JJMmtqQiJ9	2018-12-19 14:46:00.448787+00
9zkp1xfgmd7xr3x2koux2szjsl2lvvey	ODQwNGY1MDkyMDEyMzE3ZGVkNjc4MGM2ZmU3NjRhNWFkOTAyY2IyZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJqdno3NzRJamVmVDJ3WWdLa0wyekgydkNZUERhUVBnWSJ9	2018-12-19 14:53:12.072297+00
bkicvnojvea21ek3c5jt3d9mhe06h0ya	N2ZmMTAyMDM3OTUzYTFlMWNmNzJiYzNmMmFhMzJkM2QyYmVmMTljOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ0eWVqNjQ5UTlBT00yRldMbmRpc0NKalRFd0FEb1ZvbCJ9	2018-12-19 16:54:03.217051+00
gbvxhugauwuw4t6h6imdr6b3h4bkzww4	NDFhNDdmODEzYTk0ZmI2NDlkYzM3MTlkYmI3YTJlZWRkMTZhNjdmNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ0UFJXekh1RXN2VHlsYU1TQ0dNczV5NjR6Q0xwN0NGQyJ9	2018-12-19 17:42:29.95407+00
doik90z55qeqvn6j2mc63asooaly1i7x	ZWRhM2ZhODljOWQ1Y2RjNGU1YjVlNjM0MGIzYjFkNDJjY2YxNTE3YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJKMG5vaW45RVQ4WnlVc0I3QmQ0OFl5UWRJNjUxNFJMQyJ9	2018-12-19 18:08:06.331632+00
yzu2s3260i1iu0ir3ic8970glkm7q4xn	NmZiM2FkNjNlZDczYjFlOGU4MzZjZTI4MGJlOTI3YzUxNWI5NDFmMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJyZjBDa0lZeExvcHBaN3A1T2dvQ0tMSnRyV1J2SktXbyJ9	2018-12-19 19:49:47.075975+00
k7flidgfcgnxdh3l31i4h43y0fsx0ndl	NTcwMTBhMmI4OTc0ODIyYjQ1MGQ4OGE0MjI5ZjMwYTVhYWE2ZTFlYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJKZkRYYnNIcmNNc1VEQTJZMHFMSGQwc0d4eGhMUGlQbiJ9	2018-12-19 19:52:14.697326+00
mc67meovfr1e15brn3vt2xr0cs1k7fhh	Y2EyZDk5OGFiZDg4YTE5MDBkNWQ4NzA1ZjdhNzkwMmFmMjlhOTUyNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJUd2RVSk11VkFYSVVRaHJkYXM2TVNZZzYxMXNkV0E1RiJ9	2018-12-19 20:53:30.417039+00
6e0lr848jwn7q00t4fh52mjyimyowmq9	NTg2Njk3NjdiYzJmODYyMmZmZWY2ZWU1ZTY5NmQ1ZDFiOWZkNGFhMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJXZHRaeWtSd2JRcHh3M0JZWGZCSW9jYmlkc2ZBSHY5cyJ9	2018-12-19 21:01:45.259118+00
ak9gp7oe1gzy1iglugy6oxf57l61h09v	NjI0MDk2MzQ4NTFhZTQ2Y2MxYTI1N2QwOGI4NjEzZDUzM2U0NWE2Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ5SmxITmdHd0dpNU5Dall0Y2s3bGExQjdqSkUwdnE3UyJ9	2018-12-19 21:53:45.292992+00
ih8kr1j3cbrzygun9roo3jidazgtnjhv	YjE3ODQ2MmY4ZTI2MzQ3NmRhMWM2Yjc3ZDViODI3ZjEzOTA2Zjg2YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIzdlJvRElTUG5FNmpLanRNanl4QzZtRGNRZFlTcnhySiJ9	2018-12-19 22:27:56.503765+00
e1lt6twi841r21jgbgcpqxbwv4luq9az	YWU2YzQ0YjZmYTRmMWNkYWRiMGQ5NTg2OWJmZTAzZDFkMjBlMDFhMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ5WUtyQ1hPWk9lM3g0RGpUbnprbHBsbGZMSlJzaGRQQSJ9	2018-12-19 22:30:18.167939+00
52hzu5ou0q5larmgtlhkb142q0r4nccn	Yjk3ODIyZGNiNTllM2FjODM3OGYyNzRiYzFkOTIxODJhZmU5YzQyMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJDeGx4d1JIcXdPN0ZwektvSWs2YXdBRzVxTFhxd3hsUyJ9	2018-12-19 22:55:54.47164+00
hjgkzhcrweq2glyougntev3yczhaynb9	MjZmNTcxNjUzZDk3MTY5YmU2NzYxMTZlYzZjYWIzMmYyMmEzY2ExZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJDc2Y4TzZZV3p2STloeUUzSXFmU25ib093S3lFZ0xWVyJ9	2018-12-19 23:18:24.024116+00
ltbu5oat1rtoe4oaxt7sel97tqtd4jra	NzY5MWNiOTA1NGMwYzNiZmYyM2NiMWY4OTc0NzdkNjIzYjA5NWEyNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIwNTN3TFprd3VsNW15bm4yZzNGbEtMc0dxZEJpU01VeSJ9	2018-12-19 23:26:16.161344+00
6cv1e4tvvore0vkx9s0rrqreuwe359ko	MTA0NDZjZjQyNTY4MzkwYTJkMTY4OWQ4ZTcxMDc0MTk5M2E5YWUyNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJPaXRrR1NPV0t2dzNPeGhQQmdleXhKbVdrcDdJc2NwOCJ9	2018-12-19 23:30:56.599249+00
cfaudawt2qntkb1ilyp52sepoq9skjum	ZjlkYmE5NWM2NWM1OGU2MzcwODVkM2UxMDk1NmU1MTYzYTQ0YTQ0YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI5REFmYmFMTHl4TVFNcHZqRjdHeWJTZm9YVGtBR1FROCJ9	2018-12-20 02:28:12.906377+00
6m7ny9vcsqzom4zzytrtpwlbn1ajp5ok	YWI0ZGFkMDNlMWZkNzRiMjdhZDViMDM0ZGFkZGNlZDExNjAxMDM2Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJjemRNQXFVbXBBUld3QVRiWDhuY3hEd1VoREgxdFZpSCJ9	2018-12-20 02:50:31.290946+00
hbfanbhqeqepzege91oq5tlyxjcks459	MzBmYmU3MzBmY2MzNTVjN2I0YmRmZmYxNDE5ZWY5MTYzZjM3ZTE5Mzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJYVXp2RDVxZU9Xd2xESmFnV3FGcE5IdzcyYU1tMnUxQSJ9	2018-12-20 03:38:14.416926+00
t56yl9rfssy2jqkeihkpaaqswf2loi17	YjFjMGI0YjlkZGViZWYyNWU3MTgwYTNhYWRmNjVmOWZiZjY5MWNhMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJncDJucmgzbTZ2bFhCc2ZSSTRRT2Y1NWo0MHRYTU9oNiJ9	2018-12-20 04:11:35.548133+00
ddx6ojhivxxh3w1orr5no42wum59kc6z	NmM2ZmMwMWZiYTYwYTUyNDBhZjBjNmIxZGY3YWVlZGFiOWQyNjAwMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJlRXFCRlc5WE5TZVhwZDk0UmlncFgwaEhub1dkVzJ1UCJ9	2018-12-20 05:36:06.625095+00
vdldx52a9589ggdzo3qgihrhs575fwwf	YTM2ZTMxYjQwY2VlOTAzZmJhZWU5MzA0YjNiMDhmZDdiYmEwMzg1YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJSRFRqSVZTYnhqcVZHMUxVVVgxNzEyR2tqU1Fwd3NPUiJ9	2018-12-20 05:37:44.594598+00
tcgqvotngwe1ekw01qwcvgahfx6k9mc5	YzE3NWNkNzAwNTdmNTkyN2NhMGRlNzk2MGVkNTU3ZWE3MTU5MjU3Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJsV1FDUkFXQW1zYVF2M1NWb29BUXhMTVdScFVJbXRDNCJ9	2018-12-20 05:49:15.823372+00
t7ea7xpjaieoud86ncxytb3i962yypcw	NWJiZDdlOWY1ZDE1ZDk2ZGNmMjZmMTJkOGU4NDdlZDVjOTczZGI3Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJOMUVRQ2hTamtUYVZ6R2w1VDVZYVFZZE10UFhwemttcSJ9	2018-12-20 06:11:39.834783+00
lgz600a0f01y95dw1q2h6wfa9egswhhs	YTQ5ZmNiMmNhNjIyOTNjOTg2ODQ2YjQ5ZTk4ZjdmMDhhODkxMmU3NDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJjbFZ3Rnp6OEtpWUZDWGxLaGZaNVZqMnN0UGxhdlpTZSJ9	2018-12-20 06:47:18.493551+00
0nkrto7g4xshxeiq7fczyaugny7dw5w9	NzlhMWQ5YWFkNWRjMWIyNjg3NmNmZjk1Yzk1YjA4ZTY5N2QwNTVmOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJXRUZMZ2lUeHFBZmVheGlXV0pENktpZE5BOEJCZ2NYOSJ9	2018-12-20 08:08:57.463748+00
i03pa47pny8sv398nxmjliji13lp770v	ZDAxNGNlY2RkYWQzZDNlMjk2ZDM2MWM0NjE4ZDMzMTllOGJiYWFhNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ1VTFmeGk3Y0F5TnRzOVc4eUFtUkVtMGRLQktoYVlkUSJ9	2018-12-20 08:35:35.816885+00
ytxjn2wr94p9ws10twx8a8umc31lyb1v	NDczOThjYTg3ODliMWI0YzA3MTA5NmRkMDYxZGE4MzE2NGM1ODYyMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI4NWozN0pTeE5vOUZSZ2dCd1ZMbE9CaTI5RmFBTW9ucCJ9	2018-12-20 13:03:27.766067+00
04fqswybce3t9r5r50d5so5mt2lwuiu0	YmU0OGY4MTE2MDkyMDgyODczNGRhZjljMzI2ZmIzZjU5YzFkYWNjNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJxTDYyYk1oYWJUdkpBME50aUdKSkYybHJ0Wnhaa1U1QSJ9	2018-12-20 14:20:28.560328+00
xxftb6yr7g8v7u0kr4xrt2pputfmrxxc	NDkwMThjZDUzNWQ3OTFjN2Y0ZGRkMDE4NjcwYjk2MWIyNTM0NWFhODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJBZTF4MHVzck1FU2xBZTZZY3ZvMG1mRXBLMzU3UXpOViJ9	2018-12-20 14:55:41.684019+00
ioe7tqpwu08b0p26smem4h3m0rf22239	ZTBlMzY4YmZlMzVlNjdmMDk3MDc4NWM1OWMxYmFmMGQzNjJlNzViZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJUVGthUmR6ZlBiZlB2U3RxRHVNU051ZmdxSFhmRldxVyJ9	2018-12-20 15:32:15.389966+00
nyyhi7dxeu5np3ymww44qatlxy6hhwxj	MmRiZWM0NzY2YjkyODNiY2NhODVmOTcxNDViZjI3NDA0ZjE4MjVmMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJrek9kSG92NWdHUk9HOEtYZHE1UzUzc0lzMFY1cGpqZiJ9	2018-12-20 17:04:32.842362+00
q04w3v5grnhpe4cs8qt5kytqy0cce1w3	MjljMjczMmQ2ZGI5Mjk4NDk5OWI2M2U5OGUxZDBmOTM4YjE5MWU3Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIxYTk2c3dzTjZiNE9zNjNUTEJ6U0xyVUhxRE5LQ3hqMSJ9	2018-12-20 19:42:16.899427+00
fem3azzs8y6mjoupyt8f390s5a0hpspf	NWIxZjYxYzU3M2MyZWZjODQ3MTBiMTZjMWJjYThlYzFhNGY3NGY2ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJubmlJcEwxUWVnSlU4UnJ0b3plcjdJcHNtbEVmd3ZGWSJ9	2018-12-20 20:19:37.110182+00
s76bhwre0dcuap32h5zslqgueodb9ht6	YmUzZDZhNGU2MDIyODRkNmNkMTdjYzJiODNhZmU5M2VkOWM4NGFkYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIwblhuMG10TE5DUHQxVkkzTDB1MVhGNTJGV3k1R3dHZiJ9	2018-12-20 20:22:06.516193+00
htkfp5xfdjumqobd8dlieg2tmbhjzmj6	NzFiNjQyMzQ4M2UxNjM0MTc5ZjgyMjcwNDQ0MzkxYjlhNzU5NWQ1Njp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJtRklXd2ptY3dNb05NMUJNM3g4QkYwYlJBZVlFNUtQNCJ9	2018-12-20 21:58:53.981189+00
zz6h7r1rnf7ijdnh8ntupmrzzckf9gw1	MzZmYmU5ZjliZWFlYzQxZjhhNGQzZjBkM2E5ZWRlN2I2ZjEyMTQ0Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJrRnZWcHoyc3VXa0JaUjM4cFVOWURVaHFvQ0VnT2RmQyJ9	2018-12-20 22:52:24.016079+00
llfu9nz3z4m7lzbdwilkund91bvpkhn2	ZTBlMWYxOTcxNWQ3ZDRiM2E3OTQwOTVjMmU2YmE1M2U4NjhkZGM2YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJqbUZnYVFlZXM3MmozaFRkYzNuQUJXNGxJR0hOYmJkUCJ9	2018-12-20 23:09:32.485764+00
b63p9gyghl3sa6n3hc456zpp4e4gleq4	OGM5NmMzNGMzMDkyMTM0Y2UzMGJjN2ZlNTkyZGRmZTU2NjVkYjg0NDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ0NnNKWG5vSVVGMURucnJxdVZwQ3UxU3FJVXhWWjNtbyJ9	2018-12-20 23:09:32.661121+00
jp5igw7vjps9iwttitytzjlugdxxdjc3	NjYxYTM3Y2I4NzIwYmE5MGVlZDMxZGVlYTQzYjc3NTBjNTk2MGYzNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJvY0s5VExoRGhBbTJjUUN4SHJaT0luMm84eGVLNXduVSJ9	2018-12-20 23:15:24.105688+00
5pdzuu1h0gre25stfqgp2vymkad9ryad	Nzc1OTAxM2RjYzUxMjg2ODRhZDI5OTlmYWFlNjI3M2JiMDVmZDg2OTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ6anJYZHE0bjZqT3BPNWJCbDlJNVViZ0RSOW01cEJRWiJ9	2018-12-20 23:41:10.02783+00
l3l6ua77sc6rtiztex0h2gn4552ntdmn	Njg5MjhkNjU2MDlkMGZiYzM0MzkzYWE1MGI5YTRhNzkyNDM5MmU4YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ4TnAxWHVMaURrdGl5ZHUxU2ltNTJyd2U4dXphTG5YMCIsIl9hdXRoX3VzZXJfaWQiOiI0IiwiYWNjb3VudF91c2VyIjoiNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9zZXNzaW9uX2V4cGlyeSI6MCwiYWNjb3VudF92ZXJpZmllZF9lbWFpbCI6bnVsbCwiX2F1dGhfdXNlcl9oYXNoIjoiMGUxZGU5Mjg0ZDYyZDEwODI0OGFmNmNhMTg3YjliYTU1NWNhMDJiYyJ9	2018-12-20 23:41:18.854968+00
aslb9cpurq7nc68yu1jihrbbuweh8px0	NmFhM2Q4YTc3YWY4YTc2ODc2YmQyMGE5N2RhYWEyYmU5ZjJlNzBiYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ1dm9JQVdnTmQwSHcyRDBFNGpVcFlmWENqM3RLc1czTiJ9	2018-12-21 01:37:54.775435+00
c0wpvoog48aw27x8n782ugr3lvwrtdg5	YmI3OTBjMjU5ZDlmNzliNTU1MmEyNjUwZDA2MWJjNDdjZTk5YzhiYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJlOVBPamM5SVBBc0FHaGRpcld6UVpxdFlnUHNobmJGMSJ9	2018-12-21 02:33:38.059256+00
lx7gjspghamn4ir7pzp1ui58t06n4asq	YTc0OGUwZWJmNTdkZDUzZjdkOGY3YzYyY2NmYTY1YWJlNjRlODQ2Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ0dHpORWN4Q3RHemp6ZDhxMjdIYlBTUmtiYUpjRVV4TCJ9	2018-12-21 04:55:46.751442+00
p5h3xm56c0vgyf6ftk17bd80m8tv53c9	NGFiYWJhMDQ1NTFlNjFmOTljZTM4ZDExM2NiYjlkNzc2NWFlZjllZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJEUE80WUdXbkZWcEVCZEtVTWxjaXNrVVpscjFUV3EyMCJ9	2018-12-21 07:56:03.927887+00
rosqq1n82vtjp7w1c6qoz8rb912rtiej	ZGI3YTc0NTJkNmNlODdlYzM1YTQ1MGJhZTQ3NDc0N2JmZDI1YjUzNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJyRDh2Tzc1NjdIenpzcXJ2YU14cG56TEw0ODM3NzFTbyJ9	2018-12-21 08:07:27.640423+00
n9igucv0dv86o6myx2yugawh66h8ynrv	YWJmZWQ5YjY4YjIxMDE2ZjI1NmIwZmYxOWQ0NDIxNTEwM2RiNjg4Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzMUp4NlZrVVZKVFNwd0l2bWF5SjVRdVA0eWhxazExMSJ9	2018-12-21 08:59:31.185499+00
rrwecpqzwncnkn754jc80wdwbelzo6bj	YmZiNTJhOTViMGZmYTQ1YmRlMGY0MTA2ZDA1MzM1ZWEyMDI1NmUzZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJZZnFqWklBV2xMMUhXR2Q4YXdpWjV3OEN0QjNnU1BSRCJ9	2018-12-21 09:08:02.3492+00
knqqtby4lerljp3mp8h39gdiduwx4h84	NWFlNjQzZGE3Y2NhZTMxOTFiZTJhNmM1MTUzZGMyNjI3MDVhOGY0OTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJCTFNxNWxseVFBemszdWp3Yld5Z0RDM21UemUyUXdVWCJ9	2018-12-21 09:29:18.921642+00
rg1pzedew2rxnmr58ugtxur1aypuswnj	M2JkYzVjZjIxZGFiNjdmNGRkZWQwYTE3OTUwZGI2N2ZiY2ZjZDJmNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJPZVRnVzRkR3hKYmltclRjR21lM0pPWHVqUFpzZnJTZSJ9	2018-12-21 10:13:54.223023+00
8hkrb92hdwcxr047cxet83pyxo0jz7jl	OTJlZjlkZDFkNThhZmE3ZWNmZmJmY2ViOGVhNDU5MjFhMjZjNTllODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJyU3RPcjNpbGsxSFVTNk9OSFRpM2ZidWdhYUxhNXZheiJ9	2018-12-21 11:24:59.874238+00
9kryq66o63oa9iwl4tfc99of1crciqak	MzBkZDU5NTYzYjNmZjZkNzhjNTZiODEzNGEwNjFjN2FmYzk2ZTBjMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIybGVRcnNqYjdPcUVhOWFJUEJjTzdQMjUzOFZEUXltZiJ9	2018-12-21 12:26:57.258253+00
zu2bp65qscoygblykbiuuwjmbdesrse4	NmI4ZTZmYWI3ODI4OTk2YzBmNTAxNGE4NWVjNzdhN2M1ZTY4MGIwNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJaZ2ZITlJSYUlRdHVZOVEzNHJVNkZhMjU3WTV6QnpORCJ9	2018-12-21 13:43:29.679644+00
7ep7mhbueyzoocgvyt1wr2srg37kp698	MWM1NjkxZTZhNGE2YzhjOGU5NjU3OWY4NzY3NWY2MzhiZWNhOWUxOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJDUEUxSUZwYkUyOVB3eFRyOGNkNXE5Sml4akJhMk92SCJ9	2018-12-21 14:31:14.524743+00
i8c2ny2nlsayi9f4pb1b5i8zql1h1dqh	ZjRkY2JkZTg4NTQyYjMyZGQxMDg3YzIxMjhiNWUwNjc5YjlmNWZiZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzOXM1a1lPNEJrRmhSR3JsZ3lmTHNIU2hSR29kU1pYRCJ9	2018-12-21 14:31:15.141248+00
apafb5fqzxipyl9im8i1g0g3heejdqiw	Yjc1YzI3YmQyYjIzM2EyNDc0ZTkxMzZiODNjY2IwOTY0YTJjZTIwMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJBQmVERUVBdFRXQWhid1hBRW1PSFkxYWhHYURKYkkyZCJ9	2018-12-21 14:31:15.596823+00
pr1orhygt9e82qndw3g212jv2jzyo82b	NTQ4NGRmYzcwYWI2OTVhNjNiY2ViN2FkZjg0NDI4ZjQxODYzOWVmMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJMTkh4cGM0QWdIeGRIN2xaSnhzcmJPY2owQ2pIY2ZMeSJ9	2018-12-21 14:31:16.21402+00
dwnion66dk4ily9qdmnziqxj8ptirgmx	ZDMwZTk0ZGZjMWZhMDEyNjU3ZmM4YWU3ZWI3YWQ5NzYwMmI4MjRhNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI3ZEpRMDlsYnJ1WENDYnlubGtweVFjZmJnY2UxS1BaNCJ9	2018-12-21 14:31:16.790931+00
7i5q28s4f4f8q85ndqz9mg2mib2m1rts	MjhmYzZjZjdlNjEzMWQ5NzUxYWU1NjMxN2RjOGMxNTY0ZDE3MTFhZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ6RXlRNDNGUEx6ZVhCZW5Ua1AwTDNDUmNaYktING1SRCJ9	2018-12-21 14:31:17.234521+00
l1q9zvllkw73dnsc16q9q9itutdzsh5q	YWIyOTNmNGI0NGE1MGEwYzhmZTM2ZjVjZmMxZmQ2YzcwZmU4ODIxNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJxYWtUS2dRZ0k0ajZBTlp3cU5nQW1abUtGZzI5Z2c5MyJ9	2018-12-21 14:53:31.507249+00
fey0gxgp1iyigom2il43j8jm9asbuuel	ODEzOGRmYmNkYzM2OTg3ODM1ZDllYmQzMjM5NzliMGY0NmNiNWJiMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI0Q011NVlIMkF3VnhOd1M4VmYzeGJoaVdBYXBBbE90bCJ9	2018-12-21 16:26:40.516505+00
55w8kctlnqn1m7da7biux061739da1td	ZDFhOWMyMzcwNzNhNTY0NmU3MTIxZTgzZDc5NGI2ZmFjMmE0ZjAyNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ6akI5V0U5RFY2R2VsVFlyYjFvcHhaUXBMc2JVMWJtUCJ9	2018-12-21 17:26:44.834202+00
pju8jjw1drpvsefqboba6yf8md8ojimb	MmNkM2ZmZWU2NjQ3NjZkMGVjYTc4NWUyZTBiNDgxOGU0OWJlNjlkMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJDWjhrb2V4WTNjZFRjeUNJTElFcnFPaHpiSVc5Q216RCJ9	2018-12-21 18:11:10.943258+00
jfpkf2tvqm0lpjstlat4itl578zm6u18	NzcyZGMzZmE2MzIwOWI3ZGE5ODcwMGJmMTE0MTZhOGI1NzI1MWMxMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJiZlhpbmxtMkhINFZqMFA5bmdSWThEWW1zNENLWlp5dCJ9	2018-12-21 22:02:28.03387+00
mxctnchv11mmkqor3f0r81y03ikd3b3z	ODRhYTYwMzU3NzM0MmUyMGM3NGEyOGRhMzMxNWVkYjA1YzlkMTBmMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIyUFFtSHR2UXlnbkJoMlBGQkV2YjVNUzg2YmNhTXJMeSJ9	2018-12-21 22:35:38.273537+00
xk3mkiwcf7icwgrowmeyw4b2ictpm6ah	OGVhMWYzYTNhYTRmYTAxNzQwODlmOTJmY2EwMWUyZDIwMWJjNWY0ZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIxTG1iRVFLNWtybHlIc0lDRWNsRW1zeUhqbVFCZmZiTCJ9	2018-12-21 23:12:54.126323+00
5ej21bsz7ntpgty6rk3z4rnlqg46mb1a	NDEwZTI2NzQ2OGQ0ZDMxOTIxYmFiNmYwYjdjYjU2MTQ4N2I5MGUxYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ4ZEY4cUg4UFFlV3plOUdiWFNUcXpQUFNBdWtMT1NCMyJ9	2018-12-21 23:31:58.191005+00
nlsf5ttyoyl1zlhtg0o2i9950ycvy9l4	MmMyM2Q0OTE5ZGYwNTBiZTZhOWU1YjAyYjAyYmRiNjBkMzViZTQ4Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ4VnpRV0xMRk9tbnJZeHA1Y0hwNTNiYVNJeUJTdFNZSCJ9	2018-12-22 00:44:03.66793+00
aku9xxip61f3p83bgdosqn3z2zltolue	YzdiYmQ1NTU0YjYzNjhlZTdiNTVmOWIwNzNiZGEyMzdhNTc2YTVjZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJlRGJPOHkzSHRjakNXRW1DbHBVSWFnblhmUWwxSzlndiJ9	2018-12-22 00:56:15.370065+00
wtm6auggyqlfdzvx93vfsjof01qfoidp	YmIyYWFmN2MzZjNhYzI2MTcxNTQ4NDQzOTIwODUzNjY0MDM1N2JkODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJoTXpIbFprdjMxdDZTdHUwM085dnBXZFg5dTFSY0g2QyJ9	2018-12-22 01:11:09.003207+00
lwk11walme9qb3q2bqr5p6xq5un7hool	ODUzNTE0M2EzOTA5MmMxZWZkYmU0ZGZiNDAwOGE4MDA2NTA3ZWQ2NTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJNbVhOb3pYUEdPWE53aFhPMEFMVnVKaXBqSjJBTzJRViJ9	2018-12-22 01:12:55.243002+00
e8jyq2q4snkbr9ydftditz87nklkxk8v	MDY1NzMwZTEwNmI0NmI0MTFjOGIxNTk0NzgyODcyYThkMGU0NDVmNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJVbkJSZVdHMnBaTUdWZnZCc2pGWGNmTW43eFgzSmx0SCJ9	2018-12-22 01:22:31.491171+00
o3xfk1ne7u2g80dosnzlvfhjxey83got	MmM5YTU2MjA5M2U3YWQzZjcyMjhmMDAxODFjZjMzYjE1NjE5NjAzMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ2UHFzYmUyRmdONGdXZWlIU0Z1OEtrYkZtbjN5MktmWiJ9	2018-12-22 01:30:54.605322+00
byynp5a5ftw83ub21e6gkmcrhg1p5mio	OGUxMjczNzc4MzFjNWRlZTQwYzJjZmRmZjU3MzBlMTMwYmNiMGY2ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJCeFU3ZTlZZ0o5MUZ5bEthMUZrSlQxYWJmRWRwdEg2YSJ9	2018-12-22 01:42:18.821958+00
b5gfjbnxyw1lopfd9nszbpemqfbo3t8c	MjU3MWY3NmJiMjUyZTc3OTVkNzhhODk3NmY4OWRiZWU5MjlhZjgwZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ6ZGo5TG1TS25TUHJQcm9mU01GaEdoclZDd1Nlck5YcCJ9	2018-12-22 01:42:18.838318+00
xu8ucz4uk05n9unbqnes9qra09ohzj9o	NDM2NjlmYTdjYTU5MTAyMmJiZjY4YWMxMmNjMmRkYTBmMTc0M2YwODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI0ZU9PSklMZ2h4aDlNZndCSDVNRTRjRFRnMlNyam5wYiJ9	2018-12-22 01:53:55.402979+00
x5svgc4hctzq65puorg7gx794vup01fd	ODYzNzAxOTk4NjY2NDRlZTNiMmQyNTcwNDcxMTExNzVmMjc4YjNhODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIwd3VSWHVTTng1Y2N0RlNzZWtEWkVSVzQ5ZFlRNzg3aSJ9	2018-12-22 01:54:26.492091+00
fh62dr8aq0qfvt9lyc9is04zyzfujsus	ZDY2MDYzMTIzODVkZGNmNjQxZWJjZDdlY2Y1NTQyM2Q1NmRmY2MwODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzUHM3NHppV1hncFQxRUdVNUdSUXhPTDJEQURldXcwdyJ9	2018-12-22 02:14:28.425767+00
ev8wa10s8cgk6n6uyxu7n1idfogxxer8	NjJhODVhMWQyNjg4YmNmMGY1YjZlMTgyYTJlM2Y1NjkwOWEwMWFiNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJlSUlaeU1GMldvMXkyME5iSENkelpCTE1KelpZa1lXMSJ9	2018-12-22 04:05:15.935874+00
z0004a8nbjevnh7uwaitkrtvmqyoqnxb	YjhiY2UzNmVhMDc3NmI3NzE0YTMxYjZhZjU0MWY4NzQzNzJhMGNkMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI2Rk9UTVVCZmxuZzdob3dQYlo1Nlk4OEpCM2pZQnNDeiJ9	2018-12-22 04:21:53.410467+00
r0h233o6vt8hgka3r77xqpwxcgdfnupz	MGYzMjNjMDk3YWU1ZDFjMzI0MDU2OWU1OWFlYzEyZWNiMDUxMjUxZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJIWUJuQUtiQXJjbkh4WmlCRDZUNDAyd3Vmdll0RDEzeiJ9	2018-12-22 04:44:15.738818+00
km1gyka9k4694l9zj5ce2k280olwu82j	ZmY0OGY1NDgxOGJlNWMwYTZiMDAxMzFkYzMyYjBjYjU4YjdiYTJjNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI1RXRIbzBUaVZ6U2J2a1FQcjFwREJQTklMN1RWMG1xdSJ9	2018-12-22 07:19:32.396525+00
az7pt5qq70f6dwbugt4v232nmk97ey6t	NjYzYzkyOGZhYWVkZjZlZDM0Yzg5NGU0YWNhZTNiMWQ0YmI1YzE5NDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJUGFBRUVYSU5kMEhMT2tkeFhxNHBGclROUUk4b29hUSJ9	2018-12-22 08:11:30.974712+00
iigrtnmsslst75p772zgj980nn29lblp	OWFjZjY1OGUyNzBiMTM0MWEzMGNkNDA3MGZhN2QzMDBhYmQzNWE5OTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI4bFdyZVRSYlA1Sm1SeDQzdk9wTUcwNGNVNVh3R2o4TiJ9	2018-12-22 08:46:27.663729+00
ua6k5n3z089a3ii26vd5e8x57wy1wcxz	ZjRiMjc1ZWMzYzgwMzdiYWFhNTQ5MDdjZjYyMDYyNWM5MzZiZWUzYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJydGpUeDVnUG94bHFoZ1dZOXdYclpQamNmdTgyQmh6QiJ9	2018-12-22 09:06:50.095762+00
wm7v5tf1v263pch6wrez2ohvssdvynv8	NDM2NGU2ZTg2ODA1ZGYwOWE0NjA0NWM2ZWVhYzgyNzYxNTNmZGEwZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ0WUJ2bEtUM2hqck9KQnNQUnJCdndlZE5VbVNWRmlRUSJ9	2018-12-22 11:07:50.15332+00
30xiyxluyde4so1ifidkmxjbm12y3c2u	ZDIwMzQ0YzIxMDI2MmY1ZWRlZjQzZTBkNTgzMmUwMmY0NjRkOWVmNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJBSzNKTWxDcVU4VDFrZjdoUmVieG5hbzZTQm9FaElEaiJ9	2018-12-22 11:31:48.134926+00
cmij0f4t9xukj2cy8t1ih2uuwgbh9r4t	ZjYxYmNjZDI1NGFjNzgzMTg1YWIzOGIzNmE5NzNkNTkxZGMzMDQ0OTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJR3dsQkF1WHlXbklFeHJuc0pOcG9SaG5sY3VEc1dUdSJ9	2018-12-22 11:33:03.438887+00
r29ztqv1zh1d0ll0sfb7xcjw9l2spdmn	OGNiOGY3OTkxM2QxOGE0M2UzYzg2NGIxMWZiZjM0ZGUwNjQ5NDYwYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ1aldDTG01REw3cmhtMUx4NEs5ckxTTHkxSUd5cFZ2eCJ9	2018-12-22 11:34:09.221196+00
7osewbbt96f3ecn7a2d898eyn444o4mv	OGE4OWQ1YWUwODVhYWY4ZWI1YTM5NmE0YmZhODY3MjcyYmE5M2YzNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJUaXRoS3ZnMng3SEwxQzRuZ1RJRzI5WmFhNjl6V3VYRCJ9	2018-12-22 11:41:36.327114+00
blj19w7x1p7fxirw92z387zd5v236vu1	ODJjZTY1NjA0MTg1MTU0ODI2MWEzYmRiNGEyMjA0YzQ0YTUwZTkyZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJEcXhrWDFGWkQzbTVTTEIyczZnQThQZ2dDTWVseUNCMiJ9	2018-12-22 11:41:49.774623+00
2a0dv01snk7ioqe7sk7rydowdyb5m887	YWI3NTU2MjdhMDRhNTMzZjczYjRlYjhhMzU0YTlkY2I4NTU2N2RiZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJhd0F5dmVhcVljMG9idEpkeUtndkNrY1pIQzFocE1vUiJ9	2018-12-22 11:41:50.052529+00
jpkn7pyvroxuyu10uel7jwe6q0b2y3pq	MGY2ZjRjOTgyN2Q0NWNkMGY1MjI1NWU0ZjhkMDUyZTY5ZDdjNjQ3NTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIwN0NlVlhxTUJGUmVSVnpRMHh0OXNTZklYSEd1ZTNwUiJ9	2018-12-22 11:43:29.892922+00
oe4cbacrroo06824q2z7ikoiq9lkr57f	MWE0ZWUyODMxMGY0ZGMyMDJmYjQwOTI3Njk5OTA0NzU3YTU2ZjFmYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIyMXVWb2xiM3NSM2tXeUlGNGdXcm1ra0x6bENFcXRkUCJ9	2018-12-22 11:54:33.154225+00
ii6lcavr9qpa6kvknb5bfx6sl7wz5wft	NDE2ZjE5N2MxNDNhODk1MTI4YWQxMzQzYTMzZWI3NWRlNGQ5MTMxZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJtWjRhSGxPd0NSYk5uMmFYa1hheURCUUJ4WnZ3bEpRWSJ9	2018-12-22 12:36:14.172208+00
08omsli94tir95sp2w93u53usawsjona	YWMyZTMxMTU2MDlmN2JlZjgxZTdlNzAxMzUyZjI4MDU5NjgyMDAwNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJjSGpqUXpoSmRzc2kwQjFqZkVUZnFlOGlvTEpoSHhJeiJ9	2018-12-22 15:00:15.185498+00
8cua3xjl6yhku4l3d1v39i2wh29qwszy	ODFiMzhhYzBiM2JhMjZmMGFjYzA4YTFmNjE0NjljNTg0ZjRjZWNhYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJKWFM5Wk9VNE9yeFdoaGlIMnZmNGFPaXRXbmZlWWFmSiJ9	2018-12-22 15:04:59.01116+00
sfj6insebxg29fbao7c66yjdvvj9ijt7	NmNmYmY1ODdkMTdiMzA5OTc3Y2E0MTExODViZWVlNzY1MWI1N2MzMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJEalFORmlmMWY2YjkzTkFFc0M5dWd3SURkemZhNDZKWiJ9	2018-12-22 15:05:20.34364+00
24gei1mr66scsu46kexbklj3aquk7sby	YmYzZTg3MzA0ZWQ5NzgyODBhNDJhZmJjNGFkMzlhZDM5NjIzOWFlZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJDeEdNVWJ4U1FtZlRvZ0oxSEFFZnlJaVl1T1lOemlDMSJ9	2018-12-22 15:47:12.568554+00
0dijd7lbbzn9ings546c8r6jkkrhfuzp	NzdhODdlYjE1MzJmODlkZDFmYWI3NTUwZDUzNzk2ZTk3NTYwOGY5NTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJtVE9rMHZFNTI3VFc3NENtRXBkald3QVp4T2JOMmJSVyJ9	2018-12-22 16:13:23.672156+00
l94oziccw20i5mlpqfw8gjbkmo84u9os	YjVmMzI2MzlhZjA0NjQ2YzM1YjllNzJjZmY5MTQ2MmE5ZDYxMmU5NDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIyTWNLcXowZ2NyODBlbnRMUlJjNG5hWW1DbE9nOW5SViJ9	2018-12-22 18:51:29.670293+00
tex57mcf81tn9c7fkxphrxdae1b2to1c	MDFkZGZmMTE2OGFiMWU4ODg2ZWY3ZDdhYjZkZDM5NmVlMjdkZGVlZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIydGpjUEFCWXRJVHpHb0lPNTNyb1FSR09JUGtDeE5paCJ9	2018-12-22 19:02:43.401601+00
v29dyz1g15dmrq1v4if0k6o304kvyw9o	YzFhMGZlM2JlMGYxNjk0MWUxYjAxMGRjOTEyNDhjOGMyMWQwOTM3ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJWRUY1eVFxY3BUNmh6U2FRWVM4TXBDNHNPMnNOUm41ViJ9	2018-12-22 19:46:59.1636+00
308rlj67rz2h02wift0g58zb483ynrno	OWUwZWU5Y2ExZmFkM2VkYzNjYjg5ZTgxNzdiYjM4ODg0N2M3MzA5MDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJMVUZMUHFHdnpnMTNhVG5JcURmYWFtZlZ0SmxyTXNIbiJ9	2018-12-23 00:00:24.077327+00
6bn3spkubrzbeyx1h2i4u41tsjbu7911	ZTU2MmJjYzM5ZDRlNDlhMzdhMjQ3MjAyYzI4M2NhYTA2NzVkMjkxZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJVQW9xUk9CM01qNnZTTjhDaVZvWTRwdm1tVmpiUVF1ViJ9	2018-12-23 01:05:31.589151+00
kd20b36e2a5xei8rq1tq2bidcd79y900	MTViYWJhZGFjNDZjYzRjYmY4MmQ0YjRkNzY2ZDk2NDY0MWRjYTc4MDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIxb0VOT0tiUHN6cDRFRzlOSU9NN0xzOVA1cjhxYkZieSJ9	2018-12-23 03:18:58.54902+00
kwsdlzhdtop36j4lkrbiy9glm11crlkl	NjQ3NTJlMjc0ODA0NWY3OTcxN2EwZDQyMmUwZGJiZDY1OWY3N2Y0Mjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ0YjE4aW82NUlUaTNhTUl0OUxzMjlHYjNQYzRDeUhidSJ9	2018-12-23 05:02:24.214839+00
hr5o4ltwdws0ovgj4pec5l49xgtd54m2	YjJjY2VjMGIxNWZmM2ZiZmZjOGM4YjJjMTUyYzI0NjE2YzVlMTQyMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJuZ0pSTjJFVnl1QlBtdnFBUm9Gd0Z6QUVPZXF2UG5OYiJ9	2018-12-23 06:34:30.416114+00
1hdt73ty0aibq8t6mc23zxykh3im485l	Y2JiOWQ0MWFhNDliMjkzZTBlNWRjNWYyMDk0NTM1YmExNjJhNzVlMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ6dXVFRm83UjU1OVEzRDVVd2xQZU5SdGJOaW85OE9xeSJ9	2018-12-23 07:11:12.909166+00
u629ro8tku96fa25fw8z9607u178q9my	YzcxZmRkNjgzMWI4OGE3NmMwN2E4Yjc0OTc3MDIyMDI4ZmY5ZGNmYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJocERXY2JUTUJza1RUc0t5b0tBWUFVejVRem9rOW1qaSJ9	2018-12-23 08:12:56.847549+00
xh7awm3dqkou0vaa3yqci0q62p0vw6bs	OTUxMGFhMzhjNWIzOWEyMTEyMmE3YmU3MTM0ZTkwOTM2MzBkYWE1Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI2alNPeEk5SU0xaWlMak5ZTEcwUEw3QlhYR0ducDhjUCJ9	2018-12-23 08:29:44.861821+00
ntfdvdopzewo35wjqmhpeixg26wvg82p	ZjkzOWU1MTlhYWVhZTAxZTRjNDRhYzJhZjJmMTUyYWM5NWRiMWY0NTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ6ZFBIU014clZtbWt3SUxRMjNiaVVsVGVSQmx1MVFYVSJ9	2018-12-23 09:26:04.725926+00
0o006j385yw9eiejbon47rwopkr6fk3d	Mjc5ZWFiYThjMmY5OGFlODM0MmNkYTU3ZWY1N2VhOTdjNmRmNDhkMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJSR0ZZZ2l6UFNHN1c3V2ZiZTlSVmJieThIMncxWjFjNiJ9	2018-12-23 15:54:42.957178+00
4xnwvyso8e78akbn85e3riskycxduxt1	ZmEwMWYwZmUzZTI1NzlhYmRjODgyODk1MmY4YzlmM2M1NmU2ODVkNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJSSVZoYkNCRXR6aWhGVTAxRm1GUmsyNUc3U25pMmxPUyJ9	2018-12-23 17:04:56.966076+00
rtdlg7km279n3pzeisg3qqokhh8is0a8	NzQ0MGQzMGM2MTNiZjA0ZjUzYzUwYzBmYzk5ODM0NWM4MTU1MTBjYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJZRk1rdU1xb1h5MU1NaXZDM2hFcUlhaW1yZHVZazV4SSJ9	2018-12-23 17:04:57.18334+00
ltlvulp72mvvn8t878tc6jw6tx3pawpk	YzIwMDExZTJjY2Y1YmYzZjU0YmVjYzI4NzU3Y2RiNDM4MzMzNzUxYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJDTG41N0hJTzBQdkh2cDRjVXczUXBsYkdQY2NkWVM1UyJ9	2018-12-23 17:04:57.360475+00
46ehiwwbrgwpf1f0lz2uzzhkxcfn0kkr	NjRjYmQ0YjM0ZDMzNzFhYjdjN2RlMTVmMjI4NGJlMDZiYWFiZDllNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJLdHVJUHRkcVZxUE5iSW1XZ2huRGpQNWlXVTdMYnE3SyJ9	2018-12-23 17:45:34.058194+00
9hbudqslureqma4h7z7kxfwna6zjidu9	YjhkZThiNjkxMmM3YWI3ZjU4MjM1MDZkNzZjNjVmNTAxZTQ2MzVlOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJoQlhld1A1aGlsQU1rV1F1TXYxMkU3dzJwV2VuV1dEeCJ9	2018-12-23 18:34:25.144769+00
0aj5zsf48hmxht2gveuzexatmeyoy3b6	MjVkMzIwMzA5ZjA3YjBhNWZkYWE2YTlmZGE3NGExMjlkOGZmZjAyNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJHYXd0NloxUVptMGdlUVBoZjdBV01UeUlFc3NHSnlxZiJ9	2018-12-23 18:36:53.797444+00
wyue6i8hgwkn8sh4zyrcnr7avvrehv9h	YTMxNDU4MDc2MDJlMWU3YjJhNDQ4YmRiMzE0NDQ5NzdmOGMzZWQ3Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJBZnczbEhhSEhpdEpXNmp6WTI0WjNhSE9SUU1QOTFleCJ9	2018-12-23 21:18:40.689168+00
ohgf0u0o74i7d4m6wqyi3jku5h9xnlrh	ZTIzOGU5OGRlNDBmMjdmZmI0ZmIzY2FmYzA2YzVhNDI3ZTE4MDNkNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIzQXpNMm1XUGpSUUdEN2pzaEtmdENXMTY1Y01xZU1HdyJ9	2018-12-23 22:47:10.040474+00
k8dw0c4m49y6tb3jtvlw0v2cejw61gp0	NTRlYzlmMzRiOWE1MTg4NjExYWZmNmU4MTk2ZDJkOTI3NWQyOWM2MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJFdnhySUFOT25yMXc2OGltWXBrZnRmV0Vxb1Brc1NhdyJ9	2018-12-23 23:34:06.269466+00
givjfff1xoclbdijq5424d18kx4t7a85	ZmM5ZmE4NzcwZDRiNzQ1NzFhZjFiMGEwNzcwN2RmZGI0YjdhYjVhZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJLbkxwSldIRWlhZlo4QW9TWWpVN1J2UE90RURjWVNwTSJ9	2018-12-23 23:34:08.801932+00
hu9wbt64m6mmu465a62whhm3zomivg7x	OWQwNzJkNDZjNTQ4NmQ1MWYxMTYwYzIwODIxZTdlNjQ0ZDU0YzQ4NTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJPSUlaZHQ1d3lOQnZyWDJuUEttTWNQdVNSakRMZUkzaiJ9	2018-12-23 23:48:05.414106+00
rpgivw715izj4v8ial7pwrop9znuaasr	MGFhZmJjZmI5NTkxZTE5NTM2MDUwZmUzNGQ3NmI3N2NkY2JiNDRiZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJMQTAwRTRSVEk3VXJVWGVJY1NpWWRVdjFaRGR4b01FNSJ9	2018-12-24 00:47:26.508027+00
4jchr1yzpskusbbvan9a5np84fufx9kw	NGZjOTY4MTM2NjU2Yzk5YjEyM2EyMTZkYTc0NjA3YTA1OGYyYTI4ZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJXRDRXVk40OFFCcUd0Q3pyVEdQa2wwZ3h5ajhqcExGdyJ9	2018-12-24 00:49:39.324007+00
3vsan1px0abp2krhdvlymg6edp71lhrd	NDJkYjZmMmZkN2VkZmJlNzM2ZDQ4Y2FmMjM2ZTc0YmQ5ZjFlZTBjNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJCMXd4d2cyRk5YTWNQZE1idmhDc3FEUHdNY1gySWF4byJ9	2018-12-24 02:42:54.72948+00
hz1i03bjmb8rnoeiai9pvu8q3mn0f9yt	MmI0NDE0OTI0YzgwNDcyZTZjZmNjYTMyY2Q5YjE2MWQ5NjJhOGE5Mzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJOSDJ6dFlWWEtDb2FvMUdDb003MXAxRHU2NGNxMzh3UyJ9	2018-12-24 03:19:06.497275+00
mkec4dk1z3kdykujyf3xqeajx0zb1xkt	OGM3MTc1ODEyNGQ0NzIxZjAyNjJiOTUzMWNmZThjMDZjZGY0ODc5Mzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJZSmFxcnhDbG9TS2gzWmVWU2pRRFZTcWZWWVhGM3FwZyJ9	2018-12-24 03:55:42.404683+00
xkvei1eq8cussmvao6k4sc8e6n2uf1m8	YjQ1MTM4OWJmYWFkMWI1NTE1MDJlNzYwMGRiMTk1NDk1ZmRiZDc2Mjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ0MjhSZWVTMGhwWFkxSWczUTdvWWc3V2NsZUVjWG4zbCJ9	2018-12-24 04:16:54.408292+00
1zio28yawl7g7ymclsi1048pnpom75o3	NzQxMmZiMWIyOGZjNWYyYzVjZTUyNWRkZmFmZDBlODZiNTRjYjZjNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJWVUJqVG9kSkQySlc3blF3emZQWW1tT2JycGRqNGtBYyJ9	2018-12-24 04:53:00.944194+00
5smsqf47jvcif9jndxu9qrdfcmjxnysu	ZjEzZTdhMzA1ZTg0YWVlNmQ1MTBjZTExOWE2ODM0MGQ0Yjk0ZjQ4ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI4cFV2WDVQSVJSV2c1bXFpSlJJY2VCNmpudlhMV2NWciJ9	2018-12-24 06:34:00.420985+00
loc3y1ygbp0quunptl1im9dm5w9x09ku	Y2RlMzU0NTlkYWU2Yzg4Y2Q1MTVlYzA1YjJkNjBmMmI4NzBhMGY3OTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJWaGp5cUdxQWJvbGd2ZFNUSHQzYkVOc1plbjlUWXB2QSJ9	2018-12-24 07:03:00.264096+00
7l74dfvix9bq6yriv41phsnhybhh23or	NmM4ZTQ0MDc1OTBkMDAyNDVhNzk5MzZhN2IxNTkxN2JjZWEyYTNkZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJIdHg0bDJ5ejA5VGtwV2l4WnFjdmhrak1CSGhha2p4TCJ9	2018-12-24 07:21:50.89624+00
02pm6qccll3hvzs91in9ml21imrjgav4	NGNkY2ExOGE2YWFhNDE5NWUyNTUyYTkxMDhmOTE0NWZjYWJjNTAxNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ6MmQ0RE1KUEgxazdYdlRSSmE1V2oweGdFVm9iWkduMiJ9	2018-12-24 09:23:18.589678+00
sdappwggkkpagtnfjnx4unt595fjo14a	OGNhYTE0NzY1YWRlM2Q5YjRjMmFhYWYyNGFiOWM1NzU4ZjdhODIzOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJIYVNKZjl3QkJtYlhiZFdLVHhhYlFkdmJLUUlsVUtkOCJ9	2018-12-24 11:32:19.174556+00
ctvwkij97129tg2ukmztr7qlgddq6b9n	M2RhMmY4ZDgyZTZiMDQ4MGFjYTQyMjdjMmVjMTZiZjYwZDZmYzkzNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJXU0tPSlhETFhXUTByWlYxVFZRN0t2UnkyeGV5c1ZOSyJ9	2018-12-24 13:01:23.089302+00
sp3p9byxd0erq7e6m3nz4alt859826zs	NTA4NmFjYjFiZTFlNzJlNDVlZTAxYjllNDg3ODBhMTdhODQ2ODQ5MDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJtZmhDM1N5VHp4TndXNEY3M1Rzc1dqd2EwQlA2NXNGTiJ9	2018-12-24 13:04:05.938242+00
6j2e2owa8kyqweyr6udzq2pvj4we6ylm	ZmVkNjA1NDhhNmE2NGYwOTFlYmJlNmJlOTFhN2I2ZDBlMWJmOTZjNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJpMDlMNFNLNnpTQnU2dXQ0MW0xMVRpYkFaNU50WlJXSyJ9	2018-12-24 14:12:10.739345+00
5xphay94qp5uyvutqrphh9a50mk4sjk5	NjEzYzFiNjRmMDkyZDVjNzNjZThkNjA5ZmIzYmMxY2M3Yjg4ZmY5Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJqRDN3QmFTdjhIU2d1NlVoemlNWVJMNTlQaHRzZUhVUiJ9	2018-12-24 14:14:40.273957+00
v8jn2wlgv4ryfijnd0255umzf3z3hbj0	NGYyZDAzYzY3OGZiMjQ4N2Q4OWJiZDI2ZGZjMDEyNzhkOTEzODE3OTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ3UDBqUWFJZzJSSWs4cXhvaTdZWEpQbTFLNFRCaENsRiJ9	2018-12-24 15:22:10.219923+00
f6tjynyvi8ekawq84ku0sl2tkpfpq69o	ZmU4ODdmMThlYmVlMDY5MzFlMTEzYzYzYmRjMTc0NWVhNzk0NzIwZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJWTnR4eDVJNVh3eE5xUldUUmhkZVo0ZTFFRVZib1d6OSJ9	2018-12-24 16:00:38.788882+00
5tf82zyljsz08rufm31rgng5hq8zj5hz	MDVlMTVhYjhmNzIxMDc1ODUzMDk1NjNkMzIwNDJjNjkyNDRjMWVmNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJyT1ROT29pSGJvMkwzb3BNQUFaVVhXaG1LUkt0WnpveCJ9	2018-12-24 17:11:39.312475+00
dw9hh3vu4s7uhh1sfo2w4pg4szbo2nrd	OTJjYzc2YzU4N2IyYjlhNWE5MjRiNTBkMmVmOTM5MmY0MDdhZTMyODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJGOVczNlJkTzVpTU4wRE9yNHJUaWhUSFZLWllCajhVayJ9	2018-12-24 17:50:03.174228+00
7wnbrn5vrhzfpa5d4rn5lb8ql4f3036o	NWUyNWI5ZDJkZjE3MDA4YWMzNWE4NDgzYjYxMjI0ZDM1ODQzY2ExODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJuZk0ycW1uVTJEWHNlbnpnb3hwSDBVc0pxR3dVS2lwViJ9	2018-12-24 17:50:03.175669+00
f1vj2lee9oix0fikt5ans6k3q2rw75hy	ZGViYmVhMzIzOTc1NGFlNDY2MWVlNmJiYTNhNTQ2YzVkZTk2MTQxODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI0U1N6ZG1aS1NrQ1k1MUd2Wk1VYU9qN3VTUDJrT0NIRiJ9	2018-12-24 18:42:00.276217+00
9gycyccureofjefy1w9c80grv7uxwv2w	M2QzZDM1OGFlMTRmNmNlYWQ2MTQ5YmRhNzJjMWQ1YjFhMzFhMzdmMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJINGt4djVKTFFibUw5NHAyM1VCcjhld3RoNnlZeDVyeCJ9	2018-12-24 19:22:26.687664+00
rln4sah0oppsh16qurv678xpo7gds5la	ZmQ2NDc5YTBiZWM1YWVhYTU3NWNiMmIzOWJlYmRjMTMxODlhNjY4ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJZRUJWemhoQmE0T25DaWFWMzlaQmtwRGlpZFc3TFBZTyJ9	2018-12-24 19:30:16.409646+00
uw5om7w27p6v1cxasgot6rr7ksp4gand	MjA3NWExYmZjYjg3YTlhNTE4MGE3MTNiNDhiMDc2ODEwNTkxYzAyZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJabXVEODV5enFMSFFMc2R2d2xjVkd3QUt3S0tKNkFkTyJ9	2018-12-24 21:12:23.148216+00
t0qqvycn6hwissvwcma5kanohuux1giy	YTdlYmJmMmJlYjY4OGRiNjg1ZTg5NWM3ODkwNzU2MWFjYjkyMDZhNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJXQjg4RndMdnlpWVhlT0NnWkUzZTZyeTFrRkR0ckk4UCJ9	2018-12-24 21:51:41.975432+00
fzo3s4fja2o8gtpk0c9x1owj2zemp9zm	YjdhMmEyMzEzY2YzMGMyZDBlYWI1YjQ5MjY0MDkyYTg5ZmZjMTU4ZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI2SGhJanhNc2YwV0t5YllpNlN5MDZZemZSZUJuanQxRCJ9	2018-12-24 22:06:32.671669+00
trbexgltf627k3f1xldh2tnn4x7xpyk7	NDMwYWI4NmVjMTk0ZTc5OGJkMDNiOWE0NzRkZWIwNmIyYWFlYTkzNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJoMEhmM2FHS29FOUZKVHQ2eGpzb2NPR2hNd3ZKMVpEeCJ9	2018-12-24 22:23:38.537937+00
7tgx3z41o13yplwxnm17s0o8gpw9cvut	OWEzOTE3NmE1NGE1NmU1OTI0MTYzYTY5YmVhNGNjZGE0MTc2NmFlZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJUNWxEUVl5NFVqU29OZVlqYm1ESVhHZFp4Tlc3aWxnViJ9	2018-12-25 00:10:50.400479+00
rjz4kbv092u8riezvdwkauxuk3t2la7j	YTgxYzI1MWUwMzA5NGI4ZDFmYTA1NmQ5YTBmZWUyYzM3YzljOGVlNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJvQWZDVHdHRTlKb2NkWWlEaWt6STdtUlRvNW1nVVRYdCJ9	2018-12-25 01:48:16.290861+00
54mxm21e5f1ep832dwwxrxnj6iip1rta	ODE2ZGJkMWUyYWE2MDVhNDQ0MzZjOWE3ZWYxOGQ1MTZkNjAzOGJmMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJXcDFoemxBS3JYSkZxYmhtWW1GT242S08wcGRib05LcyJ9	2018-12-25 03:23:39.28025+00
yd7bn5i7zghfmmlxtcdrb4mffo4qyzkk	YTA3YWU1ZWUzZTk3YmM5N2JjN2VjNDk4OGE2NzMxMzg5NDYwNDNiYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJCOXdJOHNab3Z2dE5MMWhVM1FxSkplUDNrbFl0TjJ3NCJ9	2018-12-25 04:19:49.941697+00
9ppr8dytld6nmwcj9rej31zx3h9y7u90	NGRkNDAzMzUyNTQ3NjY2NTk3MDY0MzkxNTVjN2E1NGNiZDM4ZDJjMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJUR1VGQnhNZXJtMllFbFJxRllGS3ZZQ1VSYjNUVFV2RyJ9	2018-12-25 04:49:31.599798+00
9bpo8g4wt8m354idy0s1v9u25wgw0et2	OWExMzM5MjE5ZTBlMTBjYjEwNzE4MTliZWEyNTNmNzliMjkyNmU5Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI2UncwODYyclNadlhuOG5SM3h1ZUt2TTdGc05DQ1hNQyJ9	2018-12-25 04:49:31.779445+00
oizuqqxdmg0ioopfsdv0x7cc2981ku0z	NDYxMjMzOGNiYzgyNjZhZTkyMjc1NGY2NWI3MzFhNDFiOTlmNWQ3YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJWVGJvcEpGblFwNEpjZEVlV20wOXB5a0JlYmkxd3RvTiJ9	2018-12-25 04:51:14.605357+00
ts2b2mvi3wyb7g2gr9p1x791ix59f3l6	NDlkMWMyMzk1ZTVjMDAyOGI0YzExODRmMjBkMDE1OTljODAxMmMyYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJnd0U5TVRSWEt5QURKY2tHaUl6M25vS0w3ZDlocmxwZyJ9	2018-12-25 05:21:04.353616+00
syko9a9p9z3jpe2cy7769me2uccgh74y	ZjVkYjk1MjYxZjQxNzJhNDdlYzU3MDk3MmEzMGZkMzZjMTYyYzAyMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJBYWRrMXNRUDdhRkpSNWI3N3lDbkpKVm40dW9JemlhYyJ9	2018-12-25 08:20:00.742501+00
tayuf46bpml07og1c84zhag5v7j2m2v4	MzQ0MGQxMWI1NTE3NjFiNjVlODM1NTI5Nzg4NjEwMjIzN2U1NjEzNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ1aHZZd3lSaVY2Z05NY0hRMU9QOTZOQmlIemlhaUJRNCJ9	2018-12-25 08:20:39.074406+00
b2gmcblt5q87q2wfe432zqwbzgrjlblx	ODIxYTQ3MDhiNWI3MGE0YzFiYzk3NDU0ZWRmN2JjYjdmMTUwZjkyMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJudFNKaVo1UnpHOEdqcEFxdTY5WTgwR0tZbDlvbHBvSCJ9	2018-12-25 08:57:28.754266+00
a33t6qvps1pycldlkcrmf7wdti3d27q1	MGYyZTU3OGM3ODFkN2M0MjU5MTM1OWIxMzVlM2U5NGQ3NGFiNmU0NDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJpSXE4dW1oRnF0RjlMczBkenlHTTF6RXg5WmdzdVIzNSJ9	2018-12-25 09:15:10.657876+00
7rxposx0u3b7ywgvrha6s1noqftc4mm1	YWJlY2VmOTM4Nzc4MTZjZjlmMDljNmE5NzRjMTQ3MThkNzU3YThjZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJMNEc3U29WaDZCNnFjZTZrMk5OazhXUmc5TnpMNUVvaiJ9	2018-12-25 09:38:13.408345+00
by1m9txr17xdj28j1074l3ktpzqv56v5	YzE3ZGU3ODE4MmEzOTczZmRkZTA2ZjFhY2ZiOGMyNDViMWViMTQ3MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJSQ25WdWtQV3dUZ2NiU2c0bkhCOVZBNTBwR3ZWemVKQyJ9	2018-12-25 09:52:12.965983+00
ebmrotqxywwtxa355r5yl9zogp1kzyzr	OTM2MDBmNWYwNGY0OGFjMDVjYmNiM2E4ODUwZWY5MjZiMjY3MTBkZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJlU2NlVFZuOVhXSWpvUVd3SHdSZUZ5cWozVmF0SGFZWiJ9	2018-12-25 09:52:12.97528+00
eip8lg5lhh1gswcxnd5ql180nbnz7lck	NTNjY2I4MzM2YTNiYzFiZjYzNjhjNWEyMzg0ZjczYWNkOTY4NDM2NTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJZMTdJcDhVUHNGdHQyV1k2OFF0Y0xWOW9QV2dkb3p2MiJ9	2018-12-25 10:02:55.49437+00
wcof7ax76omxta3imoi93y5yqasxwb1i	ODQ0NTIwMTliNDQxY2ZhMDJjODU0MDc0YjllMzNiZWQ3OGU1YjZjNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJqRW9kd2Z5MG5PY09nQmE2VGIxWURCVkRsWGpXNGhJcyJ9	2018-12-25 11:00:35.703535+00
i6ves76xwptcvihieztb755kvcropl28	YzViOWJiYzEwMWE3OWIyMmFkNGZjNWY1M2MwM2MyMjE2Yzc1OGI1MDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJXa2RQYXpaVzRXUHhGU3ZBdnVNQ3lMd2VpaFVpQmNvQyJ9	2018-12-25 11:05:58.596398+00
lv0u0kptr8vvdi8kx2338u9rscradax8	NTU5ZTAzNjliMjVlMzkxNmY2ZmRjNGYwYmZmOTQ3NDMzYjU0NDFlODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJOdVVremF0ZXJBSWtESWNlN3gyb2xWV0RUVUhmckVDWCJ9	2018-12-25 11:06:28.258717+00
bn7ha2ejwbxb5ja4u0m231118eawvpdo	OGEzM2I1ZWE4OTQzNGFlNjlmNjk4ODQzYWU2NjEzYTNjZDIyNDU0OTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI4SVZnNzhXQ2p5YkVEV04xVGhhcUF4dm95Wk1WRmZMeCJ9	2018-12-25 11:10:53.347799+00
27d31a8rwy3jtv8xstl9x0j12fxq3l5y	NjMxNjU5NzBjNzczMTc0MjBjZDM2ZTQyZDlhZGRlYmJmNmQ1YTI4OTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJKUUo3WGwwTktzdmpnWndGNnVnQlVNQjdUaE83NFhvNyJ9	2018-12-25 11:16:09.152999+00
gmok1umrbok2unaovmfobe1aqiv1k7tr	MjY4ODY3YTBlOWQzM2Q5NzQxOGI1MWU4MjFjNzYwNDc5NjIzMmUwMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJUQ3dhMkxXVXdCSE9LWXdaZ2cyUDB1S0N3UnVGVVJWWCJ9	2018-12-25 11:18:08.650415+00
l1g5whwse3axg0voxj7d75jzuh538f94	M2RjMDNkYWYyMDYxODE0MTc3ZWI3MGJiYjZhZjVlZDdhZWY4NWYwZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJIZHpaQW5TeDgwQXRBZ0F6RWhIeXFSTlhlNklpN3ZZTiJ9	2018-12-25 11:45:09.222278+00
4mf7y91q4axt0g7trc09v3tza8dbbbea	YjYzZWM2MTVhZGRhMWJlNWY1YTk2YzYwNjZhZGRjNGFjY2MwNzMyNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJHazc4Z1Y5NkoxMmwwSGtYVVVTcERLSFFHMG1FVjVGeCJ9	2018-12-25 12:11:29.844449+00
gocfy0b9sa8aaul4zgjnepn5ffyfx5pl	N2Q1NGIxZmIwNmIyZmE4Yzk5MTVkZDY4M2I0Y2ZiOGJlZmJlOWE2Mzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI4czNranQzS3hZWjNaSWRiem1HM1R0UldjQ0RLZWZSbyJ9	2018-12-25 12:56:06.908563+00
qowtl7xh118io854fsprar4ogre64q7g	YzkwM2VhOGQ0M2FlYmE4YzliZDhmNDRhMTYyYTJmYzQ1OTAzOGFjMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJYeFdJSm0xS2lXMzFzajB0NGVQTzBKQ1k4Vmt3YnJhWCJ9	2018-12-25 12:56:09.614215+00
ku0wi7ujdo92dt833v1ybi3o0px35643	MWU3YWJiNWFhMzY3MzFiYmVjZmIwMDJmNmUyNDgzN2RhNWY5ZmNjZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJST3liZThzYjR0Y0RPRGQxMXd5NlA4S1NJa3BmRFc5SiJ9	2018-12-25 12:56:13.870238+00
u88cfb1opqg86qih83sjn47w972ato4w	ZWRiYjk0MTg5NDFmNjM3MzU3ZWFkMmY5MmNjY2FlYTUzNjlkMDU1YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJHMHVhVjM1TUg5dWY3WTR5UmpzTlR1STJWcUtJb092cCJ9	2018-12-25 12:56:30.602023+00
o2mhxn0lt8losqfmdpjn08s1y4if76qd	Y2E3NGNmNzMxYjhiNTljM2ViYTg4ZDk3OGZkMzMxNzI3ODI0OTFiZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJjb1dRN0F3S05hbHJ6YWZxajYwYk5hOTZKQmtiVVlWUiJ9	2018-12-25 12:56:35.919643+00
q4pubvti3xbh7on2wpq7be1d8a05rwse	M2RjZjBhYzhhMmQyNGE4ZDFmMDRlNmRhMmE4NmZiMTg3NmZjNTkzODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ4bVdkU0RiSTZJclZOaUtwUXV3ejkxMXU5NFZONkpsbyJ9	2018-12-25 15:51:17.986204+00
hcvbelm8ff1k0dntpdl46i8mm6z6umph	MzAxNDlmZjQ4ZDg4NjA2OWYxZjAxZDNlZWRjNmU5OWI3ZTcwNjZjZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJVcTI5Vm5KcHFpOWdha2oxaXk0UjNhVVFDVjMzOElkcCJ9	2018-12-25 16:24:22.793058+00
6xgzxfejayw18gjvjvwnfbrl7yjg9yx0	ZTQzNTU1ZmQ4ZGM1NTcxMWRkYzIzNDNjOGNiNWFhNjM2OTFjZDA0ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJEd2RTV2lOMXFSYVZKOU1yTVVaVlVLRXZVMXNTSDkyeiJ9	2018-12-25 17:07:05.815436+00
gu6vk3y5xiz5vvz6liquci8ugklt58ix	NTdhZjBhODZlY2U0ODkwMjg4ZjZlZDg0MTc2ZWE0YzU2MjJmYWY5NTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJaSDNZSkp3TVlKWGZ1dHpOT2NETG5Wdm5UWXZydEJVdSJ9	2018-12-25 17:24:25.484276+00
7erbpmvfju37zj8e202tgjaovlf48wv5	MjA2YzhiMzk1MTg0MTQ3NzA3NzBjNmQ2MjJmNGZhMmYyYzBiMTFkZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI3TktIRXF0UU9xMG1xOFh3UGV0dUhWbjR6NDlteWtVbCJ9	2018-12-25 20:15:45.712466+00
vgmkp9avd4vrw8d209fvz3galk81wjcb	ZWViMDIwMzM1YzBlZmYxMmMxMjNkY2E0M2JlYjVlNDViNWI0MTNjNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI1b2tuZGxvQ2FzUEJwQXBuVExLalVlaEU5M1l2ZUFnTCJ9	2018-12-25 20:39:17.412057+00
7gnrungcy2022jidlai0f4bqgj4kfclt	MDY5MzQ4YmI3OWY0MWY0ZWEzNjMyYWZhZGFkMDBlYTlkNjBmYmVhZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJobm9IbGNTTlVrbXlPbjJuWEFCS093SHRLMnhNc1NoNyJ9	2018-12-25 22:33:24.595635+00
wt2pd9pgk2u368vrbms2huvz1rmut180	NDUxNzU5NGIwNWFiMTFhMmU4YzE1MGNmZDM3Y2JhNzRjODAzZWM2MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJCcWFxYkZqQnJTU0pkaTF0WDBtVlk5U0trcGN1UlJIWSJ9	2018-12-26 00:44:48.295881+00
uyyecej7sejs5p78msuwb1gq1qvhmry2	YTBjNzJlZTVmOGZiZDdiZWVjYzE3MjM3YWEzYjI5Y2RhNDJhOGI3ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJxNU43cEFpdkV1bHgxNUprZkJtZDM4S1ZCYTVLSUx6USJ9	2018-12-26 01:10:50.645329+00
e2cgd6etr2u4pnz0402q2akkbgdo4z3u	ODgwMDNkNzFmMGQzZDRlNjVlZTExYTg1ODMxOWM2NzE1ZTg0ZGY5MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJDbm1rTzl3alFHVmRqRDJhSXdScktjVjZ2dXJxbUZhQSJ9	2018-12-26 02:33:13.709286+00
ljr261brpkx2lk6oi8cpibe28qgfrdxe	ZmMwNTIxZDBlMjliYjYzZGNkZmI0YmMxMGRlODYwOGFhN2M4MjExZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJMcWxoRFdtNm1uSUUyMkJnYWRhenhQVW82SjJBa0xQcCJ9	2018-12-26 03:54:15.227804+00
evxdkiahfj0c2qzjpxn6qyhn2wp5cvi0	NDk3YWY4Mjk2NDBiOWU3NmQ0ODlmOTRmMTVjYWZkY2Q2OTYzYmI0OTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIyYlJHejRJT3BBb2k1MVFZRWcxZEUyVHhmZnFJTnU0TyJ9	2018-12-26 04:27:30.694826+00
ozhkz36reoo79xnsthlr2cfojaxwal2z	OTQ0YWNjZDVhYTEwNGU1NGZmOWEyYmJmZDYzNGFiNTQxMThlMTQ5MDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJnOUJXaktlelk1REdXTHZPdUZJN29NSmUwOGhEZ2ZCaSJ9	2018-12-26 04:34:18.564625+00
v47pwgz5v88tm8deld5qdiogdxwbiqyx	ZWZhYjU3NGQyNzk2ZDBlMDljMzk5YjcwZTUzYTBmMTM2MDA3Y2MzYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI3Znk5YjZPVmZhaldod2hzNmdNUFpUdU9GRTNxYmdaZCJ9	2018-12-26 04:37:53.386265+00
s1uk9l9gs6p31rareykh5edtchg5ka7p	YjJkMTM0M2ZiYjllNjQ1OWYxMDdiM2ExZmZmMDllM2E1NDhjM2VkNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJuWWkyYXdwTlkxVndMT2FsMjlKR0I2REpGbExyY2R0UiJ9	2018-12-26 05:13:43.958474+00
omnxwyjkjbcm5f65ky1zzdp3okf8ub4h	N2U4ODMyZGIzMjE5Nzk4YTc0Yjg0MWI0ZDEyZjVkY2JhMjA4ZDhjYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI5VXBUUVNSbEdXb0tNeWdxVVY4MldxSDJSWXlyZExUViJ9	2018-12-26 05:52:28.414771+00
qq6lotq1mwpz51ebp39ghqvcjqd8oyg9	NjM3YmY4NDg2N2Q5NWU5YmQyZGM4Mzg4ODFhZWMzNDI4Nzc1OWJkZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJBUHJ3cmN0UHlralVldEIxelpOWjlqWmRhM1JOdkc5RCIsInNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3JlY2lwZS9hZGQvIn0sImszNEVYWkx1dkxNbiJdfQ==	2018-12-26 05:57:54.287765+00
uxvoe7lk37as14oh18o8nm879f4g88dq	MjVjMTdmNDFkMmE1YzdiZGExOTVkNTIwYmRjODNkYzk3NzczYmU2NTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJV0IzeGkzSkg5aHJPMHdzMDJqdjNMYm1JcDV2V0NUSCJ9	2018-12-26 08:17:38.260994+00
f7pggl46ezhqefxbm0pk3f94smyn31s3	M2ZmMTQyYWZhYjU5Y2M0ODYwNjdkOWFhZTdmZTQ5NjZiYWYwYWI1YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI4SXdpOEdRRldTemNoWFF6UXNSMXVrZmVvNVZsWmVrYiJ9	2018-12-26 08:45:08.260801+00
yi6f8e21t6hfmr3oxuj6xf78e2qnakhh	YmE5ZDBkYjk0MjYzZTE0YzhjOGE1M2FlMGZhMzg1OTA4OGM5MGEwNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJWa0xIRngwQWljWkFIeDduS0F6aFVLM01xZUJlYnBobiJ9	2018-12-26 09:09:20.297926+00
phyoqxvkjajpojj6hn4h9vvr7i36yaxo	YTQwOGY5NTYxN2UwN2YyODc5OWY5ZjNmZWUxNjdmNGIwOWJlMWY2Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ6UEpQa0FKM3d6Yzl4b0JnYTU5cG1ZT3FRZVpZNWxtbCJ9	2018-12-26 09:17:31.322286+00
oglu2xkdmzlzwbj19tjz9vl9tpq4kiae	ZGYyYzcwOGVlODdhNmE1NWQxNzk0ODFjZjE5OGVhZjM5ZTcxZWU2ZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJqeDhEZHI5NkhVY0xKenRLM1hCVFlvVVpHOGZwbmR0QSJ9	2018-12-26 09:59:17.485573+00
72sbaydwql95uiu5lmictubq55fvcv7l	ZTgyZmE3NjkyNmQxNTg3NzAzNmYyODhhODg4NTNmYTU5ODk3MzhlNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI2R0lvY1ZuNjlwZlh3a2NkeHR5OTQyOUpjVW1oRzR6VyJ9	2018-12-26 10:32:21.164533+00
40aw5awfve3hw98vzjdupwuai9k432f8	YWNlYjY4MjU0NWFiMDMzZjU0OGY5ZDVjMTVkZDA2YTZlMzc2YmVhNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJWdkFqWjhiSVE1MWcyQTdVR1ZleDA1UkhqZFFRYXdPSiJ9	2018-12-26 11:19:57.687436+00
0n66f4aiuczaayyyagqwzgkamo0bim5j	MTgzN2Q3YzJhOTU1MWU2ZjY4ZTdkMTZlOWYxMTBkMTE5ZDQ5NTI0Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJLMTZ3VVp1OXNQWlZHa0Q4dllFZWZHZzRyTktOYWpLZCJ9	2018-12-26 11:40:14.871124+00
2g9so89mhqbs86s8la9x59nvmabfku0b	ZjA1ZjA4ZmYwYTU3MjJlZmUzYzk1MDdhZGE4Yjc2NGQ4MTg4MGZmZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJLRVZGTldmblpLRkx2ZDRwYlNTa2duQ0NHRlVoRGhjMiJ9	2018-12-26 13:30:07.654088+00
jkt7tb4iyemflpj64zwj6fgtfwo10zwm	ZjFhMzY4Y2Q0MzY2NGEwMDcwMDhiMmQ4YWUwNjU1YjFiY2MyODRiYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJHUmN6RFh5ZXVyRTJiY1lmQnhuT3BPMWdkMGl2UFpJcyJ9	2018-12-26 13:30:07.670004+00
qsn1e17a2m31tqvhpx329c3uooc5f55t	NDg1YzAxNDc0NWY3NGUxNjA1MThiMjY0ZjllNjRhODI2N2Y4ZDI0NTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJDSjhVTmdVV2dIS3d5Nmoyd0hQY21raDJTbDVvc1U2SCJ9	2018-12-26 13:30:07.673057+00
1du0ka3ywxg96wdddtn18o3iunxzff1y	OGQyNjFkYjU2NDcyY2QxYWUyNmY4MzhlZGVmOTI2YTM1MWZmZjhlNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJHaUpqa0ZKbDhLNGd5TFBrVVRxOEpoTHFOZUhjS3FaWSJ9	2018-12-26 15:10:12.713307+00
8wdapp1u8c0fm5ofafocdcrsurw45518	ZTFkNzM5YmJmNDhhOGU5ZTQyZTdkOTc1YjgzNDkyM2JmNDYzMDBjNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJtdlZXNjN2QmNCV2kxRVVDVjZCNHpwSXpmRnNpaHFneSJ9	2018-12-26 16:28:53.642203+00
pud9v799iw1kd6b179mik04am7div9jw	OGE0MDlkN2FkZjUxYjcyMzE2N2NhMjkyOTk3MjA1OGFiMmNjYmYwYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJZYzdhN1JvOTNzZjJsNk1saHNrc09Ya1QwQkltMjZDeiJ9	2018-12-26 16:31:36.666677+00
zpp66urokomyx9lb78l07byec7w0ogoa	YjcxMTk5YzAyN2JmMzU2YzVjODM1NjA5ZmQxMDRhMTNhMDNlNDk2Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJvR1dCVFlZZGJzS04xUWdnSGlvN0daZGJrMThuN0wzYSJ9	2018-12-26 16:41:17.922613+00
fj9ty1iiv0qu1up6v27sz3wiaezoiaex	MWE2ZjkyMWM4MzRjYTNmYmYxYjZhYzljNTE4OTYyNWM5OWM1ODY1ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI2M2lXam5UWnVVTkhhOEZxeEhhb3NOWHF6V2plVDNCdyJ9	2018-12-26 16:53:29.405598+00
3sc5rfjfr12uwr08aujl4q56sudx7r06	ODM0N2RkMDdmYTc1ZGJkNDBjNzUwYzkxYzMyYjVlYzMyNGY3NzRkNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJDdlNwcmNPeGN0QzRLTDJQbGp2QnhNWnNtU1Y2QTBFTyJ9	2018-12-26 16:59:35.733966+00
1oa7g3t3olzst46csvxo9k8dvfmvymvi	ODUzNTE1MWFhNjg5OGQwZTc0Y2NmNDE1YzNkMjhjNGM3ZDZiZDFhNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI5Qk1HTTVsQ3VmaE1FOXZGNnBhVVY2RUlGa3M0YUVpeCJ9	2018-12-26 17:14:54.387717+00
cr6izfwaqcr7f5f8zv91h389ykjqpvk4	MWY0MjhkZTY3NGI1NzYwN2YzYjc1Nzk1NzEyYTZhYjE3OTJkODFmZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJVbGtCTkF2VXlsOW9HeHQ3bThEU2pOMjU1YWlKMzRjeCJ9	2018-12-26 17:19:58.868833+00
0i0ld54aa2fd5ddin4v18964vd1kek7l	NzVhMjkyODVhNDVhYmZmMDY2ZTRlMTYzMGMxZmFhODJkY2Y5MWQ2Mjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ4S1Fla2docVJoUU44M2o0NTNvN1NtSXZlQVZXQkpPOCJ9	2018-12-26 19:11:00.580617+00
tfytddlvazyeyptkxzcnh6ngkmip7gjs	OTIwYjQyZTBhNDJkODhkOGUzNDk1NDhkOWY4YjNjYTlmNzkyNTA0Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIwUks5TUJBdmc0S25RTm1qMHVXcWR5aVBCMlBRcjUydiJ9	2018-12-26 19:12:13.889801+00
k4kj5kxtdzqbugndwap02qbhcl2hovz9	NTY5NTEzMTRkMDdiZmEzOTJjNDkxYTQ3NTJhYTdkZjNiNmY1ZjAyNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIyNjBkUlNMZ0tCeG1RQjd6R0xveDBRN0wwUEtQRkJpMSJ9	2018-12-26 20:12:00.883141+00
of9jui940tscc4wh0ta64gyznmrrxky6	YTY2Y2UwYWJiYzI3ODQ3MzkyMzUwZmI4Nzk1YzVhNjJiNWI3ZDAyNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJGU2NGU1dzY3lFaE4xc1htNmJHTTAwYW9jUjVRdk04TSJ9	2018-12-26 20:42:23.403951+00
seemcxmou9l2d8kit440gc0saef80q8b	MTliNTBkMTgwN2FmMDlhMWNiYTA3ZDI2YjJjZDFmYTBhMGY1OGU4NTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ4dEh0bzdaczdQV01JaGlZeU80bTMzN2U4c1hzbFBtUiJ9	2018-12-26 21:32:14.8728+00
kjomhk1l2yf2dfwezstrmdr9spn2802h	OWRkMTU2NjQ0ODVkMDgwZjY4OTNkMTBmZjhmNDc1YTY3ZDFjZGI4NDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJVSEd2NXNIZkZRUHZEaTR4Sm9IbWIwS0hPNE1vUGJkRSJ9	2018-12-26 22:09:06.722596+00
n7g8ohis9r2uc2csyykkj0uv3eii0548	N2NkMzJlMDMzMjI5ZDVmNTc5OGM5MzIzYWMyZWY0ZjhmMzUzM2I0Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJOY2FNUXRoNnRGT2hQc0FhWjB2NTVvcVdqeHNkMFZubyJ9	2018-12-26 22:38:24.413942+00
84ydy7ut4hwk9yz2p58qlu68jlshw02c	NzQ3NTk4ODk1NDg0OWQ3MjE1ZmM5YWMzY2IyNzFhMDIzMmUxZDk2Mjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ0NzZuYjdtWW8xVkExVzNTRzdCQkRDamxlRlpzZDd1cCJ9	2018-12-26 22:53:32.822709+00
jbt6oj7sht6tmawbj46do3nxqltrsh2i	NTAyMDAxZTg2YjNiZjFjZWE0M2U1ZDdkOGNhYWIxMzUxYjg5NjhmZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJrSUFwWFhkRm1tUjh2S0ZMNmdlNzdJMGlwRzhrczgzZCJ9	2018-12-26 23:32:21.203498+00
8wmvfumqpeaj3xsa9t7ya661nngmg36u	NzE1ZDcwMWNjYWRlOWM2ZDk4M2RiOGZlNjMwYmQ0MWEyMzJiNGY2ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJaVjZyNDdBMWpUdlJYRDVHTFlLc2daY0V3cEd1ZTNMMCJ9	2018-12-26 23:32:37.151109+00
214ev0m6o0wpqhw4bpxmuxd00tijlcyy	NTNlMmQ4MGE4NjllNDQ4MDFkYWViOWIxNDkyZDY5NDA0NmQzZmQ4OTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJNndFUEJ1RGVVbDd2UXpPRDAwd01uYUVDcTBnRDVwMSJ9	2018-12-27 00:05:16.129539+00
zsx2a5vqgr7pj6oqnu9hcze4cstkp0vx	MjNkYTY5NzMyMWEyNjAwNmIxZjBjYTc2ZGU4OTAxNzFiZWRhYThiNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI3eUpUQWFjcGtvRlR6WFlCQTZXV005SzJBajJMS1dkRCJ9	2018-12-27 00:35:33.889643+00
3cgt7r8idzzgwctmj3n32lpm3sk8p7o5	ZDFjYTE3ZTM4ZWU0MzVhYzA5YWNiMjViNTU0ODYzNjgxMDhlMGYzYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJmYXlDclZrVWxPZW95eE9jQ1IwZ0pxUjA1MWN5bDlTcSJ9	2018-12-27 00:53:29.733497+00
toxwzlskg7e10z4mg2ktc7w51nqtfqz6	ZTkyMzEzYTkxNTRkOTZkNjkwNWM1ZTQ5Nzg5MGEwNDJiN2VhYzI4Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJEZGtBZGtQWmlsank4endIcmpoamZ1S1hPZmtGNW8yeiJ9	2018-12-27 01:02:19.317498+00
pp8n7zj2new7grztvyqlv17wxogtx1ij	MDU2Zjg1ZmZmNzAzNjhhNjE3YmYzNmRjZmVhOTY2N2U4MzliYzU5Mjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ4R29wMnZBQzRXNnozS05IVTBHRktyVE5XNmNzR0lkciJ9	2018-12-27 02:18:56.610054+00
tyqjfsjeo0t4ux6i6goi4buz0oyyemzk	NWRkODE2MTJlZjRjZjJjYzQyMTM1MDkyNzhmNTU3NmZlNWQxOTE5Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJoWk80dkRqT0JydWJrVmtnUlN6TkF5OFFOaHNSMENqNyJ9	2018-12-27 02:25:06.239944+00
pha43x9yjjk2hmsr33yn52s82hkzypd0	ZmM0ZDViYjNlYjU3ODU5MDBmZGIyMjU0ZWE3NjBjZGY1YzE3ZWZjZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI3ZEpVOE1GMTAyN3FTQ3JmSVp3UlZidTQ3SEp4QlpWQiJ9	2018-12-27 02:32:35.53799+00
x5cbi2afuwew3esowcu8a57qcsliyr8v	YjNjZmM4ZTQwMTdjYzhmMjdjNWZjM2YyZmNjZmY2MWUyYzYzNTlhYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ0UWJXNFdaa1ljS2NWWWc3VTdiTnptRHFPbE11WHJxUSJ9	2018-12-27 04:10:22.645258+00
87g13u2onh57sxpfd8j1104ds86wod7b	OTJmNzI1NDViNjY5ZGZkMTg5Yjc2MGM2YzI1ZGZjN2RkNGU0OWQwOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI2eTVxbVlNWHNNamdua2J1TGtHUXphaGdLRTRJY2hsViJ9	2018-12-27 04:23:28.192631+00
g6d3bip9dyfwpszo801vaq6nrnpmp7mq	MDc0ZmRhMzk0N2Y2ZGIwOGJiMGY1MWM5MmZjMTUyODMzMzFmZjQ4ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJEYnBQcFZpbjNKUk5mbVhsQ29wWFoxQ0RRNmhBV282UiJ9	2018-12-27 04:24:50.079549+00
dvgs93l1hta24h0n53ltqlx9qyld8an2	MDgwMmFkYjFlYTUyMDUzZjBjMmEwOTU5ODgyZjQ2ZTQ3MWVmY2ZjNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJxMUMzcWdlNjU0OTJIejBSbVhEUzVIZWQ3YjZ1cnBBOCJ9	2018-12-27 06:27:55.227316+00
87az7iiy7isxs1y4350182msyrqc3g9u	NDBlOTc3MTFiMjFlZjIzYWU1NjkzYWNlM2ZjOGQ3MTdjZDBhMDk4Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJXZ3gySnVuc1NEeWg2VVNwUHVRUDYwTDg1WElTbzU0dCJ9	2018-12-27 06:37:25.260247+00
0ek228027tonnzglvr5cqticr3em68bo	NTNhNmYzZjdlOGI5MTdhMDY4MzRiOWZjODMwMDY1MGIyMzYzODNhNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJZMDUyUEh3YjlKNVlMNWpUSDNHZUo2NnZ4U3dlY3JkUiJ9	2018-12-27 06:41:10.513163+00
ki553tssa5ufq2tw2fwsf63skpu1exkn	NDk3OWI2YzgyMGE1MTUzYzA3Y2M1MTg1ZDA3Y2JiZTI2ZTY0YjJjYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJMNWljY0tYZm02bFE1Z2NQNDJFYnFBN2NaekZpTFh2NSJ9	2018-12-27 08:29:32.948423+00
j4xisiv3nr27kpj8dl2wsgeuzz4t7e50	ZWJiOTI5YjM2MWM1N2VhMTBkOTc2NDQxMmZkNGZmNWIwNTIyYzZmNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJMW51aTk2anllaUpCSE1JWnZEQUVERFZUUzQ2SDB1biJ9	2018-12-27 10:04:33.37916+00
li88nw9035rpzjvucyudyrckhekza4na	ZDUxMDQwOGQxYmExZWMzODcwMTJkNzBhNTBkYTUxY2Q4N2UzMTUyYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJTYXI5VHFWUU5pZU1ySHRacElRSU5YR0hKREFxOXBhaCJ9	2018-12-27 11:13:53.434432+00
b9qhdbxmqqa625yxcmm4n7clcdadqu9g	NzVkNmFhNzJmOWYyMzcxNDFlNmM1MDQzM2NlNzE5MDU1YzI3MzhmZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJtZnhab3BnNmJNRDZWZzVDNDdVcjE2VG11S2FCU21OViJ9	2018-12-27 11:16:38.484942+00
90s3jnxuxtdqu62rxynvd4id9awxx67y	ZDUzMWNjMWNjNmIwYWVhNThjNThjOWVlYTJmYzcwNDZiMTI3ZDU3Mjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI1V0RMc3pob0djeGY2M05zMkhVVHRDN0xrUEd2aXU0cSJ9	2018-12-27 13:14:48.768289+00
f86tnea72avn1cu5q11b33sshaw5wizr	MzI5ZWE3NWRlNGZjMWVhOWU0Y2QzNzdiNzQ3MWE0MTUxZDhmMzE3OTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJkUTZYU0JjMVR2S2xLMjFDSnMyMzBXcGdRdHpVOXdRZCJ9	2018-12-27 13:22:20.844113+00
x836f3a93g5er8dlkv7uw2p2t0m9smzv	MGQyNGViZTI0YWU0MGVlMTA3MDBjM2NkMGU3M2YyYWEyOWMxMjBiYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ1UVZabUFjWHh3QzJZOUtNVlVoZUVScE9JNzNNcHBucSJ9	2018-12-27 13:36:21.878218+00
gt62nrzgv6a655d4suytnxptwqpwz4d7	NTcyZDNiZjc0ZWQ3OTVlYzczOGIwYmM5NmNhMzg3Nzc3MDY4NDc0YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJsU1dLREtaRDZmOFJtTndwaGJ5MTdJRm1qV2RXN3M4TyJ9	2018-12-27 14:21:34.66087+00
yja47lgg72deo0jdtmlu4mh1hrnnesv0	YzZlNzY3YzkzMWU5MDI3ODExYmU0YTcwYzBmMTU1MzMwZWJiMWEyNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJsMWtIU0VjMFFJTEtuangwbXlTWFpSeWpqUG0zd2VjMiJ9	2018-12-27 14:55:06.846242+00
dm7iw26zhtcbg49i1rbb8a68goejboc8	M2EzYmEwNWE0NmFlMjE4ZjI2ZThhYjNmOGQyODJjYzcwNmVlNDNhYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJkUzdjQ1pRQlZlTmFWdW9ZbG5jVkhyQk1VS0ZuWjhzbCJ9	2018-12-27 15:56:17.232571+00
fw8hr1vyeubq2ncu7tv1csrnlpunvqoo	NDUyN2FhYzhhYWNiNWJiMDBiNWZiYzkxYjVhMjUyZDY1NDE3NzUwNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI4RllPUjBmU3daaFVPWjc0NG9uRDlVN2RQVjBqcnZlbSJ9	2018-12-27 16:18:57.935852+00
kotei8ao7miub1c5utz7foi5e398xuqm	ZDc5Y2ZkMWEyZGRhNDEyMjEwNGYxYjIyYzA2MTFkOTNhNmI5NzIzMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJaRkRtWVUyZ3ZNdlV3MVF4ZDMwc0hBNUhzS3NSZlY4aSIsInNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiZmNEWmE4RnN6WjdzIl19	2018-12-27 19:09:46.355724+00
x845sceyhxg3wu7w8hmm2010v5js17m9	NGFiZGM3MGNhZjg5ZDEzNDY2YWEzODUxZmFiNjExOThjZmIwNGJjMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIwb1NqdzdrZWlhT3hyV0pXNm9BUnlhVEZjWjFiWFhKZyJ9	2018-12-27 19:10:50.326981+00
vgkjo8y2j83idaleq01esxzkmhbqgb1d	MzAzNGIzYTliNzk0OTM1ZWQ0OGRjNzRlYjMzYWQ3NWMwMjAyZTkyODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJxcHBrZ3NpS01kWWVxNHpncnl1NHRCaXZpRVNtRkpTWCJ9	2018-12-27 19:10:50.393866+00
5qw1mn4z6w1hfsziljo6z0kwtnf8otkv	ZTEzYWI0MWI3ZWNiNDQ4N2VlMDA0MTVjNzNlZTNiNTk3NWRmZWZhYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJRS1kzeWM2eWNVdWdiQXhzdFFvaVBxNVBvTFhJZk1oNCJ9	2018-12-27 19:34:44.549763+00
rge3rq5yd6kmko62q4akm9feqlfl7f8l	MjY0Y2NmMzE0ZThmMDA2ZThmNzQ4NTgxYzViMDc2NjFlZDU3YTkyOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJYblpVU2VaRk9GYk1IOEl1QkdVTzA1anhZVFAwd1hJaSJ9	2018-12-27 20:13:23.226675+00
z2swjxuqyk6zodl2qv5nq4omjzd25y93	OTg2YzlmZGZkZjBhOGVmODI2N2VlODRmNjNkZTBjNGYxN2QxODA1ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJMaGNIdEFXcG10YXBldnU0MzRWZnVDN3phdFEzNmpoRCJ9	2018-12-27 20:46:17.670497+00
n369am70mqzbdisw0k0m6wekb5vge7v8	ZjU4ZTNhMWNkMjM5YTYxNjkzYjQ2NTc3NGU0ODE5MzM1N2JmMTI2ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJaRTdwTEtIbWdKdm1wam9WS1JKbGVuY1JrQnNGdjVuMyJ9	2018-12-27 21:49:34.629428+00
dzixfrbyx5zzdjsn71rlyk81yh8p8tn9	ZGY5ZjI1Nzc4MmZhMWMwMjM1YmMyOWJhM2I3NDM2Yjk4MGFiNzM2Mjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzdnlYcmhjMnozVTdBeEhjRHFRQXBNdWg2SkpVekhZbiJ9	2018-12-27 22:29:14.929869+00
vw3vrl1d846mkxzfbl6cmmv3ygecq8gc	OTI1ZDNhYjMwZTZkMjFhZDBkZDFkNDdlYTQyYmUzYThkNjQ5YmQyYjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJNeW9nRWRUNGJuZDRFZ1RiMEExMHlId0VTbkF4VHhhZiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2018-12-27 23:14:19.251155+00
l6kqgiacz7gwc290lzdjk0jcgyfrox4i	ZjQ4N2E0YTQ3NzQ0MDgwNzEwMjQzOTU3ZmZiYzYyNzBkNzdlNGQ4YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJFc0lOMkNQUHBOc0tnSW9JUkh1U21qZUY0OU03U2NvZCJ9	2018-12-27 23:49:57.018619+00
tbzzt3b7b13pc6fhub2eeo2vj7rf7n4k	ZjEwNGU0OWI0NTI1YmI3ZmNhMDM2NGYyMzNmZTM4ZWNiYTE1NzEzYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI5Q09DeTJ1Q2pzRWNQRE82WEVHTFpLblE5Q2pFdGNjRCJ9	2018-12-28 00:00:44.20617+00
01mrycyih8wu0ocqeukdeuxzui2n7x47	MTExZDk2NjIxMmI3NzA4M2ExY2FmMThlMjI3NTZjYzM5ZTBjNWU0MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJFYVM1T2pFdmVwdGhUOUpod3dqQ1lRdGQ2dUc0Mk1pQiJ9	2018-12-28 00:09:45.866345+00
c6ui80iln4am6bglxtnufxvko6sljcvm	NzRlNDQ2YzA3ODYyMWU1YzgxZDg0OTllYjZmMGQ3YzQyYmI2YWMxMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJEVDJwRDJrOGlvdkVSVWdYSFZPSE1YSTNkM0phQlFwciJ9	2018-12-28 00:27:35.168013+00
clae8blpdelnok08wv5myf92lrn66wdj	NjdmOWM4MTgxYjhkNWZlYTI3MDM2ODc5NjE0OThkYzAyM2E1ZjU2MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJVek5mRzZJVTZxV3VrOU1rYkVJRUN0ZldLak5SN3VSeSJ9	2018-12-28 01:51:09.837001+00
2n71zjazrhzgifu81np41cwtd8r5b110	ZTM2NGFjN2RhMTIzY2RmYmVmMzFlM2ZkODhjMWM1OTIxZTNhZDJlMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJpWmVtTmxNYWxXZ3hCdFhsVGJnSGVLZXd1aTBTbEkxTyJ9	2018-12-28 02:30:31.303452+00
o5tykbyvi98nqikdnm5t0s47zt26afzq	MGUzNjQxZDFmMTU3ODJiNGE3YzBiOTE2ZmZiZTA1MWU4ZjczNTRhYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJQckZPcUp4SFlqSzFYR1laeEdIZTdrQ2JhSGRDN2V1RSJ9	2018-12-28 03:07:29.050519+00
42fa769khyz74btmmi7biv0od9pd5o0k	ZGI3NGIyNDlkMDFlODExNjdlM2U3MWRjNmEyMjU4ZmYwNDNmOGFlZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJWQXNpUEtrcFJ2cDdnSmY0OHVza2tRbXpaa0hKWmJ3NCJ9	2018-12-28 04:36:40.360267+00
llgg44dlcxm9v9yalgcr7ymsv9ru6jzs	OWQzZjBlZjZkMDI2MmVlNWFlNWMyYzRhYzMwNjc0MGQ1YWMxMGU4Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ1RkVGMTE2UFNxRzhGV0JWalBvR0hvSkYxUFJUQjZwMCJ9	2018-12-28 05:48:07.472588+00
rf45ktwiqfmiumo20adfmbc57o2mskdj	OTgxZGIwYWM1ODUyMzdkNmQwMGFhZmRlZWI5ZWUwYTA5ODMzZmEwYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJIbmJiWDhnc1VQb1RUQ053M0tGYWp6anFtUnhXRGlKciJ9	2018-12-28 05:48:07.474156+00
qogzk03skoh22q2h85tpct2ht0npa6a4	OTdmYjJjOTI0OGZmOTZkMzI3OTgxMjg2ZThmNmMzYmE5NzdkYzYyODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJMUllNZWdDWU90Um5GWTZqTW4xU0pqbjVZdm4zUFc5ZyJ9	2018-12-28 05:48:07.480435+00
59rnm196pl3gc65w43arsrj61vn2xknt	MWI4MTY3M2MzZTc3MjQ4NjQ2MjlhNzVjMzc4Mjc3NWU2NmEwNTQwMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIzUll6YnE5TGNLNUdaRVBjcUVpekNyYmdEWkV5VnY2eSJ9	2018-12-28 06:07:04.48063+00
3pt3s01jr70h0q56jz3v61b17g6h4mw1	NWExYWJmOTAxNzQ2ZGRlOTI3ZWY1YWFiZjkwMTY1NDVmYTEzMzkxYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJoOWw4aEZRMmNYOXZhVlJ6N1VYd3dOM2xYUXllMmNLTiJ9	2018-12-28 06:43:01.756163+00
1ykg1unin65qhju1mhehoulaz0vqa4h7	NGUzM2NlNmE4ZTE2NWU0OGU5ODZmYmM2MmIyYmExNTlhYmFlY2I0Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI4QUhSUzB5eFdzd2tFUWtOUHpCWENCNGRXUW1KV1BySCJ9	2018-12-28 07:43:26.694053+00
c41ym1wyi3yggkq3glo81fx0bc1iu882	YjUxOGM5OGRlNTg0MzNiY2RjMDY1Y2E4ZWE1ZjgwMzliOGUzMjYwYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJxdGpoejllNVJWMmlXNndpUVdBN3VOOFM0T3RPV0JrVyJ9	2018-12-28 07:46:58.397563+00
9djbbz94omzs4qz206jwnbn5n750kigm	MjYwZjM1N2FhNGJlMDZiNGNmMjY2MWNkODZmMjZjNDZiOGY4MmJhMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJyaWJZSDNudWw2MHVWTU5tZ29yY0xaVXFhcndvbGoySSJ9	2018-12-28 07:55:11.279505+00
vpw03e4ri3grhrftuo5lhm403mouqtgp	YzVhZmI0ZjBhMzJkMDY3MjllZDA0N2ZhYWNlNzlhMzNkYjUyMzI2NTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI3OW00WWdjYVRvSUpHRkpabldTMW1UNTdFUEhuVFRYcCJ9	2018-12-28 08:22:45.34552+00
zwdsgrw7oz8zzh11nljn9m57q8yhuzy9	Y2U1MjM5NzhlMzE3YzBhZjhkMGJlMTkwMDJkNjY3ZmFiMzgyMjVhMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ2bUFITWxQZEVIY3Yyd1ZMcXkwRXdSa0ZUVXRPd3NyOCJ9	2018-12-28 10:15:31.026494+00
d7ezlkyx5aexb2iyj16vgcsacqg05xvz	Njg4Yzg5OTE1MDIwYzg0NDA5NjlmZjgzNzA4M2I5MGQ5ODM2NjFlYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIzblFaRlVBazNSb0EyeWU0bXJSRlRsWHRmNWZSUUluaiJ9	2018-12-28 10:26:33.560918+00
bnobahtjxwcs42tc6vzkangeri2y8b9x	NTU1OWZhM2FmNTZkMGQ2NDNhMTAxMTBmM2E1OWIyYTU5YzM0NzU5MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJTcG5FcUpYTXlWTDlCS1B6VU1TUTNiYURXQTEyWGEyNSJ9	2018-12-28 10:28:23.666087+00
eluln8cspl2c2tzy93482y7cfvr2waey	MWM1ZDY3ODRhNzU4YTRiOWQ4MTA0OWJmZmRlOTQ2NDhhOTM1NTNjNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJkUFJNVllNYkxzem5qbm5xeDg4M2JKeUJVa1ZEbjZvUyJ9	2018-12-28 10:32:31.367038+00
p4y0e7cgafr8m5fep9jva0uuq5x34twc	MThjMzNjMjk5ZmNmZDljYjJkYWQ5NDljODZjOTMzYWQwNWQ0MzAxNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJuZUZpNEppTEJOV1RKaktCTUl4Rm1XNUIwWEdtTmM0YiJ9	2018-12-28 11:02:40.444812+00
mdz5xzjosca5oieettdu6anllvi8cjnm	ZTA4N2Q3NDYwOWQ2MTU0ZTBlNTQ4Yzc1NTgxZGNlZDU1YzcxZDA3MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIxMnBVUVNVTVh0SWhaU0lvejRxTExFbEI0UUZSR3pKZCJ9	2018-12-28 11:43:54.031456+00
qgnij39atzi2th4k9b80fyah7s2l2neu	OTdiZjA1M2I5YzY0YmU3ZjJkZTIxODQ1MDQ2OTQ0Y2EyN2U3ZTVlNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJORjJnVnhtaVFWeWFOMVZqWkZ5WW5NQk5MZEduV1NMUyJ9	2018-12-28 12:22:11.241873+00
7e5nvg86o3c2id4qqwvecjifheh3jh5h	YzYxMDIyODU0ZTAyM2NiOTIzNDEwNzQwYmVmZTNlYjQ0MGM1NTZhODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJTU1ZpOVV6eVg2dWJXVU9MRnpEeGJlVFBnQjkyajd6RCJ9	2018-12-28 13:02:29.674217+00
jm4s9yzn42u2yxx7ihb0rdvol73d5uux	ZWVlNDJmNTIyYTRjZjg2MDdhYzZjYjc1NGU0MjkzNWRiNWZkN2ZlODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJuVVZOWjVkVkhFY20ydGp0OEdrTnl6Z0pva09HY2RJcSJ9	2018-12-28 13:27:44.298756+00
burtcc1ad6f1cswfvblkyxlcn7r9ltqc	OWVjMzBkZDA4NTFmODIxNzI0ZDBhZDEyNGE2MTBkZGIyMjcxZmE5MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ6a1ZWSTRRNUFxeTdUN0ZIZjlYaXNoWGFHejFhT21RYyJ9	2018-12-28 14:03:37.549431+00
vv5vxkxnnmibecj2se9jwroi6r08g1qm	MGE1NTkyNWZhZjYxNGI5MThlYTI2NTM3NzIwYTU2MmViODBkZDk2OTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJRQTFHN1BtaU1nVzNzR1FIeW5zT3NjVXJSeGE2cEtMMyJ9	2018-12-28 14:15:58.41988+00
sftb1z5xnm07tnwg4u84lrnm7sozcj1x	NDBlZmJmN2U3ZjEyNDczNjk0YjRmYzU1MmVkNDg0M2Y4ZmYwYmIyOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJlbnR0TjZqcUwzdkdpV0t2TjNBZ29Jb0d5RW43UkRETyJ9	2018-12-28 14:32:49.635049+00
8mix0cr5fb3lf6ti9j9yrlcnhdex8kdn	MGJiMzc5MTQyMDhmODRhODI4ZWUzOWZhYzI1MGZjNTdjMzZiNGRjMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJxaGsxN2piVVVjSEVYS1lTRnI2UzNycWtobWs3aWNjMCJ9	2018-12-28 14:55:56.591457+00
tfavpfysmcz8pekifaop3jjgao4u9j1r	OTQxMzFmODI2MzM5ODcyMjQ5NTUwNjA3YTBhODhkODg0ZGRkMzYyMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ3b2lVZlpKVnp4eG5Pc1dvTFNva3FrenRwNXpnc3BycCJ9	2018-12-28 15:48:56.608337+00
viypiebnpz93qge4cbjxc8bw49rtagsu	ODJkMDZhNGRjOTI5MjA1MWM2MGQ4MzI5ZWUwMGYyZjVmMjYwZmQzMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJscVRPejl0eXEwakRnNVl4OWRKQ3RpNWtwTUxaaDZ3SCJ9	2018-12-28 17:56:21.32782+00
ah0zmczuyiwdqla6wj185572an0ejxj7	ZWNlYWQ2MWY2YjFhMzU1M2Y4MWYxZTA4Y2IxOTEwYTliZTAyYjc2YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJPaTI0b3RFdW1yakNPZ2VkVlNob0FLWU5OQkgxZ3VTNyJ9	2018-12-28 17:56:21.338404+00
4vbyv9wlgellzj53borphjz9sq96xj8n	NjExMjY1ZWJlOTNhZDNmYmM1MDVlNGM5ZGRmYTEyOWRiNzhkMTliNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJIcEdSZHFrVUlQTlFGbU5mNEZ2VGd4c0p1TG43QUxMWCJ9	2018-12-28 20:36:00.489678+00
3hr23zprrymeat6ea7lmesmpa208ttni	NzZiNmUyZGExMjVhMTY1NTg2OGZjYWYyZjBmODFkYmIzZGE1OWQwNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJTVTZyVThOblN4Uml1TkRFMmlmVnQzUmJJRmFKTWFaSyJ9	2018-12-28 22:40:49.124965+00
gzueiwaai4q87hs99org5zinxe9c1iau	NjgyZjQzN2JlOWY1OThlZjI5MTY3YzBiZWJmMGEwNGM3MjczM2VkMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJRZFhLR0YySFlFbHRyRmZjVktVY3QyV0ZNT21WNEUxWiJ9	2018-12-28 22:42:43.417518+00
uc515ehhfaazefb5zlx6kjuctfofiawk	NWZlYTBhODY3Y2U5NDI0NDM2NDdiYmY3MGI3ZWVhZGE0MDNmZDA0Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ4QnlzRDlqbmlsbFFVQW9zSmI5QmluQ25lV291dDN2MSJ9	2018-12-28 23:06:18.886554+00
s9m4i9y88knzrecbs1fxywmbr5wkiwlc	NTUxNTZkOGY0NTQwNjI5YWFjYTMyZGM2MWViNTAyYTBiMTE5NzVjOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJUmh5ckFTNDZmbmZWa2RQR0dQWlByMWJJRVdpekRiYyJ9	2018-12-28 23:16:01.833191+00
7xt53uf9gpy2r7ah7i6bnzoaks7xa6jt	YTNjZjZjMDhjOThhMWExNTNkZmU3Y2Q5YjM0ODE1ZjgyOGI4ZGU0ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJYN29KbW8wUXVNWjQxVE9FQkk0eUZXODZMeGw0TDh5bSJ9	2018-12-28 23:22:43.00121+00
t3di2uya4ct4sg7mfdtihwcdz9ujjm6l	ODdmYzhhNjI2ZTI1NDE4MzNiM2RlZjAwMjllMDc4NDBmMmEwNzAxYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJQeDdBaW9rdW5nSU56QjBjaWk3VVJjTE0wcGo5S0xxVSJ9	2018-12-29 00:05:18.929007+00
ptorsfgz4h02gf7pdy0f6mrny5gxk35p	NjdjN2YwODliM2IxNTQ2NGM0NGE2NmY5MjM5OTIyNGNiZGZhNzgzYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIxUkdRTWFqdVlvcENQdFgybFg4TXBndzJSQmxQRjZvMCJ9	2018-12-29 00:22:09.775405+00
16h1vbaoaab07by3odrcdcfj3x97c457	ZjQ3NWQ0MmY0NmE3NDgxZjZkNGNjMGJmNTI1ZjE2YjhkYzk5YzJiOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJUV3dkVjE4cXVTaUl5UWplSjNUNWxYWlRUUzZIdUJrayJ9	2018-12-29 01:24:57.642644+00
gipgvd5ig3bjummww2zd4xnpd0mnrpyx	MzQ1MjhiYWEyMmMxYWEwYjFmMDVmZGM3MzE5Yjg4ODEwNTk0MjdhZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJkMlAxSWVnc2hRdXZZZ3BlZEVIUjdUcWxWeXJibUVqaSJ9	2018-12-29 03:35:24.40986+00
p4k7zfplqovfrsr91dgs2ald1xfmdu8g	MjIyOWE2NzMwZDc4MWFmOGY0MGNmYjVhZDlkYTIxYThmZjhlOTE0MDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJtMml2c0E5RFdkY0VpZUZiSlk0MDIwdXNvWmFFTnVrSyJ9	2018-12-29 03:36:50.617477+00
o5y91iftz0uwfxz5u4zob9jg7vxmehnl	ZjI1NmRlNWNiYmMxZTc0M2RjYTI0MGI0NWIyNTc1MDk4ZTFjNzE0ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJTODJXVEkxYm8yS3NPWGlPTlFBdURiNHJMRmhtSFdJaCJ9	2018-12-29 04:06:25.071254+00
y7s3efinzw4sefcp5ykt4a47e41bfmbp	NTBkNDdmM2QyNTFlMDdkYTJhNDk4OWY0YTQzNGE1M2IzNzVlNzAyZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJKaFVzOGtSdFluU1dPRER5Tkl1V0ZWcEtRSGJmdEtTdSJ9	2018-12-29 06:45:06.473491+00
uq45niifiv09v7cxbekw4ejiosmsmrce	ZDU0ZmU5ZjQzMTg0NWYwNTBhOWMzYWFiNmEwODQyMjIyMmY0OTQwYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJZURKVkFPNERkN2Z2NkRhSDU2bE4zY05XQ2hWUTNPMSJ9	2018-12-29 07:04:38.146282+00
zrlp5rjraap55z8wwrn1ra5vxib9e1l5	NDZkYTQ3ZDMyMGM1YTNiZjU5ODgwZmE2MzI5YzY5NDM5ZWI4MzQ5Njp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJaT1NEM01OYnZCVUMyRmdFZ21EMlF2aVhleFZwemQwMCJ9	2018-12-29 07:07:35.368261+00
0vev9ecze871o47h9m6zti8ajnr42wkk	NmNmMTYzZWUxNWZlNzkxOWJhOTUzZjY2ODQ4ZDYyYjk3M2UxNDc0OTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJPckUwQ0l0MFMyWXJveXhnRHhOVWY4eGJPZUhudDVrbiJ9	2018-12-29 08:00:51.389542+00
l1jkfpo35qd385eqwgra2ftvazc0tqao	MTJiNWI3NDdlNGY1OGY5ZmE1OGE4NTc3ZjE4NzFjMzM4OTQwMGU4Mjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJWV0VFTlZudTNCWFhqTkc1TUFoOFNMaFc1RmFCaUhQUiJ9	2018-12-29 08:22:05.670053+00
d76f0dcyjiqb4iy6bjoo6pgl5p1rtv8p	MTBhYjNjNzcyYjQ0ZjE0OTgxNmU1OGZiNTA1OWM3MjRkNGM0MDY5Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJBa1I4RkZvQ0ZaOEMzNjBRVnVEaGpUcFh3VG9VOHhOeSJ9	2018-12-29 11:06:43.716442+00
gl86ei186sds5o036yiad2109dvv9iz2	ODgyZmEzM2RiMGNhYmYxODc1MDM0ZDU1NDJjNDcwOTNlNjc1NmMwNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI3ajBOTzJaRHRYQjFsWm44V2JiRGQ2d2RvTFpMc0dYZiJ9	2018-12-29 11:16:18.384021+00
5ji6zmobn507y9mc1i8lvcadkdjm8361	ZTIzMmYwZTkyYzc0NDU1YjFiMjZmYWFkYzcyOTFhYzY2Mzg4NmM1NTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIxM1JiT3lCdzR3ZmhsOGkwQlZqSmFWNVl3MEszOXB2NiJ9	2018-12-29 13:55:17.605158+00
321d9mur7e83699bkodxsve1suivo0l1	ZDgyZjE2MTNlMTBjZmJkM2FjYzBjOGI2ZGIxZGQ0ZmY2NzZmNDJlZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJubE14NGQ4bDZmajBBSmJwY0VDM3dXRU53Snc4Y29BNSJ9	2018-12-29 16:58:27.345052+00
tn80sy8oi7dalkuuuxcvyb92y0g8re0b	NzlhNDcxZThhODhiYTZlZmNhYTBiYWQ1NDZiZDc4YjI5OWU4NGY4Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJNQXBkVnB1OUNRS1VBblVRTHpXeDVaOHY4SHFHVzE0WiJ9	2018-12-29 17:33:05.627413+00
3iyalqf1jynnqynmak85vvkr2mawxun1	ZTZhZmE1ODY0ZTk2NzNkMzgwNDVjMjMwNWI5YWM3NWQ4MzViNDNjZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJxbFE3OGJkS1RidllzZUpuajBWdUpFQlVOVUJSa3RmVSJ9	2018-12-29 17:45:34.808506+00
b4xnh5uoxtk6w5d0grzszuw9dtmqayvw	NDUwMDE5NDZmNzk2OTRiZTYwYzg1ODZhM2YyZTRlMjIwNTFkMmNkZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ1Z21EOEhOendPV1ptMkluMkdXeHljYnBPa0g2d3RPZiJ9	2018-12-29 19:29:21.024659+00
a7uusrjm3piiy35lbowmzxdtpfkflol5	MzFkNWY4MDA0NTY3M2I5ZWZmM2RmNmI0ODk1ZGVhNzE0YzNiZTk0MDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJSTTkyYTdpVlZpV2Q3TzB0QWlDb0l1TW9uUk5BWEgyWCJ9	2018-12-29 19:36:43.335325+00
9mjsyhg2x8e69ji32rc7c4p0d8rcjc8m	Nzk4YmYwNjQzMDdmYzEwZGQ3YjkzZGI4ZjZlN2JiNTY2NzliM2I3NDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJHVWF6N0JBNWNVV0tlWjI4RmgyWjM0Uk5DUVhjdzQ2ayJ9	2018-12-29 19:44:45.279849+00
liw571lzfcqex6piv7ixb7uo7w9x89rw	OGYzZmZhMDhkMWQ0NDAxMzg3YjcyYTE0YTI1YTFmMmRmMjAyMjQ0NTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJNbWNjM2pyd0FiTlVUQjVSYXNwY2pRNmNBbGR5OUNPNSJ9	2018-12-29 20:31:13.461842+00
edpmrf7ntea6rtstz65u56f8wuevy5mo	MDNjZjc4NGQxZWU1NjQ3NDMyZGM0YjA5YWQ0NmFiNDUzZTRiYzU5MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJrZjVlMGRxTzJ5MHFiWnZqTlBGbmRMN2JiaVVna21SRCJ9	2018-12-29 21:12:11.641409+00
s063uhq0ysa70gci8vxqrezsl3dk51v9	YmUyMWYwYTVlYWJiMGNkYWFiYWNjYzkxNDIzM2JkZTA4MGZhZDIxYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJwZlBVaXR5Ym5hMEpyTWV2V2NIQ05lNm9OTmhQV0d0cyJ9	2018-12-29 21:48:14.089837+00
vmjdveu8mo8qxg386gfqqucvq4yhn9f3	ZWU4YjZjZTA2YzEwNmM3YTFhNjZjNGYwNjE3ZjY2NzhiNmI2MjgyYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ4Q25HSTN2M2RvTFVtV3pGY05VWlA2eGNTaklZc0NEdCJ9	2018-12-29 22:47:41.897506+00
pwptdnvn43p870b3brb5fhshy8faz5bf	YjIzNGQxNTIwYTJiYmVmMWY4ZWE1ZjlkNWExMTkzOWFkYzMxNzhmODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJPMkNGYzlISW5PZk5ZZjhhaGQ5VEk3YzRsa0hzSjVUZyJ9	2018-12-29 23:22:44.48767+00
z4qwd1fsjmgvvk8ghukdxzcbjhn2qzez	MWFlMTViMGM5M2JkMWMzNDdjYzljZGUyZThjYTE3NDE4ZjVkZjEwMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIyZllkUHkzTmZ1Q1B2RmozWUs3RFlxMm9aV2UzY2JvNCJ9	2018-12-30 00:02:11.286507+00
8ir4u4cz68t473tcxw1j1x6rm1wmregc	M2VjY2Y2OGRkMDVmNWM2M2RiZjM4ZGY4YjhmNTBmNTAxMDY4NGFlMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJrdk0zTmlxdDlKeXl4b0wwZG1SUmtVVGRyWTZCeHVLZSJ9	2018-12-30 01:58:48.888002+00
voxdvfhz4fttejtq4mcc3zefeafvvigk	N2U1NDFiYWZmNWM5OTgwYzQyNzg2OTNiNDdlMTJmZGNhN2IyMTUzMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJTcjV3UTc4ZHZ2SjlIVDBXMFZKRUNTZ21xaGhJRDYzRSJ9	2018-12-30 02:05:04.708371+00
vo5uv5p8sax99lx6br4y0ci15dx9dos1	YzFmMmM2NTVkMGU0NzYwOGY0MjE0ZTJlYjlmYWE0OTE0NjljMWVlNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJGTU12MlUyczdUZWdxZ1ZGYWIxY2dJdnFnUW9GZTVhViJ9	2018-12-30 02:38:46.992074+00
64u9evw55dhx2mp0mcjn6to81dn94qnv	OTNlZmVmMTFlZDg5NmE0MjcyYjQ0MDZiNzg1NGZkOTAyN2FlMzQxZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJMbWhWakhBeEtORlZFVjdpb09vamNzOHJIMFFqdDhJVSJ9	2018-12-30 03:04:38.899043+00
1z2v9kjzyfgmtq1avale0ld5np7nlua7	MGUzNjUyYTFiMzNlOTIwY2Q4YWNiMmU1ZjYwYTZjYTBkZDhiYWRhYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI2NEhmYjFQbFFtU0Jha0M1VlYzakJ6dFRtTjdIS2xGSiJ9	2018-12-30 04:06:24.242504+00
824hcpd4oymduolsla0f5rtxdcs7zeei	MTUxNGM3ZjBhNjllNTE2MjdhYWVhOWRkNDlmM2Y5NWVmMTMxN2IyZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ4T1V5RUVWTWl6SU9TZ3ZDSUY4TXV0TkR1QkhPdGdDMyJ9	2018-12-30 04:09:03.809554+00
lhmxgpcckju8r4upkkhdvnewbqrk4gq2	NGE2ZGM0YTM1Mjk0ZTMwMTU3NWRlNWYxZDdmMWFkZGNhMGJmN2E2ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI1RXFYYWtmU1B6RE93aExkTjQ1dEwyUFJ6STRpUTRRdiJ9	2018-12-30 04:42:42.655726+00
gyz21gmxr0w7rbgxe950qbqcfii188g6	MzQ2YzA3NjYzNjA0YzM5ZDY0NjE2MjYzZDI0ZWI0MDJlNGUzZjZjZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJHbDAycGJ6V3dWYmdyN1g4NXJzOFRQSmlGU0NjaUFwRyJ9	2018-12-30 04:46:56.95327+00
ai4a9a59yzev8qm2p8tg58456o122k43	NGVlNzFiNzQzMjFiZWU1MWRjZGYxM2M0Y2YyNzU5MGNkMzQ4MDlkMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJGUUMzTm5yTHhWcUdnZUowalh0c0ZraGZMYWdnVmN4cSJ9	2018-12-30 07:26:54.771013+00
kldlw7378q4jihzvgs6jddksb81n0vub	ZmJmMGQxNWUyMTI1YjA0ZjRmZWFlZmUwZTA2NDVlYjZiNjA4YjExZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJhTVF5QWowQnc4c3hmTUp4blYyVTBaVElWbFNQcEw4eiJ9	2018-12-30 09:04:37.603557+00
fbqbja6n40bxjgoxkcuklr2yynm055ir	M2RjM2NhNDNlZDFiZDMxMDdiMTVkNTNiM2EzY2YxOTk3OTZhYzdiMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJObEl0QmY4UGRZTmVoQXh6OEpFeG9uUHNINXFkMkF5WCJ9	2018-12-30 10:38:47.508288+00
ukd1uz0ifc1waw0ih86nz9tfk3i6s9hy	OGRjZjY2MWRmYjYxNTJkNmYwY2M4Zjk3OGUyNjU0ZDU2ZTc1ZDdkMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJY0VSY2VHRElNMHdZbzRxTENKOE8xZjRieGg5RWNXVyJ9	2018-12-30 11:46:03.991257+00
56ydzjpqzvcvbleekgjccktrd37oqz3n	ZjI4NTI5YzE3MTMwOWJlN2VlZDI5YzYwMjFhMGQyNTE5MDBkNTQwNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI1cEFwNnE2ek1IY21MVHU2M3JrcGFUNWtybVR2U2dtSyJ9	2018-12-30 12:13:14.189038+00
851g0yphr4ze8zsyuc16vkiki9b62a2p	MTY4NTE2MDE0YmQ3NzhjYzZiZmJmNzc4MGFlMjNjMWU0YThlNzU2MDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI0amZrODVtQ0FtT1BzMzlzaDFNNTJ1RFVaNnl3OW9YeiJ9	2018-12-30 13:28:20.968615+00
6trny6uayjee93kev8zjgm6xvkwll6z5	ZGFlOTdjZjRhZGRjODQ5NzFkMWZkZjZjMTA2MWY2Mzg3NGEzNDY4ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJUejJzRkg2REdNSllYNjdtaVJBSHVneG8yeldZdXplUSJ9	2018-12-30 13:57:15.554337+00
6l0me3oxsmeuhkh8tgo0mzuzxs5yvftl	ZjYzMWYwOGJhODMzNDg2NzRlZmU3MjExODAyMmNkNWI0NTdjYmVjNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJsdWxZb3o0TDdDT0ZVYkFRdDBPeXhkb29YWm5BOU9VMyJ9	2018-12-30 16:47:05.967145+00
wbc9od3kzgfs11w2kmtuc1v7e7yy9rq7	OWMyMjU3ZDM5YzMwMzc3MDUyMjI4ODJmOTdmMTBhOGU2MzllYTAzNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI4c0tnMWVRcExZSzVMTlhucjlCS1U1WFBScHRMNU9qeSJ9	2018-12-30 17:23:15.538889+00
xpehf9f0i6g4382c85n6u4bil2tuf8bj	YjQwNTYyZWU2MzBkNTY3NmNhOWRmMTdhNDVlNzMxNzMxZmNiZGJjODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI1b0tTMVlET2JIUjVkdzltcWw5bVF0cXlVbnNtVVRJYiJ9	2018-12-30 17:35:38.3264+00
dcdk7gppcvxj0b08od44y9tsc8hjxtrz	MTZhYmI4ZThiOTY4NjUxMzgzMWE4ODRjOGU2NzZjOGQzOWQ5OTAyZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJVcmgyWjZnQUhmdks1RFRSbmJZeXAzZGhiTmxiOWtBZSJ9	2018-12-30 17:35:38.327661+00
b7rzf5j91ac4oaj80jeguw5hcgprj889	M2MzOTYwNTc3ZWVlM2U2NzY0ODVkMGE1OGZhZjZmMTk0OGViYmZjMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJBZ1ZOSUtMQlZUOGI5T3l4dGdnMFVMMEJWMDFGeHlURSJ9	2018-12-30 18:09:50.159797+00
p0vbsp5udpmx5imw0j6s5mucs2lpoqzl	NjI2NjdiNGQ1MzljOGZiYjhkM2I2NjM4NWViMDBjODgxNjk5ZDVjMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI4NTZLd0FDckpZdDVRME9IYVhKZ0RmRTAxTXFSMGNBNiJ9	2018-12-30 19:50:40.651659+00
068jj7hzrl32751jgb4a4xofeiekvjqp	NTdjNDMzZTYzNzhjYzE4NjE4NjFjZjJiYTE2M2UxMGFjZmJiYjE5Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIzYThTTWNJUDh0SVhYSG1oWlRjU3VMcnZaVzZlYXNVeiJ9	2018-12-30 20:55:24.876077+00
c9r2oi2iyj158xuxdpaoa5caliryzmcq	MmEwMzc4NTU1Yjk1OWVlZDE1ZDdmZWZhNzFjZGE3YWZjYjhlMGJlNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJCZlBNMjZkWnVHQnA4aVg5MlczMEhGOEZDZFlJM0JDRCJ9	2018-12-30 21:21:17.903029+00
f7iwlapdbonp72ny8qfnnd7z2c6a30c3	ZTA0ZTBmZTQwYzM4ZWY4Njg3NjIzODc3ZjE3NzkyOGMzZmYxNTMzNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJuamdsWTl4VVlGYmMxcWI2ZzB0dnIxTjk0THM2ME9pdSJ9	2018-12-30 21:25:17.814916+00
yxvj2op1gqz15tpp96r5mgx8d1g4dqb1	MTBlZDJhNWMzYjc4NjU3NTJiODA1OTJiZmZiNzMwZmE2ZDQzN2U2ZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJPVm80WUF4RUQ5NlZmbTFTSDRISXMxU0ZUYVpXemZ1ZCJ9	2018-12-30 21:34:17.793838+00
vckx6m5vevpoxj8ium0vom1t6eiw0ki2	ZTdiZDFlYTUyMDk3MWFlOTAwOWY5NDEwODI5MjU5NDIwM2M3OThlZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJMGtrZktNMEtqeXdnajlzaGpvNWhWa0JFdXR0YW1pRyJ9	2018-12-30 23:25:07.788053+00
qqfyxxnmkd23l96ar0w99oo8u6ifqczg	Njk4YzUxOTU5OTgxY2Y1YzEyOTRhNGRlMGFhNWUwY2UwODA1YmFjYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJlUGpXMHdiOFByZGJSenZXSm9rUlpldE1YaGZHOFRGUyJ9	2018-12-31 00:05:12.795811+00
877af7e44h4ppp331pvwwp5y4omo5czl	ODJmYmRiOWZhMDdkYmEyMjM3ODU2NGQzNTI5NTNhNGEzNTcwN2M2Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJMOHZUS0Y5Slg1Z01peXNPNnljYVdQc2RGTEJscm94RiJ9	2018-12-31 01:22:52.13754+00
xx2dakpxe2p93ne7waz355otsxpace1s	ZWRlZGUxYjFkN2I0YTI1ZGYxZDRkYmU3OTU0ZjUxZWI5M2VlNjQwMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI0MWVNUGhsTWt0VUJHZU1pY21xb2NNSVZhRkVhbXRGbCJ9	2018-12-31 03:59:04.971472+00
rpjwd41ixx2qvfemrzdct2q345v2cbv7	NjVlZWQ2ZWIzM2EzZjRlZjdmYWYzNjEyMzE2NzMxN2ZiZDk4NGFlMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJtVWNtNHQ2eElnOHJnZ2s3VTNmR29lamNFbFQ4Wmc0TSJ9	2018-12-31 04:04:40.269958+00
vlpfqynzkqygktjhvx43txnij2sp5mqn	ODZkM2YzNjIwZDE5MTNkNWNlOGQ4YTU4NzQ3NmRmNDk2MzZiMTM4ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ3M1JxSVBJQ0pReDNQZ1RuZTNsaXZmeXZGczJiMFBJYyJ9	2018-12-31 07:31:15.129328+00
fz94quvyfttg647t6q3078jj8lw7fpxe	ZDI4ZGJkNjVjYzI4NWUzZWZkYjJhMWFkMThiZGQ5YTM0Mzc4YjczNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJhWmlpZ0hlRmRyVGFiMXZyelpwelljQ2daVXZJM1hEdiJ9	2018-12-31 08:05:00.292728+00
13hpolh7p23ty3d0jak5pqywp7ztib25	NmNmYjMzMTBhYjY5NzE2NmYwMTMxOWQ0MjZkODJlYTI4Mzg3MzVlYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzclNLTTRLdFN5OXFLdDlnbk5tdDBpdWlEMmkwczZCTiJ9	2018-12-31 08:10:40.700023+00
tio3hrdv3q6kgoj9ym2mrv4913kmcbdk	MWQzZmJkMDY0NjQ5NTRkM2IzZDI2OTc1MmE2ZWM2YjNmN2Q1MTcxMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJNVlZLS0VrWUk0SG1TODR6ZUw2NGF2eHFnaVUyZFU3NCJ9	2018-12-31 08:33:29.493989+00
manvnstcl6ozsda5gowr191cs2ba0s2v	NzNlMzk4MWJkNGE5Y2EzMzRiYmJiMTZjMGM4MGFkMjNkNTIzMWYyZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIxQUxsT1J3TnNZSzNOVEUzUENYa1FtRGEyYnRUcWRkZiJ9	2018-12-31 08:38:37.396237+00
a1sb9nqtw7ll2in8nbfyxlqwchuys6k6	NTA1YTMzYWExMjMxNGY1ZmU2MDc5OWFkMTQzYTk5ZjQ2ZDQzMTdhMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJycUVzVG0wMTNYZ1FROEo1dVhsSm1JdnRwV1FTZDhoMyJ9	2018-12-31 09:12:43.944891+00
0ytmasgixpo40wyg44fevm6co7bkejfh	ZTQzNmM0M2M2Nzc4YzgxMGE3Mjc0NWNlYWExM2QzY2NkYTEzNjZjYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJXWmhWajVYNEJYTmZYR3JwQWJPejN1YUNDdnhZekplTyJ9	2018-12-31 10:34:29.160251+00
ea7m46ngymrke17igdh3pffpx921a424	YTg1YzUxZThmMDFlYzllMjkwZTJjZjk4OWVmNjQ5OGU0ZTUwODliOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJBVEVFUlM3RmI0S1F1Uml3a0NHQm9XbkZ5b0pVWXRtaCJ9	2018-12-31 11:04:38.567189+00
gxbtl0b29s3nxlbfxzb6xhzuezkvesp1	OTRlMjgwMmNiZmJiNDcwZGUzNTBlYTgyYTliZGQ0NDFjMjZlMzA4Njp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJZSWJ0NU1UOEVqWkZoU0RIQmExa1hXMUQxNW9adTVVeiJ9	2018-12-31 11:06:04.195733+00
2zdbzfg1s3q9w22y7jwlvs487asyw19o	ZTNiNzgyMzFlNTFhMzYyYzdiZTY0ZTc5ZDlkNDYwY2Y5ODZjMWNlZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI0d042ZkdyTkljdlNPS3p6TWFaOEQzMjljQW1VRHhicCJ9	2018-12-31 11:59:55.043934+00
fxex8f6e78vd77wikddg16e89vf9zduq	MDQxMTY1MzU3NTMzM2RkZDJkYzBlMmRiODE3N2U0ZmFiNGRiYTNkZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJCRmtFdTJUYzQ4NmU0ZDROVkpxYUliYmRObXpOT2I5QSJ9	2018-12-31 12:42:52.103526+00
cvlyrw0fnec3ipq35ojilhzfsv4pc8cl	YjA0OGQ0NzYzMjQ0MWE2ZTg0MWM1NDAxZjZhMGE1ZjUwNDNlZDhiMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI0MHlyOUxLVTVNOG1BVXRLM3ppZG1SSHhSQ1BqVFpPRSJ9	2018-12-31 12:48:43.54855+00
z5xe2v2fc2mdm0hdkfnxfva7vwnfx8m2	ZTM2ZTIwNjkzN2M5N2UxMjZkNzllMWVlZmJkM2IzNGViMGIwZjEwMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJrV3Rqa1ZzOGE3dzl5NVVQbUpoNk13VDVkdzJDSEJUNCJ9	2018-12-31 14:04:19.618847+00
fy2zazat6xbq9bvx9uubhuexv76wu35j	NzI2YzYyNWFjNjE1NGJlYjBlZGY4MGI4YzYxNjdkMDg4OTMzNWNjODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ4TjR2bHh6dk9DNlhnTnRHMklKUVhvRGZyeE9lOThjVSJ9	2018-12-31 14:46:00.502815+00
qq0o96ygvs5mo6xj6j2lzeg5hlh4nrjz	ZWRiZmNiNDIxNWU0M2ExYjI2ZDY2ZTExNjY0ZjVlNDE4YTdiNGQ1Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJKOHVnV1ZqbHZqbDdZSDBZV2QzY2FGcGhwVkxqakN4TyJ9	2018-12-31 15:43:05.39979+00
c7rw2a5c52q3mowr0jgzm3iws43kkmjv	YjVkNjZjNmM0ZTcwYTBmYmQ3Y2NjMGU4ZDgzOWZhODk1ZGVhMzA1YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIzcDFKblFzMWgxVmdHeGhra1BjaUwwRGl0RWZia25GbyJ9	2018-12-31 16:17:46.251835+00
kf7jdki6z0lahajpu8r40c3yvhrk8tgn	MDE1NjAxMGEzYTUyYTJjYjg5OGQ1NDQ0OWY0MzE5YzllMzRiNjQ5ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ2Rk5NWkYzdG1nQXhwb2prRWJTRFpFNndQQ0ZoclI2TCJ9	2018-12-31 16:18:11.292295+00
6t5a5nvjjs5n2v4u7cz3uwj0ljw0iocw	YWVlNTUxNTY4NGE4NzdhMjFiNDBlY2UzODViZmMwNzhmYjQ4MTRkYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ1bzNLeVJKbUFWdnc1eVc5QmJzcWRYS2lid0Rrak5ydSJ9	2018-12-31 17:30:23.731028+00
1rj5damkfme6nbmd36jgvkkepcurociw	NzQ2NWJlMzkzMGM5YjM0OTc1NjExMTI5YTJmMmEyMmZjYzc2OTU3Mjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJnMmh2TjlpNzVuS3h4clVJUWw1dEY1Nm9jRlJNN0Z0MiJ9	2018-12-31 17:42:27.207233+00
z5vt47oe1llui2wg59do68s95baf3ld9	MTliYWRkYjJlZDgxY2M5ZjhiNjE1MzY4MDlmNmFjMTU1NDYzZTEyODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJKZlpkYm42ZGlPNndJWVFRUGRZWUtBcnBCakxoY1R0MSJ9	2018-12-31 18:42:22.845682+00
95gr2zl7jdajvfdp9eturi300c1jelao	YzBmYjg4NGVlZDg0MTU0ZjM5ZjVkYmQ1OGIxNDExYWY5YmY3YzEzNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJheFdaRXdWcWp6Vmx1anhkOUZpdXFPcmo4Nk5nU1FvSyJ9	2018-12-31 20:13:07.366856+00
ecj218048d0312vbiy2ampfkv1mezsht	NDgwM2FlNDFjZTAwMjFhNjVhMjI3ZTBiNjk1OWFlNTczODUzZWFhMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ4dHRzVTNhWXRHcFdabEpPT0d5RXhua0hoMjNWeGdxdCJ9	2019-01-01 00:27:54.522018+00
i9zeya6miu1rcy1sigx2rez4u3izmywb	NzVjMjc3ZjkwMTgxYjUxMTg3YmU5NzgwMjIyZWQ2OWE4OTNhMDllZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJUVG01bk84UFhGM0s3SWtJdlU0eDFFWWlkYUVuSFdSSCJ9	2019-01-01 03:34:19.270879+00
cueianu0cjj96ygzrq1lv1gup4tefd2o	NWJlM2JhZjZkMzZiMTVlZTQ4ZjZkNTlmMDVmOTYyMThjNzQwZmJmODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJwU1cyaEpuNG5mNDhZODlQV1BaZnNEYmhWbnZSdUJXUSJ9	2019-01-01 03:34:19.559059+00
r4cmcyg640ubmbyzw3i7s7le9ttmn3a4	ZWY1NzU5NmEwNjU3YzI5MDVjODJlZWI3YjcxZWNjZWM1MWMxNDlkMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ5TTlkQkhiZXFFMWZ3a3NPaXdZNURMb1lXWVFNSTFrTiJ9	2019-01-01 05:27:25.940802+00
tqu0yvbqb690udeuhem5dv47muhxcqlw	OTA5NWY1NGFjNGE2OWUyMGI1NmI2ZTczNGMxMGIxZDA0ZWQ3YzAxZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJyYWVkTEZwOGYxNTBJcGI5YmdUMDlhTWlZZTdWaUtHcyJ9	2019-01-01 05:40:04.742142+00
ajftsho3gtivr9ss9k0octfc7kkd33n5	MWY2NmI0NmNhMzExYWFjNTczMzQ1NmY4NDkyZjgxZmQ4MmJmZDY4YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJkZUpUWDBHVTNqRUpKM25DT1lLV3p0RlVBbUhnTk5FMSJ9	2019-01-01 06:04:18.448466+00
fowqlmr376ene34pijpwrfnc6sisuej3	NzVhNzA5NTc1YTk2NTVjODVmMmE3ZmY1ZTEyNmI4ODhkOTc5M2VhYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJqNVF4dThKWTFkU1Budm13bkc5Z1Jra1J3R1Zjejd1SyJ9	2019-01-01 06:51:00.436836+00
wa9t7zbicz7p4cnfs22386baeqftfw06	ZDRmYTZkNGEzMzM1NGRkMTU2MjlmYjMxZTA4MjgzZjZhNTg1NGRjMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJuWllVaUdXWmxQVExKTHNleEc0RU16bDd6Y2tDaExQZCJ9	2019-01-01 08:02:09.363783+00
kae1x9r32xo80ge4qftxxfcp6k10fax3	MWY4YWJmZmNjZDExMWFlNWI2MWRkMmFjMTBkMDNjOTYzOTRlMTc2MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJadDUzNjViSVRkRWVZTmhNOFdkdzc2RFdZS0cxSmFlMiJ9	2019-01-01 08:15:38.765171+00
6nmkchiprta39d84qhc562g44ttt2xzh	OGUxNWQwZjI4YWI1ZjVmZDIwNmFiYmRmODk5MTczYjkyMjNlMWJkNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJxUno0dFVhalpleXZ3TktKNlhIRVZIY3J0N2hEaWFCRCJ9	2019-01-01 08:18:13.480792+00
o1zt11edu3ybtqiyrkr9pw65ve09rwmi	NjZkZWQwMDJiYzVjZjAwNmEzZDA3NmMzYjY4ZWNjM2Y0Yzk3ZTQ0YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJTMHFTN2xOUjFzc3ZDejZLUEo4cm53TjBpVVpvQ29nQSJ9	2019-01-01 09:21:13.90038+00
sve010k7502rq7hr156hkzprhgzrbr6z	MzYwMWNhNGQxYmZiY2JmMTdlYzU5MWQ5YzY1Y2U0YmRhYzYxMThjMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJxVGNnVE1yNXZkTUFUNTF5STl0MXVQcTlBUDVLcVJzYyJ9	2019-01-01 09:26:57.807064+00
86ndvhv8o23up4a7nngmlw42v3fzwr9l	YzQ2YTJhZDg5ZTFiYzM4MDYwYTYwZmEzNmY2MDZmZWM1MmFmMmQ1NTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ2bUZ0QWxMY3hSNXYzUEdJd1FvdFZqYm9ERHlPSmFnVSJ9	2019-01-01 10:23:27.591588+00
1ab4zvdexqsny23p5vjk4r60hzjlnysq	Y2RhNjkxMWQ2OTY4ZDQ0ZWY0NTdhYzI2NjhlZDgyMDQ0ZjA3OTgxZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJyaU9Sak52YXpTZ2s0Ymt4alkxMUhvc2ltNjdBU3laSyJ9	2019-01-01 10:27:06.101539+00
6nm30z2vnd0hiu8u4xod8hfhuq7jztn0	ZWYzMjI4NDQ1MzQ0YTlhNGVlMGM3NGE3ZjI0OTE0NzA0ZWZiNzZjZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzS09nOUtxMTVDMHY1ajNJVTZScXEwWEJuOVRaR1NPTSJ9	2019-01-01 10:31:43.979916+00
ii8tr3poytkj0954sjljr8h6hsf6ncd0	ZGRkNWY4OGQ2MmNhNTVkMjc4ODViYTI5ZjlkZGMyYTI2ODU3OTZiYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJPVHNYMFpSS2JhdENzUU5PT1ZsQ0FzREN0SHRNT1ZDSiJ9	2019-01-01 10:38:55.896498+00
sicex2gv5bi4j1d06iu9f22i1o6p9jht	ZDdiMTk3YjQyNjY0Y2E2M2ZlNjRjZTdkZjNjYWUwMDk5NjgyMjQ0OTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJnOVdOWHloa1NLQmxKRUxjMGFUVnRMa0JnQ1FFQlhGWiJ9	2019-01-01 10:42:59.128852+00
onkj8h1hoaz4ppkf0s7fk2lyqrruvf6c	OGY3OGFlZjA5YTc2NTNhYmE1MDZmY2M1ZmYxN2M0Njg5NjhiOTk4MDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJjWldRQmpjaWhWWlI3dFBwT1I2cUFYVHNHMTU2ZENRYyJ9	2019-01-01 11:05:17.518695+00
yzc512z3kfyg8adpwfnj1nyhad8yk5vu	NzhkYjRkYmYwOGE0NzlmODlmYjA4MDk4M2Y3OGZhMGU4NDI4MzliNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJyMnRiVllocXpUb3RzdzdSVURENUVYa28ycHZQVzJpMSJ9	2019-01-01 12:13:33.877923+00
ru12ysvianljmmy2bddrn6ksox3h9iiw	M2QwYjdkMjcxMDA0YWNhY2Q0Mzg4Zjc5YThjNTU3NTk0Yjc1NGRhMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJuS3R3eXBLc2x4TUlQVHNneURmc2RTRkw4M25ObzRCdyJ9	2019-01-01 13:30:05.384947+00
visujgtfx5c3is8kjve5glpcpd0f1yit	YzhhYTY2ZmMwOGVhZGEwYzk5NDdhY2ZiOTFhMjUzMDA1OGI1ZTNmMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJHQlk1S0VjWFNxRWhOeTBmMVBYbGo0cEI3QWpvSm5HcSJ9	2019-01-01 14:17:09.552038+00
gr008ftir1t66oop0ibdtdx75nczfv5l	ZTc3ODk3YjRlZjkyYzcyMGY5MGFiODE1NDBiOWI2N2RkZGFlNzg2Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJNY3hLVTJVS0U4d2t3Z2huenUxNGJpS1k0MzZVdGRGdSIsIl9hdXRoX3VzZXJfaWQiOiIxIiwic29jaWFsYWNjb3VudF9zdGF0ZSI6W3sicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIiLCJhdXRoX3BhcmFtcyI6IiIsIm5leHQiOiIvcmVjaXBlL2FkZC8ifSwiaUNJejZaem05Y3d5Il0sIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJfYXV0aF91c2VyX2hhc2giOiIzODk0Njg3MDQ0OGY0MzA3YmRlYjM4NGRhZDZiMTk5ZTllYTVjMDQ5In0=	2019-01-01 16:08:13.539305+00
aqz3gmonuxuxioqqkentnsf6tvipwcj4	Yzc0N2YzMzc3NjQwYzcxZGI4ZjdlYjg2YmI1ZTk0MWQ2ZmU2OGYzMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJsWk1uc0VDUk13Zllhc1oxaTl2c2R2OEppQ1BHRjJrOSJ9	2019-01-01 16:29:40.324305+00
s0cxnydb0lw40t0ei2fafzt3n15m29gx	OTE3ZWUwYWExYTVmZmViOWVjODAzYjU0NTA3OTE0YjdhZDg4NGVlOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJTUFVLRXpJTm9kV2RNcGVNMVVnNHJlREw3NVhRQmJCdiJ9	2019-01-01 17:43:46.833156+00
0uaoht3xyb0xyn8e3zy3yi8ey1n8i0kg	NzYzMjcyNTdkZDRkYjI0YjZjMDgzYzViMWJhNTVhYzRjZDUyZDU2NDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJNNDdQSzZCTmRUYkdxVWJUb1M3WnhFcGZtVnFFdkg0WCJ9	2019-01-01 17:59:44.48355+00
3yzfm0xb3l2prmmpl1ls7f2yxecoccvn	MjAwYWZiZThlNjQyMzZmMjk3ZTA3MmZiNDNjNWYwZGY3ODk5OWRhYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJhd0dianZjUDVYOEtnTE5vdUdIUEdSYUF3RFZsbVVTWSJ9	2019-01-01 18:22:06.46975+00
gth0lghrfilof9jcyngdlner0s91tai5	ZjUxOGY1NDI5NzJjODJhZjI5NjE1MjMwZWU0MjQ5YWE1NWJhOWIzMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIyYTJSeGc2U3NVUGpRbU9QS3ZtcHprQlZ4R25PY21VYiJ9	2019-01-01 18:37:05.437967+00
mv377w70slkzorrrwjl5oradw3uoud3w	YWYzYmI4MzI5OGNiZGE0NTZhZmZiMmJjNmM1ZTg4NTA2MDU2MjU4Njp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI3cUtJeXZZRUxFVU1IMkNLdldEQndETkRlcGtZZmJYSiJ9	2019-01-01 19:17:35.816354+00
wurtqvkduzhox7zt0v0jji254tg98xsu	MzI0NTA3OWNjYjJjNjY3MzU1MzBhYjM1NzEwNzQ5Yjg4NDZkMzdhYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJEcThwU2lad0ZIQ1R6MU5ReHBpN2lhRmhVTGVFRWxGMiJ9	2019-01-01 19:35:59.718211+00
xpq3j66x0ilu8we3uk88ey001t3212rb	OWM5OWMyM2U2ODdhYjg2NGExMDlmYWI1ZWNkODUxZGVhNDVkYzYxNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJFRjRydng2TEt3YnJRdkpkVXdTRzh3RklyVDdSTkpQSCJ9	2019-01-01 20:00:49.136306+00
hpm62nxl2onsijhkkaozweeeobjpgbi9	YjI0ZDYxYTNhODQ0MmM2MjkwZWFlZTJkZjU2YThjMjM5OTJmYWJlMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJQd3QyQktPQkFHN0hLY3NJT2V6dDlXVzdTOFE5eVM4aCJ9	2019-01-01 20:01:10.145267+00
d2zv5vnbw9li47rhvu28n04epqfz505f	YTJkOTFkMmI2MjA5MzVjOGY5NWIzNmMyZDM2ZjZmZDE3NWE5NzY3Njp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJWeHhmQ0FlRG83WnIyd05qRWFhM1hqWXN2UFRZWWZvRyJ9	2019-01-01 20:15:21.687041+00
l8nfduq11b0mur64pgedd4jojj871tz2	NTk3OTQyOWRiMDRiYjU3MmQ2YzRiMDFmODk5OTk4NzU2OTJlOTNiNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJyMVZkOG44SjZXOXhRRXg1eGoxTkJSRlM5M201ckFLaCJ9	2019-01-01 20:32:29.007209+00
m5jn4i0eanwy9u99hsd086l3noqkmd2i	YzVhNTc4OTcxMjdjMDc3NDExMjNjMWE2YzA4NGIyNGQ0NWUzMjFmYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJycFVXamhPWEFCOG9oU3kzWkwycG5BclBwRERzNWJhZiJ9	2019-01-01 20:46:05.583359+00
z5x84uays87vu1lqwu5p5uvci5nvavp5	ZGY4NmI0YWJkMDBmYTViNjE3YzdiNjlmYTlhZWQzMjU4OWEwNmIzZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI2UlZLQUpvc1pMWkQ3VjJFR0hNWlMyb3R6QTJMQ09KTSJ9	2019-01-01 21:10:33.444962+00
pymjrkdj0ic50jbwysi2scnlzgbby3wo	NTUwNDRhOGU3MjNkNzI3MDkxYThjYjk4ODUxZmVhNTA2Y2JmOGEzNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJoRUYxcmpNT2hkUDZ3ekJXU1dEOHNKdW13MzdPWHVSQSJ9	2019-01-01 22:50:58.496344+00
o67jlfz6fulto2c5rma59rca5mlg4l24	MDM0MThlNmNjYzU3ODQwYzg5MTk4OTY5MGM1ODg4NTg0M2FkNDFlNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJpMTVxOWlSM2N3T0U4TnV3b1RYWnF3aWhhZnQ3T0ZiOCJ9	2019-01-02 00:22:59.499341+00
emp4gbdlcuytp1hj2zi25rqefh6lzx40	MjU5YjUwM2ZiNmQ1Mzg3MjY5ODA0NDFjNTVhOTliODliYTBlZTIxZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ1eHBSV0xmaUlMYUtqNmVCUUlnN0p6MDFyWENTV294QiJ9	2019-01-02 00:40:40.892428+00
69w4aur9kr9thlzlam9p76qzs9biwr3d	YjVhNzdkMmM3YzNhYTI2OWE0NjQ2YWNlZjc3YzJiOGFlMmNlMTMwMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI3RG5TS0EzVXFET2ttTTc1OTkxaFdKR0szZ1l6UmNWVyJ9	2019-01-02 00:54:00.142802+00
wepvk96w97mmfukgms7cy6fu3842tky6	ODc5NmI1MTJkNjViOGIwZDM4MmY3OWQzYjRhM2MyZWI1ZjJmYjg1Njp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIyU3NyYmJ0cE1VWVF3Q2s1Y1U3RjhBdmh6dFh3UFBlVCJ9	2019-01-02 01:22:31.571692+00
o61s6h1uu5ncjftx06z9eey74ovhxolw	MTliOTVkNzlhZWU4YTlhNGI5OTY3OGVkYTA4MDc1NDNkZTkwYTIwMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJXNzJLOWprZDFrMHlKRWY5c0IyR21HVjE5OHJtNlZMaCJ9	2019-01-02 02:02:13.673956+00
2tplvp2d0n9l5t9x6tujhx5extc79c2g	OGVkZTQ2ODUxYjNlZmQyYjMzYTQ3YWU5YjU0MWI2ZmE1Mjk5NGU5Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI5dmptcGNsbWNRelhyamNvM3BIV3NLRm8wNEFZV2lmbiJ9	2019-01-02 03:05:05.08934+00
hy6ssigrnqdhid6ns3mv6m8uanv2f8ut	YWQwZDBjYjEyYzI1NTBjYzRmOWQzNmUyMDMxMWVjNTU4OGU5MWM5Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ5YnI0VHMxdlI5cXBOSHI3cmtIYnlEUmFJbjQ4THVPZiJ9	2019-01-02 03:07:59.318308+00
3yleafskv481oxc25xesqfa1wp50hdiu	N2U4OWM1YmJlNmE2YjRhMzJjZmI4NzZlNDAwZWIzZGZkMDYyYmMzYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ3cGJ1dk5KUzlaZ29JV1RHZlZMa1BiQllyUEgwWmJsbCJ9	2019-01-02 03:23:28.952941+00
ogcsqga8ded255ghby1xedc5zf1log6q	MDY1ODY3YTA2YWFmY2M2OGU4MWQ4YWVhZTllMTFjMjBlYzA1ZDM5NDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJoOXNKRWRqNW9adUhXVUxzU1kyQ1FUekJXR3NsQ1ZOaSJ9	2019-01-02 03:50:03.96661+00
q869bvlwqmn1vuo09784meypu80syn51	YjU3NTkzNTBhMWNlNDljZGExNWNlODU5MGExYjQzM2I5ODEwYzQ5MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJWd0NaSmg2ZFY2ODNFcEtsNlk4aG5jbHAxbWlqcFd3NiJ9	2019-01-02 07:57:32.080087+00
qi9xiwtwcweqk0gjh9k6kb5a2a1ddjaz	NjYwMTdhYTczMmQ5ZmZiYmVlYjJmMjAwZTdhZThkZTgzMjc5NDY3Njp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJDZ2xib0Jkb3d0b3g3YlRXdVFhdFZwcmZCS1dJWjJjNyJ9	2019-01-02 09:56:26.56174+00
cbvr9agx73pr8fgvqepi3e0mayxevzgn	OWFlNzg0MWUyZTU3MTA1NjQzNDU4ZGJhNjdlMmFiYWQ1NTY0NWQ1NDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI5RXJsZVJuaVBCb2hZeTl0QUwySFRCT0xJdjRWdTRuRiJ9	2019-01-02 10:11:07.880574+00
54acflh33yh4c8y2ior285tv48ygq3qo	ZjZkNGM1NDJkYjdjYzQ2OGQ3MjM2ZjRhZGJjYWY1MmNlZjYxMGJjYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJZWd3eGc0MWJwMGtrclBCcUppSHpXRW8za0RveHJPOSJ9	2019-01-02 10:41:11.151617+00
kx6s5w1c6p6m0r3mybrjt32xytdv4jdx	ODg4ZDUzZTczNGRmZTQ3MTQwMjUwM2UwZTQxYTI2MGY4NWJkYTUzZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJKSTk5c21tcWxNTk52N3ZWcWtxR1dDZzNLQzdoQ3c4NiJ9	2019-01-02 12:31:44.401513+00
9zj3p1nvzmlimfyey427cuak2986pc4q	OTIzNDQzMjRmZWYyNzY0YzRkNzJhOTJkMWVmYjRlYjVlMjQwMTk3Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI3SlNFcXBCWnQwS1ZUSmE1Z21iRGpBS0Faakd4bWU5UCJ9	2019-01-02 13:06:57.332837+00
aw4ruaujm7sodq3g2y0ltj2g6n7dwixp	MWY1MTc5ZGY1MjQzZTc1MTM2MzI3ODFkYWQwNTE5MmEyYzJhYTk2Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIyQ28xaUFvbkZnM1lnWkxHNlNDWFVLWExCY21ZQWpGcyJ9	2019-01-02 13:14:53.308009+00
0cstdccs3kvofrrkggpl3ceej3ezix13	NjRlODljZjRkZTFhOTc2NDhlYzMwOTVmM2E2MDEyMWJkM2ZlYjFkYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJmY1VwYmdVcTcxWmlHWElSQWNIZndqQm1SNHpVVTl1dCJ9	2019-01-02 13:45:00.975709+00
ve4xyoegetkqkuwzm717n2lkmvfzgfgr	OWI5MTg3ODYwZWE3OWZiYjhhNDg2Mzg2MjdlZGQ1N2YxOTNjNDVmNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJTNnZGWFhkdGpDUnNpRWhFdmlzV0lWeHdVV1ZaVHFPNCJ9	2019-01-02 14:29:56.396507+00
h4l5csq6thalmj1bscu9sj21nvpx9lpr	ZWIyYTQ0ODQ4Njk2YTZhZTVkYTkyZmYyZDgyOGE1MWYxYzg5NTgyYzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIxaFl6SHhKb2xYM2J2bUVXa3lFV0RxWnNtcUNQSDNkQSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-01-02 14:57:31.757347+00
ecyt07p7bn0cs4xt1sitwwlydg6hjzm5	NDhmMjM4MTIyYzg3OGZjZWM2YmE1NzE4NjBmNzdkYzg3ZGE2OWQxZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJSUmhuSjNkR1k1cjhiTzNXbkJ3N2ZNYmlsMGRyUFhlNyJ9	2019-01-02 15:20:08.228997+00
hp1ymws3d87gw1kkzv18h1t4c7udtotz	NDhmZGE5YjNlZmJjMTEzZmNjOGUwMDY2M2MwNTVhMzg1ZmUwZTk3Njp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJSSUZGUXNSRlJ6RXRQWnJUSGhMY1JWQWUyS0JuZjJSRiJ9	2019-01-02 15:51:51.371889+00
5ic9wr08zn0j2koj5qwgcbrkkpwk4nyp	NDQzNDgyNzYyYmEwMTBhZjFhZDE2M2RkOTMxYWI5YTdiNDM2MTY1Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ6WkkzTXdkUnBITzI0d3lsTGt0Z1N0TkJNbTk0TVFLYiJ9	2019-01-02 17:32:52.868293+00
qqoh2844jc3wnelj05cgszrm935y3z6o	MzYzZDM2MzM2NGM3YTkyNTk4YjJmNDdkYTA3YzBlODAyZmRkZTMwZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJVMVdCVVV4Vk5ncU5CSkpzanJkRzRwVXZ6Sk9YTW9SaCJ9	2019-01-02 18:13:35.770439+00
tohch94ypezsfp93siz4uxete05nv1ag	NTA2ZGM2Y2NjNTBiODEzYTZmOWYwOTU1NWViYzNmNjRhNGI0NTcyYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJhWmMyOGIyRFJkcXFHSkEzQ3BrUmpCVWJIdUtWalpDZCJ9	2019-01-02 18:21:35.387514+00
mqcziv49mwiuk48mc582vf6f9kvz7lqv	NzVkMjQ4NWRmNjYxYjAyZTMwMzIwMzMwZWYyYzdmMDkzNjE3M2I1Njp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJTN29QTE5FcHpHc0RieW9hNGpFOFprRGJrWmdIb1J1aiJ9	2019-01-02 18:53:21.625048+00
2gxxq9ybhye0v84jaieqviqtzgx1vecv	NDVmYWFmZjUwZjAyMWZjYjgzNDc2OWYyMTdiYjA5NjRmNGJlOWM0Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJxa0pqZk1XQm1PdTFGMU40djl0Zk4yZ29pc3dwWFdBMiJ9	2019-01-02 20:07:09.712606+00
hml7fey7xuq125mjt8halefb412vclll	MWQzYmZkZDBkOGMyYmRkMmQ4YjFkYzAxYjUyMmFmN2M0YmU2OWI2ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJWVWFMMEl4NXl3bmtkQTNrYWJ0YXllWWJNdDFvZ3ZBcyJ9	2019-01-02 21:09:12.034296+00
apug0nq6zvh59gc3lzyjsfglyojivhkj	ZDY1YTE2OTI0NDViNDM2NWM1YWQ2NDljZDE0MDQ5NGM4MTUwOTRmNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIzN1ZKUDFVVk9BM2tHVjZCNWYyVnhXSm5wbEM5RlhPMiJ9	2019-01-02 22:09:25.683991+00
dohzri0nqbg7izjgiqh7kp3hpiyxjql0	YjM1NzcxOGY2MDhkZDFiNmQxNGI1ZDk5Yjk4NTY5YTk5YmM2YjQ3Mjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJVSXl4aExOYURqbVFZQWIzNm15bDNPbDEyaTBCQlZtNiJ9	2019-01-02 23:04:59.133922+00
v6flpr58ax7fvln6hsqetj1yrdqh70el	MDA0NjMxMTMyYTM1MGFmZjZlMjMxYTM5ZjlmNTlhYjQ5NzVkYWYzNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJwY2J5bFJtN1FOZm1IRll5WloxRThzNUw0a3ptQ3NkcyJ9	2019-01-02 23:38:31.012863+00
rjcx24n4c8vze9qv0ye52izgddq1rf7q	ZjQxNmM2NjI5YmRhMTdlMmQzODVjMWQ1MGVkM2Q0ZTQxYjkzNGI4Mjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJvWWJaa1hidUNHcHpROGJIczVESWtVUHJFWEpDMGNkNSJ9	2019-01-03 00:49:44.538562+00
xqat3o7fb84nk8lmz53zufkusaq57pua	YmI1Y2MxNmQzMTU0NzE2NzRiY2I3ZGYyMzI2NmQxZmJmNmU4YWE2ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJodFg0WjJ2NzlBUDVvWHE1bkJ2b05NUFdwejFTSlliWSJ9	2019-01-03 01:06:45.345377+00
l25jaqam2zp8ggb5kfy68rm1h7wa1mp0	ZmFkZmMwOGY2MTdiNjk0N2Y2MGQyOGU5NjM2YTQ2MWE0YjAwNjlhOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJXZnRjRW1yRGRSd2F3QVlsQkJFZHZuWVlUMHE3bFU2dCJ9	2019-01-03 01:07:37.257088+00
wcvjjxboade5bh02nwtf2audtph6g16m	MzA1NjdmZmQyZThmZWI0YTM5NGIxNTRiMzY3YTMwNjgwNmYzYjg4MDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJYdmV1Z25vUWd1TVljcTRPV1pvSVlpMTRTaWxrYzljTCJ9	2019-01-03 02:03:47.002866+00
a5w2rick3uukd3p4prz2dr3scteekpq1	YjRkZWZmZjRhZDg4MDIwNWJlNzliNWMwMTBiMWJhYTQwYmY5YjQwNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJjTGtuWmRFR3VRbkc5NXpLd2h3ZnVHOVg5ZUVhZjBoMSJ9	2019-01-03 02:14:29.404457+00
dr959pnpaw9rsm3sz5mm4anp67oeinof	ZTA3NTAxN2FjNTcyNDZkZTVkODFmOTU5NjUzMWZkNjgyODEwNjRhNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJFTGplaWpnNk1pV25pWkxjV0k1ZDQ0eGtwZXZxNHFrbiJ9	2019-01-03 02:44:15.036153+00
iz6q002n2xdz4pbqwpsffyergixunid0	NGJkNDU5NTY0MDQ3Njc1OWJkM2M0ODBkNDFlY2E1ZDY4ZmI1Y2U2YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJQZWRtdXhBaGRUN2VxUnU0R0RpS2pSV3ZuUzhVSVNNZyJ9	2019-01-03 02:55:47.769106+00
k38ojtk9vesutwm7976bxet9fqgzeadw	ZTMyM2VkMTQ3MDg2Y2RiYjgwMTE1ZDllYTlhMGNjNDYzNzk4NjdlMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJHakljSklRa0Y4MEs1QU50TlJJUDR6WXJ1V3V3UGNLViJ9	2019-01-03 04:48:08.809917+00
y6ixlvx41ljtkftgw7wilg3efcwegu1s	NTgxZGY3MmNkNjMxM2FhMzgxOGEwZGIwNDdjODNiNThiZmFmOGQxOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJXNm5raFJvVXNkOUZ4WXJ6bjRMWnZPczJmNlZFdW5NeiJ9	2019-01-03 04:48:09.645529+00
d7mhm8pzai10kwnz8iz81rs42hq8zx24	M2RhNGZhYzczNGVjOTJmOWNkZDk5NWEzMmFhNzY0MDkzN2Q4MTZiZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ3dmlGeEIxTFVmancwd2lpU1pwOWYxR3duUFBXS2dJZiJ9	2019-01-03 05:00:41.239701+00
8kf2gdgbkbh6ycqeta2nlzyhnwozxtyc	ZDdiY2U0YzI0NDg1NDA0NmJmNTU1OTg3MWJjZjZkZGQ3ZWE1ZTFmMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJCeXMwSkZNNXZUaXVLaFhTNDZ5YkNwSGJCNzVHNUtlTCJ9	2019-01-03 05:17:18.829036+00
l1lrc5n33p1glpmlr7ebcrrib6lz34i5	YjAxNzhhNTgyYjVjNjJlNjNjZmI3NDQ4MzU1NjI4MmRmZDllOTZjZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIwQ3BybmhlWHZVZ1AzQUp1S0dDdzA3RW5Ob0lPZFpGWCJ9	2019-01-03 07:54:53.734347+00
2soomant83a0n1i71nuh2tm9egkg1nyp	MjFiMmJlYWNhOTMxNGE0YmQ0OTc4ZjkzOGRiODBiZDc3MjkwOWFiYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJEUDdjcmhNa1dLNGI2MkpHc00yNmdwanVHNEU5azh5cCJ9	2019-01-03 07:55:40.523623+00
ex0nm4olpvoiyax3977imgbg6hr1r8ls	NjA1MTAyM2I4MjQwZTZhMjY3NmE2Y2I0NjkxN2YyN2VkMGMxN2QzNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJGZUNEWUZkVXpNTkl5MG52aEJ0dzJDa3d6cWFXd0RvWSJ9	2019-01-03 08:14:14.552258+00
4beiyo9hubrl9rgo5ic0052hblf2a2p7	OTdhMzhhMzY5OGQ4ZTMyNGQ5ZmEzY2U3MWMwYmJkZTQ4ZDhmODE5NDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJIRUNPRHhXdE9aaHZpd0Rwc1dKTUMwVHdWU2luZ2p4VSJ9	2019-01-03 08:31:46.910202+00
485qw98x23plx70xw7fl0z45uv8dex9s	MjJmZmYwYmVhNGJhMDZlMGI3ZTRiOGQwMzQxM2QxZjAxNTAyMjA0OTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ4aTRXMFZmUXVRSkZYNEhMVFd2YlVtOWI1UDl1NkczQyJ9	2019-01-03 09:27:38.0358+00
gmhbrqg026k53dpp3n9yo9sb0ushbq2b	ZTIwNjRmOGQzMmI4NjUwNWNmOWExZGQ4ZjU4MWUxNTc1MGY5YzlhMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIza1JjWUNyUTQ5alVSdlVoRjdxTVhlT0xsdVd0dmhoeiJ9	2019-01-03 10:05:01.965399+00
blcg7hh88o6jpjl8s93x3wk0d8pw40bx	NTBiYTQ5NWRhZjlhNjViYTA0YmZhZDA3NDgzOTJlMzI3MTYyM2FiNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJmVUlEeVdBbER1VEoxTmVocjRZZVJ5dndTNkg3TGw2VyJ9	2019-01-03 12:14:54.342676+00
okpmroizuizm9073l4nfxiky8w1fmhca	MDJlOGIzYzkwZDY2ZGQ5OWViY2ZmYzcwYTg2Mzg5YjU4OTY3ODdhMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJOanFVVnQzUjBoZ2JRazJZQnFaV0VRcDBpbmk1VnlsRCJ9	2019-01-03 12:50:58.05442+00
m82hnmft1to62j5swgl3h42wbwo0o3cm	NGRkYmM0Yzk4N2EwMmNkM2JiMjlhZDEwYWQ0ZTg4YzRiMmJlZDI0Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJnSHg1ZEpzazlxWDBnTTdLVFI0UU91Z3dFNEpnR253OCJ9	2019-01-03 13:10:57.026254+00
x3r62k64iigyg83cqgc8ck7suul9v68z	N2Y4ZjAxMzc5MTBjYTQ0ZTEyNmNlNWYyYTNmMjgzNWRiOTMzODNiMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJKS29uQVJBellkc2JvT053bkhTbVh2dEUyNmpsSUs3OCJ9	2019-01-03 13:37:05.20715+00
qhjpimmbr2mp6fa4k54ce8r3nx9kik4f	ZjU2YmEzZDM1ODFkYzNmZThjNjdiNzc2ZWFhZjA1ODJjMWM5OTlmZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJxRnpoZDk5MDZsR3ZEWkJic2FmTXJUUnFvV01JM2tWaiJ9	2019-01-03 14:21:04.548741+00
866v8ipx820dbcu92cpxuvw2kaco72q2	ZjNhMjA4ZDYzZWEwYTU2YzYwZmVmNzE3MjM4MThkOWU0Yzc1MGVjOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI3UDBRVkRIYzBEb2RLVXRXbHdZTzllN2FFdU40OUN6QSJ9	2019-01-03 14:57:37.64418+00
59u85flpfzqf085ppmunej6dj0lgrxny	NmM2ZTMzMGQxMjlmN2FhODY2MWIyOWJiYmQ3OWIzZjVjODI0NzUyZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJxaEtGSzliQkNtbkRNY2hWZnFjZjI5dVBuYjA4RTZPRyJ9	2019-01-03 15:10:33.41418+00
8mrdinhgakl9v7uiwgpajqsn8un9gnzh	NDI2NDY2YzE0MDE4ZjUyNTE2ZGNkNGI1YjI4MWUxN2IzMDY4NDgzNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJjdWFUTHpDUkZzU1ltQWY0NGVseG5mUHNZN3p1RFp0eCJ9	2019-01-03 16:11:37.633583+00
gp11x4cr9kh2h3m0vvlud28kiw2a325g	ZTM2ODA0NzdlMTcxZWUxODUyOTVhZWFjOGVkMzBkZWI0NjNhN2YyODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIzVXhYQnI3OWdDN285Z0hIVDNSaU14YnlsbUpNdGxJeiJ9	2019-01-03 16:38:17.695884+00
mzkvya9lhs6gh7u2r2jkg1xudfplvj4m	YTMwNDA5ZTYxNWYzODU2MWMwYjY2NmZkYWRmNjRiZjk1ZWFjMDM2ZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ4ZWlMSnZ0czZ4dmRWT0RwdW0ySURLQ0hMYTl3UVA1NiJ9	2019-01-03 17:18:09.068994+00
criruxg3onsj4y9xwb0l41ugzucu0mou	ZmNlN2M0MjVjNjYzNDM0YjUwY2RhYWQ2ZDhkOGU3Y2JlN2UyZmU5ZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJLUW9PQVIxbmd4UlBJUjNLRW83eVBoMzI3QzV6RERxYSJ9	2019-01-03 18:43:27.82966+00
hxtruzkkr2igl2asi55qbe4t3gshdqo9	MzY2MjE1ZGVhNzdkOWEwMzQzOTZkMDNkMjJiYzUwYmFkMmQ3NGU0Mjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzaE5idHJuTERGUFVoWEJhMkZhTlJiZ2puWEVkbFh2cCJ9	2019-01-03 18:49:03.93155+00
hvirboqxcp5ifiism1ozf1ams71f4ltw	MDhlNDM0NTk3MWY1M2ZlOWE5MjYxZjkyYmRlMTRiMzI2YWIzYzFhZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJreWExUVdmVFRyRE5kUG5KQndIbnhGVnAyUVU2NjhEWSJ9	2019-01-03 19:49:10.611439+00
xvr0b8wyv32nbv5borm17wr7bhdflvkt	MTM4MzhhYzk1M2Y2MjQ0OWNiNmU4NmY4ODVlNWNjY2ZkN2I3YTgxMzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJPY2tsZ3NYU090dEV0dGM0c3ZnSGQ3TDB5STNMSGVuUiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-01-03 19:51:55.339395+00
voc2y3eos2j6zm94o3amdnbzorrv7vfr	ZTRkMGY0ZTQzYTUxNjFkMGMwNmJkZmZjYTY4NmJhNmIwNzU3YzI0NDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJTd2FzelRVenhJbFRZREZRNHR4d3ZTa0V0MU5HcDJaaiJ9	2019-01-03 20:16:32.944706+00
vrralbkwdbngafa81r7fhaem83qc0k24	MTc0MmFkYjZhNDc2YThiNmMwYWZiOTdiMjRhZGY3NGY4Yzg3YTNhNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI3ZTRKMlhON21FZzA5anJNTG83Q3d0YTg4SHZLamtuQyJ9	2019-01-03 23:42:43.115794+00
8zcvebb501is2ewhlxyoqnn92fyst0rq	ZGVmMzYzYjAwYTkzMWI4ZGQxZjM3YzMzNjBlY2Y4Y2YwMGJmYjZiNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJyaTI3MURrZ2FIT0hRcGE1ZU9sU2RGckRsUmRSU2RubyJ9	2019-01-03 23:56:40.44966+00
ittrxuuy0784lag7rxnt42ie98xbujav	M2I1ZmRjODNjYTI0ZTU4YzUwMjE2YTUwM2NmNjI3NjM4ZTJhNmY0Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIzeFhVZENVcVI1ZXcwd3pUb3dORkJvMjdsTURzUjdPTyJ9	2019-01-04 00:15:53.279066+00
1jdrturpgr595od765n6ekca0e8un6b1	NjI4MjZlODFkZjAzZjBmYjQzMTQ4YTljYzJlZGM2YWVhM2E2ZDY2ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI2V2k1TVE4WTJBR0NSelBCbHJOWU1MTzVhQkh3NWZVUSJ9	2019-01-04 00:29:18.7669+00
9e2tz146pii63ibyi1t0t61jdsamorz9	MDM4NGIyMDM3YjU1MzBhMDU2NDE2OWJmNjc5NTkyZTNiMGY3MDY5ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJTNVE5bUZrdTJ2clRTaXlITWlqd0p4M0Q2aWFGWmlkNyJ9	2019-01-04 02:19:06.283691+00
ey7qadlhb7fhdcln9l3ohrryjr9jq456	NThhMzRmZmNlOGI2NGFhZWU5Y2RkNTZiMWQwNDBlMTExYjRhMjU1ZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJOeFYzQ1NQTFBTbTRRRFVVZENNYjZFcHY3SXdEZWpxSCJ9	2019-01-04 02:23:48.966435+00
e8a66mpfdiwldmy6q4ehpt95efy375wo	NmI4N2FmMTYxY2YwMjc2MjI2Y2Y4OTU0MDdlYTNiMzIyNjY3NWZmMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJKRmluTjI0bnV2aTJySXBpQjViVTlKbUV0Sng1d3BtNCJ9	2019-01-04 02:33:18.845421+00
ogdth1jmzert5ifjim7o2nmm5ns1cjr2	ZTQ1YzBiNDJiYWYzYWZkN2RkYzEzYTliZDVmOWM4YjgyOTliNmUzODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ2dFdxUnc2bTlhVGw1OGRRSWNsS0FKMDFZRGxLOXlOMCJ9	2019-01-04 04:30:55.017574+00
sj6dk67j6bhlwfnnhgysowciyre2uejm	ZjgzYzViNjhkOGMxMDMyMDhlM2QxYjQyODhjNTNjYmY2MzQwYTE2NDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ0dWV4RGp3TmZteUQxaEVjbklHRFpPOGhreXY0bTBZViJ9	2019-01-04 04:47:01.830702+00
3oizhxtqmq2rir0jpeo2pn413fusgsl6	ZGRkOGE3NDgyZGY5OGFiYjcwMWZkNjAzY2EzYWQ1MmZkNzA1YjllNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJIOFFoT3ZOSFJZNkpIUE5ITkxQc3Q4dlRoaTdKWE5DZyJ9	2019-01-04 04:57:52.527806+00
bous6r585uw6knbf17w2fab16wx87ia2	OTc0NGM3YmY4NWE4NTdhYzAxOTBmYzYwYTNmMDAzN2U0YjAwY2M2ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJnVzE4ZWV3enNlWWgwQ2xTYTlVQjRQb3AybW5Ycmo1OSJ9	2019-01-04 05:03:59.061346+00
2uuerhio7euhp28xxurr5nw41s0p8lr9	ZjEwNGUwYTRlNWZmZWIyYzU3ZjUwMGY4MjAyNGQzMGJhOWZjYWY4MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJEUXFOSEJ4Sm12dmUyU1hCeXlCdWY2RjRIZWwyeDF2SCJ9	2019-01-04 06:19:04.777913+00
ct4wyu23usq4y8t4h93hmalfmxpclde6	M2VmMzk4YmFjMDU1ZDEwODhlNjQ3YjIwNWVjMzMyYWNmZjYzYWViYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJmTHRiV1cwNFFOMzNqVHJCNmZ2V1ZHS3FaRWtySXM1YSJ9	2019-01-04 08:14:06.532463+00
12kryqinm32kkygvntvx96zjgszne3dd	MTBiMDVmNmUwMDY0YWQ1MDJiODZmNjgxMDM4NTAxMDZjYzI2Y2M1NTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJnNWFCVm1WalhLakp3bmtEd0x6OXFvajFYYkxGUmtzcyJ9	2019-01-04 09:15:36.007056+00
qzha30tom1gaxss646hvbcfh2707w9bi	ZTQ2NjU2YmIwMzdhNDdkMDg4ZDc3Njg2YWE0ZTgyM2M1YTM3MWQxYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJQUWxpVDUwb1dJN2VmQzdZRDVudW10czdYWUhOSThldCJ9	2019-01-04 10:09:57.775323+00
x2h37n837xwybg6z5a9xiz21s0qvfemh	MTVlM2FjOWQ2OWI0OWE4NDM0NGU5OTk0N2IxMDRhMzg4MTAzYTlmNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJybGt0SnZaWll2NTNsUmxnbm10ekpmWm1DdzZYRmF5ZiJ9	2019-01-04 10:12:03.522618+00
3ixwejsaoat36av5ytbhkgq94kmq20tn	ZTFmNGUxOWYxOWYzMDI4ZTA2MTVlMTFlNzc4M2FiMzNiN2NkZTQ3Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJZendSTDZZS3VlQmRGMHdvN3F6akYzWnc5SzJxTnZOTiJ9	2019-01-04 10:42:15.757748+00
db96pzyyv08oyithrnlpqs0yreixmcas	NmM0ZjM2YzgxNzFjZDU4MjQ5MjBjNGE3NGMyNGZlOThiMzVkYzdmZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJVRkhqQkQ5b1Q5eVdXYmRBeDhaQUdKNHRWckVCOW0wOSJ9	2019-01-04 10:46:24.641344+00
leikebv2pvyhs8noo5qppa6kno6idnac	NmJmMGNkMGRlMWI3Y2UyNTJmMzE0MTRhOGQ5Nzg2NmNlM2M5NDhkZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJIUjF3eElkRkR4N3FBV3BZNzVJck96ZExlSXFoYjg0OCJ9	2019-01-04 11:16:10.424287+00
762ssebqmn8dozhm48yqmncvg0thj242	YzAxZjU5ZTJmYjZmZGRjYTAyMWZmMzY3ZjFmNTQ4M2I1ODczYmYwZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJUQmE1a2VMeGhQdFNhMERJTEtualgwa1VwRTRISDZjQSJ9	2019-01-04 12:41:53.588164+00
lmpkwxc0s6up210s045umhhe2ebppvfl	OGQ1MjBmZmUyYTRlYTRhNmZlZDBhYzE4YmVlMDc0M2QzZWYyYjljNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJFRUphNjNyVE5kYmtFc2c0TGZCQ2pqVXFPY1luamFXVyJ9	2019-01-04 14:31:07.514458+00
l4ti7uj7pcemyjz6uqkeden7fjuh63z5	NmY3ZDQ2ZTZjNTJlYzdmY2FlMzE3MTQwYWY5OTA5ZDM3OTZkNzQzYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJBOHVob1F2T1RWMVVNcGw3MHZOY3RpbUZMTUx3VTF2NCJ9	2019-01-04 14:47:45.376728+00
ejv6jo4abehea1g4am5ked62zo7rvv31	NWM2Yjk2NGQyNmU4YTk5OWZiZmMwNTA4MGNjNDhmMDkyM2I5NjUwMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJpOGFFR0JNS3NKRE9VYThXenF1ZGNpVXA5RnFzZml6ZiJ9	2019-01-04 17:09:53.838137+00
f1h2pzm37rzzs7mu7gf2t5zmaum6t0oe	OWI4NDg1YzBiYzdlODViODk0YTQ4NDJlMjgzYTY3YzI2NWNmMGQyODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI0VndIZWdOeU1ESFdYWlBOSHZNeEhNUmNDMzhHSXBzTyJ9	2019-01-04 18:42:21.680712+00
8uyr0jtes3e1a3sd12a0awsrlzlwxxim	MDJlYzg5MWFmODY1NjQxZDQ1Y2NlYTIyOTRhZGYyNDgxMWU3YjM2ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJvUFZ1NlhtdjJxSDFsSklZRnJDMW90TUNhVmpSYUxzcSJ9	2019-01-04 21:29:51.089553+00
cqdwm232a9rpy8i5chdqs04yip5qde37	YzkyOTJkMGU1MTBjMzBjMDlkOTRlYjRiMGFlNmU1YTAyZjdiYTMxMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJSVWZlWXN5SWhjZGxlRDFyR2FoMmFNRXpvVHZFNFNnbiJ9	2019-01-04 22:58:58.361014+00
ezeiu67vdx5jji1c2i97obhkspityf51	YjZiMjE5MTVlMTAxNTE3OGMwNmNmOTZkYTQzOTZjZTkyNmRiNzVkYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJTRzJSVjVOY3pNa2JMUXUyaHFHN3pJQ1ZucXdCYTRVUSJ9	2019-01-04 23:08:06.818717+00
0huaksp2tf1ses3lds01shk47uzukk31	MmUzYmYwYmI3MWEyZmU5NDFhMjA3OThjYzE4Zjc3N2ZmNGU4NTcyNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI4am1LdUx2MFpDRE1haUFhYk9CajBRZ2F2dXFTODhSbSJ9	2019-01-05 01:00:44.625954+00
z8h4eyg2ynyj3nrrjw6bnxjixaf54uot	OWM4N2Q4YjdiZjUxYjQyZjZjN2Y0MGViOTQzNTVjZWE2ODhiMjIyZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ5Y0RUcDcwQkZGTVlaU0pOZlVURkJ0UzZuM1haRkd2NyJ9	2019-01-05 01:00:51.955574+00
33xhgwgua3kef1u9rzj2da7vfz5tjmiw	MWE2ZGJlNGY2MGExMmM1MzI1ZjBkYTQ3N2Q4M2RjYjQ1NmJlY2VkNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ0ZVlHSzFsU2tQZVVjaktaWVF5MXZobHhma1RLWFJaMyJ9	2019-01-05 01:03:08.662736+00
pnvcfz43ygacemmlhjixxliro9op0b72	ZTNlZTU3YzJjN2EwODY1NTg1ZTkwNDIxZTM5OWU1Y2EzNGFiMWFlYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJITTR2c1V5eVNaREZLUmpibWpGTTU0Wlh0WjhVbm1ZaCJ9	2019-01-05 02:03:25.113489+00
4h7i3lstxgtdntc4em5ge75x6suo7ag4	ZDQ3YmY0NzU2NTYzZjRjNGFkNWY2YTExNTcyYzc0NDc0ZDQ0MDQ4ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIxM0k2bWVHMVpBOHJ4eG9JM3ZXU0piU0Nsa3FuSUh1VCJ9	2019-01-05 02:13:43.042259+00
5vzzsf93ljbx0qa3w6jw52zgr0k8yt6m	MDc4YmZhNjhjZDdmMmRjYTQ4NzJmYmRlMTI3YjNkNmExMzZkODUxNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJOZ1p3Rm12Uk16UjdYNzI4SEpJbkFlMUVwejhRZXJHdyJ9	2019-01-05 02:27:17.733339+00
e1zcy0rw7ifj0gjs74vwajd40uvxati5	YWY1M2MzMjE1ODNjMDQ1NTcxNTljYjc0OGY0OGRhZDFhNTEwMWVmNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJYT1YxY3Y1MWMwSjFSTnBnYVFwc1ZBeXFBdFhNd1p4ciJ9	2019-01-05 02:34:18.338445+00
jx97g7s6ye79if1mbgyzk1dflspwsbya	ZDNkMmRkMDI3ZmZjNjJlZjRjMWQwMGZmMjllMzg2MTAwNjkwYzVkNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJhWmRicmNhYlV5SDFFV1dqTVhwUEFqc2ZDSURqWlZqMyJ9	2019-01-05 03:15:04.608803+00
4t1nal6naqujlxi89ox0q6ewbv703o14	OWZlMGFmYTc1ZjUwNTUwYTUzMGM3NDc3ZDdhNjY5NjU0M2YxZmNiMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJpZ2tRVWlyb25jQ056U1F2V2xndVJtUkZ4NFZmU0NXSSJ9	2019-01-05 03:42:53.360805+00
7rfd9a3moj7zyccdsgn466j2f77istaq	YmFlYzFlN2ZmNjE3MzQzN2MwMjQxNGZkOTVkYjY0NzFmYTgxYjNmNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJdzRuRUpKR1FSdHk0V3NoeGpZMTdva0g3OVJXa2NtbCJ9	2019-01-05 03:57:59.618852+00
m64had9dv8mkpb4h78g3y5m2kbgm602y	NjQxMzczMjFkYmFjNzUwZWYwNzRjMWQ4ZDY2ZTFiNmE2M2M5ZjZiNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJlMFJNaGpWdU5xWUJLcGllUHpqd21FS0dxRGVHN1ZPQiJ9	2019-01-05 04:11:47.136634+00
sjznw0urz2idajk5jte1jf60xwzq2zkj	MWU2ZGQ1MzJlM2EwN2Q0M2QxMmJlYjY1ZWFlZTBiMzlhOWRmZTRjMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJnQmZ3VEFVOWs4aUpuY0FqblpUSXU3VlM5WlRoNDJPZCJ9	2019-01-05 05:38:38.220244+00
zwx5c9mcvgcbcyjfzawww4rt1td13y44	ZTY1NjQ4YzNhZjM3NWZiYjgzNDRjNGUwYjQ4M2I4YmVhZGU3Y2U2MDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ1b0dmU3J2Y0ExQUNoSm5RYTdvUTN0N3VEcmgyWjlGNyJ9	2019-01-05 06:15:04.64495+00
xb9d6ki85xzk47g30q93jf84142nkq7t	Mjg0NjVlYzlmYTRiZDhhY2QyMWMxYmQ5M2IzMzY4Mjg3NmYzZDQyZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJYZEdIQ1Q0MEtDRFBHT3RkUWpLcWluM0xnQkh6YVBQbSJ9	2019-01-05 06:38:58.676138+00
mxp3dr3kzwlsa3fahv82o1wuhn280ccg	ZmU2ZmE5OWY4YWMwNjJmOTg3MzIzMjUwNTdlYjhkOTNkNTAzMjQ2ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ5MHdzWE84UVNHSEY4WUJZT1hTVWxnUFYzRTZKTzgzNSJ9	2019-01-05 07:08:26.452658+00
kebc40w8plf3jmjhybmv9u543subzftk	ZGY4ODVhODcwZjk0MDMwZjMxOWQ5YjMxNDdkZDc4NWU4Yjg0ZWRjYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJSnBXbENEOG02ZWVzdnFqOHdQY1I4Y3N1ZDg4ZFExdCJ9	2019-01-05 07:33:42.511507+00
26xvh2eer8chobrs5a7x7m44mxnhvhqm	MmVmODBlYzViN2MxN2ZjMmZlYmRiYmE2NTI2OWY3ZWM2ZWNmNjJmNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJlZ3RQek9rNWRqckVVTW56dEk1SlBydktJelJjYUM1NyJ9	2019-01-05 07:46:10.466498+00
sua134p53384tu6uqs5b1ehjjzn37tsa	ZTcwYjY0YzFhNjVjMjZiMmJhNDY4OGNmZDcwNGE0YTIxOGExMjhiMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJlSmRURWV5U1ZCTEFLdThZYVFrVWNIeHV2WEt2dlVRWSJ9	2019-01-05 08:29:50.707072+00
g5wcsshfij172ml6upg1vtb3v1vsmp0k	MjVmMDI1MTQxY2UwZDFkZjQ1MGFmN2NjYTdmMTAwZWEwYjAzODdkMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJrd1J5c2t6bDEybUhTV21tUHJJY3ZWNU1CREtRSm96RyJ9	2019-01-05 08:50:59.262071+00
h3q4t88sdwnquyrugduv5nqgy4zmc5iy	ZTc5YjYzZWQ3MjU2NzFjNDYyMzc5ZTA1NDUzODhmNjk0MGQ3ZWQzZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJrVDFRVGRzemZ4YzlBZ0lLc0E1azh3U1l3THBYclc4cSJ9	2019-01-05 11:48:04.042011+00
5rbd7xxj20t6kjbop4zr2rb66zankcul	Y2QzODdmYTJlNmI4ZTczNWUyNTZiMDBlYjRhOTBlN2Q4Mzg5NDRiZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJIWVdJZml5ZVdFdGlXdUozdlZyQ05XMkE0cEREOWEzUyJ9	2019-01-05 12:59:21.625175+00
8h37u2avxewqv3pgd0d0vjjlf13usz7y	ZmFkOTM0ZWZlMjUwZDYwN2MwZDk2ZjE3ZDIzNzk1YzFhODA2ZTRkNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJrejdWSTlEeGtvcnR0Zkt3dkhsN3Fvd0FFYjVhcHBTayJ9	2019-01-05 15:06:16.120762+00
y96h6tqd274gqcluq51i7q90zlkezqj7	ZTE5MWQ1Yjg3MzE3Zjk1MjcxNTI0ZDUxMTQzNjhmYjYyYzYwMmEzZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJyeTRrbWFSdjNQamNadmpBTENCMHZWeTM0NzhROEgyQiJ9	2019-01-05 15:09:52.212945+00
ubt6v4axk5aiuikecpzdy0xizs9lp1fb	MzA5NzQ1MWFjYWE4MzY4NmY1ZGQ2ODcyYjJjZGNkODc0OTg0NzY5MDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI4a1lEblRDZDJhaGFTZFNVRnBwamVFOWxLMkU2bFJqVyJ9	2019-01-05 19:12:31.006414+00
0tj28vresi9wg7sw424v6fqdeb8tpts3	MDcxOGU1NzVkMjg0ZDczYWMyNTAyMDY1MDY0MTY3YTY4YzA2MjQxZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJSbVcweUU1UERkVjNkYkIyY3NMWW5CZWZSdktrSGhHZSJ9	2019-01-05 20:42:32.748768+00
cazcjeyeenatyi9kk9a1ofmybvdft6f1	MTNjYjY4YTI5MTM0NDA5OTRjMjg0ZGY0OWM0ZWUzNmRkNGE5MzEyNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ3bFZQTW51VVJBdzRZdTlwMktkTENzYndhV3FuWWx0aiJ9	2019-01-05 21:12:25.756376+00
myt5sooiz1sku5kyrtfsx7jdjwuk9bbe	OGRhOGVjZGQ5OGVlNDc2NWMyMGMyOTRiODA3OWFiZTExYmU5NjViMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzQzk1Yk1lWldHN3R4Vm14dEVrbDlWNVljUGlMd3lOTCJ9	2019-01-05 21:13:52.776045+00
fjsmluvjb3irzr6xqq5gc8og8lijkzqr	ODgzZWVhNDQ5MGUyNWY1Y2FhMTZmNDBmMzZmZjliNDc3ZjliNThhMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJydDZwQ2t2cTIxQlNqWUM4a0lGSnBDTjFoNU9ERm1RcyJ9	2019-01-05 21:20:57.726008+00
9aigbmzax4df4uvqkt6v7qodnb3up4pv	MDFlMDVjMDQ5M2NhYTQwNjQ1NjdiM2Q2OTkzMmVjZTU2YWQyMWZkNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ2bEFGN1hvalVYdWVwSGk3WUl1RTFkU1FrS0JUMFVpeSJ9	2019-01-05 21:32:10.761523+00
zr5oe37ko3lwkhh8v3zut3h9gkbfu1t0	YzVkYTM5MTgxYTg3ODgyOTliYTAzNDgzYTk5NjQxYTI3ZjAyODMxNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJIdUhLdjBOdmRVbVRBanRzMG1nMlYxM1Q2SHdGSzNwNCJ9	2019-01-06 01:53:35.040174+00
lseb1d8d5ajr3216kzywk2rjb84wumrd	MzJjYTJiNzA2NDY4MmRiMmJmN2FjZmNiNjUwY2NhMzU1ODRhZmI1Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ1dmpFYTJLZTRaT1hPWkMyTmg2bERsbnVjNmxQSHJSUSJ9	2019-01-06 01:54:44.506587+00
4jegx6qvttz74mzashevrox2k2d7dcwu	NzM1YzRiMzVkODUzZjI2N2Y1NzQ2OWNjNGM2MmM1YmQ0ZDU2YmZjNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJZYlVZeE5TYXg3MHhhb2NzZHkwZXJ1U2hHVmoxSlBGYSJ9	2019-01-06 04:28:18.310105+00
7nsjuheqeydpe5l7j57t03qnogg7yqb7	MWU2MjY5YmMxYTJjOTk2NWExMDZkNmJjNTFiMzExZDg1MWM2NDQxYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJIa0tXU2N4S283M3lIODQ2V0NidEVvQjRpSWNIenoxZSJ9	2019-01-06 04:57:05.845367+00
0lx6qbg5cr2uthtzzrnh59kfv2maakjz	OTFiNDc3NGIyM2M4OThjZTZkM2RkYjY4NzU4MWI1NmU1MGQxNzgwYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI4bFZsdm1qdU96OXJRSmJMSWZGMkJ5amdEbW03a0ZuMCJ9	2019-01-06 07:17:38.728857+00
073up66321rbxhi42ffes99j0q95i9yk	YTkxZjYxMDQ4NTNjZTNiYmI5YTgxZTNmNzYwY2UwY2Q1MTdlNjhlYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJBUmJwaEdWWFBLbTFxaVFxaFVDU25CV1N1aDhlVnRXbiJ9	2019-01-06 07:33:12.309349+00
38asragzwnvbkihdq3h9zbhj9bid0h17	MmMzY2VjY2IxZjUyNjBjNzZmMzdiZTVmZjJlNWY3NjEyNTBiNTc4YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJudlJhTjBQZ2pZZ2JRSlBvdWNocTZzbFAyNnJ4cFVHaSJ9	2019-01-06 07:51:43.665584+00
2fir5ywobliicyl3fyukdcndd0fhj5zp	NmNjZGRiYjI4MGExOGM4YTU1ZDI3YTgxMGQ5MzI1ZGYzYWY1YmQ2Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJXYUZVVmxRamtaMEpkNVV1RGF5bW9EeklYSG44Q1RDaSJ9	2019-01-06 09:54:14.362188+00
b2o4g44t9aelj5vi9h8zo72wtm6nr628	YWYxOWM2NDE0MWQ4M2U4MjY1OGI4Yzk0Y2U4YTM3YjQ2ZTc3MWQwOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJBN2tsVkdFa1FvaDdOZ0Fsb0VYbTBEd2tqNDRZRDlINCJ9	2019-01-06 10:00:11.041579+00
rqk3i1xhht8ahuognw3p5ljb5cybg2ko	OGQ4OTI0MWE2ZTYzOWM2Zjk3ODgyZTVmM2UzMjM3MjFjMmI2NTEzODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJuVHFVMThaVVFYV3JRNkJORkVzTWF0Qk1KeGNZTXBnUyJ9	2019-01-06 10:07:34.600943+00
kzongxzunyvvdngf5eqil98u89gnmmqs	YjA5NDFhMWRhMzliZjVkYzhmOTAxODgzMzA1MDNmYmZmYzFhMzkwNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJoOVhyQzRZNVRlRkxPa3Bic0RNTW1sc1F6SUxrTXkxWSJ9	2019-01-06 11:15:50.371689+00
vk4isyq5ldxpmqhujwdfm8830x1r4b3d	NDQ5YjE4ODBiNDRmMjQyZDFjN2JjZGZmZjg4OWJkYjllODkzODQyZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJMRDVITXFKUFhQcGRMWGw3N1N4aU9MdHNoWGk4RjNscyJ9	2019-01-06 11:27:49.98366+00
0drz188fm4zqrr2r6opy61u4u9tfaoyw	MzRjNzkwYTZmODkzOWM0ZTAzNGU5Yzg0Yjk4ZjE1NTI4NjExNTU0Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJpYjJlWjR1ZmVZbkpETm9JcDA1b0lKYzI4MkxyOFJYRCJ9	2019-01-06 11:48:35.053449+00
5d60oq877katzbuujrifxjvs8rr90h7m	NWM1OTlkYmE2NTdlMjkzNWZlNTRjOTIyMGRjNmI4YWM2MjhlZDgyOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI4Vk5aa3NXUW5hUkdabGVZTGVONHVaWlQ2bWtDVE82bSJ9	2019-01-06 12:28:15.897339+00
jguzceyynboyocwienngwl844rlb6yd9	ZjhmZTQ4NjMwNWM5MWFjNzJlODUxNzdiMzYxNzc1YzVhZGRmZjAxYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJWSDk0NVE3WXZ5N2N1OGNHdjF1enIyNnlpcXhtQ0M3eSJ9	2019-01-06 13:22:17.544504+00
nwzj6m1g6fge1r8xbhiem1v934o1niw0	MzdlOTMzZmJiOWRkM2QzODdiYTExZWNjMjIzNTUwYzUzN2EyM2UxNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJxTXNBUkFCbE0ydmRTR0JoV09US2tPdTRnUDhTSmFFYiJ9	2019-01-06 14:32:15.667219+00
td9ah6av6o0y0hp6qeask1b5d0i2hbi0	MTQzYmE1ZWJkYjRiOGZjNjAyZmFmOTZlMGQ4ZWRlOTQxOTRiM2M0ZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJIWlZyTTI0VHJTUHFJT2Q2TVVVR2tKNmNxa0V0WXVOciJ9	2019-01-06 16:03:27.554663+00
mnx03pzx83z6r7xe29tdhed4864fab5p	NTNjZTg0NDQ1NTk5YjMxOGI4YmUzZDI1MTJjN2U3YjQxZjdlZGQ5OTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ0Z0FTNlZmRGhvekJXQlNmOTI5SGpxc0JkVnU4eU1lbCJ9	2019-01-06 16:07:03.762014+00
xvs031xcf347rpdprjv5clmahk72u93p	YTI2NmFkYTBhNDU4YzlmNzgyMjUzZmI2YWUxNTE4MzcyMmJjODI2Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJEcGdQNDlzek1hOHZMYlMzQTZXUVM2Vk1MbXQzOWJzbyJ9	2019-01-06 16:30:42.943635+00
w2ks830vzcm281joit8q79r8l2ehmrtp	NzlmMjc2ZDQ3MDFhYjAzY2ZhMDExZDI5MTFmZTJiOGYyZmMxM2I5Njp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI2eFZsdHg1RERicFF4T2k3T3QydHlmcUgxOWhMNUk1YyJ9	2019-01-06 16:30:42.944735+00
5f036xyq9yduqdkx3t9jookdq6hak1od	MjMxYzdmZGFlZWJlYTc5ZTBiYjAxNDNjNTAzNGY0NDVmMWZiMjU2OTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJiMEtNOTNRNGlQYlplU1Bpenl6bnhDeTc5SWxuRmhuVyJ9	2019-01-06 18:55:02.13138+00
yii4xxsfu98r8n202q2qnq82ggy31w87	MDdhMThiYjU4YzU3YWM2MTdkMWYwYTdiOGIyNDJkYjYxM2E4N2Q3Mzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJLaXhNZFJhV3JXRGdRc0RCM0NUNkNwQkh0T2c2ekxzSyJ9	2019-01-06 18:56:36.084451+00
fc6wovdydpwuvi5nbxz8az7mp1wkab7r	YTAwYjRmMTBkNDhmOTQxMGNiMmI4MDA3ZDVkOWNiNjc0NTc2MmZlYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI3ejg2bGs0c1FHVGlNYThkdVRuODZ4WUsyeWptY3RyaiJ9	2019-01-06 19:10:41.805888+00
obdj16ja9r5rla2qbtdgv4ocsrloivdm	Y2MxY2E2YTZjOTkyNTAyZGY5OTYwOGU1NmZlZDQxM2FhYWJiZjU5Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI2RVNndUNkbHV4dmFmYmplVEdBU1hoR1hMblVvSUNuciJ9	2019-01-06 20:42:00.776542+00
2qoq3fwp0yt6p86eqn6vg4du7xk2edoj	NTgxZGQ5ZWRjZTY2N2M2OTJkMGQ4Njk4MDY4YTM1OGNhYjI2MTg1Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJLUUpsdms4M0J4THZWMjdreXVaTXkwYkZzUXZ0YWpmYiJ9	2019-01-06 20:49:17.811111+00
jb0655r4kct06jqoy36rmz6ougvxvtgq	YmQ4MjRiYmEyYzc1YmVkZWQyNjhhMGNlMDE5MzQyYzU5ZDYzNDU0Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJXZUdndk9QdjhIa0NTcEl2TEZOemJHbGxEZ2V0OElqNiJ9	2019-01-06 21:15:48.934196+00
r8ca17yujc8epam3rsjfh4q49owfueah	ODU5YmEyODNjYjQ3N2YyMDliOGE1N2UwYTc1NjhlNThkNTIwNjFmOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJIa29FWlg0WTRyb0Z1bkZmT3VlSktOYngzZ3RtQnQzNSJ9	2019-01-06 21:34:42.672444+00
pvatvsf1b8bn89bwr09umrkyu8peucyv	MmMzNGRmZDdkYjQ5YzRmMzhmMDRkNzg2Zjg1MjNhODE4NDg1NTEzYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ2bnFrMlNnM1F2VnpzZldXRjNsODJQSDV6czR2R2RvZiJ9	2019-01-06 21:34:47.225281+00
9aa45exep46jwtm8fdmdf7df41ejt5tf	MTc4YWZlYTYyMDkxZjVjZDc2MmE4NDJkYTM2N2JiZDc1MjBiOTM0NTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ3Q0hHY0FPQTJTa0R0QWpncEhUSDZLSjVLcHpTSTg0VSJ9	2019-01-06 22:21:37.628194+00
ivy719q46kyz1rap8gxavpdow6ozmhmk	NjZkMDJmYzg2NjhiZDI2ZDU3NDVlNzRhYTdkN2VjMTJkZTZkZTg3Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJySTRBME9GOGFkREJNVHZrR2VGeGFFdnViZlBVaWpRRSJ9	2019-01-06 22:27:12.722433+00
xj79hc2tyropmtbp5vmgvzvml4pmr59j	YTFiNTc3Njk5MmQ3NmRjMDRhOGY1NjM3MjY0M2I0ZmVlMDZhNGY5ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJSTDhXSUxkUnZJS1Z3NXJ5TXBRVGE2MTJyQTkyaVZqOSJ9	2019-01-07 00:17:29.125284+00
n58u3ia8n4h30n9ncs3ji307qdhg43f6	ZDViNTQ3MzNmOTQzYzk5Mzc1NDI5NGI1OWM0OWMzZTM3ZTZkOWU2Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJTNVZJc0NsUTZ5YTA5UFdvckNnQ0hLZVhYR3I5UnhyQyJ9	2019-01-07 00:17:32.266242+00
afp01rtbk5af03khoijkw5ml4kuowbck	MzhlNjE5MjZmNDY1OTg3MmZlYzRhY2M4ZjYxYTExNmJmOTQ5YjA4NDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJpNUVERU1nMmxRNnJMRDM0OEVJZWdBbDllZmxjenBzUyJ9	2019-01-07 00:17:33.991968+00
yldbc558axbwocdqogeg1g9z6hmz54tk	YTU0NDBjOGJkNzM2MmU1YTkxOWI2MzkzYzY5YWE1MTcyYjBmMjE0ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJlVzJjeHFLR09yUUFhRFVaRGpMU2VheXhxSUlsVE1rUCJ9	2019-01-07 02:04:42.11976+00
zsv6e7uyddlkymjerqguqromshzzoj6d	YmZjM2UzNDE3ZTM2Mzk1OTUwODBjNDY4NDAwMTc3Y2JkOTQyYTA2ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJRdEhrdXdySHFnazR2SU5hMkphNkc3V2FpdVlPalJBeSJ9	2019-01-07 02:17:25.595373+00
d8j860a7rf9k8eeectyn27bbxq59ejy5	OTI2Yzk4NWNjZTVkM2U1MWRmMTkwOGQ1YjUyOTY4MTljOTg2YzEzOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJS0xXWHhtYmplQnI4SE8zZEQ5NHN6dWFzdWlXR2N5cSJ9	2019-01-07 04:09:12.815363+00
k5y9tdmsrcy6o3qectrtwx029bew3wda	ZWU3Mzc0Y2YzYThkOGJmOTllMjM1MDdkMzBhYzVlYTM2NDdkZGFmZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI2QXJCbjRyTEVaWUVkVWJWdEREMkZsRnRVQXpGSmRNYSJ9	2019-01-07 05:00:50.494987+00
ushzl9qmvsrwit7v2u82l1aygiyhlrsa	YzY4ZjBlZWRkNDMyNzE4YzRjYmUzZTI0MGI5Njc5NjA3MTE3ZTA4ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIwdEJacThBT21IdWhMVzdDb2dqUEpYdGpJejlMYnVNSCJ9	2019-01-07 06:57:49.721769+00
1vtw2ayn1gr0bf6ibd2tltyiq440munm	MTJiZTM3MzgzZjRmZmRkMTZjZDQwMWUxMWJhOTM0YjJjNjk5YjRlOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJnYWJwUUoxSFNWeHJVZ2RVV01od3VDYmcxcG12aVpmYiJ9	2019-01-07 10:21:52.875646+00
qz10iex6zwlgz8zyt0bwdthc1genshvz	YTk3OTIyYTZiNDFlNWZmYTY3YTgxOWI2YzBjYzgyNzBmMzQyMmJmYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJCMmw1WVpNbm9zSk10NUhQVmpRS1U1WVFaejh2b3hHbSJ9	2019-01-07 11:02:34.367451+00
19ptm58otctvnebxps7ojwne7inoeqcx	ODVmMWU3MTIyMTYzZGFkYjQ2Y2Q5MGY2M2ZkY2I0ZmY5YTk3ZWZjYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ5THd6U09sVTB4c2IyczVhUkhwVzZoRk55ZVduUU1tWSJ9	2019-01-07 13:33:05.173891+00
i2o5eb2uhseaj17v4k2a3bc4fz9q7fqm	NGQ4Y2Y0YzQxZjMyMTBkYmNmMDYyODRjZTNlYTRlNTllNDU3ODM2YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJXOVk4Y3QyeUg4dEhOMUxueXJpV29IYnZ3OVlNcTN5MyJ9	2019-01-07 14:47:23.905257+00
x4y7jpqweqdaaro2hlctg6dqwnb8glje	NTc5Y2VhNGM2ZDU4ZmY0Mjc2OWNhNzUzZTczM2Q3YWVjYzllODFlNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI1TENGakkyUEhaUTRmMFlpeVh3eTFuSUlsWkljVVVXdyJ9	2019-01-07 14:47:25.038652+00
o437jsw0ltn24m5073vgj0d6c8d5iimg	NDVlYjFhYTUwYmU5MjFhZTRhNzgyODE0MjA4NjQ4ZmJjN2MwYjFkZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJxS05oTE12N0JXVWJaTTlidFhsaENheEFrWnZkZEdlSSJ9	2019-01-07 15:16:08.251842+00
r8q28cccjzchuem25kkwam30eshcdc7p	NWM5NTYxNGQzNjA3ZjA3ZDI4MTNiNjJlMjAwZGQwMWY5NWE3YmE2Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJoa1dtVWF5MUpuVkNmd29pTkdzUWJLS0VXTWZBdWw4SCJ9	2019-01-07 15:52:05.463103+00
0vqq51c1dsgloh8x1zt8xvcaegbffwmo	ZmRhMjIzOWIwYWZjZTM1ZjJiZjI5NGI2ZjlhN2E3ZGEwMzlhYzlkMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJaVGV6SmNrV3Z0ZUdER2ZwcnFyREZDblNrSXp5a1BkbSJ9	2019-01-07 17:31:35.913758+00
ev2dl7cp64xsjfvyrmjstd1da1l6w8rw	MmFiMDI4ZDdlODEyODE3YTIxMzI3ZmZlOTNjMjk1ZjVkYTc5N2Q2NDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI2N0ZDQXBSNU5ueDRZdEZjZU82WWE3bm1ucXFvRGNUOCJ9	2019-01-07 17:36:28.392632+00
1jz1exwm22px13nap8s4hkyhrofqevfk	MTE2MTc2M2ZlYjNjZDA1N2Q5N2FmZDM5NmVhZTIxNDY2OTViOTg3MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIwWUdXWkNHSTh0RXZuemdsZmlTcWdLVlptWHpWYVdkMiJ9	2019-01-07 19:25:09.092844+00
txszbmj29o5byo9e8hch9klzqxew3dxg	ODZhYmMzNmY2ZTZjMjc2YWEwN2EwMDNlNWRkNjdkNDBlNGY0ZjJiYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJIc0h5QU1BMW1LNUtKazZPT3RVRkZsSVFjWHUzV3ZEVSJ9	2019-01-07 21:12:53.802575+00
yp53skczx9dnsj9sqtg9ehfvmas86i3t	YWViYmRkMDA5N2I1MGNmYzNmZDQyM2ZjZTNmNjE4ZTI4YzE0YTVlNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJaM3lSc2s3dzZhUVpoMFBYSVpVTzRFTGZZZjRyWmI5dCJ9	2019-01-07 21:22:16.545988+00
fx08zisiu5gthkh6tq7sbg7q8ydyf3e1	YjlmMGY0MzMxNzliYzEzY2E3ZDIyNmJmNDNlMmVjN2NkOWMzNDRmMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJaa1o5YzB3cDZEVU94S0NQNlc0MXBVZElaZXBTTHc4bSJ9	2019-01-07 22:05:49.180141+00
5wg528p544weq2w6h8czcqw44s2jkq7d	NGFlOWUwZDlkZTBjODA4MDZmMDA1MDRmMDBkNzcwMWUzNDU1YzVmMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJYSXlWb2xmeGN2SmoyUlNDempHVnUwZ0hHbWh5NkpsUCJ9	2019-01-07 22:06:42.722733+00
e6cwyyznpqhzy28uwtsx9vexe7c6uljh	Y2I5MWU4MTMxYTk1NWMyZWVlNTE1MzViZTYyOWZmNTBlNzYyYjllYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJGYVN5SjVJdUkzam55aExMNGEySmxvSXVTckpLZjF1OCJ9	2019-01-08 01:13:23.026538+00
wse2v7j5lxsr8v95m4gxyjzzh09riun9	YzlkMmE5YjI2NzRhNGI2Yzg5N2RmMTU4MGZlZDdiMDJlMDAxMjZhZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJVUE9TUUsyenNWa1BCOXVVVkNxY1l5VVZ6RTQ5TDVxRyJ9	2019-01-08 01:30:14.008099+00
36k98w2a7ehon6cr4iswyq33r9crmf8w	MmY3MTRmYTRlOWI1NTk1YjRlZjdhZTI3MDA0M2UxNGFmMjliNmU5NTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJwelAyNXl0c0VHRnVNbXJ1Q3ZmYmNIS2hncW9aYnN1WCJ9	2019-01-08 01:42:13.461105+00
dmlo0szey1kmeliav1jjp8fnrr8a13dq	YTc4NTI4MTQ5M2E2Yzg5NWI3ODlmNDY4NTkxNjUwZTVhMWM0MzFkZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJCdVRxTzV5cXZwZjhVZm16TDg1cjdhN1JHNzBYUEs2aCJ9	2019-01-08 01:46:56.113963+00
mr986gvqdz76nam0sztumc87gbp8k9wz	MWNmMTdiZWZmMDI4ZmI1ZjAwNGJlNmRkMmQ4MWYwN2ZjYTQ0MzA2OTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI0NzBlT2pqYWhwcUV1SU9yTGhSbjBwMUtDaUdFS0RyTyJ9	2019-01-08 02:03:22.884576+00
x2j1k94u0vwcbreelpb1pajdh8fns9zs	NDQ1YzIwYmIxYWU4MTY1MDE3NDRmZWQ5NmE1MzFiYWFiNDgzN2M5ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJEbHJnWFc2Zjl6QlZ6YW1heE9tRTlFZzI1cGNlZUJVQSJ9	2019-01-08 03:15:05.774668+00
xbfelcnwbwrwbpz2qzzgc9yr3c6xyrr6	YmVmZDEwNmUyNDJhODc5ZmU1MmRjMDhhMWEyYmM5YzAyYWEyYzEzOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJpU3BSQ0RlcEdVRk9HY0ZlSEFsc1o1a1pBNHVnMWsxNSJ9	2019-01-08 03:45:04.013963+00
0edz9so156dbkrcd72y29ejoaik4sx1h	ZTc2YWZhN2FkYTBjMDNjYWM3YmY0YmYyMmUwZDYyMzE5MjlhMWVlNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJza1RXYXE4aUdCVklTTTIxODd1NGE0ZGFMQm9OdzZOcSJ9	2019-01-08 03:53:48.333406+00
uaxxp5kuljfrffqouirlymq74wpjfe3v	OWYzZjI2ZTQyYTdkNmZlODUyOWQ0YjFmNTAyMGUxMmE4NjQyNDg4Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJHNWFlamRQd1BRMjZqNjZkdUs1SVVOd2JVdjh6RjExViJ9	2019-01-08 04:10:23.975193+00
8uoupjl92lhy6fo2m09y5wd7s4d0halh	YWRhNzkyNGNiYmYzOGI0ZmIwZmY5OTM3Yjc0MmExN2RkMWM0MzI5Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJwM2hFMjZMUjhWMWhYdTJ1NVVSVmg5UDhnWGxNMjVqQiJ9	2019-01-08 04:51:44.383614+00
eaxo1g307p2afngnis71mj8uckhajaej	MjAwZDgzMTFhYzk5ZTVhNjcwZmNkMmQxMDIxYzNiNTBjY2EzNTk1Njp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJEVlg2NjMzNXZudU55d2JvVXZqM2dLOGE5ZnpFTFpLYyJ9	2019-01-08 06:09:37.137947+00
aaoc99ykwk7i9us1nerfxdb3oa57424l	Nzg2YWUzYWQxZjUxMzY2Y2U2MjZjMDJjOTM3ZTBmYzQwYWE3MzFmNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJvblFVMWxjOHlCRHVUdDBrQUdGbTNyUVJsNXVOMWdwayJ9	2019-01-08 06:29:40.013106+00
ipxfyzupzin3q772emhwzl06vsn2jp1w	MWY2ZjcyOGVlOTI5MDU2YTg1NTAyMjNkYmU4ODkyMmM1MjAwYTg2Mzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJQVUlpWGZkY0hpMFd6Y21HczlUdVptMURFa3JNdUdCaiJ9	2019-01-08 07:59:09.291093+00
dd6lpxtav38nmyvd48cf0mrpulpop9lf	YTBhNzNkOTA3ZjVhZTU5ZmJiMWMzZTkyYjkwMzNiNGZlNjUwYjM4MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzNm1MT3FXcldEWlpZZklMV1hMbWc2YVlJRVo5MlBHeCJ9	2019-01-08 08:27:30.913861+00
yooaxzele0sesuw65xmuvx8blsc5qmaj	ODgzMzlkYWIyYjkyMzI5NGRiMTI2YmZjM2I0MmU1MTk4NjMwNjlhNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJpaFJERGNOTGxTRGhOYkRhdklwTWN4STlEWUtMTW02ZiJ9	2019-01-08 09:14:09.590487+00
dddat8c5kqq9adw2ptbvsl1jrhpfm3b7	MmZmMTc5NTY3NjdmN2IwNzM4MGIxMDY0ZGQ2OTFkNmJhODk3NjQ4NDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJhMHdHbEdLUnlRWTE1anRLYzNVdm1SWkdobkg0OERaeSJ9	2019-01-08 09:17:53.127888+00
8ukirjlnacc3vzl75z781nfujdz4b4ft	N2FiNzc0OGNhMTA2MjllMDc5MGRhYzk2YTFhMmM1NmEyODBkYTM2MDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJCV2RPRG5hc0x4azAwM01jS3FoVGRPc0xORWtmbjBvQiJ9	2019-01-08 09:53:00.372935+00
rw462kommlewgknd50p3tf9eyb15twmn	OWJiZDdjM2MwMmNhNmUxZjgwYjYwZjU4NTkyZDY0Mzk5MDlkYzUwZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJEMEVieFhCOUNCZ290UUNYUVFqR1dMbG9Idm85VzlBbCJ9	2019-01-08 10:22:13.770147+00
ukydjalhxc76s72khj5ddg2i4h8ynazk	OTY2YzJkM2JkMjBiM2ZjNzcyMzk4MzJiOTUxMjEwNDRiY2JiZWVlNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJQ1ozb1VXdjRNY1ZSb2ZpdUhoMWhQMXltRTJ3bGU0ZCJ9	2019-01-08 11:57:57.394851+00
37hogdx99wcqpymj7ctrfbjpxia0r4g3	ZThjOTJlYWY3MjhkODlkYjU2YzQ5NzJhOWM5N2ZkZDMwMjMwZjdlMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJUWkZnbklFUmdlMFJtUXhic2RDdmRNOXEwWHhmRGswTiJ9	2019-01-08 12:14:58.353657+00
p7vmkyw42kzibzi66z3wsitjfayym3ry	NGJmOTQxNTExOGU5MjlmMmMyNDliMjM3MzE3Y2Q0NjA0MDdjOThlYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ2REFPanljNEtkb0JqVGtGZGxpZjZudkRBUWxuZDFURyJ9	2019-01-08 13:57:11.414183+00
yp778fk0nf0tg35lh37dlir3pui4vygz	MDlkOWI1YWVjYmZjNzE2NzQyNjgzMmRmYTk1NzkzN2I0ZWQ2NDg0Njp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ0R1EzMWRtd2REQjdoS3RSTFhXVE1JZVhzOHdTUWhXOSJ9	2019-01-08 14:23:39.843984+00
z8cudc07ggh28aquins96fq143dtxxdj	OGVjZjc1YTdiOWY0NGE5M2E3NWUzOTk4M2ZjZTQyY2VhNTZiMTkyNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJVOHIxYnhqY3g4MEpJa3lNbnFkMUxGaUZEbjBaYXlKcyJ9	2019-01-08 16:54:10.414339+00
dd2ek209ie8na5hupxhzh8vfe9mcmxps	ODdlMTAxMTM4MTZlNGY3NmIwNmZhNDMxNjAxZmJjMzE1NDJjZWY2ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJTNUxONnVvRDdHdWdENGlqQTFQV3puc2VjbmhzbmNIeiJ9	2019-01-08 17:29:02.948961+00
6b13q8etdsxqgsep6srz1mcwra22xwis	ODZiODBhZDcwNTkzYjM5N2M2OTBlOGZiMDRkNzRiZTk1YTE5NTgyYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJMb216bHQ1SjRaajNyYllRc0RiWVZScVVvUUFUNmNneSJ9	2019-01-08 17:30:22.319715+00
7so6i0gck8lyrnieo1hj5iqyx5wcnqtg	MzgzMGM2ZTZiODFhYjA5MmE5NjgyYTA5YzQ5YTZkYzVmNTA5NTdiMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJuSEJyVU56YkpMUXpSclZINXcyOHpHSkhKY1dtYkY4QiJ9	2019-01-08 17:30:40.739875+00
o01ee3lj0gk7z6wugod9fbt2xtva7ekz	NTdiNmIzYWI4NWMyNzM5ZGZiN2VkZWZjOGY2N2EyOWMyMTgyNDc4YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI1MjVTTHdQdWl0eVdiNlNJT3lWUEppcUh0aHVvSDFoVyJ9	2019-01-08 18:27:09.730572+00
q4pmpd584e6ekoqkntqcmj15ebztqc9z	M2NhNTljNzFjMGRlNmNiZjFiZTY4NTE1ZTU2MGUzZTBlMDlkMzEwODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJKUG95NXZZdGxXekZkem4wV3NIR3dQd3ZhYUluRzQ4WCJ9	2019-01-08 23:16:58.777249+00
hcns2y11lcd3ov1dcyqsmljtp3kv74hr	ZjFkZDNmNjRjNGFmZDlkOGNjN2ZjYzMyZjc3ZDExNWZhNWJhOTY3ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJZM1VpMm1MWUtDWnZUM0NJYlgySmhLekg5WnB2aHNuaSJ9	2019-01-09 02:26:16.711954+00
eiu8ltzmkxre9lb6fl72bbt7v4hzq665	NjkxMjFiNWQyYzJhODcyZjY2ODJjNjFmNjI5OGFjMGRmMTcwZTBiZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIzbHljY2xNZFhqbmFDdW1xV1d1WWpPc2FjTnloYk1LciJ9	2019-01-09 02:26:24.38622+00
pda2d80so3jey3tj9bpu1533mo4atxkl	MjMwNDU0ZTQwNWQwOWFkY2E5ZGI3NGQyNWE1M2FmZmI0ZjYzMWVmODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIzTFJNRXpzY1dOS016djNFbmRwTDlYV296TnZlcTlVZCJ9	2019-01-09 03:48:17.046829+00
g44yrh3lnn1ia8emconuwaqjx9zzh248	Y2VkMWQ4YWNkOGMwNjk4YmYyMzM4ZDcwNTBhYzY1ZDc3NzNiZTdlYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJlZmJIUktMT1JVOHJxelZMT0I2MGVWZ2RNWkliOUdwWiJ9	2019-01-09 03:59:34.676894+00
3odl07r276eanyvkem6iuepwl21r4g9p	YTcwZmE1OWQ3ZTIyMzE0M2RmNzlkYmY5MDRiYmQ5YTZjNjRhYzQxNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ1a2t6WjY3WmdQVENPNHdJN1VNeXdpSFJNMERPcXRZNiJ9	2019-01-09 04:48:32.704881+00
m2ckeyw1gpfnjgfm78reqm1jbtmtm310	NmI4ZGZlMWFhYzA2ZTg1NGJmNzQ0MzRlMTAxOGY2NTE0ZjFiYjE3Mzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJUOHBkUDFVRUZRcWpqQVptRHhSY1FSODI4d0ZUWWdYdCJ9	2019-01-09 05:42:42.507454+00
1acpz0tdv8dd9u0yh1rc5h4m2ruqbqhe	MjI5NDYyMzA5NjQyOTJhMDExYjAwN2IwMmJiODg5NDAwYjg0ZWI3Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJGRHI4UFpQR09qMVNiRUQ4YWxHYTdsQUhBenFtRndLTyJ9	2019-01-09 05:58:47.143112+00
yi9ovbry2vlyuqs76m0731ifh9tp91d3	YTUzZDM2NTNmMjRiNjE0N2NmOTUyY2M1OWQyZDk3OTBmNDNhODY2Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJkM3hWb0JGRVVoeThleDlwbDZDRTlOZ0FpTVRGdXptViJ9	2019-01-09 06:43:44.334424+00
gi4wdfy4afeqp5udgudbtr3uknwr8i3y	Y2EwMzAzNjYyNTdmZDE3NmI3NTEwY2JkYThiZmFjMWU0YzVjY2EyMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJxMm85Z25nNmZ6cHpsU21sbnZPSW56RUx0emgxbmJCYyJ9	2019-01-09 07:23:57.882808+00
opqmaynbi9fo92j03o5guugbfb31vilt	OTc1ZTZmZTk4ODYzMGRlZDk5YWRiM2Y0YzhkODY2NzE5YzliZTg1Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJjSFpwYkFQUUdraE1LaFdNMUxzUjBEeVhmdWtYbXhCdiJ9	2019-01-09 09:34:15.398572+00
ch7zyojhio02affqla7bw1lbc1uj1vtz	OWY2OGY3YTRhNGVhOWQwODM5YTE0MGJiNmEwNTIwMjQ3NTk3MTFmMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJOeTQwTFp6TUloQ3V0SDdKRWRlUmpWRnhadm5NVmdUUCJ9	2019-01-09 10:21:09.014662+00
41m6gpegovljicjkivxycozv352srxrv	Y2Y1NmI4NDRmZGUxMTRmMzU0ZjAwZjljODliZTc4MTU5ZDA2NmNlMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJIVDN5MjVHdENIeVJ5ZXcybU1zbzdIS2sxUGVETVpiMSJ9	2019-01-09 10:37:14.183099+00
q9ivz6zf51wb3cyts8uyzx9mxg8qexwt	YzcyYmQxZDdmZGM1NjUxNTFhM2E5MmVjYTQ5YTUzYWE0NjljMmNiYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJuN1pVWExXUUxOR2d4VEM3cEYxSEFrb0swY2tSdXZrNiJ9	2019-01-09 11:51:56.698058+00
pksz9e6kvfho48qrjev0qdjfaw5n52b5	NTA5NjdjOTJkYWZkNTI2YTU5OTMzZDk3YjYxMWJjMmE3NjExZmZkODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJiTVJwYThVa3V3WGtqek5YSWtzVWhCRlhyWUFUY2lGaCJ9	2019-01-09 13:17:57.236499+00
im8lh7cveidmybn1th0c8z902xa3ztz0	YWM2MmMxNWFjZjQ1ZjJjYjhmYjk0ZGMwZGRkNWE1YzBlY2EzYmQxNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJYNXhKdFNLT2JSb25yNlhka0lPWnBxUjJoMjk2aUZ2dyJ9	2019-01-09 14:05:35.054587+00
wck55skmlhanq6wqtl8q4vx61fsfjd0i	OWJjYTBmNmRiNjliM2UyNmM3NWY0OWI0MjUyMDNiMTVjOGM5MDljNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzMGtrZWVzdU4yZ2hzcmVCVlQ0bENTM2hwWFpqOGZTeiJ9	2019-01-09 17:18:20.199539+00
419xbmwmhazg4jc1n1f57o18cuywsd2u	NjEwYjQzYzIxYTllOGU0YWQzNGFkNjExNzRmZjJlMGQwNDllMjViZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI3ano0SU1tV2NiWUYzZkUyWnJiNk9hYkRGd1ZyRk16NiJ9	2019-01-09 17:36:20.764544+00
sippcqd36uhnrmcqnbxwworvzp3ldy85	MGUxNWE3ZTJiZjdlMTI3ODJjOTQ0OWUzNjZlNDI3MjE5NDJjOGQwMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ1eDRTSGx5bjI4Rk4xQThGUEZUSDZrOG1RV2NwZzlrQSJ9	2019-01-09 18:30:41.202731+00
9hcbgntqewvb1cjfhd2mi4xudtsnuyk9	MDA1MDVmZDJkZjZhZGY2NzBiNTdiZTA0NDYzOTY4ZTBiMjg3OTE3Mjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJKdjJtcGhEWXZRSU9ZZURTZkdEbVl5Z2d2U2p3aWt5cSJ9	2019-01-09 18:42:47.800606+00
zy7b3x7h2eyg4sjqyazc1ekv8ao81cal	MmM1YzI0MjgyMGFjZWYxNDcwNWNlMTA5MjgwZWUwY2ZjNzNmZGY4NDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJqekpwMVA4T3FaNVJQWjhhY1ZiUndmd1RIY21HYVhPVSJ9	2019-01-09 18:43:21.75661+00
btbyzh993ncqurmzupnqlbwzilx06y0m	ZmU2NzUxZWY4ZGY4YzNlZTI2ZjUyY2U0ODIwNTEyMTZhZjAyMDFhZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJXbmxQTWdkU2N3NWgxMFdCaDlTMXB4OTBNSExKRHdoeSJ9	2019-01-09 20:22:28.144188+00
ricy5ciwq6mdxlvgamngcmk94okxca18	ZTVjZjcwYjY4MTQ0OWQ1M2RlZDI3ZDNmNThjODIwMDA5OThiZTg2Mjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJyUTFTR21uT1RYSHoxdVdCeTRBTGUzT0NEQXIydmdiYiJ9	2019-01-09 20:46:01.67939+00
5z02lsm5f2uob601j48i30uthb5bwy8b	Mjg4ZTRjMWUzMzMwNDU2Y2U3MjU0YThjYjk1NzE4ZDY0OTNmNmUwMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJhZTJ6RlU4YkliNkFzWGlROHNmQnBWY1BocWlBVWtucSJ9	2019-01-09 21:23:00.844373+00
v495p2twx1k37w4iy9ems2bu50sycg37	NGM2Njc1Y2ExMTk0NTIwY2M0MTJhMTk0NzBiZDg1MmE1NDUyYTA2ZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJPMVhRVXpCa2ZYbGNVU2Z4bnd1WkpsRzhmdVZPWDNKSCJ9	2019-01-09 22:49:27.005073+00
vwa8rhhvvzu8fv1fwjzom3909nduw0br	YmY0MmUxYWQxNzdmODBlOTVjMTg0OGRlMWQzY2JjYWM4ZjI2YjBkOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI1ampXZVplcGZkcjFGRVhOenNmRVFuVE5BY1Z2YzdNYyJ9	2019-01-10 00:39:24.942756+00
v77dfd6gyyj3ncro4hyyi2v5kdrpccjc	ODI0ZDAwMjk1YmUzOTc1NjFiZDg1NjdkMjA1MTgyZjY5ODk4OGY1Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIxZVg2RjJieHN2RFd4NnB4T3JxQmFzSVlTODN6ZmZQayJ9	2019-01-10 01:08:18.439668+00
1gqthwa8do5qj9bo99ycsocx7xgrxhjq	ZTVlZDM2MTgwOTlmMDExZTgyYzc0MjE2NjM0YjJlZmJlNDYyNWNmYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJFeEZ2eEhJN3EwUjNmOUZrdU9kQ2k1RFo0clFGNGVvNiJ9	2019-01-10 01:22:05.563934+00
egv90pcij7q17flho56bjm2mjlnwk6mh	MTk2ZWMzYzgyYjlhNGRlOWZkYmNmODcyMTIzOWQ1NDU2Nzg1ODgxYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJCYlN5RkZVbWRGMVdrRmZCZHlpMDlnVUI4ZUVwV0Z3dyJ9	2019-01-10 03:22:59.702175+00
dngrng1amivxf9jibr51vz1wines2rqb	NzU5ZTgwNjQ5NWViOTU1ODM3NTc1OTY2MmZmNDJkZGE4OTMxZmVmMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJsdkhSZ1lpeTFsQ2ZnQWt4REdwTUFtNnFIWm1ualhwSiJ9	2019-01-10 04:29:33.057836+00
ifjxbkbjx7odgp0bhu3d621kug95fn03	NzRmMWE4YTk2MmM5ODA4NTYxMGQxMWQyYmQ4Y2Q1YzAxYjc2ZGI5Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJKMDZ4amhmb0FEVG5XeEtyMjBJanJRelFQYzNQYjY5aSJ9	2019-01-10 06:29:30.661483+00
n7mbbp5zdxkvprfkbmlge0dds8fh4fk9	MDIzMDk5NTQ5ZjI4Zjk1MDZlMTVjOGJlNjlhYWNiMGY0OTNmODZhNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJpWDVGS1cwSnJOTVZZb2RyMExvbjFHb3l3MDNLMjJSYSJ9	2019-01-10 07:32:42.485556+00
1b0dvpw27rg9eq5hbytwie8a7s82ngf6	NDRkODQwMDlhNTg5NTkwZGIyZjI5MTVmZGUzZDA4NDRlMjBhYmZhYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ6WWxLUkFxdmhzekRzNVFING9CWUU2eWZGcm9NblMyNiJ9	2019-01-10 07:59:53.539699+00
ixgxwlathj7jnqb7l3kcu4yjc0awvdn3	NWIxZWE0ZTJiYjNiMzJkMDgwZGJhOWMxYzAzYzM2NzkzODlhY2EzZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ5SlJldk02cGVpNlVxcElic3JoNHZyWU45eWpQalN1SCJ9	2019-01-10 09:45:22.884408+00
doq8sywncobxn05qr9s4vyk6tayjsrf8	MGFjY2VmYTU1OTM2NWQxZTE1ZjczMmRkNzdkZDcyNmU3NThjZWQ1Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJPZnlVbkJLempCQnZsd1RpRUw1Tld2OXl0cjBZSW9STyJ9	2019-01-10 10:44:56.979228+00
lflesoisifk7izux8ddmzva411b5g8t8	N2M1MTIyZWVhMmNjNzU5ZWU1MWVhOTVkYzI5NDdmMmVkMzdjOWEzNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJVd1hBR2ExZzlnMjk0Skd3a3hVOGpjZGtQUkp2U0t2RSJ9	2019-01-10 10:59:39.156348+00
vm6a9l0chnjbokr8wi9rm8r3ebbys016	ODExZTA0OGQyNDI2YjA4NGIxNmMzYjVjZDMxN2U5MWI1NmU1NzJiYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJiRHRQTzRxek44QkJhWFR6NTFQcEJMa1ZvN1dWeVZoeiJ9	2019-01-10 11:24:57.845805+00
7jadqvg2h3fx9ct474kbrbwwwbaktnst	NDU4MTc5NDczZTVlYTY0MjQxODg1MjU0MjMwNWFiNTQ3ODMyZjliMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJuc1lJR0xteWo4VGpxN3NTbDI5QWkzTmZoRHdsRGFjOSJ9	2019-01-10 13:20:51.153335+00
hiu5nxb588j9utkjkyg6zrlb4ssin0pj	ZjhlYjJjZGI0MmI0YTJiYmZhNDkyMzIxYWQ5MmM1YmUxM2Y3MjllNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJFNmVFUkN5aG0wS1dPMjVHTVNOVXdZSzJzS05qTjZZcyJ9	2019-01-10 16:09:41.447077+00
17dhgmcfsf7j0g210j1zfexu5zuys3lv	YzJhMzY1MTM1ZDUzNDljMDIzNGMxYmQ4MDMyNTliMjhjMmVjODI3ZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJIajNpN0UzMWd2cjNZVjhDVXJ1c1F6NWJ3N3c3ZnltSCJ9	2019-01-10 16:12:52.725342+00
7oorhrfe9drvp6snkqbgi7dapgn04iye	YWMxYTRiYjM3NDkxN2MwOTlmNDkyZTBhYWEwZjk4ZmM4MGM5YjdiMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJMaHNmMFAwYlNtMndub3k5dTNRbklpWWVOeENTWFpvaSJ9	2019-01-10 17:08:48.271263+00
q8j4hwfjn5rjsdt2uvv908cxppz6loks	ZjUzOWEwNWU5N2JlNDIyZDg0N2I2OGRlYjc0N2FkYWY1MTM1ZmZkMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJveFd2dUEyaVlLT3VHWDlmeFZXNmxoWmFSVHk5aTNRVyJ9	2019-01-10 17:51:35.334246+00
5aodhcj0v250c3cgw9s592pa8fh4r20x	M2Y0ZWYwZDVkMTQ3NDhjMjljNzkwY2ZhYmY2NzFlMWYzZWYxYzQyZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ2ejZ6NWcwSVllY21TaGdjeUpHUVpYSnRkZjlFdXZOYiJ9	2019-01-10 19:02:01.747961+00
dguuw00rysw150x1j8snyhv7jpnbj5vc	ZmMwN2IxYTE1MzJlM2RmYTdiYWViYWIxNzM5Njk4MDg1YTlhOGYyZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJUblJLdjRuREFxdDFSYlNIdWJkTlRIdFVzNmxUUUtEOCJ9	2019-01-10 19:51:15.910953+00
352mef09iyuxviqyudo1vbvapgt7iilb	ZWMwMDdlNGQzODNkOWE5NGFiZDVmODVjODZhZWJmY2ZjZDYxNmRiODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJKSDI0TGdCTHlTOWR5NkhaZGlqQVZQbXBHeUhYUUVoUyJ9	2019-01-10 20:50:27.740936+00
0hswbbwjn7z5qmoz7f6o4yrf7twb76nq	ODMxZmIyYTJlNjNmMTMwZGNmOThhNmY4ZGU2ZjE5MmM5ZjIyZjBjMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJMVhtSEE3MTZadW50Q213S3VqVlhNMjJiQ3NPVFBjaiJ9	2019-01-10 21:43:07.940902+00
le74bkcrmzlmf5t7p1rdlfp1itbwcdol	MGJlNzcwZTNhNTNlNDJiNTkwZjlmMGY1NzcwOWU1ODIwNTZmYzBlMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJNWVA0TzMyQVlUN3oyb1hZa2pieHFmSWMxUGMzSW83ayJ9	2019-01-10 22:07:21.026176+00
3am5wd4739xb6c545ozwqsjoa7a02g8g	ODI2YzMxMmVhNDRiMWRiMzUxMjUyZTBhZjg1YjI2NjBkYWZkZGE0ZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJDRzd0dTl6c1VzendndEJRQnFtZGhVd1JhZWRqOGNTUCJ9	2019-01-10 23:20:50.51946+00
osuar5hzxvox91pueqnqaihgq6r6my6l	Nzk2MGJmY2M0MjcxOTMxZTQxMjk3Nzk2YTQwYmFiOWEwMTk1MTkxNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ3NHBnREJOYXV6OUdZbDM5b0lzc3UzaTFZbnQ4d0d6QyJ9	2019-01-11 00:10:41.614406+00
j5hdnbe52bopw7x0447267sqot5m6v3m	NjhkMzM2N2Q1OWI2M2YyM2FmZDNmOTk5ZGRmY2FjMWEwNTk0YmVjYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ6U0tWb0s2TnJxVUZ5OFNHSFBlNW1sUVhLMUdYY1piTyJ9	2019-01-11 00:36:06.332277+00
p76upl1f7txag5y2s5bojdfjyujrzxa1	ODJkOWJjYTAxOTA3MGFhMjIxNDA4NGM2YjRlZGVlODQ1ZmQ1YjRhZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ6dUFKVGZSbTM3YmFmQXFpZ05VMm15OEY4VDE1d0hJWSJ9	2019-01-11 00:44:07.008418+00
kobaczhzd6hxhfqjyy6mh203oucadde1	NWExMDRmMDU4NDgzYWFjM2RlNTExZTYzYjZhYjdkNDE4MjI4MzJlZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI3aHJjek1GdmpiazlNTkliYWpiRmVtbmJXVlZ3c3FIdiJ9	2019-01-11 02:40:57.146274+00
4r5e6bbzqu8tt3awz9zuugsgsavxnxak	YTQxZWE4YTk2MTE0Y2VmN2RiNTJjZTU0MzRmMDU1MDg2ZWQ0NjhjMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJhRURwYm9ucWR2MTFRNGlmYkpKazRwd2QxOE9acGRBWSJ9	2019-01-11 03:38:38.502534+00
wr5s7592p1oas0ku4bc6ag1e8nuuwsq6	YzU0ZTM3MWNiNjY2YzFmM2VmYmNkNDVmZTRmMjdmZmQyYTdmNDJjMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ1U1Y3NTJ6RUdVUE5ZUFMzaUZEVVNjTHlYTVFYWTE5aCJ9	2019-01-11 06:18:42.597611+00
9gppgfz14j0a3533ff7ahh8abyw92l9k	MzYyMzEwYzVhZGM5OWMwZjc1MTRhMjhjNmVkNDIxZWUwZmFhNWFkOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIwWUk5bFhlalJZSm5QT200N1FleVB1RkhmaE83OUxnciJ9	2019-01-11 08:58:10.544146+00
ush2zayn9rcrydpi0tc2uj0vjquj5pyp	YzdkMDZmNjEwODk1OTc4MzRiMTkxYzgxMDk5MDg4ODc3YzVlZDJjOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJBM2xjdVo2YmJHY3hzMFlMaXFwSmtSUkNvZXVoRlFQbyJ9	2019-01-11 09:44:31.51449+00
tv97tyffrmh3whhcki4lul7h48yj4avf	M2U3MDRkNjc4N2Y4YzRlOGEzYzRiYWIwYjA5OTliNTViNzY1NGFhOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIzQ1RYOXlQb0dZc2tobFo0N0Y2eWZzMXhJWnVFRG5EVyJ9	2019-01-11 09:44:31.584988+00
pow1gzlees9b3fjpjtlf8cxxzpmfs1gj	YjA1ZmE2NWYxZDhkZjQ0YWNjYjcwNWU4ZGUzYTlkNDUxNGJhYmVmZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJXTHF2UURIRWtzTk1KT09JdTRNWUY3aDBmNTNYaUlneCJ9	2019-01-11 10:06:42.303139+00
nasi9jsn4mxf4aeu8y5hhd91slaj8zar	ZWEyYzM4NWIxMzcwMWE4YmI3MTI5MTQ3NjMwYmMyODBmNGM2YmRlZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJSYnBsbTd2SjFrd1dVNDJJVkZMMXBtbE9vbHAzdXNtVSJ9	2019-01-11 10:15:13.79498+00
pa48ld3iyfflo1iiszlbyfzrhj091aom	N2U4YjZkYTJhMjkzOGYzOWI0MmI0NWY2OGRlYjRkZjRhYzFlYmMzZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJwejRGRk9yb3BVb2JFb3ZNb0JiTXJWSXpWeHlRbzBDbCJ9	2019-01-11 10:57:03.066849+00
ry0as79zezpwrsscsw96mgs6cl54f76h	MWMzOWY0YzliMWU4YWJkN2MzYThlYjhhNmE1ODU5MTZkMjg2Y2QwODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJOTktLN0hlOVNnMDlSakFpQk5mY1FNVWc2anl2U1c4VSJ9	2019-01-11 11:15:03.671622+00
rrhb6w3kyzgz3bwc7k5migav7bxabss1	NTE0NzYwNDk5NTU2MDhhMWJlMDM0OTRlM2Q5YzY4MGI0YjY3YTQxMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJjWm16Zm5SQjNiVHRFWndTd0lOTHhFclJJbVJkOTd4UCJ9	2019-01-11 11:22:10.028636+00
5i21l5kz31bge8cq2fi7ey2afi9808iq	M2ZjOTQ4N2FhNGVjZDZkYjM1NWE1ODc1ZWQ2NjBlZDBlM2Y5NTk3Njp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJnZmdxOGsxYUpYODM2bEFMd05NVXhqcFBZU0x4bVBVYiJ9	2019-01-11 12:09:09.197481+00
1lu3z3ej99jjcjqkkqq6b8fircleo7cb	ZWYxZGE4MjExYmQwYThhNGYzMzE2NDk0YTM2OGQxZTAwNWIzMjJlMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJVQVZDZG8zSlFVV3QxSndpTGpIekE5dUdiSFRvYXNhUCJ9	2019-01-11 12:42:46.506093+00
ws1kbbwdkthyl2nqkb7tro7jchvzv9wn	MzdlZjdlNDRjMDU5ZGZlMjYyNDBkYjZlNzZiMmNjZjFjZGFkNDIxZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ5SUtIeW9GMUdZRkpMZ1owMGpRZnhTamw1MElTUEpVaSJ9	2019-01-11 12:51:19.417788+00
e9sd8c1k3yeepwvjujul01jz5dm9r9si	YmJkNTExZWZmNmU2YTlkMTFkMmNmNTVkODMxOWRkZjE2ZDJkMWNiMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJpb0NBdml0WnNsdk8yckJrWWF0T2czMktWeXF1QmhlVyJ9	2019-01-11 13:50:50.043643+00
o55ob7an39p4bhl7sp4nblls325rnw1k	YTUwZDAwOTUxNWY2Yjk2MjU3YWFlMzJiMTE5NThhZjE5Yjk0NDE1NTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJWTZZS05YazJ2ek5USUtENEVTTkR0QUhic1phQjRaNCJ9	2019-01-11 14:41:07.984034+00
tfxqqp9q83moni70yrl3h6s3kzz5mabu	MmE3MzI2NDgxMzBkNmViZDVkOWJiZmI0ZGYyZGI2Y2U4NTViMzI2ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJKRGpKMk1XOUVUT2g2b3ZzbjlkMVZoaHdRcmdUdVA1WCJ9	2019-01-11 15:53:42.246541+00
4venpqt4x7b6wb0ntzq0lsr29ezks1uq	Y2YwZGFiMmE0MDMxODk0MTcyZjM2OWQxNzJhNzM0ZDMzZjcyZGIxNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ6Z1pubEFNMDFGQlJVWUpxR3dvcEdTUFFTUWY1QUtBRiJ9	2019-01-11 17:12:00.263936+00
ietzlpnwta2wmlftp0d532b41w5gj63o	YmM3ZWMyNmQyZGM4MjAxYjc2MGRkOGVhZjI5NWNhMTA3YzA0OWE4ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJkczk2cXlyZDBMZGNrejhpYWhqNHVtalZyeU9MNmM3VyJ9	2019-01-11 17:54:08.222354+00
yd2azsf684d4mp1sqa12mz20396oryo5	YzdkMmZkODhkMTY1ZGNmZmQ2MDYxNmIwMGZlOTkxZmI3YjcyMTNlMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJVbVM4R1c5MnNYWWpHQVZUYmsxa0NzN1VzbTJwQ0kwViJ9	2019-01-11 19:46:53.472113+00
q11nnwyopfwpd6lvfjad1yqmhr37r7ie	ZjY5NmVkMTBkOTBmN2VhZDFkNjg3NWVlMjg2MDQ1MTllNDhmY2Y4OTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJiRXZWWW5pUzFBSWVXTm8wNUplSGlSdDcyaDBVTEYyTSJ9	2019-01-11 20:10:03.061126+00
x1vsh2amqma7z7c9j6kyp88eqjxyndqf	ZmJjYzdjZmE3Njg4YWE2MTIxZGQ4YzlhMWEyZTIyYmI3ZDBlMTM1ZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJWemRrYTdYeFYxOHI0VlFnSlRBNE5FTkxJZmlVWTdFSiJ9	2019-01-11 20:10:55.097959+00
i84xr9ig75gvk2d5t8mo4rcebccg8rb3	NGM1NDQ1ZGViYjFhMzBkODYwYjEzOTc3NTdjMzQ5YzNkM2FjNzU4Mjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJhVXZsTmxsbndHaUJidTJUZHEzVURoQUVyS3BGZll5MCJ9	2019-01-11 20:29:55.14462+00
ytqmvsekpeqfnu8un8i0yt025d3t0gaf	Yzg1ZjVlMDJhMzI2YzJjZGMyNjE4OTgzMTYwYzIwMWEzNWVhYjljYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI1TVdZcFJnVXBiVERIcTRzMEhWRnNGNXRqRDUxc2hqUCJ9	2019-01-11 21:42:03.523397+00
ezgvrlci48ubhiqc8utnnxu5sc7x0f01	MGRiNzFlMDhlMWZkNmVjMmVlOTQ1NWRkYjcwZWY3MmU3ZTM0MTYxZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJqSm5QV1VhUTlQRExWNUlTVGpxS2tsdUxaa3dISEZ3SCJ9	2019-01-11 22:21:44.872757+00
no4jwxsb5rj0od5ds5runhgcd662unf2	YjA1ZmQxZjM3MjYwZTQ0MjU3ZjExNGEzYjNiY2M0ZTY0NWViYjg1ZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJRSlpBVnhXZUx3NlBpOGo5N2tLUHpWRjlsRjlwTzZXUCJ9	2019-01-11 23:12:20.9515+00
jl9uh1oflrpz89g0198m0p1hh2hbe9ss	NjIyOGYwMGNkNzYwYmY0MWRjYWFkMTc1ZWI0NjgwYTgwZmVmM2Q3Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJpQTA2aXNEdmFHMGFiN0hEY2NnYXlERFowVFZIbnE0VyJ9	2019-01-12 00:01:09.664188+00
o6uhxpw72cfn2sd63srrny8k1ogc0k37	NjkyMDc2NThjMmYzYmE0MDY4M2I0M2QxOTE1Y2Y3MWY2MjUzYTI0OTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJteUp4OEFYbXd6WENaajRHTEREMzB0M25mbXNVR3R5VSJ9	2019-01-12 00:51:44.181468+00
qdk1xmbhvnj94kva83sfy8wb619gy95c	Y2VkOGFlYjhhMTQ2MDhiYjgzOTIxZjRkZTA4MWIwYWI2MGQzZTcwNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI2RlF5eXFGSzlNbTR1a2dNNUVvdFV3YnJ4d2s3Mmw4TSJ9	2019-01-12 00:57:35.897202+00
o7bfqrt4kgjln6jq8aihi2ixr50yu2o0	NTRhMWU2Y2E5M2YzNWZhMjhkOGRiYTY5M2YyMTkxZjdlNzI2MTEzNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJTUTl2cTNyaHZTTHp2RE9vUHlGRk5HeXVEVE9Od0V3aCJ9	2019-01-12 01:04:10.073026+00
fs0n1e9770al44aq9hj4hulgbv99an0g	MWVhYmZkNWQwZTI3MWRkODAxNmE3NjA1MDdiNjQ2M2EyMWRkYjdjYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI2TmRaWWdLWGdLWDBiQlJFTHV3cDNJSjZ0aTNMa2RhZyJ9	2019-01-12 01:10:46.936966+00
tktbezc4n6mtlfhn69v5yaooehfbpld7	M2I4YjRlNWZmN2E1NmM1OWExZjc5ZWUwNjdmMDc2ZGUxMjA2NGM2ZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJkM1hWcFFodFpTd3pIeXNjb2IwQ0RrZ29iTzFjZlk0QyJ9	2019-01-12 01:52:17.864226+00
jzxdttmhuekkpdqsi2i4p0rg91jz2gz4	YTVjNTRiYTY1YWYzMmFlZTRkNWVkNjQ1ZWUzM2M2ZDJlYWFmODVmYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJlVGoyY1R0YkFhb1ZBanBCUTd0emRvVmE1NTg2a1Z0diJ9	2019-01-12 06:03:41.542849+00
ytxjt1mavw2716opsfvivm6lgo1kci0q	MjZhNjU2ZWUwZjhjYzFlNjQ5Njc4MGVjM2JhZjNiOTc1YWM4MDdjNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ5Nzk1eDh1Q3FYNmdiaVh3Mm5wS0VYQlFVVTJIV2JFbyJ9	2019-01-12 07:07:31.203852+00
4mxipmbikp160ytnds52b63lgzuq1lch	MjQwNDczOWM4M2FiNThlZGU5ZjAzM2IxZDQ1NjIyNTk3NGM3YjJiNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJCMDV4MURkQVZxV0NTTnpqRUJpSEJvbjhBOXlUQlNacCJ9	2019-01-12 07:44:04.893513+00
cgrglnfjqic2k6pdj2diw1zqi1trfg01	OTQxMTcxZTkyYzBhNTI3NjlhNjQ5ZjQ0ZTRkM2E4Mjk4Njk2ODJlOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI5NU41QVJDajVGTlBMZjZURzF2YlRGb25BRkxDazlsRSJ9	2019-01-12 08:02:04.357824+00
lnx32ts39nez7o5yvqnhadonfdhs0msj	N2RjZTc4NmIzYjM1ZmM4OTBkNzdhNTNmZTM5ODFmZmY5NjU5MzM3Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ1bDZYazZ3eVpUYmI0RUhTQ2w4UGtoNDYyOUo3cEVkNSJ9	2019-01-12 08:24:53.349832+00
ialqkwd4j6msoqxthi6cnwazuovivct9	YTZjNjQ0OGY0YzVhOTFhNTc5MmQ5NjI1YjA1MDkwMmUzODlhOTJlMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ1OTdCd1l6aVJyYXRic3psTG5rWkkzdkpiSnI3V0xJVyJ9	2019-01-12 09:51:33.29514+00
549vluqx0756gi40vy0bdohipbpq4qn9	YzU3NzVkNzMyYmM1NmNkMWUyMDAwZTUzY2E1ZTk0NTFkZjIzNTg2ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJIOXBaZ2pya0ZKYzAyQm9DMjBtVXZFVUxNTE93Vm54VCJ9	2019-01-12 10:29:11.569004+00
6okc3xvmwmv3818an1j8742jrld9kjmg	NzI3OTRlOGUwY2E1ZDc5MjM3YjA4ZjQ4MDJmY2NmZmQxMWViYWI0Njp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJQemhEcVNXdDk0dVY2aFlVWElBa21rdFhJUEhJNjNVcCJ9	2019-01-12 14:30:32.784731+00
zqvoltq7ly3p4ss1fqfk0mtnuv1zrd88	MDY3ZjhiZWYzMWNlN2RjNGI3MTc4OGNhZGFmMzA4MjE2ZWFjYjhhZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJsMEVrVndzZzJweVNCTFBkYWdaQkNCMWhMeDBjNW1SbiJ9	2019-01-12 14:53:43.785369+00
1jf4a95hgfawh9y3vw4pztogz8p3yxjb	NjljODNlNzI4YTEyNjNkZTA0YjZmNGViNjk3MTcyYzVkYzEyY2Y4MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJlbFJFSzRDRXpNMEU5ZklCcDJPVFRLOFRRdkpjcWNsTyJ9	2019-01-12 15:26:09.568642+00
o99tvbx1l2t9tmur5jxvzck7eygkf4mw	ZjAwYWZhMmU5OGM5YjliOGQyNDUxZGM1NGUxOTgxMmY2OTBjZDUzODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJjVVdocjZJeWlHY1dzNG4zcWhEOEhiNTE0WXZhR3Z0YyJ9	2019-01-12 18:40:55.431345+00
mtmw2x0vaiuyzcetdpf4geak6t2enhz8	MGJiNWY0MDVlMzlkMjI2ZDVmYjRlMGJmZTYxZmY2YTQwYWYxMWEwZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ0TEtBNjRld1FDQjdBR3g0TE9WS1ptRVI2bnVUbG4zMCJ9	2019-01-12 19:37:10.01105+00
ot9mjoplnng74hptctqsud294yzx9zqi	NDRkYjcwNDQ3YjUyNWNmMTkyZGQwNmZiZTg2ZWRlZDRiZjRlYmU5Mzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJDZ0c4ckJTTGoxZ0FlZkdrSXpGcHV5U1I5ZU5iQzVnUCJ9	2019-01-12 20:07:24.711358+00
om54liyyfw8ojbqxhvixo86acm34e65x	ZTI3OTY5OGFlZGZiMzcxNTdkYTAwZWE0NDFmNGVhMDg0OTEzNmM2ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJiU09lTXVhYkhwNWV3WXFrY3VNYzFyUk4yYWlDQ3N4TyJ9	2019-01-12 21:01:51.460071+00
puko53balqk0yhdcbhugwvab06sub6fq	ODMxYTBiZGQ2MjQzNDhhNTY1N2RiN2M5NzViMmMxZTBmYTg4ZGU2ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ4NzF6VllvZXk1VEFoMDg0SnRlSmxWZU5GOVRpdUZoOCJ9	2019-01-12 21:01:51.472897+00
owy6jpgu9vychdyrl7ylaw8gaxnj9p9z	OGQwNjYwYjNmOGE0ZDkxZmUyZTk3ODlkNGRjYzljNmEwZDUyMTJjYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIzZHlVNkpuVUtsbEFKQnZLR3Nvb2YyN1hLZWlZcWNpdyJ9	2019-01-12 21:21:40.545395+00
e0hu6clvjygm84uwwsuwizo7yxctl98a	OWIzYWEyNjEwZmM2ZmYyYTdiYTg5OWYyYzgyNDQ0NjRiOTYwNGViNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJYWWJpS05pS3BDV1NXOXdzNFRpcndiOXJ6ZmZPSUZqUSJ9	2019-01-12 21:48:34.377323+00
w6slp9zx8uodnakpnsu319ol3eswuufd	Y2RjMDgyOTlhNDJlMmE5ZjQyMmEwYzNlOGRjZGZhOGM0NTQ2ZjMzZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJvVGJhR1RtUU9XNkxpdWs0eTJMT3ZpSzB3TXM4emowTyJ9	2019-01-12 21:58:30.553295+00
jiissxm1yqvc6ce413qxzdbfpa6v1akw	YjA4OTY0MTM3OTMyNDJjNzQzYjlhOTAxM2JmMTY5NmFmYjNhNWYxZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIxVGhVcmRnSW43WmJYSGtINWV5Y1BISFp5VXB0cFRLWSJ9	2019-01-12 22:41:31.378338+00
x63mxl40vlbgxaaufnw3068llfo7k0go	NzM4Mzk0YzkyOWE2MDIzNzIxYzA2N2I4NzM0MDg0OGY3M2QzZDg4Njp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJuSldqZUUxUzFJV2E0V1VwMXRGb01ZeWpJWGQ0QTVqcCJ9	2019-01-12 22:53:09.871781+00
0dims2mxtta7shtaodoe4ai2loru0uuu	NzIzZWE0Y2JiNzM5MzQ0MDY2NjJiYWYxMjUyNzZkMTNmYTQyYzEzODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJpa0Zzb3RQUTZTMGc4TWtrSW00Zk1kMExnaUJFMzhVWCJ9	2019-01-12 22:53:17.984605+00
1yvaktuh87ljwnzzpqb9omdcz61bkcwk	MGI2N2RiYWI5NjI4MmUwZDBhNGNhOTRhYTYxYzJkYzRiZDIyMTQxNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJXTUdWQ3RXYkVOSmt1dktXN1haQ3FkcVZpZmNGY1VRcyJ9	2019-01-13 03:24:41.538799+00
m78mimbvcx3oaqzu77vijnzf2x590x1a	MTRkZDIxMTRiNTA0ZGM0NDIxZTgyYWMwYTNhODRmMmE4YTZiZTUzYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJqYlFMUEtVRDk1RFRkcnJFVXlXQ0c0SXV5cWFjV0kwWSJ9	2019-01-13 05:10:32.801354+00
zl74n5awnhx0r2tqza4nazx6ar6ppg3k	M2ZmM2Q1ZGYxZDFiMjAzN2IyYjgwNDY1ZjFiZDViOTZhODg4ZTJkZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ4MEhHQklTMGNpckNJMlN5d2E2dmxoZ0dscWFWME92RCJ9	2019-01-13 05:10:32.81389+00
ojispa5vmpttt65sdkzvpgd8q5vadcts	Y2YwMGU0YjJmOTAyYmNkODBkYTQzODczNTA3NDRiYjZmNzA4YWQ1Njp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJVYXl4Smk5N1Ywb2c1VG5ab1pmZUNrMjA1RHdPMHJKVyJ9	2019-01-13 05:28:33.867749+00
40s3tk8fqz14xfitq8givl1gj2477zjr	ZDExMDBhYmViZmQxZDFiYzE2NjBlZDc2ZjFlYWZmMzY0Yzc2MjU4MDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJjMHFTY3J0c1NpaEdXdmlRRmNNbVpqWVpHdXF0MERsVSJ9	2019-01-13 05:51:56.278299+00
wqao40tvatr0dax224bk5lx7ju65jed9	ODQwM2Q2MDg3MzU3ZGRmY2UxNjg1ZDFlNTYzNGJmZGRlNmI2ZjM2Mzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJFVWVKTXZVSDBoY282dUp1RVdKN3ozakRWUEdvQ2o5VSJ9	2019-01-13 07:07:28.712818+00
d6fxqjkw0fqsq6ql89zi6je1ygs61pag	ZThjYjk1YmQ2MDI4YThlNjIzZGQ5YzBiNDgzZDM5ZmNiNjIyNjQwMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJPOEhUSEZGZzV5Sk1IR3VwWkFGbDA2d3hURllzTmxrMSJ9	2019-01-13 07:39:21.049849+00
7btzkdm1vb8v8evexxho17uqnxprz1ey	Y2ViOWE1NGU3YzkwNjNkOTIyMzk4OGQ1YjliMzI4MjA3OTA4YWU5Mjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI1anhLc1V0MGZrYUw2ZTFBb2pMQnlyRGliT0VBdnhLbyJ9	2019-01-13 10:41:28.564259+00
jlrtmw5fejma4awrhvvhmz18lv8tvb3g	NDBhMDQ3ZTY0MTJkYzQ3ZDYwNzQxZDI5NDczOTBiZjMxNzY3OTI5Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJYbTRqUTkxdlcxbHhKVjg3OUdVSmwxa0Z5YnFkaTFCRSJ9	2019-01-13 11:42:17.568694+00
ybxuh91hdrgkelom831gvbbax18hpllb	OWIzZWFjYWMwYTk5NGY5OGFlMzg0NzQwZTBjZmNhOGJjYzYwZDYxODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJhakJuUE11U05teUxBRThjcnZ3TVZjMnR6cnFHWUxpZiJ9	2019-01-13 11:50:52.206797+00
5dwfc6cbv5dt6u66j5nvds5mpgb7e4lv	ZDBlYTFiOTg0YTllM2MxOGE5NGRjN2M5N2NjYzI2ZDAwNDNhNjYyZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ5b1pITlZGOTEzMTVGWDhETzl1a2I4SW1XdTk1YklXbSJ9	2019-01-13 13:56:42.973536+00
mx82et0zohgmskjpnfte3dkflrrcswga	NTg1Y2FhZWU3ZTEwYWZhMWU5ZWIyNDNlM2E3M2IyMjdjZjdmYTI3ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ0dUVRTGxHMFI4TjM0amxBb25ZMGdvTWRIVmxLMFI0eiJ9	2019-01-13 14:20:20.86279+00
t1werx3vjh7neuooyeoo7qbkr0dvfkzd	MWVmMzY2NTYyZmMzNDU2MTExMzA1NmVmODk0ZjRmOWIwNjI2MTQwYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI2VTBkaFJKTXdHQW5oaXE5Q2xaN0lVR2lwdDZHcmFCOCJ9	2019-01-13 15:10:06.840555+00
s9qsc2bql8wg0x022wr5vm3kpqkz5att	ZjUwMzk1YmIxYmVkZjBkZDUwYTEzZWZmZDVjMDk0MjM3OTcwYjQ2Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJCc2xkcXZ0bFZLR2lhaDRPQW9HNlkzT2pyV2xSQmw4RiJ9	2019-01-13 15:43:57.944234+00
a10xzwhijkmlva7kdpgam9kap4a6e9bg	NjAzNjg2MDAwMDQyMTk0ZDkwYzI0ZWY3ODdkMDY1MWJhODU5ODU1NTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIzUmVqMGh0YUxGOTZoaGFBZWpkZkVrSk9yZzhWYVh1ayJ9	2019-01-13 16:19:57.655536+00
2a9zr5x6mp58iy6dfztgkq6ngof77fx7	ODQyMjc2MWQxZGQxNWYwMDE1OWY3ZTdiNTg0Nzk1NWY0Zjg2YjM3NDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ3V1Azd1ZHNWl3SFBzeWJydzJlOUNKaDBlUDlYbk5TYSJ9	2019-01-13 16:39:53.386947+00
osq4hct3gaaor3212njzaboo6x3dpxdm	MDY5ZGI0OTAyM2EyNjZkMTQyNWVhZTM5ZjEyYTM4MzAxN2M3MmZkOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI1Vnh1Y2VPbWZHdkFqSmdoYzVlbTJ5a2lySlBXSWxQciJ9	2019-01-13 17:30:19.393305+00
pltpzdaq5al2kvrr0ko3vi9k4m9t7kl7	NWFlYmJlM2Y5NGZjMjEwNWU5ZTk5MGQ3ZGFhNDMwMDI5NDUxY2VhZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI3WFVhb1JMWXZ4djhnczkyd3kyanNuTkFlVHh6RnRPcyJ9	2019-01-13 18:32:22.296815+00
gvil9bt66rlexxpiffng6zs67dt8bgbj	NTE1YmQxMDE2YTY2NjMyZTM3NDM1MjZkZWI1NDEzNTg5YWJiNzcyZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJTbTJhVUlZTXEzZWVqTXhQbW1KblBZdkJGRG5GUFlaOCJ9	2019-01-13 18:58:40.64241+00
kfa2mutpfjxxsznbeonk8gz8kwu8h8gd	ZDdiNTdiODczZDJlYTRhZDM4MGY5ZjA1MTUxZDE3MWFiZjZkZTFkYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJBd3laWnV5cXo4RzdUdlU4VWE4Y0xCaklPOEt1aFpVUCJ9	2019-01-13 23:19:48.588595+00
x0k5yufo5ja0alocxkpuogrqirn0olwk	NGUwY2QwYTFkYjVkMzVkNmY5M2U5MWE5OTNlNDg0NWViYzc4ZjEzNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIwU3dtcUZyZWFsVWJ3ZEIzWTc5NnBQSG1XbXBMRHNlbyJ9	2019-01-13 23:31:53.281214+00
ras1tjcpmubxt39v65i9s3996f13w4rf	ZTE0NDUwZDQ0OTFmZjViYmVlOTNiODY1YzcxMTk3MDQzMjcxZWRlNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJvbkxpdFBUREQwNUxjdzBQdENSejhQNHdtT1lEcUVSdyJ9	2019-01-14 03:12:51.992262+00
qho5m12q72rg2flmp7qrptntgof20xk1	YzA0ZTFiMjg5ZDMxMGMzYWNhYzNlM2YyYjA0MDZjZmY0NGE3NzY5YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJHV2VZZGRhNW5wYnhYZGYzZVJQWGlDajlrbWRadjNWUiJ9	2019-01-14 04:23:37.016602+00
mb7jawum0aq20c0e7vnwr5a51ureln87	ZTliNDJkNThlMzYzZjY2MThiMDk3NTFmMGEzMzM1YTFkOTNkNzZjYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJEcHNpQzIwVDZVRGszUjZrS0VCd3NDdFNBZDJjNTFoTCJ9	2019-01-14 04:34:06.395229+00
gjihurptzwdv56m5vei83c1vtz31whs9	YTQwM2Q2Zjc4YTZhNTkxODAwZjE1MDQwNGNjMjc1Yjc2YzE5M2Q3ZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJVTmZhNXFNbms3SnBwZDRraDZHVlJyUnljRXF4Mm0xWSJ9	2019-01-14 04:58:37.977064+00
2a73qly0t411vlqtkmrgbpubqau3l04w	MjQ2ZTA2ZTZiZTJjZDE0ZjRhY2Q5ODkzNWU3MDg3NGZhMDIzY2E5Mjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJSGxmYVlZb1RVUHVlWXZ0MjNtbllSSmxYbFZqUmt6ayJ9	2019-01-14 07:28:53.007658+00
e3xn0bbuxgw0vspx9ao920oqalpoqszg	NTk0NTkyOGU0NDAwMzZmMTMxMjM3ZmE5YTBlMWI3OTE2YjljMjcxODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJKa1NKc045ckZPQXAwdmdhQmlCTlFJMjNFeFRzNDY1diJ9	2019-01-14 08:05:01.698759+00
t1w63a40cyp1x2vvqkg5qjy1r9n2c8lp	ZjhhOTgwYWIxMjAyNjViYzkzNGNlMGM0OTY5Mjg0OTc1MTM0ZjAxODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI5M2hLSzU4Zm41NFRCYWdQSWxDVlZlV0tVZEdJRjk5biJ9	2019-01-14 08:27:40.59754+00
gq6yelagig47j1lf805f10ihmvtmp4z2	MGYwZDYxM2RmMWRmMmIwYmVlMTY1ZjNhZGFjOGFiMjUyMmJjMWYxNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJqT0pFa2lFSkZOaFlnYVVXSXNKY043SHlCdVVTdlNwWSJ9	2019-01-14 08:46:11.408271+00
lhvzf39nr0yc1jwmv5g0w0k3qcmv87fg	YmFlZjNlYmQ3MTZmZDdjMTk4MzI3ZjE5YzM0NTBlYmFiNWYxYjQwZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJGcjcwd0JJMWo4V29wb2pvQjR4TkpyVENpbmtveXBCUiJ9	2019-01-14 10:21:18.472677+00
3lda4xej70x03pmfj9surzldpc0gm8gp	YzcwMjA0Y2ExZWFhNTkzODljYThkYTUyZDA3MGZhNzgxNzEzODgwMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJqbWkybDRJOGNpYjNEMDJhYzlVSjJxTFE2bW52eHdRciJ9	2019-01-14 10:24:12.542817+00
76jh4r73la3g3jdhpv9uxl8kthk5fwae	NzI4MDNkZDJhNGE5YjAwZmQyZjM1ZWIyNGIyNmFkYzJiNzcyY2QzNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJlUkdYUFNwc2loQXFjNEY3UzFaWEh4ZUc3bFlJNlUxTiJ9	2019-01-14 11:31:56.047401+00
jh3gnhozai8ei0iqc86tnabs58qf0ula	YzU3MWJlNTZiNWVlZDU5ODEzNTBhYmY2NDZhOTFmNWRhYTIxN2RkNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJQUWVuRW5yMDhNRGoxTFRUR0JtcDM2VXVDd0J4cm1KayJ9	2019-01-14 11:32:05.179225+00
1yi5gfyfzzasvspcntlky3tcequox3lp	MTlmY2ZkMzNhMWIzMzY5ZGI4ZWI0NGY5ZTA3ZDU4Y2EyMzk5YzM2Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI2bDNBY2luVGMxeFA3ZTB0NUZBaXZ5MnBoeEVtcU1acyJ9	2019-01-14 15:17:15.072322+00
w25kyuls5zit0zqnnxkie0w5mhj6qmor	NzM0OTcwMjNiYjk4ZmU2ZjA1NmNlMmVmZWE1ZDQzYTllZGI5ZGI2YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJlS1lsZ2FNVmVNR2ZmbDJiWVdicEZUS3dtVERYRTQyZSJ9	2019-01-14 15:20:49.717253+00
24wyv48i942j5vloybdc6fidysrlps6w	M2UyZjJlYWQ1ODBhMGMzOWM0ZGZkZmJkOGY0NjRjN2JjZmY3YmFmYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI2YTdYV3RvRmlEY2dXWTczY2tYQmNodTNvM0xURG90aCJ9	2019-01-14 15:20:59.549237+00
f8r6mteefg8597dnwyvzeyxyk7kn7twq	YTBiNDVlOWE2NTEzN2IzNDA5MmNjZTRkNmU5Mzc4ZDI0YmYyMzA5Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJOc3VyTHpIYWxFVnowQnYyaUlFbFdydEpMNzNnU3hvSSJ9	2019-01-14 15:21:34.855534+00
1xoqoaa7ygrvzabnusyyr1ttwunu9zck	ZmYyNTYxNjc0NmY0YTJhMzA2NmYwNGQwOTk1NDg1NGE3MjQ0ZmViYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJNdUVLYW1GRWV1OHQ1cHd2SExlT2JCWDRvY2hKYnNvUiJ9	2019-01-14 15:22:02.013936+00
baq882e7ktdj3bow6znsdabcuqei7qjz	Nzk2OGQxM2IwNmVmNjhiNTNhMWQ2MTAyYmI0YmM5Y2Q1ZTQ4NDdmNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIwRVVWN2JVTVkxTEg3Y2FjTXV1Wk84NXRiME5RZlo2RSJ9	2019-01-14 15:22:18.983212+00
omc6htit4imah7ryk5skeg1zmqvlu6g4	OTMzMDQyNWIzNWVlZTIwYjBkODUwYWVlNDc1NmFhZTU2MjYzMTUxMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJvTzJRUFQxazdtYnlUU0xZcTZwOFV0RkNYQ2pPc2RIcyJ9	2019-01-14 15:22:36.885232+00
9lytxmwg852xlxihkw7dvq1wsltv99b6	N2VjYTRhMjY1MjNhMjQ4MzU3ZDJjNjQ2ODYyMjE2N2JlYjJiNjkzYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJtbHUxTHJvNVFLRGdJMm1sck1CSk9uRlJEUUtEc1dXRCJ9	2019-01-14 15:23:13.13615+00
q6bsmvl5rk5v1xjyq12p6knhhxpsz99x	MWY3M2Y5ODkzZTNiN2I4NjYxOTBmYzZmNDA5MDk1YzEwZGIyNTQ3Njp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJpb0F0OUx4YnE2Q2VVMkxDZnlOeDlOYWRSR3VhVHYzVSJ9	2019-01-14 15:23:17.109306+00
0kgzsksrzga9jkv4c7kdl4innpurdswe	ZjJlYTA5ZTk1YjdhYjU4YTFkMDQ3NmVjNGEyODkyMDZlZWUyYTIzNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJjYm1oZndTd3pCUkJ0aktMRTNFWGZwM0x5M1JwaXBpNyJ9	2019-01-14 15:23:28.018574+00
3feenn2p0tm6bdzha9cabdgjgl4ivt3u	ZmMxOGFkZWEwN2FjZDQ5YWZkMDVkMDAxMjdmYjE0ZTdmYjRjOGUxMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI3TnBiMExleHBBR2xZZnZBT0hSeVd4Um8zM1NoOUJ5MSJ9	2019-01-14 15:23:42.599741+00
sauh476klqs628576emyyj4udkalqibw	ZGNjOGQxZmIyZWFhMTliMTc1ZWVjNmM1MjIxNDQ2NDk4N2RmZDdjZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJGVUhCOHFFZzZkcnJ4NnBjaVlheWpydGtpZXNIdVlTRCJ9	2019-01-14 15:23:43.055157+00
c5qg0fl48nl28npkpqtrdeyxm2a43836	MmI4MDA2YWM1MGYzZDE0ZTA4MWMyMmE1N2ZmYWNjOGQ2ZjFlMGQ3MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI4TTBhdEw4emlYdDd0blpmUlBBM1ZvVWQ0SE91ZHpUVyJ9	2019-01-14 15:24:35.220286+00
2lh40fxgxo25g9pbkkvrlqb5wmgtxlcn	ZWVmMGVhMDMxNTE5MWRmNzQyZGViNmRjZTBhZTBmYmI4MTQ5ZDU4OTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJTNm5mc2lDZGFlMEhndjVFV1M5TW1uN0s2UlI1a1k0UiJ9	2019-01-14 15:25:37.330105+00
btho3ig4auj75f4vg2wr8v6pcllg6xhj	ZDUyZDA5MWU5YTE3YTUzMWY2NTJmYmUyMmRjNDQ1N2I4OTAxNzI4YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJMlBJRUM1VXZKZUFGdWVJZXJlalRGZ1BKcWRWRnZ3SiJ9	2019-01-14 15:25:51.864986+00
f38s519l5mwwcu7flxz58snmqrelc5hj	NzZhZGYzMWM3ZjlkMzg1OWFlMTUzOTAxMjI0ZmEyN2QxMjM5M2YyMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI0MnVsN2pwc1JTSEluZUk3cWIwU0k0aXRZcFZiY3F4OCJ9	2019-01-14 15:25:58.884217+00
s4jxwnz9h5pfa41ycb9jtxspv242ly87	YmRmYzc4MDU3YmJlOTVkNTg0MzVlZTQ5NDdkMGZkZjEyMWViYjZlMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJLTjVackxrQjRGajNrb1hiTHB3WTZlQVRWV2pheTc0eiJ9	2019-01-14 15:26:14.587676+00
7yodtyi9acpx7esvccoxtshg48kx0iya	YTM3YzM4ODJhN2U1Y2UwZWZlMjg0YmRkODRlZTAwMGE0YTc3NzBjZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJkaUttYW1xcnh5ZFlQZlFFQkZiYVZpZHhra1FxR041aCJ9	2019-01-14 15:26:41.968948+00
etxpd2zu4shnlzp2xxx11qo7jbto7fi5	OTkzM2JjZDUzZThkYmYyYzJkMjAzZTFmZGI0MmU3MWU2NjViYWQ0Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI0MVBsU1FWQlR2NnE5a0I1dWd2WnpzYTVSUTlaVVVmQiJ9	2019-01-14 15:26:56.936853+00
x0e4cdlyo45p21uokifj6nl45axfs63h	YjNiMGUxZWI1ODYyMTBmN2EyN2IxYTBiMzFiYTA1NDIxYjhkOTBjNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJmVUgzUDg4RU1CUmhUaEdtYXJGWjJhV3pGd1lDV3VtcCJ9	2019-01-14 15:27:02.106896+00
390l2gaui1cor4ayt4vmjsag97wng5t2	YzM4ZWFkMjUxYTAxZWQyNDYzNjJmYWMzN2ZiNzZiYTNmYWUyNTExNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJqY3VCd0ZNZzRpNDlEYnNWY2d0cGxJeWxkcVZYMEVKYiJ9	2019-01-14 15:27:13.184144+00
pru67846oblekzm356b44x3u0boypez7	Y2FmODYzOTYxOTVlMzVmNTM0NjIzYTgwNWU4MzY2MWQzYmVlMjRkNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJsSEtkVzVPcFBaYmdqbjFRZnVoT2lBbnhERVZmQzRzbCJ9	2019-01-14 15:27:44.845235+00
lmngblp59m2q03wzmi57107t7kmlig4k	OTE2OGFiZWFkYTZlOTIzNThhZjBmMDBkODM0YmFhZDVjNWQ2MDY2MDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ6enJKb2NNd2pSQ3V3QXhEYnNqRE44enVDQkhUcmpJciJ9	2019-01-14 15:28:09.534195+00
v284m3ndssu65o3smvtka0qpqkl5v69c	ZTdiNTk3ZmM1NWEwZmIxZjQyOGJjNTc2ZGVjN2Y2NWE2NzRmNjc0Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI1T3dKZ09Tc3J5aVdocG5KUWx6QlhESk80eXFHclViNCJ9	2019-01-14 15:29:39.548299+00
lw54ezcw5barrdnjp40do188qultsorp	YTFhMGMwMTNlNGEzNDQyMzIzMjAyZTNkZWYxOGFkMTM5OGMwNjZkZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJtYU1FcE1JRWFvV0xwODBkbVZLRWhmeVA2UG5kMExnUCJ9	2019-01-14 15:29:59.509674+00
jz1ea70fnq2yuhazlbkbbtmyk9r7t4ik	ZjA1ZjUyMmQ5ZTRhYjhjYjQ5OGU1M2NjZjg1MTQ2NGZjMDg5YTk5Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJYeG54NjZTUzViSWJNOWhxUnFLT2tPaWFibzJrVFBTUSJ9	2019-01-14 15:31:26.443654+00
de5fcnanpvf63xfe8544erwbj4hufeib	ZWVhZjQ1MzE3ODI0ZTgwOGE0YzZmNTNjZGIzZmE4OTYxYjg4ZDcxOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJrZFZFSUFUZ0tka2ZpTjFJNk43WGtSOTJRbFVMNkRlcyJ9	2019-01-14 15:32:26.011752+00
fwppujotsroaf3yi8m0837q89v3mkknq	ODZlMWQ0MmMwM2I3YzNiMzkxODUzOGQ0MDQ4ZmVmYzI1ZmYxMzA1YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI3SUEyS2JiYlAzbE9hbXRNck82VzJBdXNVSkE4UzI4YyJ9	2019-01-14 15:32:52.50808+00
w4s7eo2lia7777af6r4y9mgacri2grq3	OGJkNDFhNzUzNjFkOWZiMzM5ZDViMmQ3MjA0NTRiNzYwNWNiYjJmZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJMSDJDSGpVNkdBUGtodmFKS3FOMEVpM05ZYWlVUExCQiJ9	2019-01-14 15:36:09.640865+00
tjw67m01s19juloe3nsxzi7l5xjoa4c6	OWNmMDA1OTYyYWEwMTIyZWRiMjdlODE0YzAyOGU3ZGEzNjk0NTQwODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJpNUZCdnBCSkI3dTNpVmpCNlNDdUFZZ2l5THlaT283USJ9	2019-01-14 15:37:46.136378+00
jwesiaw0ltzdgsa5afypzqx812qodte1	NzBhNGM3Nzc5YzBmNDJlNGM3OTYzYTY4ZDllZGUwNTRmMWE3NDdiYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJvTXQ2STJVZ2lFRWNGUjVtQVU4NnFFSFZ4Y21nb013dSJ9	2019-01-14 15:38:06.287916+00
rqgm8p3ekb5jylrbnp9cisnsuvv9m5xd	NmYwNThkYTMyMTNiOWNjZThkYTQyMGU0YmI3MGM3MTRiZmM5N2RkMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJoajNHWHBjVUFQclRqVXdvanVvbmtVVzYwVGV4Qnd5YiJ9	2019-01-14 15:41:46.377514+00
djv9dy8v5mphdfkuy4yrw3km8mwmw9b8	MGMxNWI1MDZhY2VlMTIwZmNlMTExYjUyNjM4M2Y0ZTQwNjExNWNmMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJKRHJiRmE2VEdINWxlamJsTWozWGVPT0JQbURvcUE1TSJ9	2019-01-14 15:49:31.995742+00
4jh6w1fclejcgy68boxck6n4ck0r6gon	NzYwNWQzZjc5Yzg5M2U1YWRkMTMxMjI1NDA3YzlmYTMzZTNkNWE2MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJLM2p3bDdTM24wc1dyZ2pEdDNnT2l1VXg3TVlrWUx3OSJ9	2019-01-14 15:49:59.802974+00
10xat4274s0md8e6edizrou2nf0kj92r	NGUxOTAyZmViOWQ4MmE2OWViYmIyN2NmZTg0N2U5ZjUxN2U0Y2NmYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ0TUpsT3A4eFIxelJGWWVvSVZMdmlHQWJhZ3c1aENsZSJ9	2019-01-14 16:27:20.580663+00
xsjluyel19mbt9asok2b8etxjv6lb03o	MWEwMmY0N2ZmMzYzOGY0MTAyYTE3NGY0Yjk5ZTc2NDk4NWJmMDI1Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJIME9qUmhrZDdaeTloa1g3V2ZYdXV4ZGNPd2FjSUplTyJ9	2019-01-14 16:27:21.524244+00
igfepy6uesyc65kaa5ri3mfoh3a1tldo	YTNiZTcwZjVlYjc2YWQ0NDFkYjZmNTNjZTRlZjBkNjlkODQ3NjQ3ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJqTDU0Zk04SEJDUnB1VFhleFZLaWVDRGVwTE9qcEtCSCJ9	2019-01-14 16:30:12.662259+00
grkm8xm6aed67glzon899a30hth6rt5h	ZmRkNDZjMzcyNjJhYjgyZjUxMTE5MGZkNTBjMzQ5MTU1NjFjMzVkYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJDWUIwTzdxa1kySkgyaHRJUGYyNUhyZEJUUWYyYnBnaiJ9	2019-01-14 16:35:14.910578+00
7bnuh4obhbdlnnq51clt068wnyqpy4um	ZTY1YzllNTdlMTYzZTFhMTlkZGE2ODE5OGQxOGE0ZDZhYTRiMjI4MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJoR0RPNnV5MlZoZmpVc2o4UnBBOHdwcWtFU3E3MXpaNiJ9	2019-01-14 16:41:18.499462+00
x03148dvu62hqsws8qptxz70xd4svv4t	M2E1YTJkNTM2NTgwMTkwZWNlNmE3MDRlMmIyM2MwNWNmNDJiOGUwZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJMU2E0T2pQQUdsQTdidXpkWk93bHlWaW5mcXBPUkJlViJ9	2019-01-14 16:41:47.425524+00
xsx77ul710rj0tonjy69f5czlfp3i892	OWRlZGNlYzVhYWU5OWEzYTBhMDFiNWU5NDNhMTI2ODQ0YjUxZjkyNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJXOTQ0djlwSjBZTHpHbWxqbjg3YURTNFR2Z01QSG9wRCJ9	2019-01-14 16:45:46.62079+00
18wnsnk28vpxx3546covaacae908bw6b	YjQwYWE1NGRjMzMxNzA4MzRhNTQ4MDQ0MzQ4M2Y1NzUzZWFkZTAyZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJVeGpoUW9pV3JKNnhiZjl4aHg3Yk1DcnNSTTZDTnN3ayJ9	2019-01-14 16:52:36.340162+00
ie090u32y5uctj7qz96aqj1if12qygz3	NmFjOGZiMjgwMGQwNzc3NTM4OWQ1ODI1MDAxNmY2YzU2NDY4NmI4NDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJnQmxScXZPdlJOa1U3RTBBZTZnamN0WGZkMlNxT2psRSJ9	2019-01-14 16:53:32.481078+00
e5si5zthnifu6vdnw8z4dc95v52ys33r	Yjg0YWUyN2NjNTgyMzJjMzc0Y2EzNTdhM2FlMGZkZmI5YzFlMThkZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJFa1lEVjBVSEdQbHBhYWJMeTBUcHBLaXFYMXZvbldtayJ9	2019-01-14 16:53:40.973051+00
0kyguphed94kmwzv5aad40kdion2bzhu	ZjA2NGNmZmI4Yzc4YzI4M2YxNmU2NjdiNjE0ZDc3YjUzNjBjMmUxMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIwenl1bnJ0S0RTMmJPclp6dG94VlM2YkhEeWVrZUlzWCJ9	2019-01-14 16:55:04.588885+00
n1ayomymyhg5kfop5b6edaxeye6hhemd	MzUzMWJlN2YzYTk5YmQ2ZWU5NjdhNjMwY2I1OWRhODFiN2I1ZjAzMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJtaHdVSUJPbDdWeEwwR2lwcmRkc2M2R2wwTmtBZ0FCdSJ9	2019-01-14 16:59:25.900803+00
dk3tqwihl0i0bt4kdd7cuo76j4ea6dq4	MWVhMGY4OTY2ZWYzMmU1NTdmZTFjMGFiMTgxOWQxYzFhYmNjMjVjYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIxeE1yUWpZMUIySm5nTDVnaUM4Tk5HSXFGMVZBNGJpZSJ9	2019-01-14 16:59:46.11449+00
9zydehfooewr1u4ogkcj58z4fa8os0i9	M2MwYWNiNTU0MzliMDgzYTc3MjRlYzkyMTAzNDZiZWNiOWZkM2NiNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJZN3NrcjNra0ZzM0l5VmRBRG5Ud1BPQ2UzczJzb3RsNyJ9	2019-01-14 17:10:12.632454+00
5z6z707r4ijjetnebzwygokwcjzdvki5	ZGMyNjgzMjkzZmUzMzU5ZTQwMTk1MmY0YTE1MTA0OWFhMzFjOGQ5Mjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJDaVdUd21KMlhXdlhCcEl0alVrYzBOQnBYRUFkcHNzOSJ9	2019-01-14 17:31:59.641682+00
cnn84om89v4aqhn6c6uh5bgscewjmtuo	MjYwY2Q1MWMwYzNiYWRmMGEzYTc2YWU2NjkwMDUyZjk2OWU3NGU4Mzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJESVhRcW1HUnFUMWl5U1Rnc1Q4T2tUYXV0SXR2WEFEbiJ9	2019-01-14 18:00:56.497643+00
03zu5zyk153xuu211h8c41k39p179mvk	NzQ2NmJmOWVlMTk1ZjljYWI0MzA1NThjZGYyODk3ZTQ1MzZhNzI3Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJZem1uMExYRmJoaGFQd1RHSjZKc1BLZW9kdWJjSTRSdiJ9	2019-01-14 18:47:21.042549+00
04mtyouu98e90pq2oanyrne7tflnm3tq	ZjBhZDhjNDljMjg4Nzc1OThmNGNjODcwOTE3MzQyYjQwY2I0YjEzMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJTZVlwZXNLeGtUM090OTlOTnBHNlY2aGF6bnE3M1F6cCJ9	2019-01-14 19:36:47.101317+00
1didorjak85etg1xl3bzes8juhhkqmoe	ZGVjN2JiMGMxYjBhYzI5ZTliYzgyNDE1ODhlZWY0OGIxNzlkMmQ1Mjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJDSGlFYWRpOUkza254cDJrUzVQQ1lnZTlZd2JyTVpwViJ9	2019-01-14 20:29:19.96322+00
b05yn7yitkgy2cyo138ruwnn9t29ibfi	NDllZTkwOWE4MDY1YTIwYThmNWFiNzA0N2Y5Yjc4ZjNiMTcxZjAzNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJTWVFPbnlCWmN4Q3dheUtLZnA0dVdhWm43SXBsdFhYRiJ9	2019-01-14 22:00:54.011804+00
pirnnzmgyibum6hychxa11c3llqac63e	YzE1NjdkMjQ2ZGY2YjEzZmZhYjEzMDNiMmE4MWJlYjNiN2EzMDM1Njp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJNbFNlam5IREFBVmdrc1ZEU1lSb2tMUmNCbnlFa2ZnSCJ9	2019-01-14 22:27:17.480956+00
488dxuhe8pcgvim8tuzvjjkxlg7iq28z	NzNmZWExYWQxZWQ1NTdiYjQ4NjVlOWMzZWQyNjM2ZDhkNThkY2JiNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIxSEhKWHVHRzlxb3hxenRZQjFPVDJoajB1TEJoYXE2OSJ9	2019-01-14 22:36:00.585605+00
wdh1m4wb990j3gh3nvaep7cicote1sh5	YzY5NjJmYmFhNmUxMjJjZDkzZDY2YmE4NmE1YmFhYmNmMTkwMDM3Mzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJTemFveWw3cHpFQmVnSDNqS1FZVDlxRzU2WW41SjFHMCJ9	2019-01-14 23:43:15.529818+00
d3qri5b5bv3q583xs6s2w0mwit6yut2o	MDk4ZDRhYWE5ODMzOWUyMDg5Yzc0NjEwNGVhMTRmNzE1YTFjMDk1Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJScGNEa2hqb2RsOHRVNWV4NEgzdHhwc2Y4eW1ZWnhsaSJ9	2019-01-14 23:43:56.76823+00
6pva2ajibv05v8t0k88qnd25p04j99zx	MGYzY2Y3NWI4OGZjNzdmMzU5Y2M4YTdmM2YxMGFkOTZlZjI4ZDBkMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI0WEpkZ253eU9jd0tHVllqOWNrSDBwYnd4VW5YN1ZpTyJ9	2019-01-15 00:48:39.475123+00
8gbo1bednxoriy3rugqqsw2f7x8gl3be	Y2QwYzJmNmVhYjM3NDcyMGIyZmE5MjI5ZWZiOGJjNDMxZTcxNzQ4MDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI5WnpKc1dSd0pYY2RWRjNWdVhEMHlQUmZSeFNpcWx6QiJ9	2019-01-15 01:45:04.417516+00
3eubo0vwvlp7wk68cnll6ryc2f9kipr9	NzY1OWQ2ZjY3MTk2MDc3YjQwZTkxZmIwM2IwODIxMTI1OWMyM2YzZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJwaGJCUld0UXFUZ3EzUkNjeHkwRk1IQW1yQjZSZHpDZyJ9	2019-01-15 01:48:10.550956+00
u76hwvvwbvdp1xupexukbgsfbmgjj2ad	NDlmOWU2NTIyNzhhZGU1NWUwMGI1NTU4OWIwZWZhMmE3ZDlmOWVhYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJBemlqSXljU25jZTViNlltQmNIa2Z5S1J1aThkeGdLTSJ9	2019-01-15 02:40:28.122335+00
wznpnwjbopvuy8fud5ibq6ubtdsm1b64	OGFiNjdhNTE5OTQxODM4OGZlNThhMWI1MTQzYTVmMTY5MDE5ODlhOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJHNnlhSmlvdzlHWU9YQnJFTzZQdlBIam54RTl2b0kxbSJ9	2019-01-15 03:00:08.783247+00
bbppczkjfh8jixo8puhynktjspcc8cck	NzE2ODJjOWYyYWM3ZWQ2NTc0ZDM3M2U2MzRmODFlZWNmODM4NTZmZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJaFd1MWd0MlMyTlFHVWFvTEo2eXlRRkgxcTdQTW9zZSJ9	2019-01-15 03:10:39.435605+00
6isdr8rlazx57fg0453gn64lx5lf6q84	ZWIzMDRhNzIwYTM3YWM0MDQ4OTQzYWQ5Y2Q3MzVlNTlkNWI5NDJhMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI4VmJ1WjRxcnBpM3llbXFJcnZyUzllV2g4d2tWdUxYdCJ9	2019-01-15 04:22:34.325217+00
02769fcqu8c5cesf6bztitq0ovzwqtzx	ZjkwOGYzMGZmOGM4YWQzOWIzOGRlYWE1ODk3MDg3ODZmMjAxY2Y1Mzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJuMWxmSGVpejZWb3R4c1c5eXk1MFdWNUlyd2I0QXh4dSJ9	2019-01-15 05:03:57.182396+00
cpmmlzbiqyc5s3o0o1gbphiqnwq2n5lr	YTIyMDYyOThmNjcxNjZkYjI2MzhiZDJkMjNlMDNkMDhjZjViOWQ4ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJFdW5jMUtVeGhzMmVwQkV3RmthZ005SUNGNEI0dEp4aCJ9	2019-01-15 06:22:04.794652+00
z09mw3amxsfrgta8yyf3iytt8x75euzq	NTJmMDRhM2RiODdlZjdmYjk4YzNmMDY3ZGU5MzMwMDU3M2Q3OTM3Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ3ZDlwQXNpSVU3OGd0czk2cXhSSlNZN1FvQlJDZWNtdiJ9	2019-01-15 06:43:05.66301+00
oiu3bful57b3xv2shau2vln0vunthyhq	NGYwMDVhYmMyNmRmOTFmOTU4ZWZlNzMxN2FlMzhhNWUzZTRlYjgxYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJaRXNCNzhSR3k2aWx5Q0VUSU1sd05PV0Q4QWptb3FkOCJ9	2019-01-15 06:45:23.764098+00
g2fqsjrysdfqvsllk9043tzvu17ama9r	ZWYxZGY0MWEzNWI4YzZhMmNlOTIyZTQ0MmQwMGU3NDY4OTdjM2I0ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJXNGdBY0c0aFJraG1CZmJqZ1FtaVpRVENZZDNTRUtVcSJ9	2019-01-15 07:43:18.547724+00
vzpfzwitw8h6dmw2tpl4k3pfhoss0pei	ZWZjNDRkNDYwMDE3MjJmOWJmZTU5MzljMzEzZjFhNTU3YTRlMDFmMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJsUGZ3MW0wS1JxS0dNUWtQSzNKTUYzeTNuRTREcUF3MyJ9	2019-01-15 08:13:22.795651+00
he8d4f8wo8ddsplea4zqiwzms36z63eb	MWVlNDY2MjY5NDI1OTdhN2JkYjM4ZDQwYjgwOTE3YmE4N2MwMzljODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJxdmhBV3Zjd2FhQVBSYkNTVTl1cll6YnBydFFxUUtnbCJ9	2019-01-15 08:13:23.174619+00
tszni7ddsil1thizy4hhf5buymns2oxc	YThlNjc2YTg4YTlmMTk4M2U5ZmUyMGMxM2I1YjY2YWQ0ZWQ2NTlhZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJEanJWQllQMWRGWWY4dlN4dDUzTTZnbXh4V3BBcE1mNSJ9	2019-01-15 09:12:24.710885+00
go9hhpdaxxf5jp3csm3mul7koq0bunzi	NzVkMTE2NDdhMDUwZDc3MTc1MzNkNDRiMzIzMWE4YTA1OTFkZTZjYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ6YVYweTJkc1J4bmlrY0dRQXc0MlhhcE5zR1BhVzlOZyJ9	2019-01-15 09:27:06.459742+00
7ds9v2dpqm4udcz88ljixireyl9fmk7h	ZTA2NDdmNzIzOGYwZmRlZmM5MDRmZmZjODRiMDA1MDkxYzRkNzNiMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJoSWRLU0E3dHN5bGlUR1lMVnNFSzZnNzhSR0tFbHpBRSJ9	2019-01-15 09:45:15.098583+00
z230w3miozvda3gf6vn9wgp5psdpc32m	YzhhYmMwOGRiYTA4ODRkZTRlZWJhNTI2ZjE3YTAwODM3N2MxYTEyYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJOVWxQVThneHlnTGJqVkQwbzBxRVo2dUxqOWsyemo4OCJ9	2019-01-15 11:10:27.052529+00
ksew9uwpre0lo5soa5yetcn7txykb5bw	MmRjYzlmZGU1MjBmMWNhMGZmZThkYzMzNjMwZjMxOWYxZjEyZTU0Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJSb3ViRm9adHRhSmc1YzN3RnFYaEFhR1A5ZVNJOHR5YiJ9	2019-01-15 11:29:37.888599+00
6hmwk36xhgcl47mx9df6hnq2vgyw13zk	ZmIwZjVlOTRmNDA1MDI5Mzc1NTViMWIzZjYwN2I2YmI4Zjc5ZTE3Mzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI1azlqaTl2MTJVV0YwSE40aFNZVFZPNXpzMnR1RmJ2MSJ9	2019-01-15 13:21:24.941449+00
k2pxna17akp3qi41nanv0u7xfpw3kc6c	MTdkMDFiMmM3NGFhOTdmNzc4NWY1MGY1NzUxNzk3ODljZDVlOTgwNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJIZzZaNGt5U3dTZTYwSzJWMHd0ajZTMEh4VjQ4YlJJNiJ9	2019-01-15 13:47:05.216479+00
jzr679p9g8g0yo6jv3z66n92gznfqczj	M2U1OTc0YWVjYzc3ODU0YTI5YWI3NDBmN2E4ZTk1NDU4NWY3Nzc1Mjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJtVjlkY0hyNUVWaTJaTUxrR2JucTRjNk5ZUHNiRDIzRSJ9	2019-01-15 14:08:25.321103+00
9o35xhvvnvyr9sjxra463ioqoari1p5z	OTIxZmZiODZlNzczZDZiYzY1MjYxNmNlYTZjYjlkZjZiZjI5NTA3MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ6djcxUm1rN1NQVWk1T2U5ck02RThCNGtkbUw4RkRqOSJ9	2019-01-15 16:07:50.512831+00
775urpen942fe4krkee8buqzt7wmd6j8	YWViZWQwNzU0YWVkN2IzYjEyYzYzOGZlZTRlNzk0OWJjMTg2NDEyYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI5WG9obzRxd0s4YzlMS016cHNJZkpkdjNlSVhLV2E2eCJ9	2019-01-15 16:08:00.825635+00
qywbznwf8kq1bvountrkltea8eyuivu8	YjA0MzA0NjBjMzc1NTczZDRmNzYwNDAwYmM5ODk5NWUxMGIxNGE5Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJsWGtpODJQTU40Znd1NlFYbk1vVjVrQzlCbVd2YkRzUyJ9	2019-01-15 16:08:20.409418+00
3o5rc1bbl25smyprta3hnp8l23fnqdwq	NDIyZDkxNGMzOGYwODA5OTdmZDZjNGZlNjJhNWE3NTdhOGExODVlYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJtdEpJdFViTXZSWlhiZTRZQ0VINjNYMndBbWQ4eTFSVSJ9	2019-01-15 16:09:23.599705+00
0mguo0chfx3b1zbppgx1q10v89t9jix4	NDA4YjExYjVlZDQzMDQzNzk5M2E3Yjc2ZDc1NTI0ZmZlYWQ0YmIwZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJZNTJXYWdiRTFWNmpVbEMxUGFOQXEwUzZhcGxtdG04bCJ9	2019-01-15 16:11:58.825937+00
t13s9yk4kai6evt2yly7510f9ptktrqb	NjI3Mzk3MDU5MWUwMmVlZjA5OWRhZTIyZWI4OGI1Yzc5ZjIxMTgzMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJwT0pQODYxNVJORk55OG9PMHZxbkxzMXZOQmVLN2g5ayJ9	2019-01-15 16:14:00.543355+00
tcejshrq6uvz0xyz7v2eriwatu65ijhn	MzM3NjA3OWM4ZjQ2NWRlZWY2MTE3MWFjMDNkZmI1MTBkMzM2NjQ1YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJEMm04U0xBNmhTR2dvNURKTTJ6eTdmNFJEeVVrTTltbCJ9	2019-01-15 16:18:11.993154+00
istgpktoq95jgcgpdcyhkhw3oi9ipj58	MjY1NzBhMjM5NGE3ZmY2ODM5ZDYyZTUzZGZmNWZlMjQxZjRjZWZhMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIwRUw3RlQyeXNXM1BxSHpXUWpubnRJY2ZSTll6M09jcSJ9	2019-01-15 16:20:50.438755+00
0yvzwmfj5uoqdyiqwq5qiuzu0232bcod	NzFlMzNjZmY4MDY0NTEzNjhhMzNjMmExZGE4ZWEyNDdhZjQyNzhiYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJCUm9GZnFPSjVPRDlxSWx6OHlrSGM0MWFrOHNUU1ZnZSJ9	2019-01-15 16:23:37.759008+00
jmeq2t65gt24kfncuq6ttkplvub2d5i6	OWZlNmI0NGFlMzJmMDU3MTAyOWM0MDBmZGM5ZjNkMjQ4MmMyMTJhZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJFa3NaZ0d0TVdMN2Fsa2hJbUtaY0xGSm9GYzZnSmd0NSJ9	2019-01-15 16:43:49.023319+00
8t93ezvaeqqjih8mmm82eepakan6hhux	YmQ5MTU1ZmI5NjcwZTI0OGVjOTEwN2ZmNmNjNDgwYWFkOTY0OTEyZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI1NXlWa2c2VGNsN04wb0RqWnlMTTlwdTNvd2lTNmE1MyJ9	2019-01-15 16:50:29.464906+00
71cnk5h4n2vxwco5mi04wwerfh8ymrjm	YzY1NDA1ZDRmNDkwYzBmYzUwOWQzZTNiNzY2NmRmM2RmNWMxZDZmZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJVNFNBVnZVTlJJRGdiRG9oZXNBUk10MURLQnJVRUk1YyJ9	2019-01-15 17:34:23.769474+00
fwf7e97ir8el7d9gy2h93owgmvrpy24r	OGEwZjgzNzMzZWExYzY5Yzk2MWRkZDc5NGI1MmMzZGU5MmM5OTU4Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzVmh5ak5GZW9CWFlMNVNBMjJRNGx3V3JaU2pZekVlUiJ9	2019-01-15 17:46:59.797836+00
xjkpz51um6k4zt1gm5g1av8aj5v823ij	M2IwZDNlNGU2NzQ0YmZlYzUzZjRhMjZlYWNlODhiYzc1YmZlMjA1ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJxNG1kaWZ0VXVvNmNRWDVxWWNRSHBnYUZwUERQc01zUSJ9	2019-01-15 18:11:48.782664+00
39rjrs67xku5s5tlxflg3kohsnic15ly	ZDEyZTQzYzRjODdmNGQyMDQ4NTZjYmY2N2Q2Mzc5MDRjZTg0NWM1Mzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJPUnFyS2xkOVJjeU00N1MzRUo5eW51emxZUWsweFpaMiJ9	2019-01-15 18:51:48.673593+00
azt56mdq0bosgermurr6rqxtc21j0vqe	MWQ4YThkNmFlMzRjZjI1OGI2YzhiY2VlM2NiOGE1MzQwZTg2MDEzNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJIaEFHZ3AwOFBlQlhtQmZQVFV2YTJOcUxGUXM5TVFsNyJ9	2019-01-15 18:53:56.560347+00
tf4skq7luyuqy0j7rooco3sy6qrwu3dl	MWI0MWJkNmQ1Mjk0YTE5NmU2MmZmNjhiMzdjZWM4MDA5MGE5NDJlMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJuZ2ozcVRMelZhZWZydHdQSGpKeFhsNXZOWU1xTTNybiJ9	2019-01-15 18:56:28.725602+00
vgzrf9tvigru4uqfh0xa3n0xrsz1ogeo	Y2JlMjEzYWY4NGM3ODYxZWRiYmFhNzY2MzYxODJkOTYyOTc0ZGYxODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJGTFl5T3BmeTdwTHZjSkNhdXpqUmFyS0xrM3ZBWW5VayJ9	2019-01-15 20:46:39.283759+00
q7re6k6twsvrxtpy09mr45krxebzczmy	Nzg2ZjQwYTA4ZmY3YmQ5YzFlNWFjZDY5ODA3YmIxYzhhNjcxOTNkMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJZdTRIVFdmbDVWVDIxcThFdFpWejFOQmdybmtjZ1EzbSJ9	2019-01-15 21:51:11.049177+00
kewsdzzrne69bn1ziwzrgs5gpnz0oic3	MjJlNDQ5MzlkYTNhMTljYWYxZmNmNWE4MjgxOWQ0NjJlZmE3N2E0YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJqVkRSRE5wMk0xbEM2dFAwUnphb3l0SXBmZDJub0tlViJ9	2019-01-15 21:53:39.225392+00
fgzrftso7que6ia2ext85in7ib8oea8b	YjY4ODU3MDVjYjFhOGFhMjZjYTI1NGIzZmM5NjcxOGUwZDllZmYwNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJTV3BxM2w1RWlGQ2g3Y2NSUDJBczlCY1ZIYnVheUZJYiJ9	2019-01-15 23:14:34.359818+00
ggwzu35ixf273we57s99c71gs75ixg3n	M2Y3Zjc1NGFjMmE5ZmZiYjgxZTliNzQ4ZDVlNTQ2ZGFiOGQ4NjhhNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJHNzZLeWdiRFdNZ3B4YVlPUmtYMnRBQ3N1RnlJRW1FQyJ9	2019-01-16 00:40:39.131543+00
9nuajrlxdc5uyy4qea74t8iywc806pbu	MGQzOTliYzRjNjRmYjk0N2YwYWE0MmYyODk0ZmIxNGY2NWRjODk5YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ3ZFlqZnQ0akhiejBjOWxTWXBTT0wzaEVscmMycFppdCJ9	2019-01-16 02:14:42.672106+00
5igeqp13vjddrqxtvd9r71mt5hgvbe5r	ODViZWNjMjRhYmMxMzM3YWM0YmRlZWNhMDkyZjZkNjBjOGRjMzQ2Mzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJDalZXQlRNWFlRT2pmSzhwVmFUcGdJS0JDSWNDbkNwdCJ9	2019-01-16 02:33:55.109395+00
gmdefdam68uo4alir569kjq623n0ksvi	ZGEyYTk4NWRiMWZhMzNhMmU0OGNkMzY0ZTdmMWEyZTcyYzE0MTcyMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJSWkQxaUZoeXRKTDcxVm1Va0ZNNk5ISzVkWEtsQ0pqNiJ9	2019-01-16 05:07:31.72501+00
x4som97x0gecaj337s1dti7vz8j41393	NTJiMjRkZjI0Nzc2MzA4NWU4Zjg1NDFjZjczOTFiOGUzMzMyYzgzODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ5V1ZSQ1hwTExMdUNYaVMwazh0N1JzWXNGQTZvN2NSYSJ9	2019-01-16 05:12:53.05077+00
oox5jes0jiy3jkg5a74eshzhyzr9lskn	YTM3YmYyMTQ2NTAzYmRhZGE2OTM0ZWU3NTI2YjI3NzViMzQ4YjAxNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ2d21HQXAxVjExTGphN0FlbUtBMlZ4UjRzU3NqVkowViJ9	2019-01-16 05:21:11.733263+00
ykvur04ch89dewpakx54mniyytz6i7p8	MDE3NzlmZDVhYjllYzUyODIzMWIwZjhjY2Y3ODlhZjU4NjA0MmY3Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJMQXFsaUZBSVZiQU4za2U4UUN6NkNWZ0NWcVFCOUMzWSJ9	2019-01-16 06:37:45.623309+00
xxx2ecf9hl0a06yume2tr34heks1inuf	YzIwYjBkMDg2ZjgyODkxZTJjOTlkODU1N2I0MmQyZjI4ODBmZDk5NDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJSUndhaE5TTzRvWHRJSHN5N29Dd29TMFJ1bVR1V1J0VyJ9	2019-01-16 06:39:05.262516+00
58uapimnivu16a9qpmt5w7odt78y1140	NWVlNGQzMjllNzg2ZTYyNWE5MDc5ZjE0ZGIzMWNjNDczZGJjM2VlMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJnQ3VNSUhjdUFkcVNkTGVleU1EeW9YUFZGRDhJeFUwOSJ9	2019-01-16 09:40:14.020235+00
o1wmqbn0pe2hq7hqpd8p14fwz87iixpp	ZjQ1ODdhMjg3ZGRkYjU0MjFkZjQyZTBjNzkwNzFiYjc5ZGY5OGM3Mzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJLMFRod3NqQXUyQkhBcUtpZHlUMFU5Q1dNME9PUGhFbiJ9	2019-01-16 09:52:50.396721+00
8bvh81irwb8inywm2rfwcj0likroltx4	NTIzMTQxZGU2OTc1ZDgxYTM3NTlhN2Y5OGEzMDIyMmEwN2UyNzgxNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJWSTVZYnRWbWdTUGRoWFNOZk93VjhOUmxpZWVIV3VRWSJ9	2019-01-16 09:52:51.502176+00
xni9l66n3lyn0wvlj8ihoptk5lh4xv5u	ZmYzYTdmNTQ3NmYwYjQ3N2E3M2VlMjZlZDEyODBmMWMwNWVmMzk4ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ4YkZUWGdPa3VsRjNzamNJQ2ptcjdZZ05ZSmVGQzlwdyJ9	2019-01-16 09:52:52.44658+00
wuhi4wk52s61d2pumkgm6ou2rr47kbbo	NGJlMzZkZDQ4YTg3MTA0MDQ4ZmViMmYwZDliNDc2MDVhZGRjOThiMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJmVEZQSFhjV0tVU1NLNUtLYjhQak1mMHhiaXhUdWtQZyJ9	2019-01-16 09:52:57.78141+00
97ptmn2v4g6qhu7agslcwsren04lsdh0	YjE1OWZiZGY2MjdjMGYwOGVkNzVjOGZkMDhlM2Q5M2U2NGIwZTE0Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJOaGlGd1BkR2R0QTlKYUdqUmhsSXJCWGoyT1BQQ0d0TiJ9	2019-01-16 10:18:34.587174+00
b9cuylbuzuie7ui3a4aolvfsjnn1l5xk	ZDdiNmUwMjQ0NTc1NDliOGZlNDM3NGZjODgzM2IwZGIxMmFjZThiYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJFMlVPYk5hVHBWU29YcW5UR1hTazc2WDgzWU03QlRCNyJ9	2019-01-16 11:24:43.895602+00
2gdty3qaxyp0qm2rn9dze92yfugfad7b	ZjEyYjUzMzRlZTA0MTM3NDg5MGM5YzIwODZhYWE0ZWI3NDhkZDNmMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJZQVpmTnVjaUVRZENVMmx5UzlvM2FCeGZGaW1nVG1LaCJ9	2019-01-16 11:40:52.480207+00
xocjyxvslw2o3bgd9nzp09pv85g38lnu	ODZlYzg2ZjM0MDU2ZmNmZjg5NWYxZjkyMjM5MjIyYjllYzQwMmMyZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJuenJRU2lGS01LckpsYW5HalNBUXdKbmlIV3lKN3N1ZiJ9	2019-01-16 12:45:47.753019+00
uxklrlvrpncvm4nbxvyvfcop0l55yrg8	ZTAwZWI1YWQ3MGI4NDU1NjA4YmVlNTc0MTcxY2QxNWY1YTY3MWQwMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ3WFZ1eTg0OHFKNHI3Nnh5dkR3eUhFRkZIbVQ3V296cyJ9	2019-01-16 15:09:46.576041+00
z5vvm1u1lyploriyq7kt5u8hks0kulep	ZmZhNjZmZTljNzQ0NTg3MWJiNTM0YTRhNGUzNjcxMDQxOGI2MDdjNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJMSVppRm5pWGVIY2VsY1pxM3VRbXdxZDlMNUo5cUV0dyJ9	2019-01-16 15:31:07.835638+00
7ua7pj2fcf493if50f4ddpp0nomjmcqa	YTNhYTY1YjU5MjU4YzkxYWMwYmY3MjJjNTNhNzIyYzVkYjI2Y2EyNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJaS3c0eVd6Yk8wQ3h4Wks2TVdHcXc3ZERzOXh6d0dhWiJ9	2019-01-16 15:48:16.955907+00
ce68c88g59ozfcyirpi3i2uevpeiv1ey	NGQ0ZmYxYjE1M2Q0NjVkYmRkOTY5MzQzY2YwMTkyOWU2NmE2YTIxNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJpcmpDUTJwMHZWN1F4clpaNU81UzZ1ZFBVbkw0WVFsaCJ9	2019-01-16 16:13:12.5117+00
78o1nzt2kzpcg4sx8g4xlull7gxdcfvn	NWQ3OTUxODdmZjEwZDdlNWVjYTdmZGY3N2QxNGVjY2NiZThiNTdkYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJvWVpya01oWlJZV0xWZGFSalVndUwxS3JzUUM2QnBMNyJ9	2019-01-16 17:38:03.822491+00
mpnuqx8cu6lddc0qum3t90ogwx3ivw5v	NDkzODNhZGFkZjRjMjE0YmRkNDM5NGRhMDhjNzdjZDc0MjgwYWU3ZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJBS3pYUW1nWWlUb1g2eXhnYnJabTd0WXZzbjdqZGxOZCJ9	2019-01-16 17:50:46.167458+00
rr0pp4miwq2z71fvaa8cdr8kznkc4x9d	Njk3NDZkNjA4MjhmY2FlMmFiZjIxMTVlYjA2ZTM2OTU0YzdlMDdmODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJCUlZTZG16WVN6R2F4bGM1RGpFa1J4eFJLcmF4Wkc5UiJ9	2019-01-16 21:06:02.435046+00
x7vgr1xrwuwl74tx63fdvxdbco4gp1b6	NDliMmY5YzhhYWEyM2U3YmNhNDc0MWI1NDY5MGQyYzJlZDc3YTEyZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJkcURZSUdFWVVURUE4VE5rMVBDZTNRS3Y1bTdLUVF6biJ9	2019-01-16 21:13:32.330153+00
usxffwp2u38rltg0hq94gtqddr98gz4p	Y2M0NzYxMmY0MDIzNjg3MTY5ODZmOTdkNmQwNzQ5NWE2NGY5YzMxYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJoN2cyOGFKTXhjUUZQamZwdmV1WHRXN2tQWEU0SkpYQSJ9	2019-01-16 21:21:59.643866+00
dh5xh0uyrz2jb5n71abgsg2um7lqchgh	NjMwNDVjNzMyOGYxZjlkMzYwNGY3OTkzMWNkOTExMzIxOWI4Y2QwZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJtN1N5eUtGclNQdzc2bGdHa0VjTHRwaHBSUVZzd0RYNyJ9	2019-01-16 22:44:30.876545+00
vg462ibnt9vgs3tvzanvlzr0o7kc6jcb	NDljMWU5YTI3ODU1NTliMGY0MWY1ODdlYTU2OTA0Y2I4MmEzNTljNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJlOHR0V0JWcldxdUEwYXJiWGlSZUFhTnNwZGZNb2hkbCJ9	2019-01-17 02:15:43.734746+00
su6rrjcn6e0pm9a7go80ymoqwuztv275	NTllZjMwNTMzYTc3ZjZhYTg2MWIyY2I5Y2NlYWEyOTBmNDY4ZTk3Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJxb0JnbDJwb0pEU21UdjJJSE9jWjUyYXZTTkVVUGtOSSJ9	2019-01-17 02:15:53.582846+00
hrwf0c376hgi3gt908dmh0t5925xcisb	ZGQ4NWMxZTUxNzU0MjY0ZTM5NjliNzY3Zjk3Mzc4YWUwMDQzN2ZmZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJFbkxPTmRGUk1vckJybTBYV0liUENKQUcwM3NhVWxpeCJ9	2019-01-17 02:15:54.867774+00
t1poi84t4wn9l6muso3a64wcbdwnqvtq	NzNmZjc2NDk5MjE1MDgyNGM2ZWQyNjgxYTViYTc5ZDRmODZkZTgwYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJBc2ZEd0tWZWNFbk0wS2I2TkRHdDdDYXNQSUhoWm9XRiJ9	2019-01-17 02:15:56.636821+00
w0k5xpo0vhkdypgojevpvprhkx4wlpjw	YWYwOGU2YmFkMWIyMDgwYjk3N2MwZjQ0YTliNzA3Y2Y2MTVjOWI2ZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJhT3R6aXd3U3E5Zk1wcTVpUzJtcXp1dXVUSzR3RnFnbSJ9	2019-01-17 02:15:58.471029+00
1kk6mjr2mo4sd347jv0qvqp46trlwnq5	YTIzNmY1NTQ3MTBjZDA1ZTMxNzMxMWMyYzc2ZjljMDRjZTQwYzJkOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIzS2FIQmtGNGZldU43cTFYbXJzaGxTQkdnTW5YY3lnTiJ9	2019-01-17 02:16:07.059572+00
4qw62w86g5w5rfrpgmjps6zw6kd32vqx	YWRmM2Q1Y2JhOWQ1YzZhZGJjZGJlN2E0YTZmZDE2NTIzNmQ4ZDk3ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJKY016UTQwZVVhOW9vT0xXTTFCUFZ5WTA0RUFPVWptMSJ9	2019-01-17 02:16:15.797762+00
jmwjj8sjvq0nsqny99v7kloy9c1me769	YWQ1NWU4ZjVkNTdhZmJjN2RhYTA0OTQzMDRhYTg3NzM3Y2FiYmUxYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ3OVZvRVNIN0YwSGxmSjZVbkYyMnlJcUlubGhSRkhsbyJ9	2019-01-17 02:16:24.428398+00
p67mfra7055ib65r305z1vug6eml7awn	Mzk1ZjBkZTk5Y2MxOTg5ODM1NjZjNzZhNGY2ODA1ZmNmZWRkYzdiNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJhdU1DODhoU0VrVEdiRkw3MjlVdXgwcU9Pb2VuSHN3cCJ9	2019-01-17 02:16:26.253455+00
68zt4ka57g23d3bx6fh3dxkrsg5j7q8u	MWYxYTEwOWU2ZmUzZTdiOTk2ZmE3NjYxY2Y5MTc5YWM5Y2JiYjczZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI3VDltNXpIZEdUQ1BkdklzTnNDYnlkeGJ2cmQxMmFnSCJ9	2019-01-17 02:16:34.87925+00
18nea4hucub6vs7lfbkhwgvk76lzlipa	ZTJlMjRlNGE3NWUxZWU1OTdmOTVhMWU5MGJmOTM2NjY1NmZiODRjNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJSb3d4dkV3cUg0dGpEb1FXSWM4Z3FuNmxRcHRCSmYxVCJ9	2019-01-17 02:16:43.721159+00
uswctp0upuv043x40kpxkjbxcskt0rx8	M2U0ZGE0MDVkYWFiZjQyYmE5ODIyZTcyMmU5MzY1MWNmZGVmNjdkNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJYWTBJdGwxMU40U095V2tQZDZEU2w0bVg2TE55WDNyNSJ9	2019-01-17 02:16:52.792067+00
keoylzto1htqjqmx6talnfugpm86xu8a	ZThlNTMwYThiOWQwOTQyNzhjZTIzMDBjMzkwMTk1ODYxNjYzZjZhMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI1ZWhRenhOdlJPY0JOZHZlNnN4VFRmYmtsVmlrbm1tRSJ9	2019-01-17 02:16:53.918032+00
516xyn2l8uyyqbt5zoki7fj6v602h8t4	NDk3YWJjNzkzZGM0YmRkMGEwZGQ1Nzc0YWIyOWFmZmNlZjE4ZDg4NDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJwUzkxR3RCWjhjd0hNTEJabkk3NW1va0RBSzRyNTNKTSJ9	2019-01-17 02:17:02.705599+00
ba325u4utx4qfjdarsd5sptij2q1vgdq	OTRlMTc2MGUwMWY1NGM3YmYxZWFjNTk1NjViMTRhODVlNDYzNjExZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJXQ0phRDdqak82VE9IekM5T2RPRk1kZlJmQ2E4SWxxSyJ9	2019-01-17 02:17:04.499077+00
e5thj13le9cjcdyp3iizr6jxqj8ygjwm	YzU1YjMwN2YwMDM2NGUyZDJlNDg4YWM0YWQ1ZDJhM2E4N2IyYzJiODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzUkdveG9NV3QwWGtrQmNITHFQNFR6dkVnSDM5OWR1WCJ9	2019-01-17 02:17:06.831689+00
tznm150j4sm53hiosdpbe4a2dq97euhn	Y2FhMTQzNmE5ZDg1ZGExYjU4NmViOWZjYTYzZDYwMjUxZDc2NmE3ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJmazVwZWpKTjFZZFNncGFJSTVQeVhmazVvazNoa3NsWSJ9	2019-01-17 02:17:08.719507+00
2cl7po1pbct5fz9cnqbf4x00nbdk78fa	ODFjZWMyOTMxOTgzZjI2YmE0YzZkM2U3ZDA2MDM1OGRkNWYzZjZlNzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiRld3N2U0SlRIaE5nIl19	2019-01-17 02:17:17.796566+00
v6dyzvw3pyg06t5l7go6ketnemn0qyge	M2M4OTZmNjc4ODc2MTgyZDZkYTEwYzMxNDVlYzJjYTgxNDVmMTc3ZDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiZGhFVkVmWVJZQW4xIl19	2019-01-17 02:17:25.849913+00
zrinb00jt23teh0obvt59gn0dgacful7	Y2UzOGY0ZDk4ZjRhMGU0ZWViZTM3Zjg1OGEyNDQ5MzM5MWM2MTNkZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ4dHRwSHFkam42ZXF0REhIWUcyV2tBRTlBNUhzSUtqeCJ9	2019-01-17 02:17:34.566235+00
9qto2u0673xgt361c0azfmwtfqbc7ucy	YzIyN2VkOTgyMDcyNTM5OGEzN2ZjMzcyYjdkYmNiMmQ0MzNhM2JmZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI4dlpaVXpJRk5iaUpscURvbGZ4ajlZRDI4bUhSWlNZTyJ9	2019-01-17 02:17:35.577175+00
jugb3pnit3ls48ls7qxjs3bpym0ec08d	OTk5OTg2YWU0MTNmZjA0ZDY0YTJkZWRhNWU3YTNjNzY4NzgwYmQ2ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJkQTJuNGlWU1RJM1VrZk1YSENTNjBjdGhJZFJQNXluUyJ9	2019-01-17 02:17:36.66628+00
86a57tpvvguocvz9sy873rn10m2uafsc	MTdjNGYwMTY1MGE2ODYzODMzOGIzZGY0ZjdhZTE1OGQyYTMxZDA5NTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3JlY2lwZS9hZGQvIn0sImxqbFFZMUJhWEVHaCJdfQ==	2019-01-17 02:17:37.650901+00
kjas187sakb2lgl0gk8xdd0ufl8igf8s	ZTQwMWJmNzJlYzU3MjM0NzgyYjk4YWE4MDJjOWQ3MWQ2NTNjOWUxZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIyOGhLcjN5QWxxNDUxMWJOb0JsZkNUazBxYzdrdDBYdiJ9	2019-01-17 02:17:45.926004+00
0ham7a6eq79inmi3slvogi41avn66dpc	NmJhZjA4NzJlYmVjZWJlMzIwNDcyNzljMTY0M2YzYjQyZmE0ODVhZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJZUtUZncxbFA3OElaYTJnN2pGM3U5T1huczZmUE5JUCJ9	2019-01-17 02:17:47.766482+00
inpro9la319kqjf3egisugmyki378e9w	ZmZlMzgyMzEyNTVlMDU4MWI3ZGUyZDM4M2YwNTgyNjY0Y2QwZmRmOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJHODhUNFJzNVg4bHhDM0JqaWJkOXhlUFB0Nk1lVDN5UCJ9	2019-01-17 02:17:49.439228+00
xlzqeltwqqn7zg0zoexkbzl2mtiz09ao	ZDMzMzk4MzVjYWM2MWZlY2MyZGRkZjAxYzRiODI3YmJhODViNjViZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJDMUZLRUJnSkRPS3FTV2ZidzAzekp6d3JkbHRFdmJuNyJ9	2019-01-17 02:17:58.080472+00
myvrxi7vrc6xxqz6o43veiit1kih8slx	M2Q0OTBlNmU0MmI0YWEyNzRlODM5MTNhZjgzMmE5YTY0NzliMWE4ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJFR25KbmFsRUpYWnRrWkQwSmI1TUpENzd4b3RwZlR1eCJ9	2019-01-17 02:18:06.754243+00
6pi1fotnbnuchfw6gwrs46hgdt5hn4gv	Y2QyMTJmYmI4OTViNTJmMWYwZWIwZGI0MjhhZmE0MmFjZTUxMDU2Njp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJOb1ZMc05XUkVPVkNhZVNYU1VmRlpxSnNvTTZSRnZwaCJ9	2019-01-17 03:08:53.607302+00
n0us0sb4pv4r20tqtb5vfmjym7r5z6kb	MDY1ODkzMmIzZDlmNjBhNjViNzQyM2JjMmJmMzlmZmJiNjdlNTEyNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI2eWlEeFhGWmdKRjY3M2JyYWd0aGxMMFdBa2FqcTY0SSJ9	2019-01-17 03:59:09.621249+00
o0lq5z1bcaguitab1xxweiv5f4yhm9w6	YmFhZjMzMjU4YzQ0N2E4NjViMzFjMmVhMmIzMDhkYTczMTA1OGMyODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJU1VIbGl2Nm1KR3RGSGttcUFqdlc4empHQkJVQ2xVMSJ9	2019-01-17 04:33:08.087852+00
jqj1aq2u4olvk322s36gz0ggkxyarka9	MmY3MmExMGM5Mjg1ZGRmY2FjZGEyYTI2Njc3NWUxMGNiYTVmMDI3Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJxZ3QxMUk2eFBEWmFqTWVFRnJyTnJnSlcwaDhweUVuTyJ9	2019-01-17 07:15:18.935687+00
thcghr4ajapbsx7bt4dzghftzo7641iq	NTQzNzExYzBiZTIxMzQ2ZWYyMzI5YmIzYjJhNjI1ZDliNjdhNjExMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ0UkZja0NLM3c2UGhXaFJMUlRiQjd6OEhNOVhLYW4yYyJ9	2019-01-17 07:27:56.189601+00
svjmleje67348gtuk8qnm83dn9pewmcc	MTE5ZjNjNjE0YTIwNjNiZjZhOWNhYTUzN2Y5ODEyOTc3YTJlNzA2Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJnTHpBNGkxdU1NUWM3T1g0d09sZE0xaTFxanpaM2dCdiJ9	2019-01-17 08:08:21.888648+00
batn87655l6nxfeafdcmy2qo4pfqa5bm	OWUxZjZmNGUwODAyYzUyYTBmODRhMGI1NTBlNWJmYTZiYTk3MWVhYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI5T0dzQjRqWUlyYXNibkZzNEZJZGY1MUN2TUNJc0NsTCJ9	2019-01-17 08:29:07.971085+00
rqmi411y08gdd3frp21qmyqhfsyjtmks	ZGFiMDlmZDg3OWI0MWQ4NWY2MDM4OGFhOGRmNGQ5NDAwMmIyNDI3Mzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJKSVZJalk5ZUJxb0VKMk81ZTR4UDdQbVl5d1pLRHBwSyJ9	2019-01-17 08:53:06.053982+00
hr6ynjivhwz2cicj2t7opanyp0zaivb9	ZTBmYWZjOWExYjQxNTI5MGUyMjg3MTBhOWI2OGQyY2EzMjAwNzJjNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJaTTJLSFBIM2pwYWlUN1dDR3duR2N1VzE0cG1vclRMcSJ9	2019-01-17 08:53:06.063861+00
k3nqg99oep0pf5aa0db1j3in05m09pg2	MjExNWY1YzQ1NjZjYTg0OWFlZTI5MTkyNjg0NzM2NGU4Y2QxMmQzMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJwQ1hCR1hCSG9icnBSbUFjQmVPS3ozS0xGQ2FFbmU0YyJ9	2019-01-17 09:08:25.55694+00
3k1vbjgiuxrhh09dggvthm095k1k678y	MDRiY2QxMjNmNmYwMTllMWYyZGVjN2IwODc1NWU0ZjViZWM5N2UwNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJTODNVOTRRZ1daeDJjclYzUHBJZld2cDdyaU5jcVVwaCJ9	2019-01-17 11:26:33.576433+00
7pxzhvvqcgqlfrn6rpyrpir51qrzd0ub	OGNlODQzZDE1NTRkZmFkNGIzZTUxOWM1ODA5ZTFiMmJhMzBmZmI1Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJkajNMZjNZdnFKcWo4TFc4M0xxNXlMajhucjl2cmdPQyJ9	2019-01-17 11:58:17.243191+00
92ns4ai2elfpqfvc1djirx141hq1aoeb	NjE0MjQ3M2NlM2ExM2I4M2U0ZDNmYTdjYzU4NjNmNzZkNTg4MWY5Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJvQzJxV0FDVmJyb2VZVDYwdDEwWnNyOUpHbjdyS2MzSiJ9	2019-01-17 12:43:24.201178+00
gqrbuhws5xsdjw22rotgm7om278xrsqf	ZGQ3MmQxNDkyZWM1MjIxM2YyZTAzZmViZGE2NjNhZGY2NWNmMTFmOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJYVE05a2VsTHpBVkVQMTh0UElWUmJROTlNeWFudktWYyJ9	2019-01-17 16:07:33.845656+00
t8oga99f30vbtltiqn4g55bgqx46nhbi	MjM1MzVkMTQ3ZjYzY2ZlN2JiMzQ0NDIxN2QwZWFmZDZjY2I3NjhjOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJsM1RFZUNQdjR4QWZkTjI4bUJ1UGhhM3l2d21CdmFURSJ9	2019-01-17 16:10:16.470253+00
o3gplc538bziqr3uoey2bkwalzajmwc5	NzM4NGM0MDIwZjIyYjQzN2E1M2FlM2FkZGI3NjBjZGI4MzY5MDQ2NTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJCZTViN0oyMVFHZWhBM0VWaldLaFNRRkRhRnRvZ1QwWCJ9	2019-01-19 05:41:51.601965+00
6lju34kk5u6swfig18my22fg2oczotvt	Y2U0ZGE5YmFiMjcyYzAwMmFlOWJiYjEyNGU3YTdmNTNhYWZlZTRhNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJDTGdkcHN0WEcwOUtIaTNNbWt4dTA2VjE0QUdwamRWaSJ9	2019-01-19 06:09:50.638871+00
kyxeczsr2gxjqhd9r78wkdw9pux6sckq	OThkOGYwYjZjOTcyMjM1ZGY5OWNmZWQxN2NmMWJlZGFlZTU0MzEyMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJmSXR0ZDVVa0k3cWFBV3N1T2ZGVTVrS25hZEhDNFdiZCJ9	2019-01-19 08:46:46.75797+00
1ohs3v253b88jz9rwdkzt5huhlsmd06q	NWQ1NjRhNGMyZDg0M2Q0MThmNjk5ZDk2NjFmYjQwYzA3ZmI1YTQ2NDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIxUUprdkh4czIyUTJ0WFplODNLblRPZkR5VDh5TVNwbiJ9	2019-01-19 09:59:46.422172+00
vn6gk4wjfgdfm5b5b0s17763muivqq2h	MzVjMzYzNmE3ZDc3MWJmMDA3OTBlNzc1MTdhY2Q3ZjNlMzMwNTRiODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJtZUt2VEFtNlJPRWxWcnFIdzh1ZzdLYkhKODRXcUlKVCJ9	2019-01-19 10:25:49.888565+00
syw0tz31jcab4yrqztq2xajilmbta8ug	MWU4ODJiYzE2OWM0MjM2OTAxNTVjMjZkMTY2ZDk3MThhYmIxZDUxZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI5U1FVQUZYdlR1Q3ZweEhsQzJFMm91RzVMN3FtbFlFeiJ9	2019-01-19 11:07:24.745105+00
oi08o5sjs0wevcal6npl94mkqc08peap	ZDYyNjZmODAzNjk0MTQ4NzRhMjM4M2ZjNWVmOTA4Yzk1N2U2ZmE1Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJwd0ZJUkJhQ0RZRTZlR3hGalpQclE1bTVCSTFmUFZWbyJ9	2019-01-19 12:16:56.653178+00
2y46s5b2k005bn25r9vxq4udeix249vi	OWFmNzE2NjEzMzQxM2RjMGNlM2FjNWQ3OTNiZjBlNDg4ZDZjNzVhNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJxTG5LMlZ3eEZKZk04UjVhQXBVcEdkSmVmWEJ6OEV2aiJ9	2019-01-19 12:46:34.225628+00
n2tdi7bo2vww458itdcymwjer55ggp8e	YWU3ZmQ2YThkYzFlZTg3NWVmODIzNDBlYmQwYTgzNzY1MGQyNzlhYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzcm0xWVNzT2FyNFhTbzNHOG1hV2V5Y2lTQVpGSGxtOCJ9	2019-01-19 12:46:34.242474+00
rggt2r64yfnendvznlm8j0uzmqodghni	MDZiMzk3NzBiZjAwNDAxMGExMGUzZTFkZmU2OWRhMzlkMDQ4NDk0Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJKYWpNUDB3TlNGYVlDWWJLOVRXdUcyTURvZGt4MGx6YiJ9	2019-01-19 13:04:39.397637+00
t95v4hd2s4lkjcud78qezuhtg5agbt40	MmEwZDRiY2ExYTk5NDhlODI5YzRmY2Y4ZDI2YWIzMWEwMTcwYTQ4MDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJBMEpwRlVJaGZ3a3hDeUFPYUxrT0s5U1VjbThEQUNOeCJ9	2019-01-19 13:31:51.780648+00
9qv37rzfaqazto3wmacy01d13f44za0x	ZTRkNGUwNWQ1MWJkZjA0YjNiODk4MzZhYTE2MWZhYzU5YTkwYmNiOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJZYlBmMFJVbG93blQ0dFJZM1RUbmNOdGNYT1dTR3RtbyJ9	2019-01-19 14:00:31.169475+00
62q7s05nhcxdnzh3ivqd06y7itgj2pj4	ZGIzMmNlYjM3OTc3Zjg5YjdlNzhmODQ4MWQxMjYwNTdkNDRmNTkzNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJGUDdYcDFVb09MbFVrWGxzanlBUnJmSTRHc1NLS0NEVyJ9	2019-01-19 14:25:41.940088+00
4gcakdobke3x6r980m2o2ca8s9eic0p9	NGQzYzAwODNlNjgzMzNkOTFhYzFlNWM1ZWJmNzY5NjliYWQ4ZDc5Mzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJpODRqQjhBYU1FdDM0dE55MURGazlvbzRvMklhNlE0eCJ9	2019-01-19 14:33:18.360067+00
fxtqe9w26terswa0gkonjzx9wdaq6adf	YjZiN2JiMjVmMDQ3ZjFjMTYzYjNmNmI4NWFlOTg5MTY4N2FjODI2Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ2VFJtYXRXQW1oN29mOGp6Q2tSUDJadEhoRVFaTXZFNSJ9	2019-01-19 15:44:43.581141+00
fellj2pyv7hqdq85mctvrc0wz73blaun	NzExMjIxZjkyNTA3YTc2ZTQ3MjBlZDAxNzhlYzc2ZTM4MzA2MTBhNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzSzRRNlE5TWlSSUNxYUdpNmZhZEdHbTllUHF5bllSeiJ9	2019-01-19 15:44:43.590566+00
o52po8xqpml404cgv4w5cxx3iqkl36eg	YWFlMmYyZjQ3MDlmYTA4ZjdlMzY0OTBiM2QyY2RhYWE0NDc2ODRlNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI4YU43djU0QThEWDdlZU1DQjlOWVdmVWx2MXhLMmY1ZiJ9	2019-01-19 16:56:27.048489+00
p66jdk16sxx6tjaxbg5weeyw7312gsbq	YzkyOTU4NjdlNzRlOWJkODUwODdhMGY1NjlhYTUxZGVlMDgwOTNmOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJWd2ZHUmVLNWpVVm9HRHJaeUtjcjlrelA0UEtaSjVXdSJ9	2019-01-19 18:11:24.693324+00
ta9fuqgv59vjjun5mixbvuaxx5pt1y3y	MjFkMjQyZjRkNWY0MWMxNzJhOGZhOGQyMmE2NjBkZGFlZTE1YTQ2Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJwVWZnS0NEeGdQTGczazdNQUg4YnhyUW1yRlZlVXpPOSJ9	2019-01-19 18:25:26.897161+00
i2bvabbeyznabn7xue95s3f956dlvffy	MmVjMjA2NzU4YzcxNjgyYTBjMzM1YjQxMzZhOTZmNjRkOWY5YzUyODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJGcTRrc3pSRlNycnNUeTRJR09Ed0lJTUpNaTROUWNOcSJ9	2019-01-17 17:28:07.393172+00
h4q61c0lst54ufi50x10kdmubaxx3n8g	MjM1N2ZjMjgzMTI2NGU4NzE5MjQwOTViYzZkOWM4MDlhMDgwNjQ1Mzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJSMmZialZKZlk0T3ZXUmJPMlhDM2tsd1NXR29kcTJtdiJ9	2019-01-17 19:52:34.575096+00
23hafqsn23p9ce3xjeol4b33cuarg4je	YTFhMTAxMTNhMTE0OTUzMTBkZTIyNDI3MmZmNjViOTRhMGE5NDQ3ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIyUXpxQTd2dm04NHpjZmVRTm5vaXZOVkpjOVFXUnNyYiJ9	2019-01-17 19:52:35.144787+00
ogc0miq5hi7kd5al82eic95h2yfxugmz	YTJjYmJiYjA4ODAyNTFkOGJlOGZmODE0ZGRiZDc0NTViMzkzZGE5Mzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJsWkZ1RG5BemJvcHFyTko0ZnFmQkh3ZmN1eTUxNGhqZiJ9	2019-01-17 19:52:35.609794+00
1xcx2g9ml27517avep2bpn0njyhdo5s1	Y2I4Y2U5MWM5YWYxZjhiOTFjYzQ0OTMyNzI3NTIxY2MyMWM1ZjIyZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJMR1M2NjJaaEo3TzFGb2IzV01FaG5Kb0dvZURXQXpaVyJ9	2019-01-17 19:52:37.718836+00
j1a4dyebnvle8kgepphtynfy9yo0mt88	MmY4ZmQ2ZGZlYWU1N2JhM2RkOGM4Njk3NTIzZjY3MmEwZGI0NWRiYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ3QmNsMU5iWDRzUEhXYzBXbXhpdk9jdzRTWEZiWkVLWiJ9	2019-01-17 20:22:19.860283+00
15t6lh96wjd7rhv4jb1zuy49mfdj7uis	ZjQ1NzhlYzE1YzJjZTY0MDg1OTlkOTg3YTY3NTYzMDgzNTcxMzJmYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJHRGNwMlhFMVZzQ2lzTVhzU3p2d3RFaXN6d2gwWm10SiJ9	2019-01-17 21:08:34.726544+00
iir6uq0nxnh1qtjx259ha92pndl714gi	YTQ0M2UyMzFjZDhhNjZjMWRlYTU4ZmYzZWIwY2UzMzk4MTRlMjFkMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI3Tm1KRkVzYkI1VGNpa1VFV0I4d28ybU5PaFBVa0hrNyJ9	2019-01-17 21:46:59.464807+00
obd406bx9bf8tqre1rv1vmon3kztz4b7	ZWJhYTQxOTRkNDhjZDE2YTgzZDUzZjdkYjc0ZTA4MDk2ZjFhZTMwMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJjYVc4ak80ZW03aUJoc3RRQ2RXbVVmaklOWm40VHVOeCJ9	2019-01-17 22:12:03.204291+00
mocmqy912ywdstosss4xi499bu249ezm	MTcyYTRiOWM5YzdkMmRjNzYwYjdjNDcxYzgxNmY0MTYxOTNjYTQ1ZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJmWXNtYkQ1Nm00QVBuUWtxNm9CRjJBY09oYzNGUWhkdyJ9	2019-01-17 23:01:38.230632+00
nfk4wpe45m92rkqywr81jfmzu4y0u3bv	NDY4ZjllNTdiMTIyNGEzNGFjZjUzOTgwNWQ2Y2RiYjE4NTA4MDliMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJjUGVWa2RkMENIQ21sZ3hPcmUxVURpS0dWeUoyMlRBdyJ9	2019-01-17 23:16:18.738524+00
c4dkzzr3qzxa11lnrm351r3upjep2hgn	MmUwNTRmMTZiZmExNTc0OTk3NDE4YTE3NTliOTE5M2QyYjZjMWJjMTp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ1MUVEWkVsc1E0RjRFeEFEaFRqYWJ0TEd3cVdGUWUwaiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-01-18 00:26:48.943196+00
ttr8kgi6dr6p09w42vcarlfw4kmz42ok	ZDY1YWMzMjc1ZDVmZjZlMDVlYWM2OWU0MjM0MGEzM2NkZDkxZWVmYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJwN1BYRE9yVTlHWWlTU0dYbHd4RGwyOUdGbTF0dWJiSyJ9	2019-01-18 00:28:09.439894+00
vmmf1dmpjhew2ye4s1hzjsjq6s0yr4a2	YzFmMjg2ZjQwZGM3ZGI2ZGFhZDc5YzJiYjgwM2M4ZDY5YjA5MTMzNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJWbldTM2FzVkpKODVJVkJQalZCaTd3NlVUVmFId0ZMNyJ9	2019-01-18 00:32:32.333038+00
r3942p8b7lk97w2wuydv5rpgkf6wk92q	MTFhNjEwNTUzYzg2MGUwNjllZWNiMmRmNDkyOGM5MTJkMTA4NGRiZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJGYndaVWRpNnF3cmpSOWJ5UTB4YXRKT2FBeXF4ZzNvSSJ9	2019-01-18 01:15:46.748035+00
jf6j8mbzc6jfolmnk2ywm7udjfy93ns8	OTQzMmNiZmVjNzlhMTUzYmQyMTBlNWIyYjI2ZTUxYTZkYTQwNDliODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJmVE80d1NOZFVLWDNkc2xNUURLTmFSNW9qM1JvR0ZDViJ9	2019-01-18 01:31:09.320238+00
w3d2r0u0rzrlcjl21yuyq35hay1ilhng	Zjg5MTA0MmY3MGI0Yjc5MTY3OWEzYWNjOWI1N2YxMTY0ZTIyNjdmNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJMUDJNTk5BMnpoY2Q0RnVSTG4zZ3RlYlJFalk5STU3ZCJ9	2019-01-18 04:01:15.007044+00
9i84sxt6umvh9ssr9sfqdpyuvfjtlcym	ZTJhZTUzZDFjNDliNDI2MWRkNjIxYTAzNjQ2YzlkYTZkOWE0MmEyNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI4cjFTOUZ3cW5NTlA4Qm5PV2ZsQzRvejV6QnM5UjNQQyJ9	2019-01-18 04:13:41.766299+00
245b5657ovtkrbragm01umuoqzgedacd	ZGZkMzM0ZDhkY2NkMWZiZGYyY2ZjM2MyMTk0MDJhZjk2YmRkYWMxMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJT2x2dHY1eExPM3VMem5Gb1A1bUtlTnFsYUN1d3pwSyJ9	2019-01-18 05:35:03.365174+00
myw67n4cl4lzopsi5tvvqht3c130zvrw	MzM1NmU3MmUxYjlkZGIwNWU0MDkwNzhjOWJmOWY1NjE5YzM3NDE0Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJCTE5HTWN6cFVuREE5Sm1xdjF0S3RqejRaUUdHZFpYSyJ9	2019-01-18 06:04:04.674577+00
p5uimt7tgz1so2ijnwd1x8walvzgl46l	ZGI3MzY1MDEwNmMwYzY2NjZkYmRjZjc5ZWNiNzc5ZTMzNmQwNGEwMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJKNFh1dkQxYnVOREIzZjFQdzJFZmZndzZZaEhRanpqaCJ9	2019-01-18 06:30:19.909664+00
gmau61sz8u8te925lbjix5jnf08suw00	NDQ4NDVjYTU2ZmZjMTY4NTI1NmI3OGE0YjhhMzlmZWE1ODM3YjljMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ0bFBiRXN2NTNoNTV1MWs0SlhIc3lndnlHcVpjNW5MSyJ9	2019-01-18 08:10:03.694705+00
u5dq3i2hcxbw7qy7vuufbs59s19q3jxx	ZWMzZDkyMDE2MWE5MTFlZjFjY2Y1Y2VkMDcwMWNjOTkwNzliYzE2ZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJWTnVGcW4wN05pdlV5c1JsYzhUaTJSUGRUUkFzbnhDTSJ9	2019-01-18 10:34:09.571618+00
fhs9zfhmqs61smei925y9khirrfnx7sx	ZDVhY2FlYmI1ZmQ4ZDc3MWQ0Yzk1MTFlZDcyODcxNDUyZmIxMmQ1YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJpYW11TXk2WmVMZjQzNXdOSll2Ykw2ZDFjbnZqMzhtYSJ9	2019-01-18 12:02:00.17033+00
hvlej6niukj14ms7ln4y3v8txpkqoap7	ZTE0Njg2YzNhZjk0MzZlZDIwMmFjMTgyMzk0NTY3MWUxN2ZhZjc0NDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJkSHZ2aFBhVHhyNFEzbm5JV2dnQTJRWkl3WmRTaHo3MyJ9	2019-01-18 12:14:15.765157+00
5ei70x1u7hmcmpa5cotkmgw2mhbqm55t	ZjM1NmNkNWFkMzRjMWZhNjZhYTU0ZDk1OWI0MzdhYzJiZDY1YTI1ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJOUGNSS25VS2hwMFBVdmZVdGZZcWFEU2RXVHVHN1VoTCJ9	2019-01-18 16:36:22.432769+00
y68tqw3ouoyowqd4vr733rz6037g7bg6	OGQ1ODBkY2JjYjc0NjEzZTQzMmNkMzZkZDY2YzExNmNlY2JhZWZjMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJlZjNockRnS3JaRXBWUEYzREVEYnNBRlhLNlZuV29NNiJ9	2019-01-18 16:44:10.848817+00
owpamhufmaxowen10tklxcr1vpokvhbo	M2RlMDJhYzJmNjFhODQ2ZmRlMzc5ZTg2MjUyMTZhZDFhMTY4OGU0Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJma2xPWlJ4RnhGWTl0RllDSGtqaGNrNzEybkxNYXFxbyJ9	2019-01-18 17:17:17.602134+00
i6q0e2ijjct0yd63yr2tnlriikbry4lc	MjM3MGI1MzllMGMyNDExMDQ3ZjQwMjgyZjEwOTlhZThhNmUwZTk0NDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJyWXZLRUZERGt1RjM4alFINW9NbzVCWjY2UWd4aHNVeiJ9	2019-01-18 17:30:22.010958+00
cv8tu8kt2038a59refgi6tjulnbzhe0r	M2MwODIxMjZhOTg2NTRiYjk3MTk4NjI1ZjNjMmQzNzYyZThiNzg0ZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJZMTFjV2o0Mk9WMFBUaUU0ZjNuNkVVd2R1WkMxOTNzZSJ9	2019-01-18 21:11:52.399904+00
nsfzhpuiarizzq3wrtj9jvktzlgpjey0	NWI0ODRlMTdiZDExZTY3ODE5YjM5MjYyMmYwZTc0ZmFjOGU3OTIzMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJnOW9pdnJsdk42YWZXSDB5ZzhVcG1mQ0drVmRCYXdYSSJ9	2019-01-19 03:45:27.23907+00
sbseoodd96y76flezr5su2dhh8smcq7m	ODEyNGI2OTY4ZTc3ZWRiYmE3OTljZDdhODI2ODY4ZDZkYTA1MGQ1Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJEWHlPR0lpWmdRanBsdldnTW5TUVJwVzBkNzQza2M0dSJ9	2019-01-19 03:46:06.39239+00
mfw3g19qm54w14yjup2c2oy6x601tcb3	OTJmZmM5MGUyMmM3MDgwYjkzNjdlMjBkZDgwNjY0ODYwOGM3NDc5MDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJxc1Q4eUwwaEJkNUw0dzZ5cmQyV1c5cjYxelVzU2dPNiJ9	2019-01-19 04:23:40.823712+00
lrx7uxhwecp8cf1fnafhtwb8okgibeif	OGY5OGRkMTZmYjAzNTAxYTUyMWUyMTdjYWE5Yjk0MWM5ZDFhN2VhYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI0dVA4ek4xS293ZXBYSXUxTUpIY2RPNEJkc3BySkFJNyJ9	2019-01-19 04:44:46.989636+00
zh10mdhrooxb73sbzbl5tubyj9zzlk0v	NzhkNmQxZDVkNGI2MzUzNDRlMzM4Zjk1MjgzNDRmNzI1ODI1MjBhYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJKM293NW1YbjFWdktHaVVobE5mcjlrVWdaRm5ZcjFINyJ9	2019-01-19 19:32:50.153877+00
gpjlssh7lsqu3pbfyhexgu5b1v26cfjj	YzkxMDhjMTVmYzFiYjAwNGE1NTA2YTY2ODcyNDEzYjk4MDc1NTRjYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI1clV3bjU5NU83bklhY2xxb0d0V3hnVmlvWFhocUU3TSIsIl9hdXRoX3VzZXJfaWQiOiIxIiwic29jaWFsYWNjb3VudF9zdGF0ZSI6W3sicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIiLCJhdXRoX3BhcmFtcyI6IiJ9LCIxdmRLUEZ0SW9qVmIiXSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfc2Vzc2lvbl9leHBpcnkiOjAsIl9hdXRoX3VzZXJfaGFzaCI6IjM4OTQ2ODcwNDQ4ZjQzMDdiZGViMzg0ZGFkNmIxOTllOWVhNWMwNDkifQ==	2019-01-19 19:44:26.872173+00
arqszar1zhvfbg9tkb24pda3vd23mb9k	ZTM0YzYyZGMyYmE1NjY0YWYxN2RmNjZmZWIyYTdlYjIxYmJmYTg5YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJQZ21KZjdOakVCUWFMTThWc0QzZ2cwV1g3dHoyOWRtciJ9	2019-01-19 20:03:35.172122+00
d1w977xb6ggrs24ak4e4imaeljyyxxco	MzYzMmIyMzM0Mjg0NmZiNWVhMzNhM2M5NmU2MDM1NzYxZDE2NmQ4Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJSS1hOMTY0WXU3RkFYVGpNcnRVb1VRdHk5UzBqUzFqMSJ9	2019-01-20 00:08:14.582917+00
qtxv2x5cuj2gc06ipr056vbcfjlm8rjz	Y2I5YmFkYmU5NWU3M2Q2MzZiZDYwZmMyMTQ3MjI1NzVhNDNjMDI5NTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJMaEc3a1hkaFNjZ01NQmlHbWRCaEFlcDhrWmxibHBEdyJ9	2019-01-20 00:51:22.897993+00
c358vqmojlkzzreri2p9na4k79q8q9ow	ZjFiOTFlOGY3NjQzZGFiYmY2NzhkODAzMTM1MzI5OTJlZTYzMDc5Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJrc0hud1BpakNnZktZZE9wS2dDV3VGOE1NRVg4TXBNViJ9	2019-01-20 02:49:43.125309+00
kfmflxm4c77meazilgw2x1uhvhwmjggl	NjA3NGVmYjA0NmVkMmZhNDc0MGRmZWFhOTM3YWI4Mzk3YzNlNGNiMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJRSnBBN3JDbnV6SkFVcjVheWhhOE51WmpSbHFxOWdKbSJ9	2019-01-20 05:32:58.519529+00
nmuyt2cdw9i665k3csv82oc36d4m59uu	YjEyYzAxOTQ2OWQ4YTFjMDY0ODBlYTRhMjdkMTRmM2JhNDg3MGY0MDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI0UHY4U3RLUnpsc0RIb0R1RzByM25IdnM3RklsOWhHbyJ9	2019-01-20 09:05:19.441761+00
4f2ba7pauez8s9fjhfu7iy4jvogu5i0x	YjMyZGUxYzI2YWU0YjdhMzYzMjE4NGRjZTIzMTQ5MTZkMDI4NjFlYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJFVjRSN0FZY2ZadjRyUWVqMkJyY0wwcm1HU2M2aTVwNyJ9	2019-01-20 10:14:40.86386+00
if5g08wr9u0o41uamr7p9npmun83dtvm	NTgzMGM3YjBmOTBmMzBhODAxZGQxMmY5MjMzMGYzMzEyNmJkN2IyNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ2OE1WYWI2MGNYaTRRTE1FdTlTekt3a1ZFSjhIdzJReCJ9	2019-01-20 11:42:20.552478+00
82pyumb7u90mgzwdoelmqxte0njbk730	OTI4YWFhYTU1ODRiYzBiMmI3ZTViMmM0NjUxNDA5ZTQyNDk0ZGYyNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJtUzVBRW9DaWM2WW1TZGpJZG5FeFdybjlyRWhDZUsxWSJ9	2019-01-20 11:54:33.032704+00
jmovi0kk6hhecikf728hwq7qjhnosx4w	ZTY3NTk4ZjQzNGI5MzU4Y2UxZWVjYzJiMzg2YTk3ZTFmYzMzY2QxZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJsaXgwYUU5cHQwakdmR2hYQ1lnajZ0SlRJQTFjNWV6WCJ9	2019-01-20 13:22:29.065502+00
4jpjgaxb4frm11u0gpap9kdalncs91mn	NGU3MWU2NWQwZmRmMGE5OGZmMTYxZjgwNzRhOWEyMWQyODk0ZmI1Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ4bGdpQWtCSUltaEI0UERnaGNENno5TTRtVFdZNXpiNyJ9	2019-01-20 13:43:29.033665+00
h9o56zrbhgkqx8txswqdwwqb0m31ffax	MTQ0NmU5N2YzYTEyM2I3NzllMTVmMmI2OWViMmYxNTYzNDlmNmYyOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI5aUlVdlgwWEFsSTlJTG5xZEpsZU9aNVdWY2dXUzhrVSJ9	2019-01-20 16:00:48.870758+00
epibx859yi0dp3u1h08inacz2pz7wz2e	MjI5ZjYyZjk1NzNjZTUwZDA4NWJiNDFhZDhhYzdmNjNjOWFiODg4Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJHcFljQUxYYXpFd29qRkZwZUg0b2R1R0lGY0VNNXdVZCJ9	2019-01-20 16:07:55.599935+00
2qju2hc3hxs11roxp5670akcpoo9b9zg	ZDA0YmY4YTNhZGJmMjEyNTRiNWQ3NzU5ODBhZjljODMzNWVhM2VhZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJBZDdjUGZ6cjNFVTV2R29YdWxuaGY5QnltbWpSekMyYiJ9	2019-01-20 16:51:59.777239+00
k7maw78ehaxu85fph22hmgmo2arjor98	MmQ1MGZmZmIyODNlZGFhOWNjMDY1OGViNzRmNzg5ZmM4ZTAzYTkxMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJjbTV0eVpDdDAyaG1BVnZQNFM4NkFjdUVINXlHd0tsSyJ9	2019-01-20 17:16:11.099597+00
9glhytaeo2k3nv59kuqd8fhb0rsdnymg	OTc2OWFlNTBhNTg0ZjI1NDQwMDliMzQ4NzE3ZDIxY2NhOTA1OTUwZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJVb29UMmV5a0V3bG05cmdXYUVTczlJeWJHY2EyUGpWRyJ9	2019-01-20 17:16:14.923767+00
qhlvztpev9u139r0vlks8c73mfr2chpr	YmVmZjFlMzBlYjVmODdlYWYwOTlhMGMyMjc2Mzk4YjM2NDRiYjczNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIxTjFFQk93Y2FjRVZ1Z3FCVDRFanhRb2xXdGpybWZxVCJ9	2019-01-20 17:45:23.092755+00
i6vky3tlfcn5jh8uyp6aolwkemibw5xb	YzUyMTI2ZDRjOTIyNTcyNGRhYTQzZDllZDQ5ZjRhZjRiZTViYTcyNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJuN3hKRTVqYWtxM1RaZllyT3o0MU9tVWIxbjAzNE9VaCJ9	2019-01-20 18:05:27.978281+00
xdzs6q3qeeza17v4rw3losvzouoqei4n	OTllYjFlMDdhMTQwNzE2ZDZkMTY1ZGE2YmY5YTkzYTExNmJhYjMxNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJnN2JVRjlSamxPYzZTM2Qzc1Y3eXZ3eTFFY21WNGpmbyJ9	2019-01-20 18:27:27.863621+00
rhn02z2ffmrs82cr16sg6uqw81elm3n7	MGViNGU2OWU1MWI5MDlmNjQyMWQzMjc5YmVhZGYzY2E1NmNmZDY0ZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJwcDJ2ajJqSWpMUU1qQ25vekZjTW9qZkdBd3BzVUxKYSJ9	2019-01-20 19:08:47.316032+00
x6xgpfdsf32ggjyl7ebhzqzf8bt4opzs	NTc0OGUwNzUwMzVmZDA1ZGEzMTg2NzA3YjNkYjkzZTY5OTQ4ZjYxMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJYUzNsVVZEbmEwZWdvU0l2MklxU2NFalIwd3ZjeGFGeSJ9	2019-01-20 19:30:32.284857+00
lqsr09an4i334loihls2ra3pimr3nsiz	MDA1YzZiZmY1MDZlMTRmYzBkNGViMmE2ZDNlNzhmN2JkZGI1ZmUzZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJTm9Mb3FFWlBBWVF3NEYxbHdrQzNwc1drT2NLYTN2YiJ9	2019-01-20 20:47:30.821654+00
1r4jd73bux9fqvpg7ywzi1n7cdru8fle	MmRkYjhiNjhkYzk5ZmE4YTI1MDIzZjVjNTQ1NzJlMTc2Y2RmYzQzYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJwQ0NvclNZSWJ4YzJEOHg5YVY1dmFmaG5kckNLZW5DbyJ9	2019-01-20 23:04:04.361458+00
0wnq2aio1x6fth38ehkyc192kk9p3ldr	YzNkODRhMTNhMmFhMWYyNzRmYWM3ODc0OWVjNTM4ODVjZTQ5NDY3Mzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJER3oyaWpCelhJQkFWS25zcjVSRmtVOTVxb0VYaFIwNSJ9	2019-01-21 00:10:30.916958+00
p5b2fa7naih7y10tupezjfiusj76fing	MzE3ZmNiNzYzMzY4OWQyZjM5ZmZhZGZkM2FhMGYzZjAwNjA2ZWM4Njp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJMOTQ3eHpERzEwbmlsNXVncVhJVU1wejRLeDBobjZQVyJ9	2019-01-21 00:11:09.959999+00
acyiswifdvdb5b9nr9uogmkp18n4cpr4	N2JjZTgwMjk3Y2I2MjYzZGNmOTA1ZTBhN2VlNjlkMTU5YTUxYzQ1Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJESzRlbmJyTFQxVFlzYWZLUGFuSWxuNkV4aGdkTUZ2biJ9	2019-01-21 01:29:19.445513+00
rn6trn4urxqfl9ddax6yjfixgbgb3td1	Yjc0NzAwNzU4ODUzNTkyZTc0MGUzZGIwN2FjZDU5YzI4NjdiN2FkOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJJSFlhR1l5S1pLemN4d05uaFhIVVpUaGlRc0hMdnJNTCJ9	2019-01-21 03:45:04.607278+00
tmj12ozyaw398kqiv2c6vre9f7vy68tq	OGZlNjJiNmZhMDRjYTVjOTU5NmY2ZWZlNTgwMzdmYjkxOTlmMTJkNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJqRnpNTTYwbEEwN1dYVlFDQWQ1Rk0zQXRkMTZYSWZ1ZyJ9	2019-01-21 06:02:16.682107+00
xdns0vlchk9xi6mo1ilkndntqhzd413y	OWY4YzdkYTJhYjUwZDdkNTkxZTcyYTgwZDczZGVjYzgwYWMyNjU1Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJFUjlXZEwzYTlkMzN6WVVSZEgxTHJ2cXFsa0piT0h0SSJ9	2019-01-21 06:36:54.820554+00
owb6wyeoaowfhacymfkc42v418dy31qi	OWYwN2E5ZjA4ZjI0ZjBiNjZhN2I0ZDFlZjJhNjgyMTQ4ZTY3ZDI4Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJEanVvcWtjNkY3V0lmVldmcUVhOUdEM1pibjFYSlo5YiJ9	2019-01-21 07:02:06.510922+00
f4b8ov165bdwb7z38peyu6wcwf3bdttu	ZDc5ZGY5MzUxZDczY2MyODMwYjQzZTA3MjU4YWJkNTU0OTg5YWViNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJkeUFnV0ljdnVIdHZvWHBJQktoem9kcUFTcFhGVUQ5YiJ9	2019-01-21 07:10:17.219841+00
p16rhte6xjo36jon57gl193qm7700ebq	MGQxZDk4MDBiMTEzNDg3NzQ0Y2M3MzdhYTIzZTRjZjFjMTI3YWI2Njp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJsRFFpUzFmM0c1WGtMTExIc2tmNlZYb2VaMHdVVEZTWCJ9	2019-01-21 08:46:26.390774+00
g8lx484upelggj0o3rehzesu68o9sba7	MjQyOTI0YmJkMWJmNDMzNDdlMDEzNDcwYzQ3YjBjMTYxMzI5NGYxZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJINTdwdXkyaUJZWWZZa1F3dmZzWlFKc2ZvRldCeWtiMCJ9	2019-01-21 08:59:59.46727+00
6nga3byt6s9k4mo861aketo4zn48swf0	YmJhMDIzNjIzMjUzNzJlOWVkMjVjYTJmMTg2MTJmY2JhNTVmYjJiODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJiRFlSMDRkb1lqMG1BMGJISEZ3THRlRWVQMGk3Mk5mViJ9	2019-01-21 10:06:46.507303+00
5857xw9u1frckn811ux6v8iefmwnpa3f	N2E2N2Q4MmY0ZWY5MjM0ZTgwNTNjYjhmNzhhMWJmZjFlNjVjYTE0MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ4VVNYUjhuRzBzbklOYW5SYjdRQjN5QnlTRUJnS2wzUSJ9	2019-01-21 12:33:00.050417+00
82yin6l23mx9eujvyruafjc2gxl0trsr	ZDVhNDQ1YTBkZjQxYTEzYmY1NDYwYmNlYzFmMTBkYTE5ODcxMWM3NDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzSmRnU2s0bFBPcmlSVWgzWkFWM1d5NG1nV0hCVFBhdCJ9	2019-01-21 12:33:13.821523+00
p3u6jcur6fxju55kecd62vo4p7muq6xa	ZDU5MGI1NWExMWYzOTA5OGI4YzIzMzA1N2I5YTY2YmNiNjI0Yjc5Njp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI4cW5SZElGSlNyUlJ1WlcwZGVhdFBvY2ZYTms5c0ZqRiJ9	2019-01-21 12:33:45.609478+00
iv15jlp8smvjw98g29jnq9t10g524mgr	MzlkNTlkNzJjNWNjYjQ0MWEyZjcxN2Y3M2UyYjNlOTM3YTkzZGRkMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJXOERrQm5pb0lDWEo1NVVNTGZpTVpTV1NEQzJvZE9meCJ9	2019-01-21 12:34:03.476721+00
3pube6abxiu89kbnebkv39k6rd471c7m	NTEzZTIyM2NiZDhkZmY0ODNiZjJmNDUyNmM4YzUxMDg1NWY5YmExNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI3Y0lSczVuU3czMmJDMWszQ0lDZnVRclV6R0tFOThXayJ9	2019-01-21 12:35:23.00896+00
n68pb6pzin9t0uqwk48o19427odg1ww6	MGVjYWIzYjI1MTI5YTczODM1YzdiMmUyM2I0NTlhNmE0NDM3MGRmNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJHcDRrTEpEdWlLd0tUOGJqTzNtbzgzclo4elZDeXEyeiJ9	2019-01-21 12:35:36.827322+00
76j56vm4ekomis5u7jtg0ozcsmxekqa0	ZmU4M2U4ZTdlYzQ2MDZiMWQxZmJhYTcwY2Q2ZjViYTNlNjU3YmZkMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJWdUtCamszckJPS0ZHdUIyUXRoQVlmWGphSkNobkhEMiJ9	2019-01-21 12:35:45.077144+00
vnb7q4yn2889sd21ugt1i5yy66485dls	NmQ3YjA4NGRlOWMwYmZhNDdjMjMyMWVlOTliZGNkMDkzZjY5YTM3MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJHVW4zUmFxSzA4eUV4OXM3YklpbERjSjV0V3JHMkRCUyJ9	2019-01-21 12:36:04.616277+00
bgbjl437pbny6d1vqmwkkeuh3eivsov8	YTk4MWNjY2FmMGE4MDg3OTA3MDRkZWQ4NDViM2Y3YjgxM2NjNjZkNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzcXBJNGd6UFBXUmFhbFg0Sjh6UHBVcHBvY0Y5Q3NiZSJ9	2019-01-21 12:36:11.305253+00
jy3o4f4kq3ptyx3ahv9kfayjimz9ebdq	ZjZkNzMwNzA0ZDFmZTM3NDg4Y2M1ZDA4NzlmMjIyMmVjN2MxMzhjOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJZNERHZTZyZHVMY0NVaVhaZHJyUHJNZWRtbUZselBiUSJ9	2019-01-21 12:36:16.515876+00
7no0rh23td2fwe1b28o2wxn9ie5bls87	MWExNWM0OGFhZjI4OTVmYjUxYTAyYzU4YmQzZGNjMTcyNGIxYjMyNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ2d245ZWZPR2w2c2FvT1ZUaElrUVBDVElCcmxSSVN5dCJ9	2019-01-21 12:36:31.818417+00
1gf0v2dgr3llkcfsdmdvdegw5hu8ywxu	ZDYzNTFhNmZhYTMyNDZkM2EyMmIyYmQ1MjA4ODUyNTFlYmI0NDE4Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJFc0x5eE5VNEhyallYTjhFNUJQNGg4WTVENFN1YzlwbCJ9	2019-01-21 12:36:55.459656+00
i13m59ioy1zxdio6se56fel94lv2b0tp	NDI1YzBlOGVkMmI3ODM3MTViMGExM2VkNTM5MDAyYWM1NDNhNjZmMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ1dlFZTGU3OUFnWGJ4V3JNc1o3ckNxYmNvVDJwRFQ0aCJ9	2019-01-21 12:37:25.058979+00
5pn61c7jvw6yu15zkgs34o072s9klgyk	MDM1M2M0OWMyYjQ4NTA4YTYwYjNhYTFhMjU2YTNjMTY3YmVhMDI3Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI4aDVxVUxQODFIcWFuWHdqVVJ5eTlmb0RybEpLSUgyeiJ9	2019-01-21 12:37:56.202086+00
m3g052vi75gb9udo8aqi1srm8bzzh1dm	NmMzYjcxZjNlNDAzZDEyNWJlMzQ2ZTkzZWIwMzMzYmFkOWVmOTFhMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIzY1dhVG9IM1hTdGFwYmZvdEptYXNrT1pqYjNCU0hOOCJ9	2019-01-21 12:37:56.804082+00
y0bj4vnfiwcp3yiqfcsi3wmacw60c5od	Njk1Y2M1OGNmODNjYTdmMDU0NTQzYmU1MGQxYTg2YTU1YjYxMWZmYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJNV1ZjRnVSU1NqM0RBU3hFRm9EMndOWUJhNkFCdWh3ZCJ9	2019-01-21 12:38:00.655979+00
fax5hh3i6aqbhpaba5bvycuyd82o3227	ZmUyNmU1ZWNkZDBhZjM3MzZiZTQ3OWJjYWNmODRjZDM4NTM2N2Y5Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ0MXRNb1lpTEZRR1lVanllelBaeUlPUllKQTNhcUU3OSJ9	2019-01-21 12:38:14.450987+00
s3cg5dns1038hkj5s5otiyhvlemwd7ck	YTVkOGM3ZjIyMDJhN2VhZTU5OGE0NDZjMzYxNjViMGMxMWFmMzE4Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJYblNRaFc1TlNrbEtvTHBlRzNneEdyNkx0NENyZjUxdiJ9	2019-01-21 12:38:26.602867+00
4sdn9ab0trv0iq5h8raqzwotxjr5bzi9	MTQ2ZmFiYTBmODg1MjRhYzljODE4NThmODAyOGUwNjk3ZjEwYjQ0Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJZSnRWR1JxVVJKckpHVzFLWlVZUmV3V0kyb1VTWDB6TCJ9	2019-01-21 12:38:28.961644+00
kn3clv7ny4thhw50ky7skfm5f0fk96dt	NTBhMTM0OWIzMmM3OWQ5ZDA0ZmVmMDc2N2ZhMWYzNTg3Y2Y3NmMwOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJRcWRLTjVCMnhuV2dzZ2VmbnQ3Y2xveUw2azhlY0VEaCJ9	2019-01-21 12:38:34.561604+00
mmakb7e4e0ijz8d125u8paikkqa13ukb	MmVlYTg4ZjFlOGU1MzhlNjI5ODdmYmM4ZDMxOGY1ZGM2ZjU0OGQ1Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJRMU0zT05WQzVBRmw3OXFpRUFKcE00YnV4NkVKY2VXZCJ9	2019-01-21 12:38:36.890928+00
6yqbgupyu09d7ejetdx3pyht9lx7xqgk	OGMxNmMwYjgzOTFmNTQ0NjA1YTI0ZDgwYjRmMGI0Y2Q5NGZlMGI5OTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJpYnNCdUJoRHVMb2xPWDdwbUgzY25HOGpOOW5iVURVZyJ9	2019-01-21 12:39:27.741028+00
890uvwtiqrcbzm6s6lb9wddma51475l8	NTMwNDc2ODAxMjM2YmY0NDBhNWZhMDIzYjYzYWNiNGU5M2Y0ZTM4NDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJjUnhQd0xXM1poRkFQRmFsUXVUa1BCaHlPd2NQeHZ3ciJ9	2019-01-21 12:40:28.238166+00
8a8fj0dnwiykwueq86p7jiq9z3b8hesv	YTQ2MjZkMzEwMjUxM2NhMzU0YjU3NDcxOGE0NGQ4ZGE3NTRkZTIyMTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ2Z1cwbnR4TnhyZ1gwSzdIZFUyeGhwbGdNdER3dlBnOCJ9	2019-01-21 12:40:32.563339+00
2q0kmod09dlbddhcjk84htpy9h6r3z6d	ZWZkMjNiNzM4YzQ0Zjg1ZmFlMjc3OTc2NjE5OWExNjdhMGIzMTg1Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIzbzFPRGtRblVTZVlySTRReGtnVHIxSzlvMVF5Wm51TyJ9	2019-01-21 12:40:39.29385+00
e0a1pun87zakia4p6y1axzkbtfnhl3xv	ODBkYWQ3OTIxYzdlOWRkZGZjNzIwNDIwZGQ2YTE1ODdlOGFiZmQ5ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI2ZDVnU0NQNWJWUDVVRXgwSVZwWkhWTUdKaEYxdGVCQyJ9	2019-01-21 12:41:23.571192+00
4lse7yl5c6vblhwh2b9tgiekjo2vz4b9	MGZmNjlmODU2NmQyNjg0ZTIxNGIwNjNhNDY5YTc4YjQ5MTFjZWI0Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ1MlZlRzBxeXNreW9BVVJNSk14NzQzekR6cHh1bHNOSiJ9	2019-01-21 12:41:41.156542+00
2mj0v0d6064vbe3j0cq77nue9utp0fh9	MmFkMzg5NzM0ZGNmNzU0ZGEzNzdhMWZhYjMxNzVlNmZlNDhiYTRmYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJiTkY1V0RwS2JkYWxncU96SGF3ZnAzOE1kUmhFMWd4YSJ9	2019-01-21 12:42:18.746342+00
duptowa1k98esbnfiil960vv4hbax31i	MWZhYTYzNjJiNzIwZmU0MDgzMmE2MThjZWU0ZjUxY2I4NmI5ODlhODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJHZEJKSDZiQWJoU3g2SEJHY0ZXeUYwZ3BXblJkRzJ0YiJ9	2019-01-21 12:43:24.604869+00
2886phzk5ykif6t498yzmo8bth4eyock	M2U2NzQ1YWFlZmJiNjFhMDM3ZWY1OWM1NzRiOWQ3MjA1MDVmYWM2Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJmZnhKREE4NlNFT2EyUUZLUm0ydkNjRXpVNThyc2FiNiJ9	2019-01-21 12:44:35.959879+00
ozy6ji6b1zb4kod0tndzrthzdax3k74r	ZjhmMjU2MjliYmI0MzIxMTk0NDI2MGJlMjYzYjA3ZmM0MDI2NTY4MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJQMmhTRXF1VEtYQkxtTFBPVzk4N1BJMUM4MXVpWkNRMCJ9	2019-01-21 12:46:58.104331+00
wvqbq3wxvtccykuj4oilkt5xmkhs4hbj	YzlhMWViNmQwZWYwZWFmNzM2YWQ1NGJmMzhmNTI3OTdlMGM4ZDZkNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI1WEN5WTlEWWp1NVRSamRoOU1ibjRkeEVXRGUzZklxVSJ9	2019-01-21 12:47:20.902908+00
1yb1kil0t90hfut1eta3bneuf6xh1jal	ODhlZGNmZTUzNDVkNjJhMzIzZGNkZjg5MWM4M2Q3N2RlNmQ2MmQxNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ5eEdab1NydkFSRzZXVkFESDBqMTJNS3NsblMxa2N0dCJ9	2019-01-21 12:47:48.666502+00
v79d4yjx0zlmbm0xxz0xk2arauvvm7a3	MDQ5YTQ2ZGI2NjdhZjc0MTNjYjhiMGI4OGFmYjMyNmYwY2RkOWEyZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJPT1hoYXJmTUc0MXlwMXhndnM1N0twQlRDSHl6ZXp1bCJ9	2019-01-21 12:47:50.110101+00
bk2u6azagrpbg34t44gel258cyvrveqg	MzIyYTI4ZDk5Y2I0ODFkYmRjMmQyZmM5YTczYjE0MjNjMTQ2MzU1ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJOdjZmUElpaGlUR0xLOWw2ZDZnSElaMTBDQVlxcGljNiJ9	2019-01-21 12:48:37.467754+00
nrpoqpus1j4xunvof6wu9j4in9fmjewb	ZjI4YmExZjU1YjdiYTcwOTM2ZDYyZTljOGVjNzZhYzVmYzg0ZjFhNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJRUFFMeUwyOW1kQ0FBaGVDQ1Z3dnBtek1rTkFOT0ZIUyJ9	2019-01-21 12:49:09.090645+00
2aya2dece113u4yx3ijs9if1l1x4sc1c	ZTJiNzVmNmRlMGJhNTQwZmY2ZmRjNTNlZDhjY2QyODQzMzVlYTgzYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJrcE96eWU4bXpUdHpCUHNrRG9sZ2ozV2NIRDM5aDl1aSJ9	2019-01-21 12:49:24.386332+00
79ci1akianj7m4zyve1we4wfkgarmrrv	MGFjOTE3NzcyMWJiYzI5MjRkYjM3YTBmNTliNWVkN2NmNmQzYTY4YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJVWFhRRVN0V3dMd1JMMExpOVozMzVRaHVPTkZpbEJiYSJ9	2019-01-21 12:49:30.887158+00
3cxe8jc3tnwdnqig4fu45dxe1yq5ao0y	NjRmNDc1MzY3ZmM1Y2YyZGFiOTFjMTQ3NTExNDZjOTgxZDFkZGY4Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJmNkhYQVhRN2YzS3hJZWJEODQ0ZEY4Y2NTd29yTjRwTSJ9	2019-01-21 12:50:05.303801+00
u5r9816kpx2fao5o9jytnkyox7dacuqy	YjAyYWRhNTM2MmYyNzZiNzdhYjBiNDFmODU0MWMxNDViMmMzMjNjNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJyYnMxMTJ1c0l6ZWhyY3ZQWkdoU2V4cGhyb3d3RWNuSyJ9	2019-01-21 12:51:12.97715+00
znznm8b3miavbjdf7kygwvip0ldlghy8	YWUxOWI1YjZiYTk5Y2FiYzA4MGVjZmQxMDg4NTczM2QwOGQ1M2NjYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzTThHZnY5N29McE9QdEYyaXV1YVRZT3hkaWsxUElLRiJ9	2019-01-21 12:51:48.905956+00
6tapqo53gt3e1okac18yx64e6b8mc2f8	OGY5ZmU3N2ViMzZjMjg2OTQzMzEzMDQxNjIxZjM2OTBhZjQ3ZDJhZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJnMERNQ0ZrbHhYV2NPSklRdTh4aHhKUENXUGJsTDlFZCJ9	2019-01-21 12:52:15.140727+00
qev8jky05f6qpdf75pokwb2xf5qqdfx9	YTA0N2YzNGM3ZDAxZjRlNmI5MmU2MDcyNjEzNzU0MGU4ZGQ3MjgwNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ3QzNTc2pwOWdhUTBRczIzdDZFUkpRdXRYQXUySkkyMyJ9	2019-01-21 12:53:17.777351+00
v5gm2i2qsfsl0dlh8w5bsaok9kzlxnjs	OGM1YjZiNTMwY2I1OWNiNzI3MmRjYmE5NjYzMTRiN2VhM2UyNTMxODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIyaWI1cE5GdklvV21NMVMxRnFBbzA5a0pIaXBKY1NKZSJ9	2019-01-21 12:57:14.33758+00
vm75xe2dj0xr37lt703a1calhpk0p2sd	M2VhMDdiOWU3NzNiODRiM2JmODhhY2MxNzM1MTAyZTk2MmFiYzNlZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJYSEQ5ejJ5NkVPMXFLejAxSWQ5RnpDSU5RUDB5UU1QTyJ9	2019-01-21 12:57:25.539436+00
8i4oh0nl8rsm9aobc487jdeolrro1znc	YmVkM2E3YzZmMjc3ZjYwMzNkMjlmMzZkZTVkODVhNzUyMDc3YWMwOTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIzQThJOEhObUFrejRTMVlzWnp5Q0FnRkRrRkdTWTV2RyJ9	2019-01-21 12:57:48.866605+00
u6kqzibfjeq8o68w43s5lduzaehz060o	OTE4YzZiZjI3ZDhkZTQ0ZWRlNWZmNTQ3OTM5ZjQ3ZTAwYjlmNDJkZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJHZ3RnbHlTYWNkb2hqOGpZenYyZFlqam1IOFpSdXpNciJ9	2019-01-21 12:57:51.386215+00
nukmnuvuo7g2scs094nxy69tkn8wscy8	ODZlNzA3NGZiZDJkZWExZjM1MTMyMDQyODFhYjg4ODhhNzE5ZjBkMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJndThleEptUUZ5eDNJNWlFRURER2VTQWExVUNsRjJtZyJ9	2019-01-21 12:58:40.305774+00
1itxi287s2m0dnft8eq66cojwnfwcdxr	ZjRjNGQ2M2IwYTFhMGIzNmVkMWVlYjc1Njc3YjQzYTYxNDcwNzNiMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJjMFBDNUt4cGFnQjJaUlR6eUVQQncwTzNsZUh4WGh6aSJ9	2019-01-21 12:59:11.243186+00
qow8ibo8oewfgv3juhzxlvojshoblb9i	YzVmYjNjMjI2ODk5OTZjNWU1NDg0NTM0YjIwOTQwYzY4NGJiZmIzNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI5Q3lDR1BUT0kwR2NwbGY1ckVlcWx5QWFQcThqZmlJQiJ9	2019-01-21 12:59:40.779953+00
g8bbajsqckw55nual2uf8j332a6qim4o	NzkyMmNiYjYzNzQ3ODdhMTg3YzUwODg0M2UyYzdkMTY2ZGJkZDAzODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJLRGs3dDBwU2Z1TzVzNmpZbzFjRDYxbVNWa2s5dzU3NyJ9	2019-01-21 13:00:43.033766+00
xthta4vesfccjuqepb59ylgjio3aztzb	MmYxZDlhZTJiMTFiYzhkZGI2NmZjMWE5ODcyODg0Y2IwNDE2Njk1ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIwZjhVc2FBU0RMbnJndVlqYVpPTkl2anhuR0E2blVZZyJ9	2019-01-21 13:03:03.561752+00
kmu43ognicc3gh2csxcyaiwlusr5kx5h	NDA0ZWEzYWQwZDc0YWIwNzI3NTQwODZkMGNjZDk4M2YyNDkyOWQ1Mzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ0ajA3czZRY1Z4bUdEYjFzM1praUlibnd3R2hBVWYzciJ9	2019-01-21 13:04:03.665886+00
66x7g8t2s3lej9j5xz1eiggnwfsjmqxx	YWQ3MzY5ODExYTFhMjgxZDllMTAyZjhmMTI2NWVhNTE3ZWM4YzdjODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJLZlpEVFBGN29EUkw2QVpYMmhmUDZra0lHdkN3UEx1aiJ9	2019-01-21 13:04:40.872898+00
1kgd1h4jg2s9niy2huy2f1w6ewa2csj2	YmU0ZTQ1YTIzYTZhNDc0Y2QxODEzYmFhZGFjYWZiMjA3Y2FiM2E4NTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJnRUdkVmc0VHdYUnpXcmVXR3hnRE9NdGcycXAwMGY3ViJ9	2019-01-21 13:04:56.978129+00
humr8okz49hqxl2zhaed3gre2v755csk	NTI2Y2Y2ZTE1YTFiMDdhM2M5ZmFkMGRhY2RkOTM4NjViZDU2YzM2YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI1Z0VXaTVvWW5jamNsTHRyU0l3eWxxOVpGd1N2SnBLTSJ9	2019-01-21 13:05:05.111104+00
61mr6fudgbeocsxeno6xy0p6jl0cepcr	YWYxZTU4ODdkNmU2ZmMzZGM5ZDU2YWJkMzhhNTM0ZmNjNGJiNjg2Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJTMlU0SzdjTnpOSmY0ZVdlanFaaWQ1NUloM2JCNjd3MiJ9	2019-01-21 13:06:21.009157+00
5h2lyftzitmw607e74ktsuui3ds6bmbs	ZmJlMGMwOGY4YTRkNmYwNWFlNGM2YzgxMzc3NWRhNmQxY2JiZjE5Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJGbzZCUjZNdWVrV0JnYWc4bWc0eVBqU3lEYUdXTWtOTSJ9	2019-01-21 13:06:23.481174+00
vw8uxhwezs3kvkux3g4zab7lu9nix231	N2E4YjIxYmI1YWQzNDU2MjYzN2FjYTllNmNjYWU1MDQyNWFhM2I2ZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJXeEszUWJzamdnSDhFRTFYNzNsTzV1aTFlczRFd24yNyJ9	2019-01-21 13:08:02.525805+00
3nhphne0e5psl8fv48x2khmf9txoaz6w	YzgxY2Y4NzUyNTNmZTBmOGYzNzU1ZDg5OGZlZTRkNzcwZTczZDdhZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ1dGk2QkY4c09FMk9SNmlFdFpJbG9PSmNVSWxXSXZXaiJ9	2019-01-21 13:13:12.346036+00
0fwi66cyvrsuqm8f67fy42n3jif2s88r	NGYzNmUyMTM2YzgyM2JmMTE1OWU4OTZjMmRmMWFhYzJmOTlhNWNlNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJjUXdmOGJWeDhFT2FFczZ1NmRCWVZhWkxmcVlKR285RCJ9	2019-01-21 13:13:19.341928+00
ou98nnamomxa79u9vvpi6pqo8z70y6ls	YThlZTllZWRhNDM4MWM2M2I1ZGMwMjVkMDE3YmRiMDdjZWI3ZDZlODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJWTW1qekVMMk9TR0VmbnZUUFVFeDRXSjlDaTFXWVg4MyJ9	2019-01-21 13:19:46.249969+00
dicut6y0wz56mzpafqkxqbtho5y5evk5	MzFjMmY1M2U2MGNkMzhhZjUyZGZmMTA3YWVjMWNjZWU0ZDU2NThjNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJRUHp0SzdxbFFDclFSNFRBOUVZV2ZzNlJNdklCVGppNiJ9	2019-01-21 13:25:51.999972+00
pi80w34d1mzkvqdlhdfv6puqhkte7whj	MTI4N2Q0NTgzNjZiODZlMzliZWY0NWJiMjczMmNiZmE0N2RjMTBlMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJZV2FlcUZETmFqTlVuRHF0VHVES3V6dDJTTVk5QUhGbCJ9	2019-01-21 13:34:57.604038+00
oxehlkumtl1hv19130t902blf2d747jr	MzZiODBlMzg5MzExZDY2MGU5N2QyZTliZmE5MGVjM2ExZmU1YTUxYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJQUmh1emxvRmRKUThYSjVvSjJmbEc4WUJrd29hbWZjQiJ9	2019-01-21 13:34:58.825552+00
wdxnh3ruo96zmafe7re5actgfqbddbdg	NmMzZmI5Mjg4ZTUwZWQwYTYzMGU2OGI2NTA1N2Y4YTIxMjBmOWVkMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJIclBEUlpNamh0NHpCZFRhUG1nUlVyTm92UU0zRldFMyJ9	2019-01-21 13:36:36.186255+00
p2l1gk27t6vxadlkpok6topsek9d8ssc	ODhiYTVhMmZhM2I1MmEzMDI1YWY3YTgyM2U0ZmVhZTRkYzhmYjFhNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJYWlJZYjFZTnBaUVRRcHJGN2J5ejBXTzQ3YUQ2TU9iMyJ9	2019-01-21 13:41:26.976443+00
i9hd64vjvq2yhhij8jhisa81elipmcj2	MmMyYzU1MDdhOWRlYjRmYjcxNGEzOTZiYmE1MzIzOWRkZTAwZTk4Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJqZlRrU21mQTdIc1VwdkNqcjlzWlRzcXJUY2JOYnlRciJ9	2019-01-21 13:42:39.344296+00
mu88dxsysvwjl2jwo90vqznaz8dzwppm	YjVkOGUzZDRlMWQwNzY1YTYwNjJjZGJkYmE1ODM0MDZhMjYwYmU1MDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJrQ3hYS2hadGVHNGJMeVlyUlJBSzg1WHJrTTVFNDFzdSJ9	2019-01-21 14:06:32.649836+00
2835e9ewxp0u0suec1gihb1ovbkb43n8	ZDU1NTFjMjU1NjY4YWM4ZDAwMzc3YjM0N2NiZjhlNWIyMmI0ZTIyMDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJXQnFmV2NqdWNPZnpNbk11YnVmRWlDVWNWRThlUk1WZyJ9	2019-01-21 15:03:35.457212+00
vj36kugh6qtelm0a59k15lzojipbpr9s	MmQ1NzI3MjgzYTQ2MGM0MjM3MjRlOTNjNWRmYzdjYzg0ZjE0MDQ5MDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJReWJLU3M0R3p5UFU1aG84Qld4WVBVblZmeFRRMGtSWSJ9	2019-01-21 16:39:16.973286+00
ld4fvyqfw0acrml23jed238p2jc4huir	MTE2ZDAzMDkxNTk3MWVkZTA5ZWY2ZjM1ZjM0OWFhNTg4YjhmOGM0MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJUS2xNaGVCSmtDMDJLR2F4VFdBNW1veTNPU3BoSnQ4YSJ9	2019-01-21 18:04:38.226743+00
pdz96ootcs21057ww8sbr04ymj4ew6l3	NWRlZDhmZTQ1NTA4N2MwZTM3MmZhNTlhZDQ0NzAzNzZjMDEwNjQzMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJsNkl6Z3N3SzVFM1ZHR3IyYU5KS1NzaHMxS0tyV3Z1RCJ9	2019-01-21 18:24:58.668326+00
u5i0y1damk7kfm47eh1u6yeali7d3ibq	Njg2ODcyZjVmZjg2NGJkN2JkNzY2YTYwMDNmNTNhNzg1YjUwMWQ1NTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJtbWtUR3pHMVp0QmpDZmk4bm10clpmTHUzSmkxSzdQVCJ9	2019-01-21 18:46:10.226685+00
nvmjcfeebm5mvv7wvub06w94q8bppqfj	NjJiMjdkMWI5ZDg5ZjA3ZjZmMWVkYTFkMTE5MTZlOWJhYTY2Y2E5Mjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ4Z2ZpRDBoVG9CQ0ljOHdIdkRnQnJjTWtHVTJOOXpaZCJ9	2019-01-21 19:21:43.819008+00
aatu04yvp6bpf0bkydgwrhkv4619rfko	ODkzOTU1NzhiMjhjNTgyNTdhNGEwNjIzMWE2Njc1MDRmOTRjMDdjZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ5N0Rqd0pUTWNrMEFRQmpMTVZtUVl0aXFqQVVUMTI0QyJ9	2019-01-21 19:21:53.63972+00
s96mtfe1rdyqagvtp0g7nytn3m6p0u72	YmZjZGE3MzI2MmRkNDBlMTRkZmY2ODNiZGU4MWFiNDQ5NDJiZjUyNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJTNkhmeWxock9ialhWclRWWVQyNG9kdzIyVU9jeWNDVSJ9	2019-01-21 20:15:30.705252+00
4ii3mq1ewbh9uwcunwfgy5k8gcva2eck	ZmRkODI5NzNhYTc2NmM5NGYzMmMwNGI3NzlhY2VkMzJkNDg5NjIyNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjM4OTQ2ODcwNDQ4ZjQzMDdiZGViMzg0ZGFkNmIxOTllOWVhNWMwNDkiLCJhbGxhdXRoX2ZhY2Vib29rX25vbmNlIjoiZjBuSEJidHBpYk9MbTZkWE5QVnVxTDdMRDJTajM3Q2giLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2019-01-21 20:31:39.595092+00
i1bd5bl6b4xtvwho5p8t00oyhtzlkqi7	YjMxMDZjODI1MWZiYzc2YmNjM2I4MWFjMDdmMWYzZjA5MzU5OGFjZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIxSHpDckRzSERZQXBNblI1d2w5dWRhTDVVYXlCQ1JVMyJ9	2019-01-21 21:01:16.113007+00
hd6rcgz9vtmwmyowd5skfsmyn4qm5xc1	ODc4NTFiYzFhODM1NjMwYTg2ZGM0MGFjZTdjYTY3OTdmMThjZTk1Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ6dG9oUEZ3V21hemsyMVBTS2hlSGk2elZIUlFjSzBLdSJ9	2019-01-21 21:02:39.418272+00
u5o2xb3tx6s3qswg9ej56oxpbzz3tw14	ZTVlNGMxZDM2Mjg5ZWJlOWZjOTU0OWE0MTU5YzMyYzFiNDE3NmJhMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiIwdTBySjljRzRIanlpRUtaZklVdXE1Nng5YThpOFBFdCJ9	2019-01-21 21:32:48.124634+00
dbur0r3zxzyugnkeato64b1jtxmu4rk2	MjAwOGUzNWM5ODU5YjdlZWM0ODk0OTBmNzk2MDk0YTI5NjVlMTE3YTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJZVzRxOFZkOEhKS3lhdnk2UkFOb091cVEzdVRDNjJzdyJ9	2019-01-21 21:32:48.15943+00
nphuj5ndh3zyz9a3x8omk3g63wps1hl9	ZGE3MmY3MWEyYTQxOGFlYjZmMDhkNDdhZDEzZDFiNDU5MTE0Mzk4OTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJVQlJuRjFTRmo5eG5IM1NtWjZTYXdGckJNUzdjQmRLMyJ9	2019-01-21 22:53:13.497679+00
ws7b5pq2wtm6xim257k93eiuiwpffbr2	MDQ3ZjA1YjQ3NGE0NmZmN2M4ODRiYWU4NTE2MDk2OTU4ZDY1M2E2ZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJjUVJlWDZmRmdZclNhRFBkYVR6SGlnZm10M0pZdWpkTiJ9	2019-01-22 01:44:53.316048+00
aeplnccdx4afry7lynklbov1s7fj09ly	NjFmZmU2OTIxNTk3NWE1YmIxYTgxMTNjODZmMmM5OGQ1NjViY2M2OTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJmb3dweVBZYnhObXh4RklFclpZMndjYWdXa0VrdGVQayJ9	2019-01-22 02:34:52.450591+00
slp1tr0s9xtwj4u1scppquip7hdznit5	MGFmMGI4ZThhZWJiMjI3NGY4ODM4NTgwNTc0MmM1MDRkN2VkODYzNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJhS1lkVzNyMThHcXRqWEQ1RERVajc4ZnlycVN1M2xLdCJ9	2019-01-22 02:38:31.575325+00
7zntxeu5duw1gnu7y9mbd33h71ejpxbu	YzVhYjcyYTNjMWY2N2ZlODcxM2E5ZWNkYjU0ZmYxZTU5ZTZiMDMyYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ3VE5STUlkR1VwRko0dVhBaUo5SGtXT0VDRzdMZXlFViJ9	2019-01-22 03:07:48.386438+00
6pidaql47ccw3euqsiliq0q840b5r24b	ODZjMTVlOGY2ZDA3NjdlODI4MmRmYjc0OTIxZmQxMDc4YzAzMDBlYTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJBeFo0MmtWQ0VXSXFzQXRvZ0xVSHVJYjRNTm5QNEoxaSJ9	2019-01-22 03:07:48.827149+00
ua8kd11iqeat06aqv3zogy8bi0kdatl3	NTliMTE4YWJjM2FmZmQ3MDBlNzQ5NGNiZDI5ZjE2ZDE0OGIzYjRhYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ1ZmpyUXQ1N1pLRDNhSUludkF4bGJBUldoeERvT2VSeiJ9	2019-01-22 03:33:59.479487+00
g4h320wwfb1em0zn0vltgb71atvqwhlc	NWQ2YWZjNTNkZTRiYzg3NzE2YTFmOTZiNWI5YjE5YjM1NDUxNzVjZjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJaSm5SSEdYWnliZ3JnN1hreGZKSUFCSTdOSktQOEdLQyJ9	2019-01-22 05:44:35.931142+00
nju3fy1xw6q83bp8nz636hvlpwgq9gfx	ZjljODI0ODg3YmJiMzA1M2Q4OTY3NmM3OTI1MjEzMTllMDY3NTdmYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJmcm9kMjEwZmx3ZmtNa0hTM2tUcExrTFJxdGlmWjU5TiJ9	2019-01-22 06:57:48.56912+00
b7xa0u0ftfmuiabiaue0riedkitwl71z	ZTM3M2QwMGY4NGY0MjJhNGEzZjNlNDc5NzkxYWExYjNhNTM2YTFiYzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJIWmxnSWlHdVdOTXRVQ1ZBcjJCS0hhUFhzQzNTQVUzUSJ9	2019-01-22 07:04:05.733404+00
8krstxd0ias1dylc1c67qreiao0ae0nc	NzZiYWUxNzMyZDU4YjA4YTNjNjM0ZDEwMWYwOWIyZTVlNTI5M2YwNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI5VTlLUFJXeGowcVlrUkNmallzc2owa2thSXNOSkFsVSJ9	2019-01-22 07:04:17.175254+00
pszfrulkz3f934bqgkbonpp9zt9j9d30	MDE0NzcwMGJjMzg1NGRlNjNhMmMwNTZmYjMzOTFhOTI2MzFhZjBkNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJyMU9mYmF0QlhoenFsUWRpaWVyMnkxdTBWM1d4eGdiOSJ9	2019-01-22 07:12:38.120538+00
zszjaea24i2wivdnwujsir7m6bu5tadj	NTk0MjYyMjM3ODc3MGM3NTYzNmYxYmU1MDM5ZTk3NTY0ZThhYjJjNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJKZkhFempWYTZDUWxsQlZnRGNsamE4WUExNFFOMUtjRCJ9	2019-01-22 09:15:12.914264+00
1kpkkviqhvsbaomdwv8y2uidehcvs973	ZTAyZmMyMzhlMmUyNmVkY2Q4ZWE5NDc5Njg1ZTZhYzhkNTEzOTE0MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJvd0F2SjFUaXFEaXZYbksyQ21XTHJtMmVhTzc5QzlNQSJ9	2019-01-22 09:18:10.35053+00
1ceujw0bsrb5etkf5b4cbb1t59sipja4	MDNkZDA2MjgyNjM0YjBjOWY4YWQ1N2M0MGYxZTllMjUxZjZmOWVlZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJLeWJYc3hKQ1dDVTBLcEFja1ZYWVkwTDRpeWpFUjFmQyJ9	2019-01-22 09:25:11.702271+00
r6dt1l8o9iubw2zjevs5dqnoub28n8u0	YmMyZDE0NWEwNjViZTk1NWU2YzI0Zjg5YWFlMDkwOTQ5MzFiZWQ4Nzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJXektjRkV4VWJqRDFBV3JGRWEzU01UNFBnaUlIbjEwYyJ9	2019-01-22 09:57:42.427062+00
l13579uuam4lzhlqujwf6h1tokybm89m	Y2EwMTExOWUwNDFiMjBmNzFjYjIwZjA1OTQwYjU0NDFiYmFhMzFlMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJWQ3hwY05MOXFGOW1DY2pLWThrcmduMmFRQ29FcUJnYiJ9	2019-01-22 10:04:09.412455+00
j2tb5rp0iv7xcd3fnfk4871v4rc1tq0j	MzBjNTU1MGZjZjA0NjFhNGY3NWIyMDZkMzc3MzVmMTg3ZmIzZTY5Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJWWlJVVHZFS3puMkFrSTcxRTM5b0xEMm5reE5xd3NMRSJ9	2019-01-22 10:07:37.825652+00
zmbidg4epn5z4hdva2bk62zorud7toyy	MmEyNWZiMmVlMjA2OThkYjYwM2I1NDYwMDA4YTk5ZGIwODNlYjI2Yjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJVM3k2dTdlaVJIZGo1WlB2OFlJRFdEVlp4WEtsUXVubyJ9	2019-01-22 10:42:22.258468+00
vehc3q9rhq8qw6mtygip9bd7d9hpgjib	MTA2MjYyM2I2NDAwYTIxOWNmYWVhY2U5ZTEyNjVhNTAwYzU4MDNjODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJtcExXeXluOXR1cWw4eXI3aHBGNXFOQzZBbGxhZUJPYyJ9	2019-01-22 11:30:28.748724+00
s1tcmv01kg1dy1x2mpe5sdy6lam8wq1l	N2Y5YmI3ZThjMjllYjcyOTMwZWNhMmY5MzNhM2JjZTcyYWNiZDExNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJrZ0czS1BqMzd5ZEtTeUJPcXN5aXlPOThZcVNhdjhITCJ9	2019-01-22 12:48:30.917489+00
7ok5he7qjigp79u7ywvgjchpov4pvdz6	YzMxOGZjNzk4ODgyYTE3MTk5ZDA3NjBlNWEzODEzYjcxNjc2ODA2Zjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ4bm9BS3JnZ01SdHp2UFpyYVh0QWZSaE41MWNwbEkyMSJ9	2019-01-22 13:10:38.348854+00
syucy1snvb8kzbylz1kdqrpdo06csdk3	Y2M5NzcxZmNkYWJjMjA5OGVmNGNmNmVhNTNjZmE1ZGM3YjJmM2JhYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJsM1A4b1l6a1UyRlJkc2lzN3QxV3ZVbkJ1WENBeXlsTiJ9	2019-01-22 16:25:26.962948+00
9fppo5qf8x0m6fl9tyccot7v3kz2z0du	ZjZkYzMwY2JhNjEwZmY3MjZjNmYxNWIyNGUwMjQxMGQ2Y2I1OTdkNzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJmalNEdkZ4T2pCNDhZVk0yNXRGMlk4aG5qS3p6QXJNUSJ9	2019-01-22 16:53:34.429317+00
tt5wa5fd2gyoawd0on488czuwpapt261	ZjA5YWU0ODBlNmFkZmY0NjVjZTU5ODBjMmM2NDg5ODk4YjBlYTYwNTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJSN211ZUlHcGJSSWNRMmRpN2tNNTZjVDlwbzZvVFppSSJ9	2019-01-22 17:24:51.298798+00
cafr9zt08wbhbbfr39yioosoz4kr6fdf	Mzg1ZmU2MTJmNGIwYjYyZGRmYTE5YTM1NjkzMWZmYjhiM2JjNWRhZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJDdkVZOG5YVmF1ejJPYTlTRDQ5Sk5Iam52N2czdXAxdSJ9	2019-01-22 17:27:32.133306+00
jl10a2xyusoj4ed873npzhzdn2afntk0	YmNhY2ZmMDIxNWZlZjEzYjMxMjRjOGFjYmNiMjUzM2FiMjMzMDNkNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJZVmFHSTV0NmZVaVVGVTNGa2JqVjJxRXQ0OHlPUWRFMiJ9	2019-01-22 17:28:52.737526+00
bw14ur2u6g59hjfcz11tqis4b9qwdq0w	NWUyNWQxZWJhOTUwOTdjNGFjMGE4NzFmODE5NWQ5YzMyZjM3YWI4ZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI2TnJGQTZHY0JFSFdrWHpuQ3VzcFhSOGlOTUJZUTJnTSJ9	2019-01-22 17:29:57.007018+00
jhhyz9lgyy3nummydljc10nihta2qg6l	MjQyODQ4MWRkN2ZjYzhhZjcyYTI3NDM1NDcxNGZhNjFmYzI4ZWM5ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJwelF6ZW1XTnhEbDdkRTluRmNRem56QUxKNXdRUTF3eiJ9	2019-01-22 17:33:29.755995+00
no12t5ieod7ji3degn6vdnwhfbmpcbxt	ZTI0MDA2NGRjOWVhMzVkMzM5NzUwN2I5NDVkY2NmM2IxOTBhNzE3Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ2Vlk0STJ5eDJBQk9ON1R2aElSTm9zZDFrdzB3cE9KWiJ9	2019-01-22 17:45:28.14923+00
c1ufoq9xt2scn7fw8k2cis8vpq10b1b9	ODA4MTU1NzMxODAzYWEzMzYxODU2YjJjNDY4MjgwMzhjNWJiYjUyMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJlQnFLNVpWOHBYMzlYMVY0RnpreWxlc2gzaEtiOU9OYSJ9	2019-01-22 17:46:15.452223+00
ddxug6utjt7sh11sldo34fb4r66y3drv	ZGQyMDNkNDRmNDEyMDAxZDY2N2EyYjUyODk3MDE5ODM0NTFiN2VlYjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJmYllJU2lNU08wWkNzSW1CMjN4bXo2TnpoR25jd0syOCJ9	2019-01-22 17:46:52.947671+00
crmrb8fqndl3gq3a1cwsd8cv8hvx1jbc	OTFkMWZmMzRkMjA0MmFmNDVkNTQwZTAyNDBhM2M0OTAxMDYzNGFjNDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI5NXBOaWJJWDk2VjJ4eU9kNVFRV21UMWIxbjg0ejBUQyJ9	2019-01-22 17:52:07.066558+00
37y7v1o4bizug5mgzdq80uasz4o2m7ew	ZDRiOWZmOWM0ODdhNzMyY2M0MWNiZDg4NGM2YWIxMjgyOThlZjRlZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJoNHphMHBZdzdXOUdRanE2MGFMZ2pOUUJaZkJIaVlFViJ9	2019-01-22 18:01:36.201749+00
fz7qg2mmhzbt279aqt44ww9eda9bsedj	MjVmMTRiZDE2MGRiYzNjZDllYTQ2OThkM2I4NzhmNjJlZDZiZDI0Mzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ1cG5JeVFKc1pGWnhkMVZsdkxVRXRsOTZKaFYwd0Y4RyJ9	2019-01-22 18:53:51.653057+00
rulr7o9lavn4vvb1upz4fx118zdk7irs	YzZlOWM5MmU5OWE5ODc3ZWI4Y2U3NWU3OGM4Y2RiYWJkNDExN2Y3MDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJGWlNQd1YyMUJBRXYwWG9EaXV3RGdwYmJ5TTN1aTNmMiJ9	2019-01-22 19:18:32.118881+00
85nkjdl73blm4enwcezrjny5r4bcyb46	Zjc4ZTMxODg4YjBhMjk1ZDlhOTBmZGRhODQyYTliMThlNTlmODdiMzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJPeGV6MzF6b3B6cVZXMTE5ek42dXZsSVRvYzJLdnE4SyJ9	2019-01-22 20:26:16.585541+00
ys4uv8jn70rfl8tixxptts898ur0g1rr	NjczMWU3NjJkMTE4YTE3YWUxMzBiOTI4NTExMTgyMzMxMWQzMmRhZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjM4OTQ2ODcwNDQ4ZjQzMDdiZGViMzg0ZGFkNmIxOTllOWVhNWMwNDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2019-01-22 23:12:44.0291+00
vhzf61yn8issxaomjmwlw4vlsz7rjpcs	NjczMWU3NjJkMTE4YTE3YWUxMzBiOTI4NTExMTgyMzMxMWQzMmRhZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjM4OTQ2ODcwNDQ4ZjQzMDdiZGViMzg0ZGFkNmIxOTllOWVhNWMwNDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2019-01-23 09:43:51.348601+00
5if6bufygeu1u8yt5t6k81ii8gn5p544	NjczMWU3NjJkMTE4YTE3YWUxMzBiOTI4NTExMTgyMzMxMWQzMmRhZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjM4OTQ2ODcwNDQ4ZjQzMDdiZGViMzg0ZGFkNmIxOTllOWVhNWMwNDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2019-01-23 15:42:50.215987+00
akk3k097qmv9i2c470dn5z8rgb5e0uws	ZTU2ZGJhYTMzMWE4NTMwOTBiYTg1ZDg5ZjE5ZTQ2Nzg3NmM1MWI0ZTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiaVJNRmZKaktUanhaIl19	2019-02-07 08:19:06.299717+00
86ebw9dkjqvtcw3wrwarc0tkh19icyhx	MGZjODdlNmRlYzEwZWRhMjQwOTU1ZWJlN2NkZTY2MGMzNGY2NTRkNTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiWERING9oTnRsc3JGIl19	2019-02-07 08:19:14.670872+00
1uiocqc4l40rmbwyjsxe0it43nyyw0ns	Mzg2NzM5ZDhkMzUwODViMDFlZjNiZjZlNjQ4ZDdjNWIyZjJhZGJkNjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3JlY2lwZS9hZGQvIn0sIlMyaDhkZm9SWTBmTCJdfQ==	2019-02-07 08:20:24.949397+00
we0grpo826mwpy9nycdb6iwd8a95v2tf	MWVkYzUxNjA5M2I3MWI3Njk4ZDc3ZTVmZjEwYzdmZWQyNzBmNjUwYjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwickdUQXMwN3hkU2xHIl19	2019-02-08 04:35:02.255706+00
mfq131f14k3o6rygbyk1lwvo39ozyaeu	MjgzMmFmMzEzZDdhNTE4ZjI3YmJiNTY3YjVjYWRiYjVjNjc2MjVjNDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiVVRMQmliUXNIR01FIl19	2019-02-08 04:37:09.151612+00
3t067gi00x8iv3iyp22ehnizgalr9t0v	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-02-09 20:42:40.849365+00
60dy6kg2l0mx1x667ox42ls6jhjimdsj	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-02-10 20:21:11.754212+00
w3h151wzdr383zyy5zgx7jga16givqrf	NjczMWU3NjJkMTE4YTE3YWUxMzBiOTI4NTExMTgyMzMxMWQzMmRhZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjM4OTQ2ODcwNDQ4ZjQzMDdiZGViMzg0ZGFkNmIxOTllOWVhNWMwNDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2019-02-12 19:58:54.279977+00
9qvuc9xg5ia5dgpu16hfst1pt7i2ot5b	NTNhN2FlZjNkZDYzN2NhYTViNzkyMTZjZjZiMDUzZWJhNDlkYWRhZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjM4OTQ2ODcwNDQ4ZjQzMDdiZGViMzg0ZGFkNmIxOTllOWVhNWMwNDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwic29jaWFsYWNjb3VudF9zdGF0ZSI6W3sicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIiLCJhdXRoX3BhcmFtcyI6IiJ9LCJaWlE4S2RlcUtCNkciXX0=	2019-02-12 20:44:22.611592+00
0bbibl615jwsl9473ftr25j0p683hdqo	MjZlNjYwMzVjMGU2ODM3OWM2YjRiOTU3M2ZiNGFlNGVlN2JmNzczMzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiczZLZmRLMmZiYUxaIl19	2019-02-25 01:44:23.724036+00
k3vq3j4th2xpezq9iasf4shsw3p8vk3i	Y2I2NmI1ZjQyZWM4YWY1ZDE1Zjc0OTNiOTJmNjljMTMxYWIwNjVlODp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiV1hPTXZDUTR6cUthIl19	2019-02-25 01:44:33.684559+00
x3j6c2cckg0qvsdua4l9svh0n9h4hpei	NGI0ZjliNmU4Y2JkZmVlZDc5MGViYTUwYzY4M2Y5OTUzYWUzNzU1Mzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3JlY2lwZS9hZGQvIn0sIng1UDlqTVdKZmlqUyJdfQ==	2019-02-25 01:45:20.754255+00
0dq89861zu6y6sbp65wblpjth4zmfo7f	OTExZGZkZTRmMDE0YmNkNjIyZTM3MGU2NDA1N2VkYjBlYjI2Yzc3NTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiZ2lJU3NyYmF0SDNWIl19	2019-02-25 12:39:28.958475+00
3wehhi827nce4j5byi23ma00kg7e2evf	ZTJkNTFlZDEwNGFlNDMxMDI2NmViOWI2MWRiMTAwYTQ0YzAyODZkODp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3JlY2lwZS9hZGQvIn0sIklkQWlmM3oxYWtNUyJdfQ==	2019-02-25 14:32:48.027071+00
kf6zkbgpsauv7xw7ti20e2makjapjp3m	MWJkZTFiNGI1OWI1MTgzZDg0NjNmOTM2MjMzYmJkOTc5NDA5ODk0ZTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiMjRPZ2JjMmFSa3RTIl19	2019-02-25 22:49:04.953525+00
ysx58me9l3zq1p9jgiuk51v3r94lxfot	MjhkMmFmYzYzNTRiZDcxMmM1MTlhYjAxNjY1ZDZiOWFkYTMzOTE2MDp7InNvY2lhbGFjY291bnRfc29jaWFsbG9naW4iOnsidXNlciI6eyJ1c2VybmFtZSI6IiIsImZpcnN0X25hbWUiOiJMYWtpZ25hbiIsImxhc3RfbmFtZSI6IlNvbmlhIiwiaXNfYWN0aXZlIjp0cnVlLCJpc19zdGFmZl9tZW1iZXIiOmZhbHNlLCJpc19jb250cmlidXRvciI6dHJ1ZSwiaXNfc3VwZXJ1c2VyIjpmYWxzZSwiaXNfc3RhZmYiOmZhbHNlLCJsYXN0X2xvZ2luIjpudWxsLCJpZCI6bnVsbCwicGFzc3dvcmQiOiIhRjJRWkh3ckJVQ1RXZVBVTHNkMWg2TENkQkt4dHlxd1lXcGRWR0dOaCIsImVtYWlsIjoiZWxpb3JhMjAxNDdAZ21haWwuY29tIiwiZGF0ZV9qb2luZWQiOiIyMDE5LTAyLTE2VDE1OjA3OjEwLjQ5OFoifSwidG9rZW4iOnsiYWNjb3VudF9pZCI6bnVsbCwiYXBwX2lkIjoyLCJleHBpcmVzX2F0IjoiMjAxOS0wMi0xNlQxNjowNzowOS4zOTJaIiwidG9rZW4iOiJ5YTI5LkdsMnlCaXlTMm5lOEdJREIzR0NtbUZ6dkE0bWhmNlBZX2c5VE52VURMN3lSeG9KcHk3VHRxVWtoTHdxazl6dXZuR1JHSUo3TUZZVzhyRTRhUFFxTFYtOVVSTDdJTDRHMHl4M0JSTkpEY2tQbnRPeXlGTkJJYU1lWTJKRXlIeWciLCJpZCI6bnVsbCwidG9rZW5fc2VjcmV0IjoiIn0sImFjY291bnQiOnsidXNlcl9pZCI6bnVsbCwidWlkIjoiMTA0MTA1NjY1MjgyNTgyNTAwNzY1IiwibGFzdF9sb2dpbiI6bnVsbCwicHJvdmlkZXIiOiJnb29nbGUiLCJleHRyYV9kYXRhIjp7ImZhbWlseV9uYW1lIjoiU29uaWEiLCJuYW1lIjoiTGFraWduYW4gU29uaWEiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDQuZ29vZ2xldXNlcmNvbnRlbnQuY29tLy1ZUU80UkMyS21hOC9BQUFBQUFBQUFBSS9BQUFBQUFBQUFRdy91S3E1c0x4dWt0MC9waG90by5qcGciLCJsb2NhbGUiOiJmciIsImdlbmRlciI6ImZlbWFsZSIsImVtYWlsIjoiZWxpb3JhMjAxNDdAZ21haWwuY29tIiwibGluayI6Imh0dHBzOi8vcGx1cy5nb29nbGUuY29tLzEwNDEwNTY2NTI4MjU4MjUwMDc2NSIsImdpdmVuX25hbWUiOiJMYWtpZ25hbiIsImlkIjoiMTA0MTA1NjY1MjgyNTgyNTAwNzY1IiwidmVyaWZpZWRfZW1haWwiOnRydWV9LCJpZCI6bnVsbCwiZGF0ZV9qb2luZWQiOm51bGx9LCJlbWFpbF9hZGRyZXNzZXMiOlt7InZlcmlmaWVkIjp0cnVlLCJ1c2VyX2lkIjpudWxsLCJlbWFpbCI6ImVsaW9yYTIwMTQ3QGdtYWlsLmNvbSIsInByaW1hcnkiOnRydWUsImlkIjpudWxsfV0sInN0YXRlIjp7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifX0sInNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwieG1jZ3VqNU1GRHUwIl19	2019-03-02 15:07:17.598219+00
h4b29pnuddge6a0onn3avcvbc1zwgw45	ZTQ5NmZmOWMyYTcyZWE2N2Q0NzY1Y2I5MGRiMmFlNmJhNGZiZjQyYzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sImU2ak9RMmFRY2tCRyJdfQ==	2019-03-07 11:40:40.038568+00
jx8fvehoh8ea2wwm3pmg08llmenco64a	YzdkZWMxNjY0NzlkNGM4ODBjYjQzOTg0Njk4NmU3ZGVmNzVhY2YwMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==	2019-03-08 20:01:21.710696+00
kk5e4yqvcwaq1gbqsi2xew706sqa0rls	YzdkZWMxNjY0NzlkNGM4ODBjYjQzOTg0Njk4NmU3ZGVmNzVhY2YwMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==	2019-03-11 11:49:51.617166+00
6nl8zfkypoicglv0qfp06jjwkcwlm8en	NjczMWU3NjJkMTE4YTE3YWUxMzBiOTI4NTExMTgyMzMxMWQzMmRhZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjM4OTQ2ODcwNDQ4ZjQzMDdiZGViMzg0ZGFkNmIxOTllOWVhNWMwNDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2019-03-14 22:17:13.084087+00
oxm35n5hx3p8at6m5t96xuo16ug4mxhm	NjczMWU3NjJkMTE4YTE3YWUxMzBiOTI4NTExMTgyMzMxMWQzMmRhZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjM4OTQ2ODcwNDQ4ZjQzMDdiZGViMzg0ZGFkNmIxOTllOWVhNWMwNDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2019-03-14 22:39:01.459141+00
lgjb6krrj8j014e0sca0cqnavzut31fc	NjczMWU3NjJkMTE4YTE3YWUxMzBiOTI4NTExMTgyMzMxMWQzMmRhZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjM4OTQ2ODcwNDQ4ZjQzMDdiZGViMzg0ZGFkNmIxOTllOWVhNWMwNDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2019-03-15 10:11:52.72956+00
l6gy2r7j5xt3861uxvoy4b57iywb6qlj	YmQ0MzE1ZjFlMDFkMjNjMDkyOTAyOTMzZGQ5NGZiOTIwOTI2NWM2OTp7Il9hdXRoX3VzZXJfaGFzaCI6ImYxMWQwZGZiN2FhNDFkOTQ1ODRjMTM4MzViYTc2MDU3MzQ1Mzc5NzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMTAiLCJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsfQ==	2019-03-17 21:21:29.727307+00
o5lqobquhbzuppim67ekxwubqt6pt7fv	NjczMWU3NjJkMTE4YTE3YWUxMzBiOTI4NTExMTgyMzMxMWQzMmRhZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjM4OTQ2ODcwNDQ4ZjQzMDdiZGViMzg0ZGFkNmIxOTllOWVhNWMwNDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2019-03-17 21:24:20.919019+00
mmj6jpiszj6wilrdjdtkmupisj9j850m	M2YyYjEwMDZlNTdjOTIyZmVjOTcyYzI2OWI4NWFiZTE1ODM4N2ViOTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwickJFYzdmNGdNN1Z4Il19	2019-03-19 08:34:57.788644+00
kmelxz58nfo3tzqi2bnu25w0ipobd6zg	ODI4NjIwZjc0ODA5OWFmOGFhZWUyMTkyNTM2YzY0NzExNDQ5NDkxODp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiYTNTc2tMd21YaWtFIl19	2019-03-19 08:34:59.022916+00
p37vz1rt0dwk6qlsf7sj61yzfh2ekrrj	NTYxNmEzNDhmYzIwNGViYTk4N2ZmNDljYjcxMTdiNmY4MmIwZGZjNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImYxMWQwZGZiN2FhNDFkOTQ1ODRjMTM4MzViYTc2MDU3MzQ1Mzc5NzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMTAifQ==	2019-03-21 16:04:29.113434+00
x1kl0ycoypzvqtrsa6ixy33y59fs1htu	YzdkZWMxNjY0NzlkNGM4ODBjYjQzOTg0Njk4NmU3ZGVmNzVhY2YwMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==	2019-04-04 10:50:18.182806+00
tkt9v2c0utpxz9e606rm44fgspt8bnvd	YzQ4OGVhMGFmNTJkNTdmMjFkMjFhNGQwZjFlMzA1MWQzZjE3NGE2MTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3JlY2lwZS9hZGQvIn0sIk94UGJIY3J1SUJwUSJdfQ==	2019-05-19 00:58:56.702165+00
moeaclslh1352oqag3nra2c2s9p29s3q	NDc5ODg4ZTUyOTZlMWJjMjUxODFlZmFiNGUxMWMwZWIzOTFiNDYyMjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiMnpuZmFFVzJxb2ZSIl19	2019-05-20 03:02:39.28434+00
h8omti2kcbc4swauveviloj7xpe4x0l5	YTkzMzgzOWFiNzdkNThkYzZkMGQ5ODljZDNiNDRlZTY2MWRkMWRmYzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiNDRCVmtEWDJvaG12Il19	2019-05-20 03:02:40.373606+00
ru2be7xofjuv99skehpck4dxdxxlcid6	Y2UxYzE4MTEwZjA1OGE2MzNiMjE5NzUzNTNjZjg2OWViNmZhOWRmNDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiNnUwVXpTbHdNb0dzIl19	2019-05-22 23:16:07.033569+00
uqu0arzihvmudgf3wwop1xucwue7jm8j	OWU1YThhZjQ5OTUzMmJmYjkzNDBmNmUwNDhhNDdmMWExMzQ0MjAwNDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiRFpuZEhGZE9rOEQzIl19	2019-05-30 22:59:25.423155+00
yxo1bk1qquk7q3qujx4p2o0sv0iuzyll	NjI3MjA1NGE2MTAyMDVmOTE3OWY1NWVlMmVmYTVmM2ZmOGY5Nzg1Mjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiQXZGZnhPSkpVb2ZvIl19	2019-06-19 04:14:01.347648+00
rwu1kjxzhh5kcpvjodbknkxh9qaces6s	ZTkyZDY5NDQ3ZGI3ZjZhNjhkMTdmYWQ4YjdmNzJlMTQyMDI2YmZhZTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiZmFNS05xU2JTczdoIl19	2019-06-20 17:45:56.841171+00
pb6r9uunxrko6otmtgz7mne6yg9my5ij	MWVjZDc5YWRkMDY1ODE0ZjkyZjY4ZGQwMTVkYWEyNTk4MDE0NjU0Yzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiOXZ5ZzNzVjU1VGNHIl19	2019-06-20 17:46:16.137606+00
n7wmaec5uyt16dcnufrwlvo57mzw29r7	ZWE0NGYxZTZhMmEwZTBhMmFiYzg4NzE2NzE5N2ViYjc0MTQ5N2ZlZTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwieW40WlFnSHdHMXY5Il19	2019-06-28 21:11:08.852059+00
od1mafkwacb31s6jyt9f8fd2js0fsvpt	ZWRhN2M2ZmI4MWI5ODVhMTcxNzg1MTRlMzVhNzczNDM3Yzk1MjQyYTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiNnFUWHRORkljNXlzIl19	2019-06-29 10:41:27.326726+00
j8m7t0gnyq4xdedlsy1to06e2x7zfnyn	NWJlNjE0MzdjZDM1ZWNmODdhYWE4Y2JjZDA5YzM2YjQ0NzRjN2Q0Nzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3JlY2lwZS9hZGQvIn0sIkNyYWxrRXR1NUtZayJdfQ==	2019-07-09 05:56:13.661445+00
hleve0l8tljznhna5obr04ch0f7msudm	NGYwZWNkYjUzZDM0M2Q4MWNkMzM5MzJmYmFiZTM2YTUwMzJhY2FiYTp7Il9zZXNzaW9uX2V4cGlyeSI6MH0=	2019-09-05 20:48:44.952412+00
4m7f5tmyy7j7kq239v1zljdkm0bl2ts9	NjhlZmE5OTliMTE3MTg1NGYyNDE4NGIxNjI4MzhhNWYxNDZkY2M3Yzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiZDh2YVlROTBNazJBIl19	2019-09-07 06:13:35.977123+00
p8xiz4ast5mvdvkkm5y6rcvghc3l6gla	N2ZhNmFlYTZmMzUwZWM4MzhjYzE4NjE0MWNmY2FmZDU5NmM4NjFlMzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3JlY2lwZS9hZGQvIn0sInQ5TUVLbjRXcmM2eCJdfQ==	2019-09-19 19:22:56.873602+00
yvcn6jco8faxngb6fwg0ld3avfcmwf13	MWZhNTliNzI3ZGE0OTY2YzczODA1NTMzNzQxZGRhOWQ5M2FkYzNiYzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiRmhSVGlWdXZ1V3dxIl19	2019-10-01 00:54:57.951456+00
jwsbozxsszz0y5wir0li5r4m84rfxurh	OTRjYzFhYThjNmEyZGU5NTRiNGU4MDE0NGM1NGEwZTg5MzExMzIxODp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiMmZUaW9UalRCdDVnIl19	2019-10-01 23:14:03.971718+00
c3hpf770itpjpket5dx0xp6wurfcrt4m	YTQ0OWY0ZWVkMjAzMDY2NDA2N2FkZTMwNWU2MTUwMDQxYThlYzgwZjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiMGRsR2w3cGVQSGZPIl19	2019-10-01 23:14:06.56748+00
kmddv85b651rev7x8kweo5zs500jywyv	ZTc4MzZhODQ4ODA0NTg5MjQxNjU3NjU5ZWM1MWI0M2VhMjYxNDU1Mjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3JlY2lwZS9hZGQvIn0sIkpiREs4UDJZWFBzTyJdfQ==	2019-10-01 23:14:14.642058+00
cln558sc4t8v59zpwam1qn8xfjyfqnyl	MTFmYjU0ZjYwZTlkYzJlMWEyZjc1YjEzNTVhYzlkNDdkZTBiZGYxNDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3JlY2lwZS9hZGQvIn0sIjlyTFNyeUVSd2w5ZCJdfQ==	2019-10-06 23:56:28.373319+00
gm88ej3e76hl5qmnz412c96amqzayt9v	YzdkZWMxNjY0NzlkNGM4ODBjYjQzOTg0Njk4NmU3ZGVmNzVhY2YwMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==	2019-10-08 15:06:20.443504+00
pgh3wybc4zxze9928iq4qxgcycasf91f	NjczMWU3NjJkMTE4YTE3YWUxMzBiOTI4NTExMTgyMzMxMWQzMmRhZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjM4OTQ2ODcwNDQ4ZjQzMDdiZGViMzg0ZGFkNmIxOTllOWVhNWMwNDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2019-10-08 19:09:25.955197+00
hmui720btfmhxrwyb2ax7mg2mu1bxgm8	YzdkZWMxNjY0NzlkNGM4ODBjYjQzOTg0Njk4NmU3ZGVmNzVhY2YwMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==	2019-10-09 20:58:50.575992+00
dcynd1wp4zo8jaq091k86au8vteqtql9	Nzg3ZWMwMTc0NDhjYWJjOTAxMGYxZDI3ODAyYzhlZGI5ZWU3MTE5MDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiQWl3TWp0emNVaXlCIl19	2019-10-10 13:54:35.868944+00
brt7xqide74qhyt552ygy13nndgx7igq	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-10-11 14:04:37.773197+00
bdx3z7jvo5x66fb9hr29cuncqtd96j78	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-10-11 17:05:09.07283+00
mqfmbk66w8ui9z2lvwzd12zv0sk626yp	NjczMWU3NjJkMTE4YTE3YWUxMzBiOTI4NTExMTgyMzMxMWQzMmRhZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjM4OTQ2ODcwNDQ4ZjQzMDdiZGViMzg0ZGFkNmIxOTllOWVhNWMwNDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2019-10-03 14:19:32.256767+00
5wn5w1iq497hljoepvvsco4h9cultksr	NjczMWU3NjJkMTE4YTE3YWUxMzBiOTI4NTExMTgyMzMxMWQzMmRhZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjM4OTQ2ODcwNDQ4ZjQzMDdiZGViMzg0ZGFkNmIxOTllOWVhNWMwNDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2019-10-03 20:45:20.888929+00
d9xvwuxo0gbn1pmdoj1cf3a2rias54w0	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-10-04 00:11:07.827602+00
q2xa0r39vov271zygdfdk9y2jx3peyo1	OGRlNjlmMDBjZDE4MTRhNWFmMTA2MzVjMjNjMjQwMDA1MDdhMDdjMjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiRkk1Q0t6VnQ1Rm5jIl19	2019-10-04 03:26:44.066421+00
jruxdel68d79z6g0l89i24g9javi4e2m	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-10-06 11:28:02.508594+00
k8x27bei9667ei93sqbhb2igtwd23jry	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-10-06 13:52:56.521015+00
b9feofl5ecn0lkif3duikbqcdz22ec8c	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-10-06 22:00:09.620563+00
73snz2a33lm5vi9tua5jx0r4fkoja1i0	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-10-06 23:09:30.079289+00
dvltoqjyxtnkqd5513katxs2godb9quq	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-10-06 23:15:19.126279+00
mo9vb1pgjn2we7xjqftp7tcky15voebw	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-10-07 21:17:32.525451+00
d5qw6rwlhi6qp0t03kwvyx0i0hgq6gr5	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-10-07 21:56:20.458254+00
smi5bp2c5qjqoa6eyogysjiunhlv6y2v	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-10-07 22:53:25.002139+00
hvi0ar9d3ph3vkf915o5zj2vec1nqavi	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-10-07 22:58:57.457468+00
ha352hkuiboenr164qf7bbel1nslx76j	YWY5OTgyYzVhOGNjODJmZTE4NjhhNGViYjU1ZTRhNTYyODNlNWI2Yzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIjZtZTRXUG11WGZHNSJdfQ==	2019-10-08 13:31:21.048978+00
y0rcmot53346cimetxz58ebg13dnivb5	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-10-08 20:48:27.478528+00
83hvlyh5srfmhz7qh4yg2yhora4ubrjp	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-10-08 21:55:41.428336+00
nkm5yxvw0gw7nmho9q3mgv66f1tffh9r	N2U4MTIwMTU0ZTM3MWNhYzRhZjg0OTAxMWNiYzAyYmI3NDBlN2MyMzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwidGR5RWtNeTNUNGxsIl19	2019-10-09 20:41:31.555917+00
dbcs3femaof8bhrvcc6af0jbi1r1tr8b	YmE4ZTIwNGQ1OGUzZWU5MGRiZjcxYmQzMWM1OTcwMGVmMjgwZmY1Yzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiQ0k0M0FDTFV5UU1JIl19	2019-10-10 07:46:28.850408+00
5c1l50vbaw9ic4wjpp2rmibgtajyb27n	OThhMDI0YjMyYzQ1OTZiNjJjNGQwNjIxMzEyMGEyZWI0MWE2NjA1Yzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwidWllY1BkbTYxWVF6Il19	2019-10-10 07:46:48.174225+00
33gyct6whugjvvvtbpzvrgr2pf9nd357	NDAyNjAwNWE4NDAxNjBiM2ZhYzA0NjhiNjhmNTY3M2ZmOWVkMDZhMTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3JlY2lwZS9hZGQvIn0sIm5lbzNpdUZTYXNqNyJdfQ==	2019-10-10 07:48:33.942282+00
nc513k8xkympi042kjr6qciszliydhxo	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-10-12 18:42:07.280159+00
ybfbrdomvujd9h862jqekb8z85b58zz9	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-10-12 19:44:22.819796+00
xswuafde8hshvqevmw7dniayrctg19ta	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-10-12 20:45:10.744831+00
9zhmmiuzfpjshro5rm1fuyehzsxma14u	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-10-12 20:47:55.44925+00
p25vo6bsd0jljb5zb639fkgj5igp7wj2	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-10-26 21:22:12.432189+00
mwftv5ahkkv36gsgq3xqmz3ulphmomn6	MmY4ZDg1ZGQzZjhlNDc4MmM0ZDk5MTEwNmI1MGNmMGJhMDQ1YjEwZDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiTzJEeEZBQU9mZ3p1Il19	2019-10-27 05:51:51.102661+00
5e68ktcvq3b0nfhtc7sbi3fm6q1nt2lq	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-11-03 22:04:20.363713+00
7gep1193ohp5w0ghqfzaymmxq62mp8fz	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-11-04 11:19:10.679156+00
sln1hupubnll976g668750k0s3y4gkbb	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-11-04 17:07:23.58358+00
pq5rwlinv8m8ma5ifbbka1jpdr1n5qbd	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-11-06 13:34:50.497983+00
vl2pdhr8ohcqwkkm4l6dqumjjhgpm371	ZjBjOGE1YmE4ZWI0OWYwMTFjMDVjYmMzZDdhOGYwZWQxZTE0Mzg1Mjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwic29jaWFsYWNjb3VudF9zb2NpYWxsb2dpbiI6eyJ1c2VyIjp7InVzZXJuYW1lIjoiIiwiZmlyc3RfbmFtZSI6Ikhlcm1hbm4iLCJsYXN0X25hbWUiOiJLYXNzIiwiaXNfYWN0aXZlIjp0cnVlLCJpc19zdGFmZl9tZW1iZXIiOmZhbHNlLCJpc19jb250cmlidXRvciI6dHJ1ZSwiaXNfc3VwZXJ1c2VyIjpmYWxzZSwiaXNfc3RhZmYiOmZhbHNlLCJsYXN0X2xvZ2luIjpudWxsLCJpZCI6bnVsbCwicGFzc3dvcmQiOiIhNjFTNVZ2bVcwYUY1WmpIYXFKblJQV1Nta3NRMEZpcWlpT1JlWXFhWSIsImVtYWlsIjoiaGVybWFubi5rYXNzQGdtYWlsLmNvbSIsImRhdGVfam9pbmVkIjoiMjAxOS0xMC0xNFQxMTozNzoxMS4wNjRaIn0sInRva2VuIjp7ImFjY291bnRfaWQiOm51bGwsImFwcF9pZCI6MiwiZXhwaXJlc19hdCI6IjIwMTktMTAtMTRUMTI6Mzc6MTEuMDAyWiIsInRva2VuIjoieWEyOS5JbC1iQnlSaU53dV9kd1VBSEhISjhEM2ozdWRiZDA5X3pHM2JmR2lkNmNGVzk3ZHgyUktfdzhoQUYyb01IaXJxQ2t4dTlrRkdCOE02dnUzR3VfMXJpbnRDcjluVFNQcDl2c3lIbUE0TjMyd0RxUlg2a2N1UTZCRFRCdW9LeUdtb2NnIiwiaWQiOm51bGwsInRva2VuX3NlY3JldCI6IjEvZGhuVlpIVWg3MDVSVkgwRGFiLXhfWDRmWV80YU1UZUpKNE0zeDdQbmtFVSJ9LCJhY2NvdW50Ijp7InVzZXJfaWQiOm51bGwsInVpZCI6IjEwNzU3NjA0MTU0MjE4ODUwOTY5MyIsImxhc3RfbG9naW4iOm51bGwsInByb3ZpZGVyIjoiZ29vZ2xlIiwiZXh0cmFfZGF0YSI6eyJmYW1pbHlfbmFtZSI6Ikthc3MiLCJuYW1lIjoiSGVybWFubiBLYXNzIiwicGljdHVyZSI6Imh0dHBzOi8vbGgzLmdvb2dsZXVzZXJjb250ZW50LmNvbS9hLS9BQXVFN21DZmtobHJIdWw2THQ1c05PQXBsM3hmcE9adHJLalRtVzRtZ1lpRWdnIiwibG9jYWxlIjoiZnIiLCJlbWFpbCI6Imhlcm1hbm4ua2Fzc0BnbWFpbC5jb20iLCJnaXZlbl9uYW1lIjoiSGVybWFubiIsImlkIjoiMTA3NTc2MDQxNTQyMTg4NTA5NjkzIiwidmVyaWZpZWRfZW1haWwiOnRydWV9LCJpZCI6bnVsbCwiZGF0ZV9qb2luZWQiOm51bGx9LCJlbWFpbF9hZGRyZXNzZXMiOlt7InZlcmlmaWVkIjp0cnVlLCJ1c2VyX2lkIjpudWxsLCJlbWFpbCI6Imhlcm1hbm4ua2Fzc0BnbWFpbC5jb20iLCJwcmltYXJ5Ijp0cnVlLCJpZCI6bnVsbH1dLCJzdGF0ZSI6eyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn19LCJfYXV0aF91c2VyX2hhc2giOiIzODk0Njg3MDQ0OGY0MzA3YmRlYjM4NGRhZDZiMTk5ZTllYTVjMDQ5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9	2019-10-28 11:37:51.086411+00
qk5eqtrbubmkz4u8m6lty4e1b2nljm9f	ZjU0OTUyMThiMTcxNDNiODY2MzlmNDRhOTEwOTE5ZjY3ODE5YzVjOTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc3NDEzM2JkOGU1ZGZjYjllYTJjMmIxN2I0YTViMDQ0NjRiNTk3ODciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMTEifQ==	2019-10-28 12:02:50.576722+00
y51zas6i6lpqruekb05j3ecu3tv8gf4c	ZjU0OTUyMThiMTcxNDNiODY2MzlmNDRhOTEwOTE5ZjY3ODE5YzVjOTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc3NDEzM2JkOGU1ZGZjYjllYTJjMmIxN2I0YTViMDQ0NjRiNTk3ODciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMTEifQ==	2019-10-28 16:23:38.586271+00
p7s1qacb2uk16je5ylctwt463lqs33tl	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-10-28 16:36:22.022317+00
qqdv9utp0qwl41xc08eiu8fdcz3eqyxu	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-10-28 16:44:45.726613+00
irzt7t4p42a0hzen1jwpm2bff1zgqtzk	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-10-28 19:41:19.053807+00
ac8wtvqwu59jdu5jwk4t4861j89dlxyh	MDAzZWVhZjc5M2UzOWNkMjA0Y2Y2NTRkMDVlMjg2ZmY3MmVkNzAzZDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiV1FJeER3UHdSNXBQIl19	2019-10-29 00:53:07.289049+00
qekebytzpmfulfgld2gdcf1hmqg6pthx	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-10-29 10:11:23.949569+00
5l283hgjz3yr5te21whw4dtiihwpyd0j	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-10-29 10:50:58.196797+00
ieacepic6ni09qbpmvsioug8zeq7usbf	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-10-29 19:57:25.031322+00
naxv6j7fs50ssyp239g3fcaxuetuksb9	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-10-31 12:08:27.367936+00
r960j0ybdjjq33xdq8umc0aor7iyw4a3	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-10-31 22:31:18.66944+00
zhl0z8cwoqb8eolw3xyyqyffqk5jauy3	NjczMWU3NjJkMTE4YTE3YWUxMzBiOTI4NTExMTgyMzMxMWQzMmRhZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjM4OTQ2ODcwNDQ4ZjQzMDdiZGViMzg0ZGFkNmIxOTllOWVhNWMwNDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2019-11-01 09:54:47.32739+00
rx103u01utgfocczh454prfa144v9348	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-11-01 13:55:42.106499+00
33jkabgwbdy4li0ja3j8x6kgtgqkpz6r	NjczMWU3NjJkMTE4YTE3YWUxMzBiOTI4NTExMTgyMzMxMWQzMmRhZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjM4OTQ2ODcwNDQ4ZjQzMDdiZGViMzg0ZGFkNmIxOTllOWVhNWMwNDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2019-11-02 13:29:53.268705+00
njit9ognuc0p31dbx68cm6ifk77fju7l	NTAxMjQ4NzlmZTU4MTFkOTU2YTVlMjhmMGVkODA2YjJjZTgwM2M1Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMzg5NDY4NzA0NDhmNDMwN2JkZWIzODRkYWQ2YjE5OWU5ZWE1YzA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-11-02 13:32:49.734279+00
qh2q70paqnkcr7c14riho82qdqgnaf35	MjMyNjY4YjgyNjdhMGVlM2JmY2YyNWRhN2ZlZTNjZWMyZjIzZGRjNTp7Il9hdXRoX3VzZXJfaGFzaCI6IjYyZDJjYTVjOTk0MzNiZTczZDEzYmRjNzQ3OTIyY2Q1YjRiNmJjM2MiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMTYiLCJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsfQ==	2019-11-03 17:19:35.880858+00
6l768uknautp541rvykbq0u7afjt2f20	YWRkMzY0NTYyMWE2NmQ1NGFjNmFhMjkyYzM3NmRjNWE5YmFmMWM0OTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTY2YzZjNDllYWNjN2RjMGNlNjNmM2NiNzkxODQyMWVmZjkzOWFjNyIsIl9hdXRoX3VzZXJfaWQiOiIxNyIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2019-11-03 21:25:49.386796+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.django_site (id, domain, name) FROM stdin;
2	togokuizine.com	togokuizine.com
\.


--
-- Data for Name: newsletter_article; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.newsletter_article (id, sortorder, title, text, url, image, post_id) FROM stdin;
\.


--
-- Data for Name: newsletter_message; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.newsletter_message (id, title, slug, date_create, date_modify, newsletter_id) FROM stdin;
\.


--
-- Data for Name: newsletter_newsletter; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.newsletter_newsletter (id, title, slug, email, sender, visible, send_html) FROM stdin;
\.


--
-- Data for Name: newsletter_newsletter_site; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.newsletter_newsletter_site (id, newsletter_id, site_id) FROM stdin;
\.


--
-- Data for Name: newsletter_submission; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.newsletter_submission (id, publish_date, publish, prepared, sent, sending, message_id, newsletter_id) FROM stdin;
\.


--
-- Data for Name: newsletter_submission_subscriptions; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.newsletter_submission_subscriptions (id, submission_id, subscription_id) FROM stdin;
\.


--
-- Data for Name: newsletter_subscription; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.newsletter_subscription (id, name, email, ip, create_date, activation_code, subscribed, subscribe_date, unsubscribed, unsubscribe_date, newsletter_id, user_id) FROM stdin;
\.


--
-- Data for Name: notify_notification; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.notify_notification (id, actor_object_id, actor_text, actor_url_text, verb, description, nf_type, target_object_id, target_text, target_url_text, obj_object_id, obj_text, obj_url_text, extra, created, read, deleted, actor_content_type_id, obj_content_type_id, recipient_id, target_content_type_id) FROM stdin;
1	1	\N	\N	a été publiée	\N	approve_recipe	1	\N	recipe_detail	\N	\N	\N	\N	2018-11-25 17:27:26.738858+00	t	f	29	\N	1	23
3	1	\N	\N	a été publiée	\N	approve_recipe	2	\N	/recipe/detail/sauce-aux-feuilles-de-haricots/	\N	\N	\N	\N	2018-12-13 23:27:12.586288+00	t	f	29	\N	1	23
2	1	\N	\N	a été publiée	\N	approve_recipe	3	\N	/recipe/detail/sauce-aux-feuilles-de-baobab/	\N	\N	\N	\N	2018-12-13 23:27:07.606948+00	t	f	29	\N	1	23
5	1	\N	\N	a été publiée	\N	approve_recipe	6	\N	/recipes/detail/kelewele/	\N	\N	\N	\N	2019-09-24 20:11:53.136726+00	t	f	29	\N	1	23
6	1	\N	\N	a été publiée	\N	approve_recipe	7	\N	/recipes/detail/le-fameux-pinon-blanc/	\N	\N	\N	\N	2019-10-07 22:43:20.41265+00	t	f	29	\N	1	23
7	1	\N	\N	a été publiée	\N	approve_recipe	9	\N	/recipes/detail/pastels-a-la-viande/	\N	\N	\N	\N	2019-10-12 19:45:11.111483+00	t	f	29	\N	1	23
8	1	\N	\N	a été publiée	\N	approve_recipe	8	\N	/recipes/detail/ma-salade-minceur/	\N	\N	\N	\N	2019-10-14 23:43:11.70015+00	t	f	29	\N	1	23
9	1	\N	\N	a été publiée	\N	approve_recipe	14	\N	/recipes/detail/les-petits-beignets-de-tapioca/	\N	\N	\N	\N	2019-10-19 14:22:55.749339+00	t	f	29	\N	1	23
\.


--
-- Data for Name: recipe_category; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.recipe_category (id, name, created_at, update_at, slug) FROM stdin;
6	Entrées	2019-03-03 22:20:57.101149+00	2019-03-03 22:20:57.101173+00	entrees
7	Plats	2019-09-22 22:40:25.917426+00	2019-09-22 22:40:25.917463+00	plats
8	Sauces & Soupes	2019-09-22 22:40:46.291764+00	2019-09-22 22:40:46.291792+00	sauces-soupes
10	Snacks	2019-09-22 22:41:27.96145+00	2019-09-22 22:41:27.961476+00	snacks
9	Desserts	2019-09-22 22:41:16.073707+00	2019-09-22 22:41:39.416765+00	dessert
\.


--
-- Data for Name: recipe_categoryvideo; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.recipe_categoryvideo (id, name, created_at, update_at, slug) FROM stdin;
\.


--
-- Data for Name: recipe_origin; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.recipe_origin (id, ethnic, country, created_at, update_at) FROM stdin;
\.


--
-- Data for Name: recipe_recipe; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.recipe_recipe (id, title, description, prepare_time, cooking_time, total_time, ingredient, preparation, image, image_1, image_2, image_3, view, "like", created_at, update_at, published_at, slug, author_id, category_id) FROM stdin;
6	Kelewele	Le Kelewele (prononcé kéléwélé) est un plat ghanéen très populaire que l'on retrouve également  Togo, Cote d'Ivoire, Nigéria, Bénin, etc. Il est fait à base de bananes plantains frits et épicées. Il est parfois servi seul ou avec du riz , haricot ou encore du ragoût. C'est un plat qui se déguste à n'importe quel moment de la journée.	00:00:15	00:00:10	00:00:25	<ul>\r\n\t<li>3 bananes plantains m&ucirc;res</li>\r\n\t<li>1/2&nbsp;c.&agrave;.c&nbsp;de&nbsp;gingembre en poudre</li>\r\n\t<li>1/2 c.&agrave;.c de&nbsp;de piment rouge en proudre</li>\r\n\t<li>1/2 c.&agrave;.c de poivre blanc</li>\r\n\t<li>1.c&agrave;.c de sel</li>\r\n\t<li>1 oignon (taille moyenne)</li>\r\n\t<li>Huile pour la friture</li>\r\n</ul>	<ol>\r\n\t<li>Eplucher les bananes plantains et d&eacute;coupez les&nbsp;en petits d&eacute;s.</li>\r\n\t<li>Hacher l&#39;oignon et m&eacute;langer l&#39;ensemble des epices&nbsp;avec les bananes&nbsp;</li>\r\n\t<li>Laisser mariner environ 10&nbsp;min</li>\r\n\t<li>Faire chauffer l&rsquo;huile dans une casserole. Frire les bananes&nbsp;dans l&rsquo;huile chaude jusqu&#39;&agrave; ce qu&rsquo;elles&nbsp;soient&nbsp;dor&eacute;es.</li>\r\n\t<li>&Eacute;ponger&nbsp;sur du papier absorbant&nbsp;et servir chaud... Bonne d&eacute;gustation!</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>	recipes/IMG_20190922_170219.jpg	recipes/IMG_20190922_160543_sjaRFOD.jpg	recipes/IMG_20190922_164636.jpg	recipes/IMG_20190922_165615_e9oEMok.jpg	48	0	2019-09-24 17:22:25.120641+00	2019-10-21 12:21:34.234081+00	2019-09-24 20:11:53.129366+00	kelewele	1	10
14	Les petits beignets de tapioca		00:00:05	00:00:10	00:00:15	<ul>\r\n\t<li>200g de tapioca</li>\r\n\t<li>10g de sucre</li>\r\n\t<li>5cl de lait</li>\r\n\t<li>1 oeuf</li>\r\n\t<li>Huile</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>	<p>1. M&eacute;langez&nbsp;le tapioca et le sucre dans un r&eacute;cipient. Versez le lait dessus. Laissez poser 5 &agrave; 10 min, le temps que le grains de tapioca ramolissent s&#39;ils&nbsp;sont trop durs.</p>\r\n\r\n<p>2. Ajoutez l&#39;oeuf au m&eacute;lange et formez de petites boules .</p>\r\n\r\n<p>3. Chauffez&nbsp;de l&#39;huile&nbsp;dans une casserole et faites frire vos beignets jusqu&#39;&agrave; ce qu&#39;ils ne soient dor&eacute;es.</p>\r\n\r\n<p>4. Servez chaud seuls ou accompagn&eacute;s d&#39;une bouillie/d&#39;un&nbsp;th&eacute;. Les beignets ont un aspect croustillant vu de l&#39;ext&eacute;rieur, mais sont moelleux &agrave; l&#39;int&eacute;rieur.</p>	recipes/IMG_20191019_100518.jpg	recipes/IMG_20191019_093915.jpg	recipes/IMG_20191019_094707.jpg	recipes/IMG_20191019_100414.jpg	18	0	2019-10-19 13:56:03.412456+00	2019-10-21 17:52:09.842777+00	2019-10-19 14:22:55.744383+00	les-petits-beignets-de-tapioca	1	10
9	Pastels à la viande	Les pastels sont des beignets en forme de chausson,farcis à la viande ou au poisson. Ce plat africain peut être servi en entrée ou en apéritif.	00:00:15	00:00:45	00:01:00	<p><strong>Pour la p&acirc;te</strong> :</p>\r\n\r\n<ul>\r\n\t<li>350 g de farine</li>\r\n\t<li>25 g de beurre</li>\r\n\t<li>15&nbsp;cl de lait</li>\r\n\t<li>1/2 sachet de levure chimique</li>\r\n\t<li>1 c.a.c de thym</li>\r\n\t<li>2 oeufs</li>\r\n\t<li>Sel</li>\r\n</ul>\r\n\r\n<p><strong>Pour la farce</strong> :</p>\r\n\r\n<ul>\r\n\t<li>100 g de viande hach&eacute;e</li>\r\n\t<li>Tomate, poivron, oignon (coup&eacute;s en d&eacute;s)&nbsp;</li>\r\n\t<li>1/2 c.&agrave;.c de piment</li>\r\n\t<li>1 c.&agrave;.c de m&eacute;lange d&#39;&eacute;pices&nbsp;</li>\r\n\t<li>Huile</li>\r\n\t<li>Sel</li>\r\n</ul>	<ol>\r\n\t<li>Versez la farine, le sel, la levure,le thym dans un saladier. M&eacute;langez et creusez un puits. Y incorporez, le beurre, les oeufs et versez progressivement le lait en remuant &agrave; l&#39;aide d&#39;un fouet ou &agrave; la main. Vous devez obtenir une p&acirc;te homog&egrave;ne et un peu &eacute;latisque. Formez une boule et laissez la p&acirc;te reposer pendant 30&nbsp;min &agrave; temp&eacute;rature ambiante.</li>\r\n\t<li>Pour la farce: Faites revenir l&#39;oignon, le poivron et la tomate dans une po&ecirc;le avec un peu d&#39;huile. Ajoutez la viande hach&eacute;e,&nbsp; salez, et assaisonnez.&nbsp;Laissez mijoter quelques minutes et ensuite laissez la farce refroidrir.</li>\r\n\t<li>A l&#39;aide d&#39;&nbsp;un rouleau &agrave; p&acirc;tisserie, &eacute;talez la p&acirc;te sur un plan de travail farin&eacute;. D&eacute;coupez de petits cercles &agrave; l&rsquo;aide d&rsquo;un emporte-pi&egrave;ce.</li>\r\n\t<li>Au milieu de&nbsp;chaque cercle, ajoutez un peu de farce &nbsp;et rabattez.&nbsp;Vos pastels doivent &ecirc;tre en forme de demi-lune.</li>\r\n\t<li>Dans une casserole, faites chauffez&nbsp;l&#39;huile. Ensuite plongez les pastels,&nbsp;faites-les frire environ 5 min, jusqu&rsquo;&agrave; ce qu&rsquo;ils soient bien dor&eacute;s.</li>\r\n\t<li>Servez chaud avec&nbsp;une sauce tomate en accompagnement si vous le d&eacute;sirez.&nbsp;</li>\r\n</ol>	recipes/IMG_20190921_180450.jpg	recipes/IMG_20190921_173240.jpg	recipes/IMG_20190921_175942.jpg	recipes/IMG_20190921_182117.jpg	27	0	2019-10-12 19:43:11.343308+00	2019-10-21 16:57:49.600058+00	2019-10-12 19:45:11.106774+00	pastels-a-la-viande	1	10
13	test		\N	\N	\N	<p>ss</p>	<p>dfgg</p>	recipes/drink-2910442_1920.jpg				0	0	2019-10-14 19:42:32.033095+00	2019-10-14 19:42:32.033119+00	\N	test	1	6
15	Vinaigrette au curry		00:00:05	\N	\N	<ul>\r\n\t<li>1 c.c de curry</li>\r\n\t<li>1 c.c de moutarde</li>\r\n\t<li>1 c.c de mayonnaise&nbsp;</li>\r\n\t<li>2 c.s&nbsp; de vinaigre basalmique</li>\r\n\t<li>1 c.s de vinaigre de cidre</li>\r\n\t<li>2 c.s d&#39;huile d&#39;olive</li>\r\n\t<li>1 pinc&eacute;e de sel</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	<p>M&eacute;langer le&nbsp;</p>	recipes/IMG_20191020_220227.jpg				0	0	2019-10-20 22:14:11.521836+00	2019-10-20 22:14:11.521868+00	\N	vinaigrette-au-curry	1	8
16	Salade de fusilli au curry	Aujourd'hui nous vous proposons, une salade toute simple mais délicieuse.   Ce plat peut être servi en entrée ou pour un léger dîner le soir.	00:00:10	00:00:15	00:00:25	<p>Pour deux personnes:</p>\r\n\r\n<ul>\r\n\t<li>150 g de p&acirc;tes(fusilli)</li>\r\n\t<li>1 boite de thon</li>\r\n\t<li>Saucisse</li>\r\n\t<li>Haricots verts</li>\r\n\t<li>Carottes</li>\r\n\t<li>Tomates</li>\r\n\t<li>1 oignon</li>\r\n\t<li>Sel</li>\r\n\t<li>Vinaigrette au curry</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	<ol>\r\n\t<li>Cuire les p&acirc;tes al dente dans de l&#39;eau sal&eacute;e. Les &eacute;goutter et les laisser refroidir. Faire de m&ecirc;me pour les carottes et haricots verts coup&eacute;s en morceaux.</li>\r\n\t<li>D&eacute;couper en d&eacute;s les tomates, oignons et saucisse.</li>\r\n\t<li>Mettre les p&acirc;tes dans un saladier,&nbsp; ajouter les haricots,&nbsp;carottes, les tomates, oignon et saucisse. Ajoutez &eacute;galement le thon &eacute;goutt&eacute; et &eacute;miett&eacute;</li>\r\n\t<li>Arrosez votre salade, de la&nbsp;sauce vinaigrette. M&eacute;langez le tout et laissez reposer, sous un film plastique, pendant 1h au r&eacute;frig&eacute;rateur.&nbsp;</li>\r\n</ol>	recipes/IMG_20191020_1950441.jpg				0	0	2019-10-21 12:51:33.492898+00	2019-10-21 12:51:33.496008+00	\N	salade-de-fusilli-au-curry	1	6
8	Ma salade minceur aux légumes	La salade est un plat incontournable dans un programme minceur et ceux qui veulent garder la ligne, peuvent vous le confirmer. Il existe une multitude de salades minceur mais aujourd'hui nous vous proposons l'une des plus basiques, simple et rapide à réaliser.	\N	\N	\N	<ul>\r\n\t<li>2 pieds de laitue</li>\r\n\t<li>1 poign&eacute;e d&#39; haricots verts</li>\r\n\t<li>1 Carotte</li>\r\n\t<li>1 Oignon</li>\r\n\t<li>1 Tomate</li>\r\n\t<li>1 Oeuf</li>\r\n\t<li>Vinaigrette l&eacute;g&egrave;re</li>\r\n</ul>	<ol>\r\n\t<li>Retirez les pieds de votre laitue. Lavez et essorez vos laitues.</li>\r\n\t<li>Coupez&nbsp;les haricots, la&nbsp;carottes en batonnets.&nbsp;Faites&nbsp;bouillir dans une casserole de l&rsquo;eau sal&eacute;e. Lorsque l&rsquo;eau bout, y plonger les haricots et laissez les cuire, au bout de 2 minutes ajoutez &eacute;galement les carottes. et laissez le tout cuire pendant 3 minutes. Egouttez.</li>\r\n\t<li>Cuire l&#39;oeuf dur et D&eacute;coupez la tomate et l&#39;oignon en longueur.</li>\r\n\t<li>Dans un saladier, posez vos laitues (d&eacute;coupez les feuilles&nbsp;si elles sont trop grandes). Ajoutez le reste des ingr&eacute;dients. M&eacute;langez le tout avec une vinaigrette l&eacute;g&egrave;re.</li>\r\n</ol>\r\n\r\n<p><strong>Astuces</strong>: Pour d&eacute;sinfecter vos laitues, lavez les au minimum 3 fois de suite.&nbsp;La 3&egrave;me fois, ajoutez&nbsp;du vinaigre ou du sel dans l&#39;eau et&nbsp;laissez poser les laitues pendant 30 min avant de les essorer.</p>	recipes/IMG_20190908_1947511.jpg	recipes/IMG_20190908_193758.jpg			12	0	2019-10-08 13:07:43.866173+00	2019-10-21 17:05:12.635707+00	2019-10-14 23:43:11.694486+00	ma-salade-minceur	1	6
\.


--
-- Data for Name: recipe_recipe_origin; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.recipe_recipe_origin (id, recipe_id, origin_id) FROM stdin;
\.


--
-- Data for Name: recipe_video; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.recipe_video (id, title, description, video, view, "like", created_at, update_at, published_at, slug, author_id, category_id) FROM stdin;
\.


--
-- Data for Name: recipe_video_origin; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.recipe_video_origin (id, video_id, origin_id) FROM stdin;
\.


--
-- Data for Name: restaurant_category; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.restaurant_category (id, name, created_at, update_at, slug) FROM stdin;
1	Restaurants	2018-11-24 17:26:33.665054+00	2018-11-24 17:26:33.665076+00	restaurants
4	Hôtels	2019-09-22 22:57:19.679456+00	2019-09-22 22:57:19.679484+00	hotels
5	Services traiteurs	2019-09-22 22:57:34.795449+00	2019-09-22 22:57:34.795487+00	services-traiteurs
\.


--
-- Data for Name: restaurant_restaurant; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.restaurant_restaurant (id, name, description, tel, fb_id, insta_id, twit_id, lind_id, address, web_site, image, enabled, created_at, update_at, slug, author_id, category_id) FROM stdin;
2	Love Africa Bar-Restaurant	<p>Si vous &ecirc;tes &agrave; Lom&eacute; et vous avez envie de visiter&nbsp;un lieu d&eacute;contract&eacute; et chaleureux qui met en valeur les plats africains, faites un tour au&nbsp;restaurant Love Africa.&nbsp;Il propose &eacute;galement d&rsquo;autres plats europ&eacute;ens &agrave; des tarifs abordables. Le restaurant est ouvert 7j/7 et 24h/24.<br />\r\n&nbsp;</p>	+228 90 85 78 28	https://www.facebook.com/LvefricaTg/	https://www.instagram.com/Lve_Africa/			Rue Tandouare, à 50 m de EAMAU  (Adewi/Lome)		restaurants/46828819_550304195442127_3043825185028308992_n.jpg	True	2019-10-03 14:05:31.201186+00	2019-10-03 14:10:19.950556+00	love-africa-bar-restaurant	1	1
\.


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
5	google	116198348302123933587	2019-10-14 16:23:38.560646+00	2019-10-14 09:51:52.870232+00	{"family_name": "Yakpa", "name": "Brice Yakpa", "picture": "https://lh3.googleusercontent.com/-uBu9YTo7EkQ/AAAAAAAAAAI/AAAAAAAAAAA/ACHi3rfA-OEwblrnOvHuxaucnUmYVOKlzQ/photo.jpg", "locale": "fr-CA", "email": "klausyakpa@gmail.com", "given_name": "Brice", "id": "116198348302123933587", "verified_email": true}	11
\.


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
2	google	Google	709204217009-k81pahmglkqg8vci64v6jn4egf9s7ie3.apps.googleusercontent.com	YpoBH1Um5QfS50z9vo8rC9yt	
1	facebook	Facebook	128292487759648	6d750fe463d0ce642995d722834016d9	
\.


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
1	1	2
2	2	2
\.


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
5	ya29.ImSbBx5ZrS1n-bXIfSbV1rqdR9N8YYJWL_0xJYwB1PQJRYIs-YU3z6PVf4XrsCWMUyJOladsnmTicroTyWimyVSXbN5eMVV2VTLkvOmXfJcE40Q8aVlnaTQ04N6shqfGITgnKR9g	1//03sVbH3tSXZbyCgYIARAAGAMSNwF-L9IrPXoyBExd-1c9P8w5Zc1fR1yD-fceKwZAo9mUnpPww9nL23N-2LFyR7hFY_DFFs6tnK4	2019-10-14 17:23:38.493456+00	5	2
\.


--
-- Data for Name: star_ratings_rating; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.star_ratings_rating (id, count, total, average, object_id, content_type_id) FROM stdin;
1	0	0	0.000	1	30
2	11	38	3.455	2	30
\.


--
-- Data for Name: star_ratings_userrating; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.star_ratings_userrating (id, created, modified, ip, score, rating_id, user_id) FROM stdin;
1	2019-10-15 10:53:47.22834+00	2019-10-15 10:53:47.228804+00	196.170.23.47	1	2	\N
2	2019-10-15 10:53:47.832183+00	2019-10-15 10:53:47.83263+00	196.170.23.47	2	2	\N
3	2019-10-15 10:53:48.547293+00	2019-10-15 10:53:48.54758+00	196.170.23.47	3	2	\N
4	2019-10-15 10:53:49.222431+00	2019-10-15 10:53:49.222813+00	196.170.23.47	4	2	\N
5	2019-10-15 10:53:50.92249+00	2019-10-15 10:53:50.922861+00	196.170.23.47	3	2	\N
6	2019-10-15 10:53:51.963333+00	2019-10-15 10:53:51.963754+00	196.170.23.47	4	2	\N
7	2019-10-18 16:47:18.066024+00	2019-10-18 16:47:18.066463+00	196.170.92.79	4	2	\N
8	2019-10-18 16:47:22.246864+00	2019-10-18 16:47:22.247126+00	196.170.92.79	4	2	\N
9	2019-10-18 16:47:24.649578+00	2019-10-18 16:47:24.650105+00	196.170.92.79	5	2	\N
10	2019-10-18 16:47:28.37985+00	2019-10-18 16:47:28.38041+00	196.170.92.79	4	2	\N
11	2019-10-18 16:47:32.449951+00	2019-10-18 16:47:32.450213+00	196.170.92.79	4	2	\N
\.


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.taggit_tag (id, name, slug) FROM stdin;
1	Blog	blog
2	Fruit	fruit
3	Santé	sante
4	salade	salade
5	entree	entree
6	togo	togo
7	naouda	naouda
8	kabyè	kabye
9	Poids	poids
10	Graisse	graisse
12	Salade	salade_1
13	Pommes de terre	pommes-de-terre
14	Laitue	laitue
16	Entrée	entree_1
17	Collation	collation
18	Fritures	fritures
19	Bananes plantains	bananes-plantains
20	Aloco	aloco
21	Amuse-gueule	amuse-gueule
22	Pinon	pinon
23	Manioc	manioc
24	Gari	gari
25	Pâte	pate
26	Street Food	street-food
27	Pastels	pastels
28	Beignets	beignets
29	Farine de Blé	farine-de-ble
30	Snacks	snacks
31	Régime	regime
32	Légumes	legumes
33	Salade verte	salade-verte
34	Riz Blanc	riz-blanc
35	Préparation	preparation
36	Astuces	astuces
37	Riz	riz
38	Cuisson	cuisson
39	Tapioca	tapioca
41	collation	collation_1
43	beignets	beignets_1
44	petit déjeuner	petit-dejeuner
45	magnoc	magnoc
47	manioc	manioc_1
48	Curry	curry
49	Vinaigre	vinaigre
50	Sauce	sauce
51	Vinaigrette	vinaigrette
\.


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
1	1	27	1
2	1	27	2
3	1	27	3
4	1	23	4
5	1	23	5
6	2	23	6
7	2	23	7
10	2	27	1
11	2	27	10
12	2	27	9
17	6	23	17
18	6	23	18
19	6	23	19
20	6	23	20
21	6	23	21
26	6	23	26
27	9	23	27
28	9	23	28
29	9	23	29
30	9	23	30
31	8	23	32
32	8	23	33
33	8	23	12
34	8	23	14
35	8	23	31
36	3	27	34
37	3	27	35
38	3	27	36
39	3	27	37
40	3	27	38
41	14	23	41
42	14	23	43
43	14	23	44
45	14	23	39
46	14	23	47
47	15	23	48
48	15	23	49
49	15	23	50
50	15	23	51
51	15	23	12
\.


--
-- Data for Name: threadedcomments_comment; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.threadedcomments_comment (comment_ptr_id, title, tree_path, last_child_id, parent_id, newest_activity) FROM stdin;
1		0000000001	\N	\N	2018-11-25 16:59:58.060264+00
2		0000000002	\N	\N	2018-12-02 21:40:27.221628+00
3		0000000003	\N	\N	2018-12-02 21:41:51.662425+00
4		0000000004	\N	\N	2019-01-03 16:51:07.136708+00
5		0000000005	\N	\N	2019-10-09 19:37:28.804558+00
\.


--
-- Data for Name: thumbnail_kvstore; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.thumbnail_kvstore (key, value) FROM stdin;
sorl-thumbnail||image||75df702a5eb548c20ec87bf676e146cf	{"storage": "django.core.files.storage.FileSystemStorage", "name": "blog/corossol.jpg", "size": [425, 265]}
sorl-thumbnail||image||a50dbe7c535ab9603127dbe4ab8a2e56	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/f2/00/f200aa73a39d82ee15565c591fae1f6e.jpg", "size": [600, 300]}
sorl-thumbnail||image||63de8bf76adc188e682fc159481a2df8	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/0a/6b/0a6b22dc92458adc1c12175b1211bb37.jpg", "size": [70, 50]}
sorl-thumbnail||image||d578d2b143f5f4c49f47edcc626e7401	{"storage": "django.core.files.storage.FileSystemStorage", "name": "blog/DSC_1409.JPG", "size": [6000, 4000]}
sorl-thumbnail||image||e5287ccf1670f029ddab1358ca4533db	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/c1/20/c12028bc5482cf6b9f52479b9729bc05.jpg", "size": [680, 350]}
sorl-thumbnail||image||85f36073e493ea2aafe0b63ebf0026b3	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/6d/ca/6dca38cb21fb13ac0001250f36fd13d4.jpg", "size": [600, 300]}
sorl-thumbnail||image||d4305b5a758f9a4ace55dc72f188b136	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/e6/6e/e66e6e49f02534356b5152a37108f2ce.jpg", "size": [900, 500]}
sorl-thumbnail||thumbnails||75df702a5eb548c20ec87bf676e146cf	["a50dbe7c535ab9603127dbe4ab8a2e56", "63de8bf76adc188e682fc159481a2df8", "d4305b5a758f9a4ace55dc72f188b136"]
sorl-thumbnail||image||85d96b41434b9c35d8d3dbd2ee5791ff	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/Lighthouse.jpg", "size": [1024, 768]}
sorl-thumbnail||image||183e207ba3f0a86f253cec7f3da6f461	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/ae/32/ae3216f7924597be1f7da06acd16a1ae.jpg", "size": [900, 500]}
sorl-thumbnail||image||78efea8c355a4dad71dec2a28edfe73d	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/06/e1/06e1f0fad6021b01ce6b9df4c6f8fb57.jpg", "size": [800, 400]}
sorl-thumbnail||image||7cd7cc5972d406e4728bfcf106abd7b5	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/Hydrangeas.jpg", "size": [1024, 768]}
sorl-thumbnail||image||763af746230e90484e633a861a0ce345	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/d7/ac/d7acb57a57434c46c14129d6e7dbecde.jpg", "size": [800, 400]}
sorl-thumbnail||thumbnails||7cd7cc5972d406e4728bfcf106abd7b5	["763af746230e90484e633a861a0ce345"]
sorl-thumbnail||image||90ebf85e7756bbc9b686482e6e985a92	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/e9/17/e9179535a0231c412bf01307360f30db.jpg", "size": [70, 50]}
sorl-thumbnail||thumbnails||85d96b41434b9c35d8d3dbd2ee5791ff	["183e207ba3f0a86f253cec7f3da6f461", "78efea8c355a4dad71dec2a28edfe73d", "90ebf85e7756bbc9b686482e6e985a92"]
sorl-thumbnail||image||02ff956508f9393b11fcc837338aeaae	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/S39-500x500.jpg", "size": [500, 500]}
sorl-thumbnail||image||9e8a8b95de1cc7fe6c52ed687dd66f51	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/5c/4f/5c4f3ac85aeca68fe501e37ce36e5e57.jpg", "size": [900, 500]}
sorl-thumbnail||image||8636150dc5a859b3a3e7625cb354566e	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/Martin-habilitation-electrique-coupure.png", "size": [500, 500]}
sorl-thumbnail||image||4b1f781b2cf00745525c17855b57de6d	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/48/d3/48d3992041668d671dd164c437d39361.jpg", "size": [900, 500]}
sorl-thumbnail||image||87e0e727db001f76dbc8cb0f967dce4a	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/72/b8/72b81dab3d2a14997372b2d75fb9e71a.jpg", "size": [800, 400]}
sorl-thumbnail||image||2b6fc47f0c7ef2bd0fa3d6b94b9bfce3	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/bd/c2/bdc2df2917ab7fcb0bd5b1339a090bc6.jpg", "size": [70, 50]}
sorl-thumbnail||image||fa46984101bdc9ed7c940f5dd975cd44	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/63/cf/63cf405485c7cc5d2c676e4cc165abc5.jpg", "size": [70, 50]}
sorl-thumbnail||thumbnails||8636150dc5a859b3a3e7625cb354566e	["87e0e727db001f76dbc8cb0f967dce4a", "4b1f781b2cf00745525c17855b57de6d", "fa46984101bdc9ed7c940f5dd975cd44"]
sorl-thumbnail||image||568db4f1550bdfb28442bc7d5d78232e	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/a7/48/a7480a2d10ff883e23ec0b5d6c7e2598.jpg", "size": [800, 400]}
sorl-thumbnail||image||e818f483dea97f0c2e4d5d673f745659	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/74/dc/74dc768f965a3eaa8fc76042f4fc2e37.jpg", "size": [900, 500]}
sorl-thumbnail||image||d326a6b6cd2ce8fed8c07b570fac381b	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/4a/f3/4af381e1b76845bfea9c74f514fd3345.jpg", "size": [70, 50]}
sorl-thumbnail||thumbnails||02ff956508f9393b11fcc837338aeaae	["d326a6b6cd2ce8fed8c07b570fac381b", "568db4f1550bdfb28442bc7d5d78232e", "9e8a8b95de1cc7fe6c52ed687dd66f51"]
sorl-thumbnail||image||c5e5f7c7b9a8e0500e84bf1446bdb7bf	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/DSCF2293.JPG", "size": [6000, 4000]}
sorl-thumbnail||image||0aebef2d7a429b18bd703444eeb48b07	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/99/1d/991d6be3ea7b4c07de9e6c0c992da683.jpg", "size": [900, 500]}
sorl-thumbnail||image||4babe4047d87418f90a492b2fbd9426e	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/5f/dd/5fddf5a3fb0288d9348ed3f0d0c7e0c2.jpg", "size": [800, 400]}
sorl-thumbnail||image||3927ac6bb4276f083891b99be83a7a32	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/DSCF2299.JPG", "size": [6000, 4000]}
sorl-thumbnail||image||2109f73cb6301af32029d677b297c24f	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/ca/ea/caea097dd9c0c3480459a44558825246.jpg", "size": [800, 400]}
sorl-thumbnail||thumbnails||3927ac6bb4276f083891b99be83a7a32	["2109f73cb6301af32029d677b297c24f"]
sorl-thumbnail||image||66c3d2a2b40eb2255fcb7ea21dbd58f6	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/3b/d9/3bd9bc162e3ac6a3e51893519d1bb0ed.jpg", "size": [680, 350]}
sorl-thumbnail||thumbnails||d578d2b143f5f4c49f47edcc626e7401	["66c3d2a2b40eb2255fcb7ea21dbd58f6", "85f36073e493ea2aafe0b63ebf0026b3", "2b6fc47f0c7ef2bd0fa3d6b94b9bfce3", "e818f483dea97f0c2e4d5d673f745659"]
sorl-thumbnail||image||f59bf154af4e932e52c68f53a26b9922	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d.jpg", "size": [70, 50]}
sorl-thumbnail||image||38f5187e65a75bca4cfb4103242b62d8	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_9apMgdV.jpg", "size": [70, 50]}
sorl-thumbnail||image||a470d150bfb31db3e63c26b3aa1be921	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_8aMfHnx.jpg", "size": [70, 50]}
sorl-thumbnail||image||71b1296517ec712815bdf4a16e5c8e3f	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_3x3Vaxs.jpg", "size": [70, 50]}
sorl-thumbnail||image||8f6c65bb61e0504cc71ba3409dcefabf	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_mfJEGMq.jpg", "size": [70, 50]}
sorl-thumbnail||image||b76d235205e17b11a97d9dc72f0869dd	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_oDXxOPI.jpg", "size": [70, 50]}
sorl-thumbnail||image||cefa6814e0328b4feb4089f904b75fe1	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_a5L19fM.jpg", "size": [70, 50]}
sorl-thumbnail||image||d8cfac08708e1680de339f27eb9fb6dd	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_1ynIIrY.jpg", "size": [70, 50]}
sorl-thumbnail||image||0378d71abf32ab8eef11b81195b0cb2e	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_v7QAaC1.jpg", "size": [70, 50]}
sorl-thumbnail||image||ea93f1e02c2263365ba98c5b97a545e6	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_9oXYtuG.jpg", "size": [70, 50]}
sorl-thumbnail||image||18591d7c2da5cb7f4f2b7eb55de917d1	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_lTBzYA6.jpg", "size": [70, 50]}
sorl-thumbnail||image||8895ba225c9d71b1de7240f5b767137d	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_2mXXuMu.jpg", "size": [70, 50]}
sorl-thumbnail||image||a5be715457a44d835406cbd8a0da2412	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_vKbRvf2.jpg", "size": [70, 50]}
sorl-thumbnail||image||5412ce32d7c385eb6de8aa739e7ba7d4	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_IQ3U0hQ.jpg", "size": [70, 50]}
sorl-thumbnail||image||a1330b593f97c0829cf6e15858b60ec3	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_c9OsR00.jpg", "size": [70, 50]}
sorl-thumbnail||image||217c110f6ef54e31978948fdcd2183ce	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_vHHRLJT.jpg", "size": [70, 50]}
sorl-thumbnail||image||10c3c5342b21f5cd13b12c852a359d93	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_1z2WXn0.jpg", "size": [70, 50]}
sorl-thumbnail||image||d9c9c771dfdebd3d353671e4cee9310d	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_mDDLgG4.jpg", "size": [70, 50]}
sorl-thumbnail||image||ff20d01216a11cc290d66e4beec6e342	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_C50cw8V.jpg", "size": [70, 50]}
sorl-thumbnail||image||0042c46ec15e2942b50045940a3aa60c	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_4gBXlz9.jpg", "size": [70, 50]}
sorl-thumbnail||image||24ec5c76aac448ee539f04fab0a47272	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_0QgTfkA.jpg", "size": [70, 50]}
sorl-thumbnail||image||4e824383021c158aaf67046bbc73f25d	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_ZmZHf4b.jpg", "size": [70, 50]}
sorl-thumbnail||image||7b3ffb499cffa03c6e5f6ade56fd371c	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_z0zHlCV.jpg", "size": [70, 50]}
sorl-thumbnail||image||52e2de405cf19c6571bc970a8e44a561	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_15mWsxA.jpg", "size": [70, 50]}
sorl-thumbnail||image||7301d0d9cbcaae6ce2ff932be43d8edb	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_2F1fprS.jpg", "size": [70, 50]}
sorl-thumbnail||image||1fe58db93d362a0ba8178c22c9ef1920	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_D0D17W0.jpg", "size": [70, 50]}
sorl-thumbnail||image||8dcb42ed0b213a06c81efadee61c2b53	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_ya5Y17p.jpg", "size": [70, 50]}
sorl-thumbnail||image||daaadbc0bc28eeffcd974e9920bd8591	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_7ngO9is.jpg", "size": [70, 50]}
sorl-thumbnail||image||e03191bd15c937bdf8c0f7905e0fb2fb	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_F0S18ZN.jpg", "size": [70, 50]}
sorl-thumbnail||image||26981d0de421ad3318f9d133f53726d9	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_j08O8Eb.jpg", "size": [70, 50]}
sorl-thumbnail||image||ba17904bd19ad7d5becbe582b76cc35f	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/IMG_20190922_170219.jpg", "size": [2448, 3264]}
sorl-thumbnail||image||b36fe6da97d7a1150414a2531dddd033	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/eb/a8/eba8c6cc0ee22c3892e89c48de7acfe3.jpg", "size": [500, 200]}
sorl-thumbnail||thumbnails||ba17904bd19ad7d5becbe582b76cc35f	["b36fe6da97d7a1150414a2531dddd033", "eeb13aaafdf39a2c8618617ae7794778"]
sorl-thumbnail||image||a51d4e95d9332e6642f01e079d8131b8	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/5e/57/5e5755353b7b4f463895a7768c9db497.jpg", "size": [900, 500]}
sorl-thumbnail||image||42cfeabc5461f94462a0b770bb206b63	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/a0/74/a074f46b260b5a7e9554ea0b6b126fe1_vrUIY7a.jpg", "size": [70, 50]}
sorl-thumbnail||image||05209bdce738241ea27c70f033aa1bf3	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_37w6Ru4.jpg", "size": [70, 50]}
sorl-thumbnail||image||18dd7a0c680757be30f7ba00624ebf73	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/f2/5f/f25fc604032b0e26d561700304bdd6e5.jpg", "size": [900, 500]}
sorl-thumbnail||image||31689fc92c939d12f82419a299e32322	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_PuEAA7n.jpg", "size": [70, 50]}
sorl-thumbnail||image||e2b640286e468c278254e316a2bf53f3	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/b6/25/b625315e649e04e3a613f87fbdda778c.jpg", "size": [70, 50]}
sorl-thumbnail||image||41bca4ba84fdc5d262d0d6c99cc5c644	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_ahFpr4w.jpg", "size": [70, 50]}
sorl-thumbnail||image||4cb0f2351896ee407a997f13e7d25076	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_bKUjdGr.jpg", "size": [70, 50]}
sorl-thumbnail||thumbnails||12959a520ed19a742b9da185bb8a4a55	["6031cef10d47e4ae398e6936fbf1dec3", "e2b640286e468c278254e316a2bf53f3", "589a6f7c019df9c8c86c2cf41c81b82c", "18dd7a0c680757be30f7ba00624ebf73"]
sorl-thumbnail||image||c68183f356b8d4c6f38ee92c1ce34fbb	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_WOyRH91.jpg", "size": [70, 50]}
sorl-thumbnail||image||6ea8efcbcb3a5dae061ec65a315131c1	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/4a/93/4a93de85d167bb9bef681e4926d0b595.jpg", "size": [900, 500]}
sorl-thumbnail||image||282962c6d617d04881caa59f7383faa3	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_mTuLxAw.jpg", "size": [70, 50]}
sorl-thumbnail||image||a137de85c951beaa8666bba32d1dd3b6	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/ce/6c/ce6c55ab7c7fc86a361fd531dcc5a9a5.jpg", "size": [70, 50]}
sorl-thumbnail||image||8e8f13600f4011f7c920d5e390bf204c	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_dM8d2Fs.jpg", "size": [70, 50]}
sorl-thumbnail||image||561a2ec583df92669f038ec4ef99fb7b	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/fc/89/fc897061ee5894fdef58f8bd5dafcae4.jpg", "size": [800, 400]}
sorl-thumbnail||image||e010baa94fc3e47f93d0f5ae8493f39f	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/92/14/9214ee1701690041f15e9d3010c7582d.jpg", "size": [70, 50]}
sorl-thumbnail||image||c35c400340afe5613c29a1dcd781085d	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/IMG_20190921_175942.jpg", "size": [3264, 2448]}
sorl-thumbnail||image||edb8d4618f7fcfbf9ea051342bde45c9	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/bb/3a/bb3ac5e21ff65aa10c9efd961af5d56c.jpg", "size": [500, 200]}
sorl-thumbnail||image||e856bc624f568c2afc99ff34efcf84bf	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/IMG_20190921_182117.jpg", "size": [3264, 2448]}
sorl-thumbnail||image||2839d832ed6633c4cdf4101b8042ca5d	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/43/05/4305b86ef8dba85714fd2cc08c2f1fec.jpg", "size": [500, 200]}
sorl-thumbnail||thumbnails||c35c400340afe5613c29a1dcd781085d	["edb8d4618f7fcfbf9ea051342bde45c9", "f671d28f77a94dd89952ab604adc1494"]
sorl-thumbnail||thumbnails||e856bc624f568c2afc99ff34efcf84bf	["2839d832ed6633c4cdf4101b8042ca5d", "acfddbf2ee8e58d2a3bb615d87b42cc9"]
sorl-thumbnail||image||084dbb3ea18a694afa4b46406df10cae	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/IMG_20190908_193758.jpg", "size": [3968, 2976]}
sorl-thumbnail||image||676eabbcf06324f9bc438e02ca5a7a1c	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/b1/77/b1779adf065801bfee03e80d1d47174e.jpg", "size": [500, 200]}
sorl-thumbnail||thumbnails||084dbb3ea18a694afa4b46406df10cae	["289c24ab74976326cd3a070021802da1", "676eabbcf06324f9bc438e02ca5a7a1c"]
sorl-thumbnail||image||3c5fd099d8fd40e7f47820cb2f78e04a	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/IMG_20191019_094721.jpg", "size": [2448, 3264]}
sorl-thumbnail||image||7f67348a80a27cd3af134b629fe809a4	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/9d/76/9d765b013b49cf0910febb7d81af88a6.jpg", "size": [500, 200]}
sorl-thumbnail||image||d571405161f9b458c0f5fc9640f9adb3	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/IMG_20191019_094141.jpg", "size": [3968, 2976]}
sorl-thumbnail||image||7b83f952729f683fba6c20cdeaeb00ec	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/5a/4c/5a4cfe10cc1b6aabc0e62d70109d356c.jpg", "size": [500, 200]}
sorl-thumbnail||image||dddef9216e681dd2b335e37280d355ec	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/IMG_20191019_100414.jpg", "size": [3968, 2976]}
sorl-thumbnail||image||a521bc3cb549981e512c1aa0d06414cc	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/bc/96/bc9696393160df2698ae17e67f398b11.jpg", "size": [500, 200]}
sorl-thumbnail||image||8fac78d7550b12ecbb0d50c66687485c	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/18/4c/184c00fb3197ca1c8ce07328bdc3a93f_5du8pOf.jpg", "size": [500, 200]}
sorl-thumbnail||thumbnails||3c5fd099d8fd40e7f47820cb2f78e04a	["7f67348a80a27cd3af134b629fe809a4", "1f0ca52839676ac6b32a93253556e56b"]
sorl-thumbnail||thumbnails||d571405161f9b458c0f5fc9640f9adb3	["580be56d7d89fc909a46b43791bcabd3", "22b3e4a37f398917db4f8e45334d4f20", "7b83f952729f683fba6c20cdeaeb00ec"]
sorl-thumbnail||thumbnails||dddef9216e681dd2b335e37280d355ec	["ebce0a4156454224405d6cc1f42547d5", "1a39d493ad9d7db473e47c4d00588d0a", "a521bc3cb549981e512c1aa0d06414cc", "978f85c7fa98e8096a3e25a11babf2ec"]
sorl-thumbnail||image||a851034cbea2dd9b04c57cccf69e2bef	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_rJXkxQB.jpg", "size": [70, 50]}
sorl-thumbnail||image||9cf3c7f2ed7589ba88ae150a6d51e8db	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_A28NbB2.jpg", "size": [70, 50]}
sorl-thumbnail||image||b4c639e4854aa6c0c08ec40646b72c5a	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_5zL3aMg.jpg", "size": [70, 50]}
sorl-thumbnail||image||a483ece69c12ee756369f76ccab0b2c6	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_PYQUvsx.jpg", "size": [70, 50]}
sorl-thumbnail||image||1ca3e1da86a72893da4e69ba99c29ab3	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_eXzrXpC.jpg", "size": [70, 50]}
sorl-thumbnail||image||987e1197342b75944ebcd091f60c8cf7	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_qek8OMg.jpg", "size": [70, 50]}
sorl-thumbnail||image||a45c16d60a810b04418f23bc44f553d1	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_Ocf1qbu.jpg", "size": [70, 50]}
sorl-thumbnail||image||c8798df625c46c71718dbe742b832a9f	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_9kSWPXA.jpg", "size": [70, 50]}
sorl-thumbnail||image||ad7830386e49f16e16139c4ee76c1a0a	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_4BlV0tG.jpg", "size": [70, 50]}
sorl-thumbnail||image||fc5705c49a82254ed605ec5213bc7e84	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_MeMIhQ3.jpg", "size": [70, 50]}
sorl-thumbnail||image||52c59b6981a67b37af35f2ce250c4c10	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_1Vl6c5Y.jpg", "size": [70, 50]}
sorl-thumbnail||image||66195efcf3aa1b188b167a6c4bc755e9	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_dPqNcQA.jpg", "size": [70, 50]}
sorl-thumbnail||image||948063ed3f5b69a1f59a80ceeddb140a	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/IMG_20190922_160543_B9OCkEw.jpg", "size": [3968, 2976]}
sorl-thumbnail||image||042ca8ad784f0e87c47a2665a8de51ed	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_CQ4qnNH.jpg", "size": [70, 50]}
sorl-thumbnail||image||90345fc768e646dd8f85bd8eb5896bd7	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_xc60XUF.jpg", "size": [70, 50]}
sorl-thumbnail||image||e85971c04ac79381f15ae55f2287aef3	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_mVCtBk5.jpg", "size": [70, 50]}
sorl-thumbnail||image||c896d913429ebf1b1b4bf3977d785812	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/bc/bb/bcbbaa9f5d0c0f8aefa9a962964c9e62.jpg", "size": [800, 400]}
sorl-thumbnail||thumbnails||948063ed3f5b69a1f59a80ceeddb140a	["c896d913429ebf1b1b4bf3977d785812"]
sorl-thumbnail||image||dac48e68a394fdbd068dea84959ea9ae	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_whvTvdh.jpg", "size": [70, 50]}
sorl-thumbnail||image||3fd23a48c86fff4feeaa30093fc67e2d	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/IMG_20190922_165615_oYbWvxV.jpg", "size": [3968, 2976]}
sorl-thumbnail||image||c6a8f1aeffb2ce9d9e5bac1b820ba49e	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/ea/99/ea99ff8f48cc2fedb130b3e22df45ec0.jpg", "size": [800, 400]}
sorl-thumbnail||thumbnails||3fd23a48c86fff4feeaa30093fc67e2d	["c6a8f1aeffb2ce9d9e5bac1b820ba49e"]
sorl-thumbnail||image||eeb13aaafdf39a2c8618617ae7794778	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/41/66/4166164828e7c1973091f61a974c693f.jpg", "size": [800, 400]}
sorl-thumbnail||image||1725f104bb7b5c8c555c0c9ef9934a47	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/pastelsviande.jpg", "size": [2976, 3968]}
sorl-thumbnail||image||19eeb661b42d6a8d6a654a77b213ad16	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/c8/57/c857ba8871dda8446215061f3184c325.jpg", "size": [500, 200]}
sorl-thumbnail||image||f671d28f77a94dd89952ab604adc1494	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/23/8f/238f53e82e9c0a6afbfa17bf450857cc.jpg", "size": [800, 400]}
sorl-thumbnail||image||acfddbf2ee8e58d2a3bb615d87b42cc9	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/c0/9f/c09fd04d06319b64b0fef364b19fcc73.jpg", "size": [800, 400]}
sorl-thumbnail||image||289c24ab74976326cd3a070021802da1	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/d8/1f/d81ffa3b2ed301739dd2f0f902e829da.jpg", "size": [800, 400]}
sorl-thumbnail||image||1a39d493ad9d7db473e47c4d00588d0a	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/bc/96/bc9696393160df2698ae17e67f398b11_Kz5RuPg.jpg", "size": [500, 200]}
sorl-thumbnail||image||1e229d85ff633a7f746db5ce9de14462	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/d2/3e/d23e684363d886345b4cc82e5597ed32.jpg", "size": [800, 400]}
sorl-thumbnail||image||785673470ec3c7ee817ed9a2548d8b55	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/b9/04/b904f2203217d08bf819a6408cbd2db1.jpg", "size": [800, 400]}
sorl-thumbnail||thumbnails||1725f104bb7b5c8c555c0c9ef9934a47	["a842f023b083d16e27265ea82fff43f0", "d8263b2656d0e38f2ffdfb1f3cac09ab", "19eeb661b42d6a8d6a654a77b213ad16", "7d5f00c1cf17e008844926f4de92057c", "1e2b75f72357cf9ebcb714e2ed2312ef", "d93f4ecb1b4566ae63fac7550368e558", "42cfeabc5461f94462a0b770bb206b63"]
sorl-thumbnail||image||b9807704858553c534f62f171f613443	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_YaLDpL7.jpg", "size": [70, 50]}
sorl-thumbnail||image||fb2b26702856b1385ebd4e02931fc0e6	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/IMG_20190922_170028.jpg", "size": [2976, 3968]}
sorl-thumbnail||image||b5fd41f3e78adbe2d4456c9b406c57a0	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_SmzxFCx.jpg", "size": [70, 50]}
sorl-thumbnail||image||9a7f1ac47b97c3d69fbbba59cffd62a5	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/ca/ef/caef307fc4ec021c5b4b88500f9376fa.jpg", "size": [500, 200]}
sorl-thumbnail||image||d7b1edd20d3f970990ab3744621ed046	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_Bqq6QMc.jpg", "size": [70, 50]}
sorl-thumbnail||image||b1cd851366b60070d7ac762b03c7d02e	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_eL7QaEr.jpg", "size": [70, 50]}
sorl-thumbnail||image||9b7347cbb1f13ea0e6dd932b7e256829	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_h68Cfzn.jpg", "size": [70, 50]}
sorl-thumbnail||thumbnails||fb2b26702856b1385ebd4e02931fc0e6	["9a7f1ac47b97c3d69fbbba59cffd62a5", "e22bd63844f6bbc5224ae6ba59a4b3bb"]
sorl-thumbnail||image||aa45072b69a58e1502589c5f685600e8	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/jambon_lUymiZZ.jpg", "size": [660, 400]}
sorl-thumbnail||image||247288bee2757ecde3b14d9ed6515aa4	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/07/5c/075cf8a938432f7c3a824f3732ad6b6c.jpg", "size": [500, 200]}
sorl-thumbnail||thumbnails||aa45072b69a58e1502589c5f685600e8	["247288bee2757ecde3b14d9ed6515aa4"]
sorl-thumbnail||image||78882177a32f483224c804e4409dcb36	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/dc/aa/dcaa8b96fc19e01ebe54bdcec5361837.jpg", "size": [900, 500]}
sorl-thumbnail||image||8d0d5aef465ce466e8e403b9a28d45bd	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/a0/74/a074f46b260b5a7e9554ea0b6b126fe1.jpg", "size": [70, 50]}
sorl-thumbnail||image||df4bd07b4d83ebb0b9a41301e783e0b9	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/IMG_20190921_180450.jpg", "size": [2976, 3968]}
sorl-thumbnail||image||14211a12c295b981083e1a39f4267f3e	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/9f/a0/9fa0feeaa6bc88ffa460fdc212ee0428.jpg", "size": [500, 200]}
sorl-thumbnail||thumbnails||df4bd07b4d83ebb0b9a41301e783e0b9	["14211a12c295b981083e1a39f4267f3e", "07a9788cdfefdbf2d0b531f75cb9a337", "01b034f5f3a67f57d5c25a364a233239", "fb51cb1bbaeb751552083ed567a171f3"]
sorl-thumbnail||image||3421760d916c7b163f11d28fee525274	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/c0/5f/c05f063d0e23040163d9d9f14b79b249.jpg", "size": [70, 50]}
sorl-thumbnail||image||54be83c225e01c03e4026d4428e63ca4	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/2b/25/2b25567207055dc59553ac2f2b4a4c0b.jpg", "size": [900, 500]}
sorl-thumbnail||image||ebce0a4156454224405d6cc1f42547d5	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/7d/61/7d613c03e92027a0226ebe6273210b61_axGzd6P.jpg", "size": [800, 400]}
sorl-thumbnail||image||2c7bc3f37179d7b06c0f2def7aec5c78	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_bdpXOlh.jpg", "size": [70, 50]}
sorl-thumbnail||image||d9849615e813d3e7635efa158fbc3741	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_58B9vQ2.jpg", "size": [70, 50]}
sorl-thumbnail||image||597e4b622d1a2cd20ac6d14a578a0965	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_DE8w84y.jpg", "size": [70, 50]}
sorl-thumbnail||image||7f389e044be9cce30e5cb02d34742a57	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/df/a0/dfa0df411fcd64f17dffe53398d16f12.jpg", "size": [900, 500]}
sorl-thumbnail||image||73c0757a3a257e553989219b2ce29a95	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_zsXbcSm.jpg", "size": [70, 50]}
sorl-thumbnail||image||94b1557ca8c9a5c64aee99dba684b46d	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_XRl5Wb5.jpg", "size": [70, 50]}
sorl-thumbnail||image||0a0f6cc050c5632f2837dc150081ed24	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_NvpN5Pr.jpg", "size": [70, 50]}
sorl-thumbnail||image||bf65f71dbd53d1bee35bf4b5968c90b0	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/d1/ec/d1ec693d2a341994d2b51394d90e526b.jpg", "size": [70, 50]}
sorl-thumbnail||image||a2d87ee719fe66be8438bb8eebe9bae8	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/IMG_20191007_214917.jpg", "size": [2976, 3379]}
sorl-thumbnail||image||9f5a3e184388b87d4464348ea23ece3b	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_qad2eFO.jpg", "size": [70, 50]}
sorl-thumbnail||image||bc2858c9a0f918473dcef596e7e6024b	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/e1/eb/e1eb2f93bf62b7d34ef63b10e5b514bd.jpg", "size": [500, 200]}
sorl-thumbnail||image||dd2b4aa4b324400bf6366316eb2e3f96	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_jJkQP4h.jpg", "size": [70, 50]}
sorl-thumbnail||thumbnails||a2d87ee719fe66be8438bb8eebe9bae8	["72b1f5b5493f048dfeb8a349322e3eae", "bc2858c9a0f918473dcef596e7e6024b", "2a8ae8974f8e6d321204ab0a71b9260a", "804b600dcbc2bf793f67b2555e0edc83"]
sorl-thumbnail||image||d93f4ecb1b4566ae63fac7550368e558	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/a0/74/a074f46b260b5a7e9554ea0b6b126fe1_u8XzDxi.jpg", "size": [70, 50]}
sorl-thumbnail||image||01b034f5f3a67f57d5c25a364a233239	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/d1/82/d182e6e8b1c51a9aa4f86e23d176a2aa.jpg", "size": [800, 400]}
sorl-thumbnail||image||07a9788cdfefdbf2d0b531f75cb9a337	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/4f/c8/4fc85b0ca85dd0c7797cb7142ce2a717.jpg", "size": [70, 50]}
sorl-thumbnail||image||8ab91654f756253bccd91c34a03c0c33	{"storage": "django.core.files.storage.FileSystemStorage", "name": "blog/cooked-1239311_1280.jpg", "size": [1280, 853]}
sorl-thumbnail||image||9bf2ed504db798f6adc94bfd942f694c	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/4a/19/4a19396ef62a57aae1d3807552bd0cf6.jpg", "size": [500, 200]}
sorl-thumbnail||thumbnails||8ab91654f756253bccd91c34a03c0c33	["f36708ab60c68c228134133168c83a79", "9bf2ed504db798f6adc94bfd942f694c", "f7a20536312ade9fad340e918e9165d3"]
sorl-thumbnail||image||1e772c0edf94e3dedb36a8fc5a3d7105	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/fc/76/fc760f2acdf6f160375629811b3eecfe.jpg", "size": [800, 400]}
sorl-thumbnail||image||1f0ca52839676ac6b32a93253556e56b	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/2a/2b/2a2b8f09cbcadc8ae023d1e2f7b9db47.jpg", "size": [800, 400]}
sorl-thumbnail||image||580be56d7d89fc909a46b43791bcabd3	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/63/88/6388268107e5e952095c6f478fc7361a.jpg", "size": [800, 400]}
sorl-thumbnail||image||8d00ae66b6e8314fee4b72637425c53e	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/7d/61/7d613c03e92027a0226ebe6273210b61.jpg", "size": [800, 400]}
sorl-thumbnail||image||0414de37dd01bbfd6e05ce1f7f4d4158	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/41/cb/41cb77e9de5ca7d5e998fa124174d19a.jpg", "size": [70, 50]}
sorl-thumbnail||image||5497e12a1a0c8110643ebe69a31427b4	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_jRe9jBd.jpg", "size": [70, 50]}
sorl-thumbnail||image||e22bd63844f6bbc5224ae6ba59a4b3bb	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/80/ea/80ea627e7456f950f051b254d2f6e6e1.jpg", "size": [800, 400]}
sorl-thumbnail||image||e44dbf818d047331d6a3110730ffd6e8	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_WssvhGk.jpg", "size": [70, 50]}
sorl-thumbnail||image||0f51d74e66494c1b9175ffe44e4fe8eb	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_U6AoFqb.jpg", "size": [70, 50]}
sorl-thumbnail||image||00b3e951cdc7ff7b8ee9860aa876f9f5	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_aTNE0F6.jpg", "size": [70, 50]}
sorl-thumbnail||image||8c417127d54007d6ae9371016b98e50e	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_WlRGnlb.jpg", "size": [70, 50]}
sorl-thumbnail||image||eb435f7a3e1deb6a9cf30fccb82e3361	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_ceWexrg.jpg", "size": [70, 50]}
sorl-thumbnail||image||e6d1ad5e2bcf200f378eb30bfa15b2df	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/IMG_20190922_160543_sjaRFOD.jpg", "size": [3968, 2976]}
sorl-thumbnail||image||ecce110cda7c7ad9db1d4021447c9ad5	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_mFZLnnk.jpg", "size": [70, 50]}
sorl-thumbnail||image||db6e9adf589645a08308bdd3dd98b85f	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/4c/cc/4ccce0f2209b0f8fc50cf82c51a86879.jpg", "size": [800, 400]}
sorl-thumbnail||image||c0999dacf5bfbcdeb52c75daab62f056	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_cBHP3Si.jpg", "size": [70, 50]}
sorl-thumbnail||image||33538fdd4d339fe66cb187662705b9f8	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_W9GgCIR.jpg", "size": [70, 50]}
sorl-thumbnail||image||0a00821fb4e2611196bb467d75c8ca79	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/IMG_20190922_164636.jpg", "size": [3264, 2448]}
sorl-thumbnail||image||b15c26c420eadb72f51b9510a0e51fbf	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/7d/4b/7d4b8feef4c42a3a30a66ba6d74cac60.jpg", "size": [800, 400]}
sorl-thumbnail||image||849108c236b296ae960bfc4fb2e79348	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/IMG_20190922_165615_e9oEMok.jpg", "size": [3968, 2976]}
sorl-thumbnail||image||a934b867a13f1e7da5927b1d1dab3448	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/09/f7/09f7fd882f8e5d84cf451fcb85fb2597.jpg", "size": [800, 400]}
sorl-thumbnail||thumbnails||e6d1ad5e2bcf200f378eb30bfa15b2df	["bceaa64e12d21f2de4c3590530c3933c", "db6e9adf589645a08308bdd3dd98b85f"]
sorl-thumbnail||thumbnails||0a00821fb4e2611196bb467d75c8ca79	["ed0a9d0a71d91fffd6b1c98a6891c229", "b15c26c420eadb72f51b9510a0e51fbf"]
sorl-thumbnail||thumbnails||849108c236b296ae960bfc4fb2e79348	["a934b867a13f1e7da5927b1d1dab3448", "674761780b4df679cb6ef08423949363"]
sorl-thumbnail||image||804b600dcbc2bf793f67b2555e0edc83	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/4c/54/4c5497f1eeb91e5348f3ac0c0de9ec64.jpg", "size": [900, 500]}
sorl-thumbnail||image||7d5f00c1cf17e008844926f4de92057c	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/3b/f7/3bf7af1252a2ae37816454982e02f171.jpg", "size": [800, 400]}
sorl-thumbnail||image||a842f023b083d16e27265ea82fff43f0	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/a0/74/a074f46b260b5a7e9554ea0b6b126fe1_0PH1C5c.jpg", "size": [70, 50]}
sorl-thumbnail||image||fb51cb1bbaeb751552083ed567a171f3	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/83/16/831626c23c39aba87157a004a6ab839c.jpg", "size": [900, 500]}
sorl-thumbnail||image||f36708ab60c68c228134133168c83a79	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/39/26/392688821c75766fbb668b06ab42df89.jpg", "size": [70, 50]}
sorl-thumbnail||image||22b3e4a37f398917db4f8e45334d4f20	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/63/88/6388268107e5e952095c6f478fc7361a_4w5WjRP.jpg", "size": [800, 400]}
sorl-thumbnail||image||978f85c7fa98e8096a3e25a11babf2ec	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/7d/61/7d613c03e92027a0226ebe6273210b61_sf5RoiX.jpg", "size": [800, 400]}
sorl-thumbnail||image||6b327f7258412f2d43a33c391a9bc590	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/IMG_20191020_1950441.jpg", "size": [3120, 3120]}
sorl-thumbnail||image||4488ee9803abaaa545125a0a5eac8a5f	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/b7/ef/b7ef1e5c18ae7c22ef3f924df0781216.jpg", "size": [500, 200]}
sorl-thumbnail||thumbnails||6b327f7258412f2d43a33c391a9bc590	["4488ee9803abaaa545125a0a5eac8a5f"]
sorl-thumbnail||image||fccbacb6d8b8c382c9ff4745c001f528	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_bWtZVbV.jpg", "size": [70, 50]}
sorl-thumbnail||image||17ef8f6667354e41678220334c2de5db	{"storage": "django.core.files.storage.FileSystemStorage", "name": "restaurants/46828819_550304195442127_3043825185028308992_n.jpg", "size": [959, 959]}
sorl-thumbnail||image||f0bda072980d167eab60000e50189e38	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_6QUBalj.jpg", "size": [70, 50]}
sorl-thumbnail||image||2862ad5c57c356e71e8be40b666c763a	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/ad/8d/ad8d1d817a8b42d7f7a51413f39d181b.jpg", "size": [500, 200]}
sorl-thumbnail||image||b1687ead878848b5790efdb06f834478	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_lnf7UOW.jpg", "size": [70, 50]}
sorl-thumbnail||image||4d436a107046ab72065ea07bbfc1292d	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_B882xtC.jpg", "size": [70, 50]}
sorl-thumbnail||thumbnails||17ef8f6667354e41678220334c2de5db	["2862ad5c57c356e71e8be40b666c763a", "8aade72ab77a5d8596d1ffe9bf63c843"]
sorl-thumbnail||image||2a8ae8974f8e6d321204ab0a71b9260a	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/4f/44/4f4495ad4cf1627f4481ff18f84fd98b.jpg", "size": [800, 400]}
sorl-thumbnail||image||72b1f5b5493f048dfeb8a349322e3eae	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/19/88/1988d130a33dd24c6babb1dd2cf3ef30.jpg", "size": [70, 50]}
sorl-thumbnail||image||d8263b2656d0e38f2ffdfb1f3cac09ab	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/a0/74/a074f46b260b5a7e9554ea0b6b126fe1_hx49wFH.jpg", "size": [70, 50]}
sorl-thumbnail||image||e6effe1b0bf4e4c3a702d21c7ef98f8a	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/drink-2910442_1920.jpg", "size": [1920, 639]}
sorl-thumbnail||image||c65d27fb46c5b96ad9fbcd3320bf5799	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/8f/5e/8f5e1a550cd092f7ff7847a7400f457c.jpg", "size": [500, 200]}
sorl-thumbnail||thumbnails||e6effe1b0bf4e4c3a702d21c7ef98f8a	["c65d27fb46c5b96ad9fbcd3320bf5799"]
sorl-thumbnail||image||23022af86b7274c54c4e98606993b79a	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/55/c0/55c0eecf4fc90fa03fcc5ff709905d38.jpg", "size": [680, 350]}
sorl-thumbnail||image||b3b798354c1e165654f87a9254f61d43	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/7d/61/7d613c03e92027a0226ebe6273210b61_lohvG9Z.jpg", "size": [800, 400]}
sorl-thumbnail||image||dfc35f8efc38cac67c7fb33999cfd5e3	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_tXCVGQT.jpg", "size": [70, 50]}
sorl-thumbnail||image||8aade72ab77a5d8596d1ffe9bf63c843	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/5e/2a/5e2a01323bcfab2ec400b34b211cf385.jpg", "size": [900, 800]}
sorl-thumbnail||image||f596f953f1f382ed96dd4829a41ff1d2	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_ENrYR5G.jpg", "size": [70, 50]}
sorl-thumbnail||image||5a8d3b900faf83c241db3bc42c3d897d	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_6qm3beo.jpg", "size": [70, 50]}
sorl-thumbnail||image||410493f4829841b5e8ad0cf2bc77ecee	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_xWJ3g9F.jpg", "size": [70, 50]}
sorl-thumbnail||image||f7ad64dbf09de0e1bf8157c6b300bf77	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/IMG_20190908_1947511.jpg", "size": [3374, 2924]}
sorl-thumbnail||image||35e077dd369e3267ca86e414d8362e37	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_Le2LmWy.jpg", "size": [70, 50]}
sorl-thumbnail||image||2f8d9870988db28879bc773b62c14323	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/ad/42/ad4264ae1d2ef56197fd20b6f43c3ad1.jpg", "size": [500, 200]}
sorl-thumbnail||image||45d7d547499f599934bd186654c1a32f	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_KcoxdeI.jpg", "size": [70, 50]}
sorl-thumbnail||image||f035e7d5733609d04f012a9e3a7d7c4c	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/IMG_20190921_173240.jpg", "size": [3968, 2976]}
sorl-thumbnail||image||2451cec74f9dbacfbbf7ae4fcc87ba33	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/48/0f/480f0fca6c1f22890ee19605e2b6c6c4.jpg", "size": [500, 200]}
sorl-thumbnail||image||8d3a285be1bfdb39ee4a0b6e55aceca5	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/IMG_20190921_180107.jpg", "size": [3968, 2976]}
sorl-thumbnail||image||78d2647ab534454eb9053fc534154753	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/1b/bd/1bbdcad5390f8667360e94bb8234e451.jpg", "size": [500, 200]}
sorl-thumbnail||thumbnails||f035e7d5733609d04f012a9e3a7d7c4c	["2451cec74f9dbacfbbf7ae4fcc87ba33", "1002d1298c4032eac6945efa49d0debd"]
sorl-thumbnail||thumbnails||8d3a285be1bfdb39ee4a0b6e55aceca5	["258b17692fcb7a1fa9a509ecaac94d45", "78d2647ab534454eb9053fc534154753"]
sorl-thumbnail||image||de5d659d004ded6c8fb382fee561d9fb	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/4a/f7/4af77bfbb2a321f782cfc086b6e5ac1a.jpg", "size": [900, 500]}
sorl-thumbnail||thumbnails||f7ad64dbf09de0e1bf8157c6b300bf77	["de5d659d004ded6c8fb382fee561d9fb", "2f8d9870988db28879bc773b62c14323", "3421760d916c7b163f11d28fee525274", "9bbaa4e1c41a0770f6222b250ffd6699"]
sorl-thumbnail||image||f7a20536312ade9fad340e918e9165d3	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/b8/a6/b8a6edc8e6664b19fd4e4dadb9bb0d68.jpg", "size": [900, 500]}
sorl-thumbnail||image||4509bdf457222d44639ed419e069a422	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/7d/61/7d613c03e92027a0226ebe6273210b61_e83OTyD.jpg", "size": [800, 400]}
sorl-thumbnail||image||403e9af0c7b0d352d0eed7287a25212b	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_IqfmZEX.jpg", "size": [70, 50]}
sorl-thumbnail||image||bceaa64e12d21f2de4c3590530c3933c	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/66/b9/66b90a2192c74af9f3ab76e7d3256b1d.jpg", "size": [500, 200]}
sorl-thumbnail||image||7030df10b744a182952091c9f1fcd7b7	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_vARQU9J.jpg", "size": [70, 50]}
sorl-thumbnail||image||354cca70a33a4c50b6e14bdbc1e463ca	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_9c6Mupa.jpg", "size": [70, 50]}
sorl-thumbnail||image||6eb6637ac09d5501b970c802065adab3	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_6vFKj6r.jpg", "size": [70, 50]}
sorl-thumbnail||image||ed0a9d0a71d91fffd6b1c98a6891c229	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/09/98/0998bd9017789ad15edfd7f1bdce3995.jpg", "size": [500, 200]}
sorl-thumbnail||image||e98a879bfc0eee5f320c37bca0f67e92	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_j2u5s3R.jpg", "size": [70, 50]}
sorl-thumbnail||image||674761780b4df679cb6ef08423949363	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/88/77/8877b59c3f47a823bba2ca919d7bcd4a.jpg", "size": [500, 200]}
sorl-thumbnail||image||a08de1d6828046fd39e37243636e3c81	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_7JtRVrD.jpg", "size": [70, 50]}
sorl-thumbnail||image||44b5e40d9f206b5e94f0ee60f6e5d05e	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/IMG_20190921_180530.jpg", "size": [2448, 3264]}
sorl-thumbnail||image||e3c895346d0ef980e496e5d6673de211	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/4a/72/4a727437347425e39ec94d08afb2682b.jpg", "size": [500, 200]}
sorl-thumbnail||thumbnails||44b5e40d9f206b5e94f0ee60f6e5d05e	["e010baa94fc3e47f93d0f5ae8493f39f", "561a2ec583df92669f038ec4ef99fb7b", "e3c895346d0ef980e496e5d6673de211"]
sorl-thumbnail||image||1002d1298c4032eac6945efa49d0debd	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/51/da/51daa9c98ce193e5984cbb7a4372ef68.jpg", "size": [800, 400]}
sorl-thumbnail||image||258b17692fcb7a1fa9a509ecaac94d45	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/6a/12/6a1208789ffc3d24be2e83a12ff99759.jpg", "size": [800, 400]}
sorl-thumbnail||image||1e2b75f72357cf9ebcb714e2ed2312ef	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/a0/74/a074f46b260b5a7e9554ea0b6b126fe1_Wxk0UHt.jpg", "size": [70, 50]}
sorl-thumbnail||image||9bbaa4e1c41a0770f6222b250ffd6699	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/d0/df/d0dfe2ded4b3a574f47784f3a87818ae.jpg", "size": [800, 400]}
sorl-thumbnail||image||53b1902f1fab586dd5236c8ee59cee1a	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/IMG_20191019_100518.jpg", "size": [3968, 2976]}
sorl-thumbnail||image||36c0184356afe4f6c43b6109beec0811	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/be/70/be70e5ec9cd5374f489d45fef5a43a6b.jpg", "size": [500, 200]}
sorl-thumbnail||image||3e38c7d6453a27cd6e05bfac8f91f84e	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/IMG_20191019_093915.jpg", "size": [2976, 3968]}
sorl-thumbnail||image||677344dd78450554426227d4811c4e1a	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/2c/e7/2ce77cd961f0e0685c7b145ed010f982.jpg", "size": [500, 200]}
sorl-thumbnail||image||e12e6c8f7c492bea89ff278e72ba1050	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/IMG_20191019_094707.jpg", "size": [2976, 3968]}
sorl-thumbnail||image||3206453d978da0d455180abab51491de	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/18/4c/184c00fb3197ca1c8ce07328bdc3a93f.jpg", "size": [500, 200]}
sorl-thumbnail||thumbnails||3e38c7d6453a27cd6e05bfac8f91f84e	["677344dd78450554426227d4811c4e1a", "1e229d85ff633a7f746db5ce9de14462"]
sorl-thumbnail||thumbnails||e12e6c8f7c492bea89ff278e72ba1050	["3206453d978da0d455180abab51491de", "785673470ec3c7ee817ed9a2548d8b55"]
sorl-thumbnail||thumbnails||53b1902f1fab586dd5236c8ee59cee1a	["1e772c0edf94e3dedb36a8fc5a3d7105", "36c0184356afe4f6c43b6109beec0811", "0414de37dd01bbfd6e05ce1f7f4d4158", "54be83c225e01c03e4026d4428e63ca4"]
sorl-thumbnail||image||d81a8dc8bc2229677bf6b398d15ab842	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/56/2056de8c4538dca112ad87ba510b6b6d_r5Rjq4f.jpg", "size": [70, 50]}
sorl-thumbnail||thumbnails||c5e5f7c7b9a8e0500e84bf1446bdb7bf	["0aebef2d7a429b18bd703444eeb48b07", "d8cfac08708e1680de339f27eb9fb6dd", "dfc35f8efc38cac67c7fb33999cfd5e3", "dac48e68a394fdbd068dea84959ea9ae", "b76d235205e17b11a97d9dc72f0869dd", "9b7347cbb1f13ea0e6dd932b7e256829", "8c417127d54007d6ae9371016b98e50e", "e44dbf818d047331d6a3110730ffd6e8", "4babe4047d87418f90a492b2fbd9426e", "7301d0d9cbcaae6ce2ff932be43d8edb", "a851034cbea2dd9b04c57cccf69e2bef", "b9807704858553c534f62f171f613443", "10c3c5342b21f5cd13b12c852a359d93", "a08de1d6828046fd39e37243636e3c81", "52e2de405cf19c6571bc970a8e44a561", "5497e12a1a0c8110643ebe69a31427b4", "41bca4ba84fdc5d262d0d6c99cc5c644", "4e824383021c158aaf67046bbc73f25d", "e03191bd15c937bdf8c0f7905e0fb2fb", "597e4b622d1a2cd20ac6d14a578a0965", "ff20d01216a11cc290d66e4beec6e342", "00b3e951cdc7ff7b8ee9860aa876f9f5", "66195efcf3aa1b188b167a6c4bc755e9", "24ec5c76aac448ee539f04fab0a47272", "f596f953f1f382ed96dd4829a41ff1d2", "a5be715457a44d835406cbd8a0da2412", "d81a8dc8bc2229677bf6b398d15ab842", "8f6c65bb61e0504cc71ba3409dcefabf", "b1cd851366b60070d7ac762b03c7d02e", "c8798df625c46c71718dbe742b832a9f", "c68183f356b8d4c6f38ee92c1ce34fbb", "ecce110cda7c7ad9db1d4021447c9ad5", "daaadbc0bc28eeffcd974e9920bd8591", "987e1197342b75944ebcd091f60c8cf7", "0f51d74e66494c1b9175ffe44e4fe8eb", "71b1296517ec712815bdf4a16e5c8e3f", "f59bf154af4e932e52c68f53a26b9922", "e98a879bfc0eee5f320c37bca0f67e92", "8dcb42ed0b213a06c81efadee61c2b53", "26981d0de421ad3318f9d133f53726d9", "5a8d3b900faf83c241db3bc42c3d897d", "8e8f13600f4011f7c920d5e390bf204c", "4cb0f2351896ee407a997f13e7d25076", "38f5187e65a75bca4cfb4103242b62d8", "b5fd41f3e78adbe2d4456c9b406c57a0", "c0999dacf5bfbcdeb52c75daab62f056", "d7b1edd20d3f970990ab3744621ed046", "1ca3e1da86a72893da4e69ba99c29ab3", "33538fdd4d339fe66cb187662705b9f8", "a470d150bfb31db3e63c26b3aa1be921"]
sorl-thumbnail||image||ce1e953da1677690a843ea6895b75b23	{"storage": "django.core.files.storage.FileSystemStorage", "name": "restaurants/loveafrica.jpg", "size": [960, 640]}
sorl-thumbnail||image||9574f0e708062680376d907a56919311	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/3e/6d/3e6d5c38cfa7456782f4af5e105fee9b.jpg", "size": [500, 200]}
sorl-thumbnail||image||0696c9ff848265993dfddf5aa84f3927	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/b9/21/b9212aba59ca14adbf134324dad79876.jpg", "size": [900, 800]}
sorl-thumbnail||thumbnails||ce1e953da1677690a843ea6895b75b23	["9574f0e708062680376d907a56919311", "0696c9ff848265993dfddf5aa84f3927"]
sorl-thumbnail||image||68f50e89b60da9e36ea28e8353a52da5	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/IMG_20190303_135343.jpg", "size": [4864, 2736]}
sorl-thumbnail||image||2cde9d34d99e0a566d8706f559347820	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/4f/e2/4fe2dfc7e7c4e37ed5c5bbedadc159ab.jpg", "size": [500, 200]}
sorl-thumbnail||image||141f4a85840ed9678afa7eabd7cafd0a	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/cf/11/cf11fbfff7d00303d655a2ec0ef697bc.jpg", "size": [900, 500]}
sorl-thumbnail||image||316e02207ab5af6d1b4556ca4e723327	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/0f/14/0f143914100a5fc10383e9d9717f32a5.jpg", "size": [900, 500]}
sorl-thumbnail||image||e913a8c7601299954de2242d71ed2aa6	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/d9/5f/d95fd713de4cca8d7e9fe2cd6f924df7.jpg", "size": [800, 400]}
sorl-thumbnail||thumbnails||4f20e4857d980364aa04e983b8880756	["684701486dd601dd08a0e1489b91f009", "47d36b7b42733338c0e8c9a45db0cd60", "de172f51fcadfb8b15cc2e2d33405630"]
sorl-thumbnail||image||a2b87ce69e0e452bb2a4031dcdb61091	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/c8/f2/c8f2882491d0fc5a7c6d345803b7e4cf.jpg", "size": [70, 50]}
sorl-thumbnail||thumbnails||68f50e89b60da9e36ea28e8353a52da5	["141f4a85840ed9678afa7eabd7cafd0a", "e913a8c7601299954de2242d71ed2aa6", "2cde9d34d99e0a566d8706f559347820", "a2b87ce69e0e452bb2a4031dcdb61091"]
sorl-thumbnail||image||4f20e4857d980364aa04e983b8880756	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/IMG_20190922_160543.jpg", "size": [3968, 2976]}
sorl-thumbnail||image||684701486dd601dd08a0e1489b91f009	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/7c/2a/7c2a57516722057432e985cefdb5d8c9.jpg", "size": [500, 200]}
sorl-thumbnail||image||47d36b7b42733338c0e8c9a45db0cd60	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/9b/d7/9bd7c601f36cfc1ccdaf711e315160ac.jpg", "size": [800, 400]}
sorl-thumbnail||image||589a6f7c019df9c8c86c2cf41c81b82c	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/b7/77/b777f0a7e437dc90ffdb5f288b1b17a8.jpg", "size": [800, 400]}
sorl-thumbnail||image||eaca3634648e093760e1b9bb104933be	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/IMG_20190922_165615.jpg", "size": [3968, 2976]}
sorl-thumbnail||image||5dea960094c00bb3822b26d9755a2781	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/e4/61/e461c9ad07e7d1ea33a1ec1e76bbbccb.jpg", "size": [800, 400]}
sorl-thumbnail||thumbnails||eaca3634648e093760e1b9bb104933be	["5dea960094c00bb3822b26d9755a2781"]
sorl-thumbnail||image||200ac656a71875190f0c03454c8d6b18	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/IMG_20190922_164632.jpg", "size": [3264, 2448]}
sorl-thumbnail||image||958bb73cd709d21af19dae0a862039f5	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/0c/36/0c36239dd655cc6384e796256c3bef02.jpg", "size": [800, 400]}
sorl-thumbnail||thumbnails||200ac656a71875190f0c03454c8d6b18	["958bb73cd709d21af19dae0a862039f5"]
sorl-thumbnail||image||f5dce8338a0cbf386c70a25cda8999d2	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/IMG_20190922_171916.jpg", "size": [2976, 3422]}
sorl-thumbnail||image||3d63aff3f252a0d838407a3eb5efa626	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/20/a8/20a89de518fd908f78d9d269119228d1.jpg", "size": [800, 400]}
sorl-thumbnail||thumbnails||f5dce8338a0cbf386c70a25cda8999d2	["3d63aff3f252a0d838407a3eb5efa626"]
sorl-thumbnail||image||de172f51fcadfb8b15cc2e2d33405630	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/e0/98/e0980a49d3fac7e30ba2fdf5c60dc56c.jpg", "size": [70, 50]}
sorl-thumbnail||image||12959a520ed19a742b9da185bb8a4a55	{"storage": "django.core.files.storage.FileSystemStorage", "name": "recipes/IMG_20190922_171916_1BPIB07.jpg", "size": [2976, 3422]}
sorl-thumbnail||image||6031cef10d47e4ae398e6936fbf1dec3	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/4a/ed/4aed21e85abd08ca6522d24bd9b9216b.jpg", "size": [500, 200]}
\.


--
-- Data for Name: userprofile_profile; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.userprofile_profile (sexe, user_id, bio, country, tel, photo, linkedin, facebook, twitter, gplus, instagram, created_at, update_at, slug, job) FROM stdin;
	12		\N								2019-10-14 11:26:53.228047+00	2019-10-14 11:26:53.229624+00		\N
	3		\N								2018-12-03 13:28:57.311819+00	2018-12-03 13:28:57.316143+00		\N
	13		\N								2019-10-14 11:37:22.869503+00	2019-10-14 11:37:22.871168+00		\N
	11		\N								2019-10-14 09:51:52.864914+00	2019-10-14 20:24:49.161869+00		\N
	17		\N								2019-10-20 21:02:34.27184+00	2019-10-20 21:25:49.302336+00		\N
	1	moi	TG	0022890275964	profiles/kal.png						2018-11-24 16:31:14.134678+00	2019-10-23 13:34:50.493598+00		CEO
\.


--
-- Data for Name: userprofile_user; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.userprofile_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, is_contributor, is_staff_member) FROM stdin;
17	pbkdf2_sha256$30000$8mAAcyWTk8Qf$3qF/Mi9Q/6iZd0ay3zi+PU4xlJPumXkeQ74NxVl2Sf8=	2019-10-20 21:25:49.297425+00	f	eliora20147			eliora20147@gmail.com	f	t	2019-10-20 21:02:34.244154+00	t	f
1	pbkdf2_sha256$30000$6IOmwzGOG9LL$TZP+qJ1r1BSXtiuYUe4k8XCzbWn1h/q1LdkJbabIn4k=	2019-10-23 13:34:50.488442+00	t	root	Hermann	KASS		t	t	2018-11-24 16:31:14+00	t	t
3	pbkdf2_sha256$30000$36FmQvnxaeDd$yCMZO3XHIwDdXjOVZC8AW8i7fhfKUPjd2I4PjO4RVYY=	\N	f	hermann.kass			hermann.kass@gmail.com	f	t	2018-12-03 13:28:57.277867+00	t	f
12	pbkdf2_sha256$30000$cptyi3DU3GlR$jyWngFyjc3kRTfP+XiL8qwU6jJtgbeFdq5bZTrbYET8=	\N	f	vincmsk			vincmsk@gmail.com	f	t	2019-10-14 11:26:53.201054+00	t	f
13	pbkdf2_sha256$30000$AavBIRyvkuRI$n+kKIB1wjUHb1nFn2MUU2mo7cNBDjrFiAk4mVinUlyo=	\N	f	briceklaus			briceklaus@gmail.com	f	t	2019-10-14 11:37:22.842554+00	t	f
11	!tNPIYs0OwESuJY2lfLg4925mZaI57xCv7CHGcviN	2019-10-14 16:23:38.578056+00	f	brice	Brice	Yakpa	klausyakpa@gmail.com	f	t	2019-10-14 09:51:52.847946+00	t	f
\.


--
-- Data for Name: userprofile_user_groups; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.userprofile_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: userprofile_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: togokuizine_user
--

COPY public.userprofile_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 17, true);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 115, true);


--
-- Name: blog_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.blog_category_id_seq', 7, true);


--
-- Name: blog_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.blog_post_id_seq', 3, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 56, true);


--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.django_comment_flags_id_seq', 1, false);


--
-- Name: django_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.django_comments_id_seq', 5, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 38, true);


--
-- Name: django_flatpage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.django_flatpage_id_seq', 1, true);


--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.django_flatpage_sites_id_seq', 1, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 58, true);


--
-- Name: django_redirect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.django_redirect_id_seq', 1, false);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.django_site_id_seq', 2, true);


--
-- Name: newsletter_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.newsletter_article_id_seq', 1, false);


--
-- Name: newsletter_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.newsletter_message_id_seq', 1, false);


--
-- Name: newsletter_newsletter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.newsletter_newsletter_id_seq', 1, false);


--
-- Name: newsletter_newsletter_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.newsletter_newsletter_site_id_seq', 1, false);


--
-- Name: newsletter_submission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.newsletter_submission_id_seq', 1, false);


--
-- Name: newsletter_submission_subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.newsletter_submission_subscriptions_id_seq', 1, false);


--
-- Name: newsletter_subscription_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.newsletter_subscription_id_seq', 1, false);


--
-- Name: notify_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.notify_notification_id_seq', 9, true);


--
-- Name: recipe_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.recipe_category_id_seq', 10, true);


--
-- Name: recipe_categoryvideo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.recipe_categoryvideo_id_seq', 1, false);


--
-- Name: recipe_origin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.recipe_origin_id_seq', 3, true);


--
-- Name: recipe_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.recipe_recipe_id_seq', 16, true);


--
-- Name: recipe_recipe_origin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.recipe_recipe_origin_id_seq', 2, true);


--
-- Name: recipe_video_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.recipe_video_id_seq', 1, false);


--
-- Name: recipe_video_origin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.recipe_video_origin_id_seq', 1, false);


--
-- Name: restaurant_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.restaurant_category_id_seq', 5, true);


--
-- Name: restaurant_restaurant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.restaurant_restaurant_id_seq', 2, true);


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 6, true);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 2, true);


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 2, true);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 6, true);


--
-- Name: star_ratings_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.star_ratings_rating_id_seq', 2, true);


--
-- Name: star_ratings_userrating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.star_ratings_userrating_id_seq', 11, true);


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.taggit_tag_id_seq', 51, true);


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.taggit_taggeditem_id_seq', 51, true);


--
-- Name: userprofile_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.userprofile_user_groups_id_seq', 1, false);


--
-- Name: userprofile_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.userprofile_user_id_seq', 17, true);


--
-- Name: userprofile_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togokuizine_user
--

SELECT pg_catalog.setval('public.userprofile_user_user_permissions_id_seq', 1, false);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: blog_category blog_category_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.blog_category
    ADD CONSTRAINT blog_category_pkey PRIMARY KEY (id);


--
-- Name: blog_category blog_category_slug_key; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.blog_category
    ADD CONSTRAINT blog_category_slug_key UNIQUE (slug);


--
-- Name: blog_post blog_post_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.blog_post
    ADD CONSTRAINT blog_post_pkey PRIMARY KEY (id);


--
-- Name: blog_post blog_post_slug_key; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.blog_post
    ADD CONSTRAINT blog_post_slug_key UNIQUE (slug);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_comment_flags django_comment_flags_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_comment_flags
    ADD CONSTRAINT django_comment_flags_pkey PRIMARY KEY (id);


--
-- Name: django_comment_flags django_comment_flags_user_id_537f77a7_uniq; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_comment_flags
    ADD CONSTRAINT django_comment_flags_user_id_537f77a7_uniq UNIQUE (user_id, comment_id, flag);


--
-- Name: django_comments django_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_comments
    ADD CONSTRAINT django_comments_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_flatpage django_flatpage_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_flatpage
    ADD CONSTRAINT django_flatpage_pkey PRIMARY KEY (id);


--
-- Name: django_flatpage_sites django_flatpage_sites_flatpage_id_0d29d9d1_uniq; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_flatpage_id_0d29d9d1_uniq UNIQUE (flatpage_id, site_id);


--
-- Name: django_flatpage_sites django_flatpage_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_redirect django_redirect_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_redirect
    ADD CONSTRAINT django_redirect_pkey PRIMARY KEY (id);


--
-- Name: django_redirect django_redirect_site_id_ac5dd16b_uniq; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_redirect
    ADD CONSTRAINT django_redirect_site_id_ac5dd16b_uniq UNIQUE (site_id, old_path);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: newsletter_article newsletter_article_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.newsletter_article
    ADD CONSTRAINT newsletter_article_pkey PRIMARY KEY (id);


--
-- Name: newsletter_article newsletter_article_post_id_cbe3c629_uniq; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.newsletter_article
    ADD CONSTRAINT newsletter_article_post_id_cbe3c629_uniq UNIQUE (post_id, sortorder);


--
-- Name: newsletter_message newsletter_message_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.newsletter_message
    ADD CONSTRAINT newsletter_message_pkey PRIMARY KEY (id);


--
-- Name: newsletter_message newsletter_message_slug_a2ab3653_uniq; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.newsletter_message
    ADD CONSTRAINT newsletter_message_slug_a2ab3653_uniq UNIQUE (slug, newsletter_id);


--
-- Name: newsletter_newsletter newsletter_newsletter_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.newsletter_newsletter
    ADD CONSTRAINT newsletter_newsletter_pkey PRIMARY KEY (id);


--
-- Name: newsletter_newsletter_site newsletter_newsletter_site_newsletter_id_eaadd4df_uniq; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.newsletter_newsletter_site
    ADD CONSTRAINT newsletter_newsletter_site_newsletter_id_eaadd4df_uniq UNIQUE (newsletter_id, site_id);


--
-- Name: newsletter_newsletter_site newsletter_newsletter_site_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.newsletter_newsletter_site
    ADD CONSTRAINT newsletter_newsletter_site_pkey PRIMARY KEY (id);


--
-- Name: newsletter_newsletter newsletter_newsletter_slug_key; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.newsletter_newsletter
    ADD CONSTRAINT newsletter_newsletter_slug_key UNIQUE (slug);


--
-- Name: newsletter_submission newsletter_submission_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.newsletter_submission
    ADD CONSTRAINT newsletter_submission_pkey PRIMARY KEY (id);


--
-- Name: newsletter_submission_subscriptions newsletter_submission_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.newsletter_submission_subscriptions
    ADD CONSTRAINT newsletter_submission_subscriptions_pkey PRIMARY KEY (id);


--
-- Name: newsletter_submission_subscriptions newsletter_submission_subscriptions_submission_id_fa14b47b_uniq; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.newsletter_submission_subscriptions
    ADD CONSTRAINT newsletter_submission_subscriptions_submission_id_fa14b47b_uniq UNIQUE (submission_id, subscription_id);


--
-- Name: newsletter_subscription newsletter_subscription_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.newsletter_subscription
    ADD CONSTRAINT newsletter_subscription_pkey PRIMARY KEY (id);


--
-- Name: newsletter_subscription newsletter_subscription_user_id_0a9641e0_uniq; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.newsletter_subscription
    ADD CONSTRAINT newsletter_subscription_user_id_0a9641e0_uniq UNIQUE (user_id, email, newsletter_id);


--
-- Name: notify_notification notify_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.notify_notification
    ADD CONSTRAINT notify_notification_pkey PRIMARY KEY (id);


--
-- Name: recipe_category recipe_category_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.recipe_category
    ADD CONSTRAINT recipe_category_pkey PRIMARY KEY (id);


--
-- Name: recipe_category recipe_category_slug_key; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.recipe_category
    ADD CONSTRAINT recipe_category_slug_key UNIQUE (slug);


--
-- Name: recipe_categoryvideo recipe_categoryvideo_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.recipe_categoryvideo
    ADD CONSTRAINT recipe_categoryvideo_pkey PRIMARY KEY (id);


--
-- Name: recipe_categoryvideo recipe_categoryvideo_slug_key; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.recipe_categoryvideo
    ADD CONSTRAINT recipe_categoryvideo_slug_key UNIQUE (slug);


--
-- Name: recipe_origin recipe_origin_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.recipe_origin
    ADD CONSTRAINT recipe_origin_pkey PRIMARY KEY (id);


--
-- Name: recipe_recipe_origin recipe_recipe_origin_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.recipe_recipe_origin
    ADD CONSTRAINT recipe_recipe_origin_pkey PRIMARY KEY (id);


--
-- Name: recipe_recipe_origin recipe_recipe_origin_recipe_id_e7c3145e_uniq; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.recipe_recipe_origin
    ADD CONSTRAINT recipe_recipe_origin_recipe_id_e7c3145e_uniq UNIQUE (recipe_id, origin_id);


--
-- Name: recipe_recipe recipe_recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.recipe_recipe
    ADD CONSTRAINT recipe_recipe_pkey PRIMARY KEY (id);


--
-- Name: recipe_recipe recipe_recipe_slug_key; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.recipe_recipe
    ADD CONSTRAINT recipe_recipe_slug_key UNIQUE (slug);


--
-- Name: recipe_video_origin recipe_video_origin_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.recipe_video_origin
    ADD CONSTRAINT recipe_video_origin_pkey PRIMARY KEY (id);


--
-- Name: recipe_video_origin recipe_video_origin_video_id_f6caa1e2_uniq; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.recipe_video_origin
    ADD CONSTRAINT recipe_video_origin_video_id_f6caa1e2_uniq UNIQUE (video_id, origin_id);


--
-- Name: recipe_video recipe_video_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.recipe_video
    ADD CONSTRAINT recipe_video_pkey PRIMARY KEY (id);


--
-- Name: recipe_video recipe_video_slug_key; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.recipe_video
    ADD CONSTRAINT recipe_video_slug_key UNIQUE (slug);


--
-- Name: restaurant_category restaurant_category_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.restaurant_category
    ADD CONSTRAINT restaurant_category_pkey PRIMARY KEY (id);


--
-- Name: restaurant_category restaurant_category_slug_key; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.restaurant_category
    ADD CONSTRAINT restaurant_category_slug_key UNIQUE (slug);


--
-- Name: restaurant_restaurant restaurant_restaurant_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.restaurant_restaurant
    ADD CONSTRAINT restaurant_restaurant_pkey PRIMARY KEY (id);


--
-- Name: restaurant_restaurant restaurant_restaurant_slug_key; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.restaurant_restaurant
    ADD CONSTRAINT restaurant_restaurant_slug_key UNIQUE (slug);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_provider_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_socialapp_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_socialapp_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: star_ratings_rating star_ratings_rating_content_type_id_f170c88b_uniq; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.star_ratings_rating
    ADD CONSTRAINT star_ratings_rating_content_type_id_f170c88b_uniq UNIQUE (content_type_id, object_id);


--
-- Name: star_ratings_rating star_ratings_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.star_ratings_rating
    ADD CONSTRAINT star_ratings_rating_pkey PRIMARY KEY (id);


--
-- Name: star_ratings_userrating star_ratings_userrating_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.star_ratings_userrating
    ADD CONSTRAINT star_ratings_userrating_pkey PRIMARY KEY (id);


--
-- Name: star_ratings_userrating star_ratings_userrating_user_id_25ba0a69_uniq; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.star_ratings_userrating
    ADD CONSTRAINT star_ratings_userrating_user_id_25ba0a69_uniq UNIQUE (user_id, rating_id);


--
-- Name: taggit_tag taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: threadedcomments_comment threadedcomments_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.threadedcomments_comment
    ADD CONSTRAINT threadedcomments_comment_pkey PRIMARY KEY (comment_ptr_id);


--
-- Name: thumbnail_kvstore thumbnail_kvstore_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.thumbnail_kvstore
    ADD CONSTRAINT thumbnail_kvstore_pkey PRIMARY KEY (key);


--
-- Name: userprofile_profile userprofile_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.userprofile_profile
    ADD CONSTRAINT userprofile_profile_pkey PRIMARY KEY (user_id);


--
-- Name: userprofile_user_groups userprofile_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.userprofile_user_groups
    ADD CONSTRAINT userprofile_user_groups_pkey PRIMARY KEY (id);


--
-- Name: userprofile_user_groups userprofile_user_groups_user_id_90ce1781_uniq; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.userprofile_user_groups
    ADD CONSTRAINT userprofile_user_groups_user_id_90ce1781_uniq UNIQUE (user_id, group_id);


--
-- Name: userprofile_user userprofile_user_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.userprofile_user
    ADD CONSTRAINT userprofile_user_pkey PRIMARY KEY (id);


--
-- Name: userprofile_user_user_permissions userprofile_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.userprofile_user_user_permissions
    ADD CONSTRAINT userprofile_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: userprofile_user_user_permissions userprofile_user_user_permissions_user_id_706d65c8_uniq; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.userprofile_user_user_permissions
    ADD CONSTRAINT userprofile_user_user_permissions_user_id_706d65c8_uniq UNIQUE (user_id, permission_id);


--
-- Name: userprofile_user userprofile_user_username_key; Type: CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.userprofile_user
    ADD CONSTRAINT userprofile_user_username_key UNIQUE (username);


--
-- Name: account_emailaddress_e8701ad4; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX account_emailaddress_e8701ad4 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailconfirmation_6f1edeac; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX account_emailconfirmation_6f1edeac ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX auth_group_permissions_0e939a4f ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX auth_group_permissions_8373b171 ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX auth_permission_417f1b1c ON public.auth_permission USING btree (content_type_id);


--
-- Name: blog_category_slug_92643dc5_like; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX blog_category_slug_92643dc5_like ON public.blog_category USING btree (slug varchar_pattern_ops);


--
-- Name: blog_post_4f331e2f; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX blog_post_4f331e2f ON public.blog_post USING btree (author_id);


--
-- Name: blog_post_b583a629; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX blog_post_b583a629 ON public.blog_post USING btree (category_id);


--
-- Name: blog_post_slug_b95473f2_like; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX blog_post_slug_b95473f2_like ON public.blog_post USING btree (slug varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX django_admin_log_417f1b1c ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX django_admin_log_e8701ad4 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_comment_flags_327a6c43; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX django_comment_flags_327a6c43 ON public.django_comment_flags USING btree (flag);


--
-- Name: django_comment_flags_69b97d17; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX django_comment_flags_69b97d17 ON public.django_comment_flags USING btree (comment_id);


--
-- Name: django_comment_flags_e8701ad4; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX django_comment_flags_e8701ad4 ON public.django_comment_flags USING btree (user_id);


--
-- Name: django_comment_flags_flag_8b141fcb_like; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX django_comment_flags_flag_8b141fcb_like ON public.django_comment_flags USING btree (flag varchar_pattern_ops);


--
-- Name: django_comments_417f1b1c; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX django_comments_417f1b1c ON public.django_comments USING btree (content_type_id);


--
-- Name: django_comments_9365d6e7; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX django_comments_9365d6e7 ON public.django_comments USING btree (site_id);


--
-- Name: django_comments_e8701ad4; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX django_comments_e8701ad4 ON public.django_comments USING btree (user_id);


--
-- Name: django_comments_submit_date_514ed2d9_uniq; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX django_comments_submit_date_514ed2d9_uniq ON public.django_comments USING btree (submit_date);


--
-- Name: django_flatpage_572d4e42; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX django_flatpage_572d4e42 ON public.django_flatpage USING btree (url);


--
-- Name: django_flatpage_sites_9365d6e7; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX django_flatpage_sites_9365d6e7 ON public.django_flatpage_sites USING btree (site_id);


--
-- Name: django_flatpage_sites_c3368d3a; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX django_flatpage_sites_c3368d3a ON public.django_flatpage_sites USING btree (flatpage_id);


--
-- Name: django_flatpage_url_41612362_like; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX django_flatpage_url_41612362_like ON public.django_flatpage USING btree (url varchar_pattern_ops);


--
-- Name: django_redirect_91a0b591; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX django_redirect_91a0b591 ON public.django_redirect USING btree (old_path);


--
-- Name: django_redirect_9365d6e7; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX django_redirect_9365d6e7 ON public.django_redirect USING btree (site_id);


--
-- Name: django_redirect_old_path_c6cc94d3_like; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX django_redirect_old_path_c6cc94d3_like ON public.django_redirect USING btree (old_path varchar_pattern_ops);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX django_session_de54fa62 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: newsletter_article_f3aa1999; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX newsletter_article_f3aa1999 ON public.newsletter_article USING btree (post_id);


--
-- Name: newsletter_message_2dbcba41; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX newsletter_message_2dbcba41 ON public.newsletter_message USING btree (slug);


--
-- Name: newsletter_message_5bf08b02; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX newsletter_message_5bf08b02 ON public.newsletter_message USING btree (newsletter_id);


--
-- Name: newsletter_message_slug_6dae36a9_like; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX newsletter_message_slug_6dae36a9_like ON public.newsletter_message USING btree (slug varchar_pattern_ops);


--
-- Name: newsletter_newsletter_46cf0e59; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX newsletter_newsletter_46cf0e59 ON public.newsletter_newsletter USING btree (visible);


--
-- Name: newsletter_newsletter_site_5bf08b02; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX newsletter_newsletter_site_5bf08b02 ON public.newsletter_newsletter_site USING btree (newsletter_id);


--
-- Name: newsletter_newsletter_site_9365d6e7; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX newsletter_newsletter_site_9365d6e7 ON public.newsletter_newsletter_site USING btree (site_id);


--
-- Name: newsletter_newsletter_slug_ec71f8b5_like; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX newsletter_newsletter_slug_ec71f8b5_like ON public.newsletter_newsletter USING btree (slug varchar_pattern_ops);


--
-- Name: newsletter_submission_4ccaa172; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX newsletter_submission_4ccaa172 ON public.newsletter_submission USING btree (message_id);


--
-- Name: newsletter_submission_5bf08b02; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX newsletter_submission_5bf08b02 ON public.newsletter_submission USING btree (newsletter_id);


--
-- Name: newsletter_submission_76776489; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX newsletter_submission_76776489 ON public.newsletter_submission USING btree (publish_date);


--
-- Name: newsletter_submission_789183b7; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX newsletter_submission_789183b7 ON public.newsletter_submission USING btree (sent);


--
-- Name: newsletter_submission_80f5f164; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX newsletter_submission_80f5f164 ON public.newsletter_submission USING btree (sending);


--
-- Name: newsletter_submission_91a51175; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX newsletter_submission_91a51175 ON public.newsletter_submission USING btree (prepared);


--
-- Name: newsletter_submission_9b6d0bb3; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX newsletter_submission_9b6d0bb3 ON public.newsletter_submission USING btree (publish);


--
-- Name: newsletter_submission_subscriptions_1dd9cfcc; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX newsletter_submission_subscriptions_1dd9cfcc ON public.newsletter_submission_subscriptions USING btree (submission_id);


--
-- Name: newsletter_submission_subscriptions_ef42673f; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX newsletter_submission_subscriptions_ef42673f ON public.newsletter_submission_subscriptions USING btree (subscription_id);


--
-- Name: newsletter_subscription_0c83f57c; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX newsletter_subscription_0c83f57c ON public.newsletter_subscription USING btree (email);


--
-- Name: newsletter_subscription_5bf08b02; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX newsletter_subscription_5bf08b02 ON public.newsletter_subscription USING btree (newsletter_id);


--
-- Name: newsletter_subscription_a0f39894; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX newsletter_subscription_a0f39894 ON public.newsletter_subscription USING btree (unsubscribed);


--
-- Name: newsletter_subscription_cb982542; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX newsletter_subscription_cb982542 ON public.newsletter_subscription USING btree (subscribed);


--
-- Name: newsletter_subscription_e8701ad4; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX newsletter_subscription_e8701ad4 ON public.newsletter_subscription USING btree (user_id);


--
-- Name: newsletter_subscription_email_3b8020aa_like; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX newsletter_subscription_email_3b8020aa_like ON public.newsletter_subscription USING btree (email varchar_pattern_ops);


--
-- Name: notify_notification_53a09d9a; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX notify_notification_53a09d9a ON public.notify_notification USING btree (actor_content_type_id);


--
-- Name: notify_notification_5e4daf29; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX notify_notification_5e4daf29 ON public.notify_notification USING btree (obj_content_type_id);


--
-- Name: notify_notification_8b938c66; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX notify_notification_8b938c66 ON public.notify_notification USING btree (recipient_id);


--
-- Name: notify_notification_e4f9dcc7; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX notify_notification_e4f9dcc7 ON public.notify_notification USING btree (target_content_type_id);


--
-- Name: recipe_category_slug_9e8c4cc6_like; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX recipe_category_slug_9e8c4cc6_like ON public.recipe_category USING btree (slug varchar_pattern_ops);


--
-- Name: recipe_categoryvideo_slug_d2246481_like; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX recipe_categoryvideo_slug_d2246481_like ON public.recipe_categoryvideo USING btree (slug varchar_pattern_ops);


--
-- Name: recipe_recipe_4f331e2f; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX recipe_recipe_4f331e2f ON public.recipe_recipe USING btree (author_id);


--
-- Name: recipe_recipe_b583a629; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX recipe_recipe_b583a629 ON public.recipe_recipe USING btree (category_id);


--
-- Name: recipe_recipe_origin_c78b92ae; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX recipe_recipe_origin_c78b92ae ON public.recipe_recipe_origin USING btree (origin_id);


--
-- Name: recipe_recipe_origin_da50e9c3; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX recipe_recipe_origin_da50e9c3 ON public.recipe_recipe_origin USING btree (recipe_id);


--
-- Name: recipe_recipe_slug_49f84e76_like; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX recipe_recipe_slug_49f84e76_like ON public.recipe_recipe USING btree (slug varchar_pattern_ops);


--
-- Name: recipe_video_4f331e2f; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX recipe_video_4f331e2f ON public.recipe_video USING btree (author_id);


--
-- Name: recipe_video_b583a629; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX recipe_video_b583a629 ON public.recipe_video USING btree (category_id);


--
-- Name: recipe_video_origin_b58b747e; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX recipe_video_origin_b58b747e ON public.recipe_video_origin USING btree (video_id);


--
-- Name: recipe_video_origin_c78b92ae; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX recipe_video_origin_c78b92ae ON public.recipe_video_origin USING btree (origin_id);


--
-- Name: recipe_video_slug_e3690f24_like; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX recipe_video_slug_e3690f24_like ON public.recipe_video USING btree (slug varchar_pattern_ops);


--
-- Name: restaurant_category_slug_f64b955b_like; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX restaurant_category_slug_f64b955b_like ON public.restaurant_category USING btree (slug varchar_pattern_ops);


--
-- Name: restaurant_restaurant_4f331e2f; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX restaurant_restaurant_4f331e2f ON public.restaurant_restaurant USING btree (author_id);


--
-- Name: restaurant_restaurant_b583a629; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX restaurant_restaurant_b583a629 ON public.restaurant_restaurant USING btree (category_id);


--
-- Name: restaurant_restaurant_slug_9c30c6a0_like; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX restaurant_restaurant_slug_9c30c6a0_like ON public.restaurant_restaurant USING btree (slug varchar_pattern_ops);


--
-- Name: socialaccount_socialaccount_e8701ad4; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX socialaccount_socialaccount_e8701ad4 ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_9365d6e7; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX socialaccount_socialapp_sites_9365d6e7 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_fe95b0a0; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX socialaccount_socialapp_sites_fe95b0a0 ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_8a089c2a; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX socialaccount_socialtoken_8a089c2a ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_f382adfe; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX socialaccount_socialtoken_f382adfe ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: star_ratings_rating_417f1b1c; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX star_ratings_rating_417f1b1c ON public.star_ratings_rating USING btree (content_type_id);


--
-- Name: star_ratings_userrating_c14e3df7; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX star_ratings_userrating_c14e3df7 ON public.star_ratings_userrating USING btree (rating_id);


--
-- Name: star_ratings_userrating_e8701ad4; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX star_ratings_userrating_e8701ad4 ON public.star_ratings_userrating USING btree (user_id);


--
-- Name: taggit_tag_name_58eb2ed9_like; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX taggit_tag_name_58eb2ed9_like ON public.taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_6be58b2c_like; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX taggit_tag_slug_6be58b2c_like ON public.taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_417f1b1c; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX taggit_taggeditem_417f1b1c ON public.taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_76f094bc; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX taggit_taggeditem_76f094bc ON public.taggit_taggeditem USING btree (tag_id);


--
-- Name: taggit_taggeditem_af31437c; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX taggit_taggeditem_af31437c ON public.taggit_taggeditem USING btree (object_id);


--
-- Name: taggit_taggeditem_content_type_id_196cc965_idx; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX taggit_taggeditem_content_type_id_196cc965_idx ON public.taggit_taggeditem USING btree (content_type_id, object_id);


--
-- Name: threadedcomments_comment_6be37982; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX threadedcomments_comment_6be37982 ON public.threadedcomments_comment USING btree (parent_id);


--
-- Name: threadedcomments_comment_86b41ee2; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX threadedcomments_comment_86b41ee2 ON public.threadedcomments_comment USING btree (last_child_id);


--
-- Name: thumbnail_kvstore_key_3f850178_like; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX thumbnail_kvstore_key_3f850178_like ON public.thumbnail_kvstore USING btree (key varchar_pattern_ops);


--
-- Name: userprofile_profile_2dbcba41; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX userprofile_profile_2dbcba41 ON public.userprofile_profile USING btree (slug);


--
-- Name: userprofile_profile_slug_938b9244_like; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX userprofile_profile_slug_938b9244_like ON public.userprofile_profile USING btree (slug varchar_pattern_ops);


--
-- Name: userprofile_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX userprofile_user_groups_0e939a4f ON public.userprofile_user_groups USING btree (group_id);


--
-- Name: userprofile_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX userprofile_user_groups_e8701ad4 ON public.userprofile_user_groups USING btree (user_id);


--
-- Name: userprofile_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX userprofile_user_user_permissions_8373b171 ON public.userprofile_user_user_permissions USING btree (permission_id);


--
-- Name: userprofile_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX userprofile_user_user_permissions_e8701ad4 ON public.userprofile_user_user_permissions USING btree (user_id);


--
-- Name: userprofile_user_username_48ebc8c7_like; Type: INDEX; Schema: public; Owner: togokuizine_user
--

CREATE INDEX userprofile_user_username_48ebc8c7_like ON public.userprofile_user USING btree (username varchar_pattern_ops);


--
-- Name: threadedcomments_comment D6d3812839a3907e4bae4b44daae45c0; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.threadedcomments_comment
    ADD CONSTRAINT "D6d3812839a3907e4bae4b44daae45c0" FOREIGN KEY (last_child_id) REFERENCES public.threadedcomments_comment(comment_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_em_email_address_id_5b7f8c58_fk_account_emailaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_em_email_address_id_5b7f8c58_fk_account_emailaddress_id FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_userprofile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_userprofile_user_id FOREIGN KEY (user_id) REFERENCES public.userprofile_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_post blog_post_author_id_dd7a8485_fk_userprofile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.blog_post
    ADD CONSTRAINT blog_post_author_id_dd7a8485_fk_userprofile_user_id FOREIGN KEY (author_id) REFERENCES public.userprofile_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_post blog_post_category_id_c326dbf8_fk_blog_category_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.blog_post
    ADD CONSTRAINT blog_post_category_id_c326dbf8_fk_blog_category_id FOREIGN KEY (category_id) REFERENCES public.blog_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_userprofile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_userprofile_user_id FOREIGN KEY (user_id) REFERENCES public.userprofile_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comments django_comme_content_type_id_c4afe962_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_comments
    ADD CONSTRAINT django_comme_content_type_id_c4afe962_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comment_flags django_comment_flags_comment_id_d8054933_fk_django_comments_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_comment_flags
    ADD CONSTRAINT django_comment_flags_comment_id_d8054933_fk_django_comments_id FOREIGN KEY (comment_id) REFERENCES public.django_comments(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comment_flags django_comment_flags_user_id_f3f81f0a_fk_userprofile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_comment_flags
    ADD CONSTRAINT django_comment_flags_user_id_f3f81f0a_fk_userprofile_user_id FOREIGN KEY (user_id) REFERENCES public.userprofile_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comments django_comments_site_id_9dcf666e_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_comments
    ADD CONSTRAINT django_comments_site_id_9dcf666e_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comments django_comments_user_id_a0a440a1_fk_userprofile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_comments
    ADD CONSTRAINT django_comments_user_id_a0a440a1_fk_userprofile_user_id FOREIGN KEY (user_id) REFERENCES public.userprofile_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_flatpage_sites django_flatpage_site_flatpage_id_078bbc8b_fk_django_flatpage_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_flatpage_sites
    ADD CONSTRAINT django_flatpage_site_flatpage_id_078bbc8b_fk_django_flatpage_id FOREIGN KEY (flatpage_id) REFERENCES public.django_flatpage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_flatpage_sites django_flatpage_sites_site_id_bfd8ea84_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_site_id_bfd8ea84_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_redirect django_redirect_site_id_c3e37341_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.django_redirect
    ADD CONSTRAINT django_redirect_site_id_c3e37341_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: newsletter_submission_subscriptions newslett_subscription_id_be932b58_fk_newsletter_subscription_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.newsletter_submission_subscriptions
    ADD CONSTRAINT newslett_subscription_id_be932b58_fk_newsletter_subscription_id FOREIGN KEY (subscription_id) REFERENCES public.newsletter_subscription(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: newsletter_article newsletter_article_post_id_c481e545_fk_newsletter_message_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.newsletter_article
    ADD CONSTRAINT newsletter_article_post_id_c481e545_fk_newsletter_message_id FOREIGN KEY (post_id) REFERENCES public.newsletter_message(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: newsletter_message newsletter_m_newsletter_id_b77d9df1_fk_newsletter_newsletter_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.newsletter_message
    ADD CONSTRAINT newsletter_m_newsletter_id_b77d9df1_fk_newsletter_newsletter_id FOREIGN KEY (newsletter_id) REFERENCES public.newsletter_newsletter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: newsletter_newsletter_site newsletter_n_newsletter_id_d5cf228e_fk_newsletter_newsletter_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.newsletter_newsletter_site
    ADD CONSTRAINT newsletter_n_newsletter_id_d5cf228e_fk_newsletter_newsletter_id FOREIGN KEY (newsletter_id) REFERENCES public.newsletter_newsletter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: newsletter_newsletter_site newsletter_newsletter_site_site_id_2a546dc1_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.newsletter_newsletter_site
    ADD CONSTRAINT newsletter_newsletter_site_site_id_2a546dc1_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: newsletter_submission newsletter_s_newsletter_id_8fa5ae76_fk_newsletter_newsletter_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.newsletter_submission
    ADD CONSTRAINT newsletter_s_newsletter_id_8fa5ae76_fk_newsletter_newsletter_id FOREIGN KEY (newsletter_id) REFERENCES public.newsletter_newsletter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: newsletter_subscription newsletter_s_newsletter_id_e9d08ab9_fk_newsletter_newsletter_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.newsletter_subscription
    ADD CONSTRAINT newsletter_s_newsletter_id_e9d08ab9_fk_newsletter_newsletter_id FOREIGN KEY (newsletter_id) REFERENCES public.newsletter_newsletter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: newsletter_submission_subscriptions newsletter_s_submission_id_0cda0c3f_fk_newsletter_submission_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.newsletter_submission_subscriptions
    ADD CONSTRAINT newsletter_s_submission_id_0cda0c3f_fk_newsletter_submission_id FOREIGN KEY (submission_id) REFERENCES public.newsletter_submission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: newsletter_submission newsletter_submiss_message_id_35227c2e_fk_newsletter_message_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.newsletter_submission
    ADD CONSTRAINT newsletter_submiss_message_id_35227c2e_fk_newsletter_message_id FOREIGN KEY (message_id) REFERENCES public.newsletter_message(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: newsletter_subscription newsletter_subscription_user_id_4185bd67_fk_userprofile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.newsletter_subscription
    ADD CONSTRAINT newsletter_subscription_user_id_4185bd67_fk_userprofile_user_id FOREIGN KEY (user_id) REFERENCES public.userprofile_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notify_notification notif_target_content_type_id_55b5712a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.notify_notification
    ADD CONSTRAINT notif_target_content_type_id_55b5712a_fk_django_content_type_id FOREIGN KEY (target_content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notify_notification notify_actor_content_type_id_1a428036_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.notify_notification
    ADD CONSTRAINT notify_actor_content_type_id_1a428036_fk_django_content_type_id FOREIGN KEY (actor_content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notify_notification notify_n_obj_content_type_id_93f677d5_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.notify_notification
    ADD CONSTRAINT notify_n_obj_content_type_id_93f677d5_fk_django_content_type_id FOREIGN KEY (obj_content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notify_notification notify_notificatio_recipient_id_07222ca5_fk_userprofile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.notify_notification
    ADD CONSTRAINT notify_notificatio_recipient_id_07222ca5_fk_userprofile_user_id FOREIGN KEY (recipient_id) REFERENCES public.userprofile_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recipe_recipe recipe_recipe_author_id_76879012_fk_userprofile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.recipe_recipe
    ADD CONSTRAINT recipe_recipe_author_id_76879012_fk_userprofile_user_id FOREIGN KEY (author_id) REFERENCES public.userprofile_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recipe_recipe recipe_recipe_category_id_1b058e66_fk_recipe_category_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.recipe_recipe
    ADD CONSTRAINT recipe_recipe_category_id_1b058e66_fk_recipe_category_id FOREIGN KEY (category_id) REFERENCES public.recipe_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recipe_recipe_origin recipe_recipe_origin_origin_id_c7145538_fk_recipe_origin_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.recipe_recipe_origin
    ADD CONSTRAINT recipe_recipe_origin_origin_id_c7145538_fk_recipe_origin_id FOREIGN KEY (origin_id) REFERENCES public.recipe_origin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recipe_recipe_origin recipe_recipe_origin_recipe_id_bb4aa4b0_fk_recipe_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.recipe_recipe_origin
    ADD CONSTRAINT recipe_recipe_origin_recipe_id_bb4aa4b0_fk_recipe_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.recipe_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recipe_video recipe_video_author_id_13dc92c5_fk_userprofile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.recipe_video
    ADD CONSTRAINT recipe_video_author_id_13dc92c5_fk_userprofile_user_id FOREIGN KEY (author_id) REFERENCES public.userprofile_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recipe_video recipe_video_category_id_034cb880_fk_recipe_categoryvideo_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.recipe_video
    ADD CONSTRAINT recipe_video_category_id_034cb880_fk_recipe_categoryvideo_id FOREIGN KEY (category_id) REFERENCES public.recipe_categoryvideo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recipe_video_origin recipe_video_origin_origin_id_d4697dc9_fk_recipe_origin_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.recipe_video_origin
    ADD CONSTRAINT recipe_video_origin_origin_id_d4697dc9_fk_recipe_origin_id FOREIGN KEY (origin_id) REFERENCES public.recipe_origin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recipe_video_origin recipe_video_origin_video_id_d9a3b81b_fk_recipe_video_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.recipe_video_origin
    ADD CONSTRAINT recipe_video_origin_video_id_d9a3b81b_fk_recipe_video_id FOREIGN KEY (video_id) REFERENCES public.recipe_video(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: restaurant_restaurant restaurant_resta_category_id_b2573cd6_fk_restaurant_category_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.restaurant_restaurant
    ADD CONSTRAINT restaurant_resta_category_id_b2573cd6_fk_restaurant_category_id FOREIGN KEY (category_id) REFERENCES public.restaurant_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: restaurant_restaurant restaurant_restaurant_author_id_081cacfe_fk_userprofile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.restaurant_restaurant
    ADD CONSTRAINT restaurant_restaurant_author_id_081cacfe_fk_userprofile_user_id FOREIGN KEY (author_id) REFERENCES public.userprofile_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialacc_account_id_951f210e_fk_socialaccount_socialaccount_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialacc_account_id_951f210e_fk_socialaccount_socialaccount_id FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccou_socialapp_id_97fb6e7d_fk_socialaccount_socialapp_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccou_socialapp_id_97fb6e7d_fk_socialaccount_socialapp_id FOREIGN KEY (socialapp_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_soc_app_id_636a42d7_fk_socialaccount_socialapp_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_soc_app_id_636a42d7_fk_socialaccount_socialapp_id FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount socialaccount_socialacc_user_id_8146e70c_fk_userprofile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialacc_user_id_8146e70c_fk_userprofile_user_id FOREIGN KEY (user_id) REFERENCES public.userprofile_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_site_site_id_2579dee5_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_site_site_id_2579dee5_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: star_ratings_rating star_ratings_content_type_id_176abacc_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.star_ratings_rating
    ADD CONSTRAINT star_ratings_content_type_id_176abacc_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: star_ratings_userrating star_ratings_userr_rating_id_e7ac9370_fk_star_ratings_rating_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.star_ratings_userrating
    ADD CONSTRAINT star_ratings_userr_rating_id_e7ac9370_fk_star_ratings_rating_id FOREIGN KEY (rating_id) REFERENCES public.star_ratings_rating(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: star_ratings_userrating star_ratings_userrating_user_id_33d5d349_fk_userprofile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.star_ratings_userrating
    ADD CONSTRAINT star_ratings_userrating_user_id_33d5d349_fk_userprofile_user_id FOREIGN KEY (user_id) REFERENCES public.userprofile_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: threadedcomments_comment t_parent_id_2ee72289_fk_threadedcomments_comment_comment_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.threadedcomments_comment
    ADD CONSTRAINT t_parent_id_2ee72289_fk_threadedcomments_comment_comment_ptr_id FOREIGN KEY (parent_id) REFERENCES public.threadedcomments_comment(comment_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_tagge_content_type_id_9957a03c_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_tagge_content_type_id_9957a03c_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES public.taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: threadedcomments_comment threadedcomments__comment_ptr_id_a3586f1b_fk_django_comments_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.threadedcomments_comment
    ADD CONSTRAINT threadedcomments__comment_ptr_id_a3586f1b_fk_django_comments_id FOREIGN KEY (comment_ptr_id) REFERENCES public.django_comments(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofile_profile userprofile_profile_user_id_f37c6bb1_fk_userprofile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.userprofile_profile
    ADD CONSTRAINT userprofile_profile_user_id_f37c6bb1_fk_userprofile_user_id FOREIGN KEY (user_id) REFERENCES public.userprofile_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofile_user_groups userprofile_user_groups_group_id_c7eec74e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.userprofile_user_groups
    ADD CONSTRAINT userprofile_user_groups_group_id_c7eec74e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofile_user_groups userprofile_user_groups_user_id_5e712a24_fk_userprofile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.userprofile_user_groups
    ADD CONSTRAINT userprofile_user_groups_user_id_5e712a24_fk_userprofile_user_id FOREIGN KEY (user_id) REFERENCES public.userprofile_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofile_user_user_permissions userprofile_user_u_permission_id_1caa8a71_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.userprofile_user_user_permissions
    ADD CONSTRAINT userprofile_user_u_permission_id_1caa8a71_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofile_user_user_permissions userprofile_user_user_p_user_id_6d654469_fk_userprofile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: togokuizine_user
--

ALTER TABLE ONLY public.userprofile_user_user_permissions
    ADD CONSTRAINT userprofile_user_user_p_user_id_6d654469_fk_userprofile_user_id FOREIGN KEY (user_id) REFERENCES public.userprofile_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

