--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admins; Type: TABLE; Schema: public; Owner: rails; Tablespace: 
--

CREATE TABLE admins (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.admins OWNER TO rails;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admins_id_seq OWNER TO rails;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE admins_id_seq OWNED BY admins.id;


--
-- Name: artists; Type: TABLE; Schema: public; Owner: rails; Tablespace: 
--

CREATE TABLE artists (
    id integer NOT NULL,
    name character varying(255),
    picture character varying(255),
    bio text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    avatar_file_name character varying(255),
    avatar_content_type character varying(255),
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone,
    facebook character varying(255),
    instagram character varying(255)
);


ALTER TABLE public.artists OWNER TO rails;

--
-- Name: artists_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE artists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.artists_id_seq OWNER TO rails;

--
-- Name: artists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE artists_id_seq OWNED BY artists.id;


--
-- Name: clients; Type: TABLE; Schema: public; Owner: rails; Tablespace: 
--

CREATE TABLE clients (
    id integer NOT NULL,
    lastname character varying(255),
    firstname character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.clients OWNER TO rails;

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_id_seq OWNER TO rails;

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE clients_id_seq OWNED BY clients.id;


--
-- Name: images; Type: TABLE; Schema: public; Owner: rails; Tablespace: 
--

CREATE TABLE images (
    id integer NOT NULL,
    display boolean,
    story_id integer,
    artist_id integer,
    img_file_name character varying(255),
    img_content_type character varying(255),
    img_file_size integer,
    img_updated_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.images OWNER TO rails;

--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.images_id_seq OWNER TO rails;

--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE images_id_seq OWNED BY images.id;


--
-- Name: makeupartists; Type: TABLE; Schema: public; Owner: rails; Tablespace: 
--

CREATE TABLE makeupartists (
    id integer NOT NULL,
    name character varying(255),
    picture character varying(255),
    bio text,
    avatar_file_name character varying(255),
    avatar_content_type character varying(255),
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    facebook character varying(255),
    instagram character varying(255)
);


ALTER TABLE public.makeupartists OWNER TO rails;

--
-- Name: makeupartists_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE makeupartists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.makeupartists_id_seq OWNER TO rails;

--
-- Name: makeupartists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE makeupartists_id_seq OWNED BY makeupartists.id;


--
-- Name: makeupimages; Type: TABLE; Schema: public; Owner: rails; Tablespace: 
--

CREATE TABLE makeupimages (
    id integer NOT NULL,
    makeupartist_id integer,
    img_file_name character varying(255),
    img_content_type character varying(255),
    img_file_size integer,
    img_updated_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.makeupimages OWNER TO rails;

--
-- Name: makeupimages_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE makeupimages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.makeupimages_id_seq OWNER TO rails;

--
-- Name: makeupimages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE makeupimages_id_seq OWNED BY makeupimages.id;


--
-- Name: newsposts; Type: TABLE; Schema: public; Owner: rails; Tablespace: 
--

CREATE TABLE newsposts (
    id integer NOT NULL,
    heading text,
    body text,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.newsposts OWNER TO rails;

--
-- Name: newsposts_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE newsposts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.newsposts_id_seq OWNER TO rails;

--
-- Name: newsposts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE newsposts_id_seq OWNED BY newsposts.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: rails; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO rails;

--
-- Name: stories; Type: TABLE; Schema: public; Owner: rails; Tablespace: 
--

CREATE TABLE stories (
    id integer NOT NULL,
    title character varying(255),
    description text,
    date date,
    featured boolean,
    artist_id integer,
    client_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.stories OWNER TO rails;

--
-- Name: stories_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE stories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stories_id_seq OWNER TO rails;

--
-- Name: stories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE stories_id_seq OWNED BY stories.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY admins ALTER COLUMN id SET DEFAULT nextval('admins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY artists ALTER COLUMN id SET DEFAULT nextval('artists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY clients ALTER COLUMN id SET DEFAULT nextval('clients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY images ALTER COLUMN id SET DEFAULT nextval('images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY makeupartists ALTER COLUMN id SET DEFAULT nextval('makeupartists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY makeupimages ALTER COLUMN id SET DEFAULT nextval('makeupimages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY newsposts ALTER COLUMN id SET DEFAULT nextval('newsposts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY stories ALTER COLUMN id SET DEFAULT nextval('stories_id_seq'::regclass);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY admins (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('admins_id_seq', 1, false);


--
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY artists (id, name, picture, bio, created_at, updated_at, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, facebook, instagram) FROM stdin;
\.


--
-- Name: artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('artists_id_seq', 1, false);


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY clients (id, lastname, firstname, created_at, updated_at) FROM stdin;
\.


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('clients_id_seq', 1, false);


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY images (id, display, story_id, artist_id, img_file_name, img_content_type, img_file_size, img_updated_at, created_at, updated_at) FROM stdin;
\.


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('images_id_seq', 1, false);


--
-- Data for Name: makeupartists; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY makeupartists (id, name, picture, bio, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, created_at, updated_at, facebook, instagram) FROM stdin;
\.


--
-- Name: makeupartists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('makeupartists_id_seq', 1, false);


--
-- Data for Name: makeupimages; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY makeupimages (id, makeupartist_id, img_file_name, img_content_type, img_file_size, img_updated_at, created_at, updated_at) FROM stdin;
\.


--
-- Name: makeupimages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('makeupimages_id_seq', 1, false);


--
-- Data for Name: newsposts; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY newsposts (id, heading, body, start_date, end_date, created_at, updated_at) FROM stdin;
\.


--
-- Name: newsposts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('newsposts_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY schema_migrations (version) FROM stdin;
20140121060459
20140125060131
20140125060516
20140125060808
20140125061011
20140126061848
20140507003622
20140724014701
20140724014853
20140903161010
20140903161911
\.


--
-- Data for Name: stories; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY stories (id, title, description, date, featured, artist_id, client_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: stories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('stories_id_seq', 1, false);


--
-- Name: admins_pkey; Type: CONSTRAINT; Schema: public; Owner: rails; Tablespace: 
--

ALTER TABLE ONLY admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: artists_pkey; Type: CONSTRAINT; Schema: public; Owner: rails; Tablespace: 
--

ALTER TABLE ONLY artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (id);


--
-- Name: clients_pkey; Type: CONSTRAINT; Schema: public; Owner: rails; Tablespace: 
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: images_pkey; Type: CONSTRAINT; Schema: public; Owner: rails; Tablespace: 
--

ALTER TABLE ONLY images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: makeupartists_pkey; Type: CONSTRAINT; Schema: public; Owner: rails; Tablespace: 
--

ALTER TABLE ONLY makeupartists
    ADD CONSTRAINT makeupartists_pkey PRIMARY KEY (id);


--
-- Name: makeupimages_pkey; Type: CONSTRAINT; Schema: public; Owner: rails; Tablespace: 
--

ALTER TABLE ONLY makeupimages
    ADD CONSTRAINT makeupimages_pkey PRIMARY KEY (id);


--
-- Name: newsposts_pkey; Type: CONSTRAINT; Schema: public; Owner: rails; Tablespace: 
--

ALTER TABLE ONLY newsposts
    ADD CONSTRAINT newsposts_pkey PRIMARY KEY (id);


--
-- Name: stories_pkey; Type: CONSTRAINT; Schema: public; Owner: rails; Tablespace: 
--

ALTER TABLE ONLY stories
    ADD CONSTRAINT stories_pkey PRIMARY KEY (id);


--
-- Name: index_admins_on_email; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE UNIQUE INDEX index_admins_on_email ON admins USING btree (email);


--
-- Name: index_admins_on_reset_password_token; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE UNIQUE INDEX index_admins_on_reset_password_token ON admins USING btree (reset_password_token);


--
-- Name: index_images_on_artist_id; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE INDEX index_images_on_artist_id ON images USING btree (artist_id);


--
-- Name: index_images_on_story_id; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE INDEX index_images_on_story_id ON images USING btree (story_id);


--
-- Name: index_makeupimages_on_makeupartist_id; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE INDEX index_makeupimages_on_makeupartist_id ON makeupimages USING btree (makeupartist_id);


--
-- Name: index_stories_on_artist_id; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE INDEX index_stories_on_artist_id ON stories USING btree (artist_id);


--
-- Name: index_stories_on_client_id; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE INDEX index_stories_on_client_id ON stories USING btree (client_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

