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


ALTER TABLE admins OWNER TO rails;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admins_id_seq OWNER TO rails;

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


ALTER TABLE artists OWNER TO rails;

--
-- Name: artists_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE artists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE artists_id_seq OWNER TO rails;

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


ALTER TABLE clients OWNER TO rails;

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE clients_id_seq OWNER TO rails;

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


ALTER TABLE images OWNER TO rails;

--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE images_id_seq OWNER TO rails;

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


ALTER TABLE makeupartists OWNER TO rails;

--
-- Name: makeupartists_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE makeupartists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE makeupartists_id_seq OWNER TO rails;

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


ALTER TABLE makeupimages OWNER TO rails;

--
-- Name: makeupimages_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE makeupimages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE makeupimages_id_seq OWNER TO rails;

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


ALTER TABLE newsposts OWNER TO rails;

--
-- Name: newsposts_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE newsposts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE newsposts_id_seq OWNER TO rails;

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


ALTER TABLE schema_migrations OWNER TO rails;

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


ALTER TABLE stories OWNER TO rails;

--
-- Name: stories_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE stories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE stories_id_seq OWNER TO rails;

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
1	nicolas.blunt@gmail.com	$2a$10$LvYyaV9aORC6eMJUr69/q.EI0Mn1PR2i8M9r1aoCTRBrNZ1liscby	\N	\N	\N	23	2015-08-27 16:41:37.470064	2015-08-25 22:51:01.948056	75.142.18.52	68.116.53.98	2014-05-15 00:47:49.926235	2015-08-27 16:41:37.471479
2	ludlowbuilt@gmail.com	$2a$10$x14CezOK8osfpoEY0e.36.Drhr3KNnWZTDVV2jSydGrsY9QYA//9S	\N	\N	\N	34	2015-10-26 18:00:47.866986	2015-10-21 22:52:31.197886	71.92.131.45	71.92.131.45	2014-05-16 22:14:37.04714	2015-10-26 18:00:47.868906
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('admins_id_seq', 2, true);


--
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY artists (id, name, picture, bio, created_at, updated_at, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, facebook, instagram) FROM stdin;
3	Casey Meservey	\N	Hailing from rainy Portland, Oregon, Casey has always been in love with art. As a child he carried around a sketch pad and was often transforming his thoughts on paper, in the form of art. With dreams of one day drawing a Wolverine cover for Marvel Comics, he spent countless hours honing his skills. When the teenage angst years hit, his love of art expanded and he spent several years pouring his heart and soul into playing the guitar for multiple Oregon bands. As an oil painter, he has always loved color blending and when he got his first tattoo at 16, he heard his calling and hasn’t turned back since. He’s been tattooing since 2009 and has even done a Wolverine tattoo. 	2014-06-07 19:40:31.907786	2014-10-20 22:25:11.954604	10478525_10203654835346935_8228260417174832530_n.jpg	image/jpeg	181552	2014-07-17 22:26:15.253653	https://www.facebook.com/Kaishisama?fref=ts	http://instagram.com/mr_pandapants_tattoo?modal=true
1	Josh Ludlow	\N	Josh has had a passion for art for as long as he can remember and is a self-taught artist with a professional education in tattooing. He is a self-proclaimed nerdy, hard-working husband and father, and recycles because his wife makes him. He loves most genres of music and attended countless concerts prior to being a dad. These days he stays busy being a family man, designing and tattooing custom artwork, and occasionally is able to fit a sci-fi movie into his busy schedule. \r\n\r\n\r\n	2014-05-15 00:48:08.325182	2014-10-20 22:39:14.862392	IMG_3661186158757.jpeg	image/jpeg	59148	2014-07-02 22:19:27.937831	https://www.facebook.com/josh.ludlow.tattoo?fref=ts	http://instagram.com/ludlowtattoo?modal=true
2	Guillermo "G" Tavera	\N	Guillermo, also simply known as "G", can often be found devouring tacos outside the local taco truck. He knows good Mexican food when he finds it and isn't afraid of habaneros. 	2014-06-07 19:26:42.516659	2014-11-25 00:52:17.125744	10818897_990758680950284_1884890921_n.jpg	image/jpeg	27286	2014-11-25 00:52:15.111189	https://www.facebook.com/guillermo.tavera.9?fref=ts	http://instagram.com/guillermotavera?modal=true
11	Joshua Teska	\N	Birds, birds, birds! Joshua Teska says that his favorite thing to tattoo is birds but he also loves doing large-scale custom work that includes Japanese, black and gray, full color, portraits, and anything imaginative and out of the ordinary. Teska recalls that as a young boy he was intrigued by his uncle’s old, traditional tattoos and the fact that it was possible to put artwork on someone’s skin. He got a book by Guy Aitchison and a book from Shige and read, studied, and reread those books until the bindings fell apart. He was hooked. Art was his calling and he began drawing and painting with oil, acrylic, and watercolor and also does murals. He began tattooing in San Francisco and has now tattooed for 12 years and counting.\r\n\r\n He thanks God for giving him such a wonderful life where he is able to have the opportunity to do what he loves and still put his family first. As a married father of five, when he isn’t busy tattooing or painting, he is either at church or hanging out with his family.	2015-03-30 21:04:39.191496	2015-03-30 21:04:39.191496	Teska_working.jpg	image/jpeg	28624	2015-03-30 21:04:37.170331	https://www.facebook.com/joshuateska1?fref=ts	https://instagram.com/joshuateska777/
\.


--
-- Name: artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('artists_id_seq', 12, true);


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY clients (id, lastname, firstname, created_at, updated_at) FROM stdin;
1	Generic	Generic	2014-05-15 00:48:19.610069	2014-05-15 00:48:19.610069
\.


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('clients_id_seq', 1, true);


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY images (id, display, story_id, artist_id, img_file_name, img_content_type, img_file_size, img_updated_at, created_at, updated_at) FROM stdin;
95	t	\N	2	1014397_596328557078350_1299299971_n.jpg	image/jpeg	116665	2014-07-13 02:40:39.356901	2014-07-13 02:40:40.507944	2014-07-13 02:40:40.507944
452	t	\N	2	10268619_752917044752833_1148181721207432536_n.jpg	image/jpeg	47417	2014-07-17 01:22:48.523537	2014-07-17 01:22:49.448528	2014-07-17 01:22:49.448528
454	t	\N	2	10382849_765878730123331_3398297130814576355_n.jpg	image/jpeg	50847	2014-07-17 01:22:52.030042	2014-07-17 01:22:52.768949	2014-07-17 01:22:52.768949
455	t	\N	2	cupcake	image/jpeg	481846	2014-07-17 21:33:51.52023	2014-07-17 21:33:53.744971	2014-07-17 21:33:53.744971
456	t	\N	3	12471_10202835111174343_1568136033_n.jpg	image/jpeg	38452	2014-07-17 22:26:18.232677	2014-07-17 22:26:19.473104	2014-07-17 22:26:19.473104
457	t	\N	3	984088_10203296434547139_1862406398053694593_n.jpg	image/jpeg	61479	2014-07-17 22:26:20.031508	2014-07-17 22:26:21.571824	2014-07-17 22:26:21.571824
101	t	\N	2	1231556_627885853922620_1777567155_n.jpg	image/jpeg	99820	2014-07-13 02:41:38.338391	2014-07-13 02:41:39.535411	2014-07-13 02:41:39.535411
104	t	\N	2	1525318_676524482392090_517839801_n.jpg	image/jpeg	101907	2014-07-13 02:41:45.236317	2014-07-13 02:41:46.290718	2014-07-13 02:41:46.290718
458	t	\N	3	1378791_10203155664947987_2366712344985209582_n_(2).jpg	image/jpeg	68330	2014-07-17 22:26:22.260247	2014-07-17 22:26:23.673201	2014-07-17 22:26:23.673201
459	t	\N	3	1798152_10202913549055241_532882699_n.jpg	image/jpeg	68331	2014-07-17 22:26:53.064772	2014-07-17 22:26:54.77068	2014-07-17 22:26:54.77068
460	t	\N	3	10273312_10203749082143046_7260378509693574493_o.jpg	image/jpeg	78896	2014-07-17 22:26:55.728963	2014-07-17 22:26:57.709889	2014-07-17 22:26:57.709889
461	t	\N	3	10369193_10203551610286373_8941411184593582684_n.jpg	image/jpeg	126251	2014-07-17 22:26:58.563086	2014-07-17 22:27:00.271033	2014-07-17 22:27:00.271033
463	t	\N	3	10273312_10203749082143046_7260378509693574493_o.jpg	image/jpeg	78896	2014-07-17 22:27:07.130765	2014-07-17 22:27:10.363439	2014-07-17 22:27:10.363439
465	t	\N	3	1503816_10203676716533951_5253043576802580091_n_(2).jpg	image/jpeg	32593	2014-07-17 22:28:35.18364	2014-07-17 22:28:36.496642	2014-07-17 22:28:36.496642
466	t	\N	3	10393814_10203652420886575_2897221577442747281_n.jpg	image/jpeg	43584	2014-07-17 22:28:37.330357	2014-07-17 22:28:39.021937	2014-07-17 22:28:39.021937
467	t	\N	3	10440808_10203514187590829_5550242195404024158_n.jpg	image/jpeg	112543	2014-07-17 22:28:39.662101	2014-07-17 22:28:42.7984	2014-07-17 22:28:42.7984
468	t	\N	3	537298_652873464757192_1544528995_n.jpg	image/jpeg	58370	2014-07-17 22:34:31.485276	2014-07-17 22:34:33.063689	2014-07-17 22:34:33.063689
469	t	\N	3	576584_652873768090495_166016099_n.jpg	image/jpeg	54690	2014-07-17 22:34:34.725658	2014-07-17 22:34:35.924044	2014-07-17 22:34:35.924044
470	t	\N	3	1453320_652874524757086_677261105_n.jpg	image/jpeg	78596	2014-07-17 22:34:37.298464	2014-07-17 22:34:39.074416	2014-07-17 22:34:39.074416
14	t	\N	1	IMG_3295126649480.jpeg	image/jpeg	104959	2014-07-02 22:15:26.682659	2014-07-02 22:15:27.698391	2014-07-02 22:15:29.033088
479	f	\N	1	10553397_10204189421246776_1048056148580960338_n.jpg	image/jpeg	91862	2014-08-04 18:35:53.527302	2014-08-04 18:35:54.579476	2014-08-04 19:25:32.975812
15	t	\N	1	IMG_3284352235419.jpeg	image/jpeg	89398	2014-07-02 22:15:29.045646	2014-07-02 22:15:30.057057	2014-07-02 22:15:30.693734
17	t	\N	1	IMG_3266987275702.jpeg	image/jpeg	101064	2014-07-02 22:16:10.502735	2014-07-02 22:16:11.503436	2014-07-02 22:16:12.542782
18	t	\N	1	IMG_3235746492011.jpeg	image/jpeg	85336	2014-07-02 22:16:12.559139	2014-07-02 22:16:13.443706	2014-07-02 22:16:14.052441
20	t	\N	1	IMG_3206198915107.jpeg	image/jpeg	126172	2014-07-02 22:16:54.755204	2014-07-02 22:16:55.585169	2014-07-02 22:16:56.410985
21	t	\N	1	IMG_3194311433416.jpeg	image/jpeg	127333	2014-07-02 22:16:56.422484	2014-07-02 22:16:57.404617	2014-07-02 22:16:58.222436
23	t	\N	1	IMG_3170694276434.jpeg	image/jpeg	119340	2014-07-02 22:17:32.800344	2014-07-02 22:17:33.826568	2014-07-02 22:17:34.72083
473	f	\N	2	10556233_913166365376183_4195072885618825878_n.jpg	image/jpeg	101164	2014-08-01 23:43:00.725077	2014-08-01 23:43:01.821301	2014-10-06 23:22:07.737824
25	f	\N	1	IMG_3139281404120.jpeg	image/jpeg	117832	2014-07-02 22:17:36.849911	2014-07-02 22:17:37.654817	2014-08-04 19:25:32.990932
508	t	\N	2	10441308_926273947398758_475288534392477795_n.jpg	image/jpeg	33404	2014-10-06 23:22:07.773316	2014-10-06 23:22:08.392723	2014-10-06 23:22:08.392723
509	t	\N	2	10684193_637310996389904_1698742525_n.jpg	image/jpeg	110687	2014-10-06 23:22:09.849236	2014-10-06 23:22:10.662601	2014-10-06 23:22:10.662601
510	t	\N	2	10676387_952049178154568_1825479890117444125_n.jpg	image/jpeg	40361	2014-10-06 23:22:11.370665	2014-10-06 23:22:12.218681	2014-10-06 23:22:12.218681
511	t	\N	2	1964880_950168788342607_1488027188954788657_n.jpg	image/jpeg	74952	2014-10-06 23:22:45.482893	2014-10-06 23:22:46.223355	2014-10-06 23:22:46.223355
522	t	\N	3	134943-Friendship-Is-Not-About-Who-You-ve-Known-The-Longest.jpg	image/jpeg	99641	2014-10-27 22:24:26.111964	2014-10-27 22:24:27.293913	2014-10-27 22:24:27.293913
523	t	\N	1	10358570_10204869631371604_8686474627819174532_n.jpg	image/jpeg	26343	2014-10-27 22:25:16.3164	2014-10-27 22:25:16.900538	2014-10-27 22:25:16.900538
524	t	\N	1	10599389_10204830408991069_2726962055010779482_n.jpg	image/jpeg	114160	2014-10-27 22:25:17.65141	2014-10-27 22:25:18.624178	2014-10-27 22:25:18.624178
525	t	\N	2	1620443_957606464265506_5469760354872013785_n.jpg	image/jpeg	51920	2014-11-25 01:05:59.801003	2014-11-25 01:06:01.144605	2014-11-25 01:06:01.144605
526	t	\N	2	10387612_986213414738144_471312847394370397_n.jpg	image/jpeg	84716	2014-11-25 01:06:02.155503	2014-11-25 01:06:03.27673	2014-11-25 01:06:03.27673
527	t	\N	2	10446206_887598461266307_1742998849200786640_o.jpg	image/jpeg	328503	2014-11-25 01:06:04.153547	2014-11-25 01:06:06.086238	2014-11-25 01:06:06.086238
528	t	\N	2	10653715_946989341993885_2502451575360555322_n.jpg	image/jpeg	116505	2014-11-25 01:07:01.725565	2014-11-25 01:07:03.108594	2014-11-25 01:07:03.108594
529	t	\N	2	10672115_932111793481640_5354464618174631232_n.jpg	image/jpeg	138353	2014-11-25 01:07:04.089955	2014-11-25 01:07:05.644771	2014-11-25 01:07:05.644771
530	t	\N	2	10696461_975106952515457_2231356217626529391_n.jpg	image/jpeg	80851	2014-11-25 01:07:06.459698	2014-11-25 01:07:07.759686	2014-11-25 01:07:07.759686
531	t	\N	2	10850111_998498300176322_678406200710887931_n.jpg	image/jpeg	44563	2014-12-09 00:12:36.195197	2014-12-09 00:12:37.065041	2014-12-09 00:12:37.065041
532	t	\N	1	1920162_10205165519408620_3671903576835391073_n.jpg	image/jpeg	136020	2014-12-09 00:12:59.728472	2014-12-09 00:13:00.756027	2014-12-09 00:13:00.756027
533	t	\N	1	10384905_10205155349434377_6434388840041224998_n.jpg	image/jpeg	53690	2014-12-09 00:13:02.055594	2014-12-09 00:13:02.962381	2014-12-09 00:13:02.962381
534	t	\N	1	134943-Friendship-Is-Not-About-Who-You-ve-Known-The-Longest.jpg	image/jpeg	124004	2014-12-15 23:29:46.838294	2014-12-15 23:29:47.962751	2014-12-15 23:29:47.962751
538	t	\N	3	1.jpg	image/jpeg	27159	2014-12-16 00:43:30.305623	2014-12-16 00:43:30.912121	2014-12-16 00:43:30.912121
539	t	\N	3	10245949_1551843191702364_456187242_n.jpg	image/jpeg	63807	2014-12-16 00:43:32.053228	2014-12-16 00:43:32.685604	2014-12-16 00:43:32.685604
540	t	\N	2	134943-Friendship-Is-Not-About-Who-You-ve-Known-The-Longest.jpg	image/jpeg	45391	2014-12-22 22:41:34.578329	2014-12-22 22:41:35.644111	2014-12-22 22:41:35.644111
541	t	\N	1	10425496_10205049049816953_2467701164284051249_n.jpg	image/jpeg	102427	2015-01-05 23:51:42.20511	2015-01-05 23:51:46.633767	2015-01-05 23:51:46.633767
542	t	\N	1	10599491_10204926919363768_5171292395954207618_n.jpg	image/jpeg	60626	2015-01-05 23:51:48.352094	2015-01-05 23:51:49.414274	2015-01-05 23:51:49.414274
543	t	\N	1	lantern.jpg	image/jpeg	51919	2015-01-05 23:51:50.058304	2015-01-05 23:51:51.031105	2015-01-05 23:51:51.031105
544	t	\N	2	10404268_882264441818092_7003653139744979151_n.jpg	image/jpeg	63611	2015-01-05 23:53:20.080581	2015-01-05 23:53:22.014495	2015-01-05 23:53:22.014495
545	t	\N	11	1378426_858868867469313_2688781294359491148_n.jpg	image/jpeg	42583	2015-03-30 21:05:04.87747	2015-03-30 21:05:05.324675	2015-03-30 21:05:05.324675
546	t	\N	11	1456593_831334593556074_1616941363975187642_n.jpg	image/jpeg	45359	2015-03-30 21:05:06.119259	2015-03-30 21:05:06.625383	2015-03-30 21:05:06.625383
547	t	\N	11	1456593_831334946889372_2476990520585639737_n.jpg	image/jpeg	53790	2015-03-30 21:05:07.082347	2015-03-30 21:05:07.543028	2015-03-30 21:05:07.543028
548	t	\N	11	1507198_831334443556089_6406318456795971793_n.jpg	image/jpeg	72890	2015-03-30 21:05:41.937249	2015-03-30 21:05:42.499707	2015-03-30 21:05:42.499707
549	t	\N	11	1546412_831334570222743_1910051847144307147_n.jpg	image/jpeg	61091	2015-03-30 21:05:43.254654	2015-03-30 21:05:43.804525	2015-03-30 21:05:43.804525
550	t	\N	11	1601506_859600957396104_4007169607703338014_n.jpg	image/jpeg	51406	2015-03-30 21:05:44.321231	2015-03-30 21:05:44.828037	2015-03-30 21:05:44.828037
551	t	\N	11	1797386_859600980729435_8846053396135533242_n.jpg	image/jpeg	56098	2015-03-30 21:06:22.986502	2015-03-30 21:06:23.598061	2015-03-30 21:06:23.598061
552	t	\N	11	10301183_833778659978334_1193094486316857678_n.jpg	image/jpeg	60727	2015-03-30 21:06:24.236336	2015-03-30 21:06:24.819149	2015-03-30 21:06:24.819149
553	t	\N	11	10334393_767875746568626_2321578956451395859_n.jpg	image/jpeg	66017	2015-03-30 21:06:25.28114	2015-03-30 21:06:25.771661	2015-03-30 21:06:25.771661
554	t	\N	11	10342461_843880862301447_5959198090687430273_n.jpg	image/jpeg	71279	2015-03-30 21:07:01.218215	2015-03-30 21:07:01.722007	2015-03-30 21:07:01.722007
555	t	\N	11	10371423_831438620212338_7089323632272983494_n.jpg	image/jpeg	63805	2015-03-30 21:07:02.508609	2015-03-30 21:07:03.082066	2015-03-30 21:07:03.082066
556	t	\N	11	10393902_831334693556064_2086482213463111787_n.jpg	image/jpeg	47783	2015-03-30 21:07:03.522867	2015-03-30 21:07:04.019811	2015-03-30 21:07:04.019811
557	t	\N	11	10342461_843880862301447_5959198090687430273_n.jpg	image/jpeg	71279	2015-03-30 21:07:04.545146	2015-03-30 21:07:05.051754	2015-03-30 21:07:05.051754
558	t	\N	11	10371423_831438620212338_7089323632272983494_n.jpg	image/jpeg	63805	2015-03-30 21:07:06.125376	2015-03-30 21:07:06.697255	2015-03-30 21:07:06.697255
559	t	\N	11	10393902_831334693556064_2086482213463111787_n.jpg	image/jpeg	47783	2015-03-30 21:07:07.129414	2015-03-30 21:07:07.631091	2015-03-30 21:07:07.631091
560	t	\N	11	10476353_833224840033716_9174011553135994521_o.jpg	image/jpeg	104562	2015-03-30 21:07:53.253783	2015-03-30 21:07:54.081729	2015-03-30 21:07:54.081729
561	t	\N	11	10547502_762069423815925_5384813428065268106_n.jpg	image/jpeg	13457	2015-03-30 21:07:54.803789	2015-03-30 21:07:54.93818	2015-03-30 21:07:54.93818
562	t	\N	11	10580240_768757683147099_5503108576584512233_n.jpg	image/jpeg	67744	2015-03-30 21:07:55.312712	2015-03-30 21:07:55.831988	2015-03-30 21:07:55.831988
563	t	\N	11	10639642_831334733556060_7567426964385600064_n.jpg	image/jpeg	114706	2015-03-30 21:08:39.01466	2015-03-30 21:08:39.967082	2015-03-30 21:08:39.967082
564	t	\N	11	10644853_869921276364072_8427501917590267413_n.jpg	image/jpeg	159193	2015-03-30 21:08:40.850148	2015-03-30 21:08:41.699974	2015-03-30 21:08:41.699974
565	t	\N	11	10649686_781886085167592_2209611326876606408_n.jpg	image/jpeg	99459	2015-03-30 21:08:42.250571	2015-03-30 21:08:42.97861	2015-03-30 21:08:42.97861
566	t	\N	11	10805757_831334610222739_1455944217070397378_n.jpg	image/jpeg	158227	2015-03-30 21:10:11.710113	2015-03-30 21:10:12.436781	2015-03-30 21:10:12.436781
567	t	\N	11	10849794_831334630222737_3649481463271376896_n.jpg	image/jpeg	50781	2015-03-30 21:10:13.200229	2015-03-30 21:10:13.70284	2015-03-30 21:10:13.70284
568	t	\N	11	10653484_782477028441831_7293669636236193825_n.jpg	image/jpeg	56489	2015-03-30 21:10:14.104889	2015-03-30 21:10:14.580466	2015-03-30 21:10:14.580466
569	t	\N	11	10849825_831334550222745_330572693904757267_n.jpg	image/jpeg	110229	2015-03-30 21:11:15.736355	2015-03-30 21:11:16.620584	2015-03-30 21:11:16.620584
570	t	\N	11	10888815_845645172125016_187993234050787997_n.jpg	image/jpeg	85362	2015-03-30 21:11:17.431911	2015-03-30 21:11:17.942312	2015-03-30 21:11:17.942312
571	t	\N	11	11014958_869921303030736_1631862715067577756_n.jpg	image/jpeg	127905	2015-03-30 21:11:18.420674	2015-03-30 21:11:19.305893	2015-03-30 21:11:19.305893
572	t	\N	11	11025666_872324066123793_6812292738785113793_n.jpg	image/jpeg	66616	2015-03-30 21:13:42.616766	2015-03-30 21:13:43.246489	2015-03-30 21:13:43.246489
573	t	\N	11	chest_piece_up_for_grabs__moth_and_chrsanthemums.jpg	image/jpeg	195844	2015-03-30 21:13:43.905783	2015-03-30 21:13:44.818199	2015-03-30 21:13:44.818199
574	t	\N	11	Frida_coverup.jpg	image/jpeg	46439	2015-03-30 21:13:45.383392	2015-03-30 21:13:45.805295	2015-03-30 21:13:45.805295
575	t	\N	11	horse_in_progress.jpg	image/jpeg	51006	2015-03-30 21:15:12.434975	2015-03-30 21:15:12.855242	2015-03-30 21:15:12.855242
576	t	\N	11	rose_and_pearls.jpg	image/jpeg	92209	2015-03-30 21:15:13.644713	2015-03-30 21:15:14.453929	2015-03-30 21:15:14.453929
577	t	\N	11	up_for_grabs-_side_or_leg.jpg	image/jpeg	170449	2015-03-30 21:15:14.969517	2015-03-30 21:15:15.886009	2015-03-30 21:15:15.886009
578	t	\N	1	El.jpg	image/jpeg	28892	2015-04-06 22:22:54.723031	2015-04-06 22:22:56.546886	2015-04-06 22:22:56.546886
584	t	\N	2	headshot.jpg	image/jpeg	87959	2015-05-11 23:38:56.615639	2015-05-11 23:38:57.257989	2015-05-11 23:38:57.257989
585	t	\N	2	10407181_1034881766537975_5987906684793894587_n.jpg	image/jpeg	50803	2015-05-11 23:38:58.018698	2015-05-11 23:38:58.556795	2015-05-11 23:38:58.556795
586	t	\N	2	lotus_and_the_lion.jpg	image/jpeg	43726	2015-05-11 23:38:58.97486	2015-05-11 23:38:59.33405	2015-05-11 23:38:59.33405
587	t	\N	3	sun.jpg	image/jpeg	97206	2015-05-11 23:43:37.339178	2015-05-11 23:43:37.795145	2015-05-11 23:43:37.795145
588	t	\N	3	WIP_Mariel_portrait.jpg	image/jpeg	122009	2015-05-11 23:43:38.518239	2015-05-11 23:43:38.957107	2015-05-11 23:43:38.957107
589	t	\N	3	lily_side_piece.jpg	image/jpeg	109278	2015-05-11 23:43:39.563203	2015-05-11 23:43:39.995302	2015-05-11 23:43:39.995302
590	t	\N	3	james_dean.jpg	image/jpeg	97697	2015-05-11 23:44:27.483448	2015-05-11 23:44:27.922845	2015-05-11 23:44:27.922845
591	t	\N	11	tiger_collage.jpg	image/jpeg	61576	2015-05-11 23:49:08.536301	2015-05-11 23:49:09.001423	2015-05-11 23:49:09.001423
592	t	\N	11	tiger.jpg	image/jpeg	184849	2015-05-11 23:49:09.719659	2015-05-11 23:49:10.46604	2015-05-11 23:49:10.46604
593	t	\N	11	moth.jpg	image/jpeg	114575	2015-05-11 23:49:11.064234	2015-05-11 23:49:11.770138	2015-05-11 23:49:11.770138
594	t	\N	11	iris.jpg	image/jpeg	155917	2015-05-11 23:55:20.614359	2015-05-11 23:55:21.376284	2015-05-11 23:55:21.376284
595	t	\N	3	watercolor_hummingbird.jpg	image/jpeg	101382	2015-05-19 01:11:45.007353	2015-05-19 01:11:50.076792	2015-05-19 01:11:50.076792
597	t	\N	1	hibiscus.jpg	image/jpeg	45248	2015-05-19 01:15:30.695392	2015-05-19 01:15:30.951608	2015-05-19 01:15:30.951608
598	t	\N	1	lone_wolf.jpg	image/jpeg	124168	2015-05-19 01:15:31.658135	2015-05-19 01:15:32.381322	2015-05-19 01:15:32.381322
599	t	\N	2	guac.jpg	image/jpeg	133512	2015-05-19 01:17:55.258932	2015-05-19 01:17:56.149317	2015-05-19 01:17:56.149317
600	t	\N	2	girlyskull.jpg	image/jpeg	114559	2015-05-19 01:17:56.947806	2015-05-19 01:17:57.563917	2015-05-19 01:17:57.563917
601	t	\N	11	elephant.jpg	image/jpeg	139839	2015-05-19 01:19:37.101559	2015-05-19 01:19:37.975781	2015-05-19 01:19:37.975781
602	t	\N	11	leo.jpg	image/jpeg	167898	2015-05-19 01:19:38.806819	2015-05-19 01:19:39.567609	2015-05-19 01:19:39.567609
603	t	\N	11	skullfoot.jpg	image/jpeg	161551	2015-05-19 01:19:40.187494	2015-05-19 01:19:40.937143	2015-05-19 01:19:40.937143
604	t	\N	1	10389009_10205670331708612_3640922228351525227_n.jpg	image/jpeg	58827	2015-06-01 22:43:28.887746	2015-06-01 22:43:33.45188	2015-06-01 22:43:33.45188
605	t	\N	1	10897902_10205699930808571_1709365756097602560_n.jpg	image/jpeg	67032	2015-06-01 22:43:34.761244	2015-06-01 22:43:35.283604	2015-06-01 22:43:35.283604
606	t	\N	1	10968350_10205670352869141_2388112083841535412_n.jpg	image/jpeg	132372	2015-06-01 22:43:35.811406	2015-06-01 22:43:36.511186	2015-06-01 22:43:36.511186
607	t	\N	1	raven_hand_skull.jpg	image/jpeg	96294	2015-06-01 22:48:40.415298	2015-06-01 22:48:40.936907	2015-06-01 22:48:40.936907
608	t	\N	1	my_owl.jpg	image/jpeg	110975	2015-06-01 22:48:41.65882	2015-06-01 22:48:42.320608	2015-06-01 22:48:42.320608
609	t	\N	1	10410235_10204905076897720_9146011479690131494_n.jpg	image/jpeg	89755	2015-06-01 22:48:42.907456	2015-06-01 22:48:43.512628	2015-06-01 22:48:43.512628
611	t	\N	3	newest_watercolor.jpg	image/jpeg	86762	2015-09-07 23:44:32.29302	2015-09-07 23:44:33.564166	2015-09-07 23:44:33.564166
613	t	\N	3	yoda.jpg	image/jpeg	32527	2015-09-07 23:44:36.069402	2015-09-07 23:44:36.234484	2015-09-07 23:44:36.234484
614	t	\N	3	11742883_10153004909796569_4419668853293247413_n.jpg	image/jpeg	131300	2015-09-07 23:51:52.696042	2015-09-07 23:51:52.996257	2015-09-07 23:51:52.996257
615	t	\N	3	11807258_1002466909797844_6877302748718918283_o.jpg	image/jpeg	68759	2015-09-07 23:51:53.86206	2015-09-07 23:51:54.036615	2015-09-07 23:51:54.036615
616	t	\N	3	butterfly_arrow.jpg	image/jpeg	52691	2015-09-07 23:51:54.440001	2015-09-07 23:51:54.593753	2015-09-07 23:51:54.593753
617	t	\N	3	10608029_732736956780479_1839383453_n.jpg	image/jpeg	139747	2015-09-07 23:52:57.369217	2015-09-07 23:52:57.491254	2015-09-07 23:52:57.491254
618	t	\N	3	compass_rose.jpg	image/jpeg	58391	2015-09-07 23:52:58.384857	2015-09-07 23:52:58.553057	2015-09-07 23:52:58.553057
619	t	\N	1	983802_10204905073457634_7922607921958381374_n.jpg	image/jpeg	117889	2015-09-07 23:57:29.891428	2015-09-07 23:57:30.111536	2015-09-07 23:57:30.111536
620	t	\N	1	1464596_10204884868112513_2474010365203322202_n.jpg	image/jpeg	91198	2015-09-07 23:57:30.896705	2015-09-07 23:57:31.079598	2015-09-07 23:57:31.079598
621	t	\N	1	10488168_10204019747405036_8445653888743969043_n.jpg	image/jpeg	49204	2015-09-07 23:57:31.600515	2015-09-07 23:57:31.722608	2015-09-07 23:57:31.722608
622	t	\N	1	10492259_985526301491905_647839922795360563_n.jpg	image/jpeg	96607	2015-09-08 00:01:01.850462	2015-09-08 00:01:02.018101	2015-09-08 00:01:02.018101
623	t	\N	1	10599228_10204830443271926_8670708434471075502_n.jpg	image/jpeg	88719	2015-09-08 00:01:02.905028	2015-09-08 00:01:03.105857	2015-09-08 00:01:03.105857
624	t	\N	1	11659232_986304274747441_6954970699243555307_n.jpg	image/jpeg	88885	2015-09-08 00:01:03.586218	2015-09-08 00:01:03.786903	2015-09-08 00:01:03.786903
625	t	\N	1	traditional_heart.jpg	image/jpeg	96607	2015-09-08 00:01:55.789705	2015-09-08 00:01:55.950908	2015-09-08 00:01:55.950908
626	t	\N	1	sternum.PNG	image/png	488646	2015-09-08 00:01:56.738281	2015-09-08 00:01:57.014003	2015-09-08 00:01:57.014003
627	t	\N	1	lighthouse.jpg	image/jpeg	130933	2015-09-08 00:01:57.798845	2015-09-08 00:01:58.004307	2015-09-08 00:01:58.004307
628	t	\N	2	11693956_988233697887832_8814360854020260986_n.jpg	image/jpeg	75781	2015-09-08 00:04:42.10571	2015-09-08 00:04:42.283815	2015-09-08 00:04:42.283815
629	t	\N	2	shoulder_eye.jpg	image/jpeg	70455	2015-09-08 00:04:43.074932	2015-09-08 00:04:43.268133	2015-09-08 00:04:43.268133
630	t	\N	2	chola.jpg	image/jpeg	41218	2015-09-08 00:04:43.711034	2015-09-08 00:04:43.900197	2015-09-08 00:04:43.900197
631	t	\N	2	feather.jpg	image/jpeg	32692	2015-09-08 00:07:08.657157	2015-09-08 00:07:08.797814	2015-09-08 00:07:08.797814
632	t	\N	11	11751428_999242860120249_390295958066199626_n.jpg	image/jpeg	94824	2015-09-08 00:08:25.942071	2015-09-08 00:08:26.162468	2015-09-08 00:08:26.162468
633	t	\N	11	11742643_1000787019965833_3710865388387794334_n.jpg	image/jpeg	137785	2015-09-08 00:08:26.946252	2015-09-08 00:08:27.177144	2015-09-08 00:08:27.177144
634	t	\N	11	11696016_999558133422055_2467992133304247709_n.jpg	image/jpeg	129327	2015-09-08 00:08:27.737844	2015-09-08 00:08:28.006879	2015-09-08 00:08:28.006879
635	t	\N	11	hummingbird.jpg	image/jpeg	132919	2015-09-08 00:08:40.194885	2015-09-08 00:08:40.414878	2015-09-08 00:08:40.414878
636	t	\N	1	raven_new.jpg	image/jpeg	77732	2015-10-26 18:04:12.182521	2015-10-26 18:04:13.827015	2015-10-26 18:04:13.827015
637	t	\N	1	jesus_new.jpg	image/jpeg	73707	2015-10-26 18:04:15.302257	2015-10-26 18:04:15.546855	2015-10-26 18:04:15.546855
638	t	\N	3	skull_and_cross.jpg	image/jpeg	72151	2015-10-26 18:04:34.207193	2015-10-26 18:04:34.466331	2015-10-26 18:04:34.466331
639	t	\N	1	elephant.jpg	image/jpeg	71242	2015-10-26 18:09:56.743149	2015-10-26 18:09:57.005544	2015-10-26 18:09:57.005544
640	t	\N	11	eagle.jpg	image/jpeg	156811	2015-10-26 18:10:07.602766	2015-10-26 18:10:07.982549	2015-10-26 18:10:07.982549
641	t	\N	3	owl.jpg	image/jpeg	74537	2015-10-26 18:11:13.878594	2015-10-26 18:11:14.172349	2015-10-26 18:11:14.172349
642	t	\N	11	ship_in_a_bottle.jpg	image/jpeg	119938	2015-10-26 18:13:33.932362	2015-10-26 18:13:34.230487	2015-10-26 18:13:34.230487
643	t	\N	11	ship_in_a_bottle1.jpg	image/jpeg	169219	2015-10-26 18:13:35.145756	2015-10-26 18:13:35.463294	2015-10-26 18:13:35.463294
644	t	\N	3	microphone.jpg	image/jpeg	86762	2015-10-26 18:17:02.863995	2015-10-26 18:17:03.320903	2015-10-26 18:17:03.320903
645	t	\N	3	paris_side.jpg	image/jpeg	48818	2015-10-26 19:15:38.923786	2015-10-26 19:15:39.240789	2015-10-26 19:15:39.240789
\.


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('images_id_seq', 645, true);


--
-- Data for Name: makeupartists; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY makeupartists (id, name, picture, bio, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, created_at, updated_at, facebook, instagram) FROM stdin;
1	Britta	\N	Britta Bocala’s love of tattoos began with a journey to Thailand where she received her first apprenticeship certification in artistic tattooing. She has since received additional apprenticeship certifications in the United States studying under Joshua South (Anchored Ink/Area 51, Eugene, Oregon) and Tina Bryson (Permanent Makeup by Tina, Veneta, Oregon).\r\n\r\nShe has a formal arts degree in composition, design, color theory, drawing and painting, as well as a developed sense of accuracy via her experience using lasers and intense pulsed light electronics in medical aesthetics.\r\n\r\nBritta has continuously worked with and on individuals seeking decorative transformation via body art using human skin as her medium for the better part of the last twenty years. She brings a non-judgmental perspective that allows an individual to feel comfortable regarding their personal transformation via the tattoo arts.\r\n\r\nPlease contact her directly to schedule a consultation. 541.973.4771	unnamed.jpg	image/jpeg	20729	2014-08-15 21:12:21.268621	2014-07-29 20:30:47.472851	2014-09-29 19:30:34.086668		
\.


--
-- Name: makeupartists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('makeupartists_id_seq', 1, true);


--
-- Data for Name: makeupimages; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY makeupimages (id, makeupartist_id, img_file_name, img_content_type, img_file_size, img_updated_at, created_at, updated_at) FROM stdin;
22	1	slide_31.jpg	image/jpeg	89306	2014-09-29 22:19:47.866321	2014-09-29 22:19:48.685103	2014-09-29 22:19:48.685103
23	1	slide_30.jpg	image/jpeg	56159	2014-09-29 22:19:49.567895	2014-09-29 22:19:50.325646	2014-09-29 22:19:50.325646
24	1	slide_29.jpg	image/jpeg	65163	2014-09-29 22:19:51.056126	2014-09-29 22:19:52.165449	2014-09-29 22:19:52.165449
26	1	slide_27.jpg	image/jpeg	65042	2014-09-29 22:20:45.192386	2014-09-29 22:20:46.186079	2014-09-29 22:20:46.186079
31	1	slide_22.jpg	image/jpeg	19515	2014-09-29 22:33:53.766857	2014-09-29 22:33:54.487301	2014-09-29 22:33:54.487301
34	1	slide_23.jpg	image/jpeg	48066	2014-09-29 22:40:09.535537	2014-09-29 22:40:10.335915	2014-09-29 22:40:10.335915
35	1	slide_24.jpg	image/jpeg	57451	2014-09-29 22:40:11.200861	2014-09-29 22:40:11.938667	2014-09-29 22:40:11.938667
36	1	slide_25.jpg	image/jpeg	60906	2014-09-29 22:40:12.608473	2014-09-29 22:40:13.36956	2014-09-29 22:40:13.36956
37	1	slide_20.jpg	image/jpeg	44311	2014-09-29 22:40:42.190331	2014-09-29 22:40:42.767514	2014-09-29 22:40:42.767514
38	1	slide_21.jpg	image/jpeg	72631	2014-09-29 22:40:43.537255	2014-09-29 22:40:44.145538	2014-09-29 22:40:44.145538
39	1	slide_14.jpg	image/jpeg	41540	2014-09-29 22:41:18.761438	2014-09-29 22:41:19.696994	2014-09-29 22:41:19.696994
40	1	slide_15.jpg	image/jpeg	71170	2014-09-29 22:41:20.472968	2014-09-29 22:41:21.308395	2014-09-29 22:41:21.308395
41	1	slide_16.jpg	image/jpeg	89703	2014-09-29 22:41:22.034492	2014-09-29 22:41:23.578024	2014-09-29 22:41:23.578024
42	1	slide_17.jpg	image/jpeg	77078	2014-09-29 22:42:26.63285	2014-09-29 22:42:27.336172	2014-09-29 22:42:27.336172
43	1	slide_18.jpg	image/jpeg	79669	2014-09-29 22:42:28.321887	2014-09-29 22:42:29.178237	2014-09-29 22:42:29.178237
44	1	slide_19.jpg	image/jpeg	73570	2014-09-29 22:42:29.928351	2014-09-29 22:42:30.956802	2014-09-29 22:42:30.956802
45	1	slide_6.jpg	image/jpeg	42325	2014-09-29 22:44:54.31215	2014-09-29 22:44:54.9096	2014-09-29 22:44:54.9096
46	1	slide_7.jpg	image/jpeg	69369	2014-09-29 22:44:55.868949	2014-09-29 22:44:56.433281	2014-09-29 22:44:56.433281
47	1	slide_8.jpg	image/jpeg	75169	2014-09-29 22:44:57.087645	2014-09-29 22:44:57.815917	2014-09-29 22:44:57.815917
48	1	slide_9.jpg	image/jpeg	116451	2014-09-29 22:45:33.47099	2014-09-29 22:45:34.272919	2014-09-29 22:45:34.272919
49	1	slide_10.jpg	image/jpeg	81025	2014-09-29 22:45:35.279226	2014-09-29 22:45:36.045179	2014-09-29 22:45:36.045179
50	1	slide_11.jpg	image/jpeg	89237	2014-09-29 22:45:36.819549	2014-09-29 22:45:37.780717	2014-09-29 22:45:37.780717
51	1	slide_12.jpg	image/jpeg	90782	2014-09-29 22:46:13.930068	2014-09-29 22:46:14.561381	2014-09-29 22:46:14.561381
52	1	slide_13.jpg	image/jpeg	105814	2014-09-29 22:46:15.668206	2014-09-29 22:46:16.268868	2014-09-29 22:46:16.268868
53	1	slide_4.jpg	image/jpeg	44378	2014-09-29 22:46:38.308331	2014-09-29 22:46:38.90898	2014-09-29 22:46:38.90898
54	1	slide_5.jpg	image/jpeg	69425	2014-09-29 22:46:39.687431	2014-09-29 22:46:40.188512	2014-09-29 22:46:40.188512
55	1	slide_2.jpg	image/jpeg	40287	2014-09-29 22:47:19.038002	2014-09-29 22:47:19.665786	2014-09-29 22:47:19.665786
56	1	slide_3.jpg	image/jpeg	74070	2014-09-29 22:47:20.530705	2014-09-29 22:47:21.335914	2014-09-29 22:47:21.335914
57	1	slide_1.jpg	image/jpeg	73403	2014-09-29 22:47:40.500832	2014-09-29 22:47:41.136771	2014-09-29 22:47:41.136771
\.


--
-- Name: makeupimages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('makeupimages_id_seq', 57, true);


--
-- Data for Name: newsposts; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY newsposts (id, heading, body, start_date, end_date, created_at, updated_at) FROM stdin;
4	Guest Artist: Chris Standley	Chris will be visiting us from Twin Falls, Idaho. We are very excited to have him as a guest artist and hope that you take a moment to look through his portfolio. We are now booking appointments with him so please come in to the shop to do so. He will be here August 25th- 30th.	2014-08-11 00:00:00	2014-08-29 00:00:00	2014-08-11 18:14:03.304403	2014-08-29 18:19:02.351958
3	Now Offering Cosmetic Tattooing	The talented Ms. Britta Bocala will be offering cosmetic tattooing starting August 1st. Please schedule your consultation with her at 541-973-4771.\r\n\r\n*August Eyeliner Special!!!*\r\n\r\n30% off eyeliner for any August appointment. Book now!\r\n	2014-07-13 00:00:00	2014-08-31 00:00:00	2014-07-13 01:52:55.941683	2014-08-29 18:19:35.925551
5	Guest Artist: Aaron Borden	Former Medford tattoo artist, Aaron Borden, will be joining us from Bend for two days only. He will be here September 11th and 12th and he still has a few spots available so plan to schedule your appointment with him as soon as possible to ensure that you get in.	2014-08-29 00:00:00	2014-09-11 00:00:00	2014-08-29 18:21:35.05568	2014-08-29 18:21:35.05568
6	REX ROXWELL	Guest spotting from Seattle! Come get tattooed! He will only be here until October 31st.	2014-10-14 00:00:00	2014-10-31 00:00:00	2014-10-14 00:58:08.518759	2014-10-14 00:58:08.518759
7	Joshua Teska has joined our team of Joshes	\r\nBirds, birds, birds! Joshua Teska says that his favorite thing to tattoo is birds but he also loves doing large-scale custom work that includes Japanese, black and gray, full color, portraits, and anything imaginative and out of the ordinary. Teska recalls that as a young boy he was intrigued by his uncle’s old, traditional tattoos and the fact that it was possible to put artwork on someone’s skin. He got a book by Guy Aitchison and a book from Shige and read, studied, and reread those books until the bindings fell apart. He was hooked. Art was his calling and he began drawing and painting with oil, acrylic, and watercolor and also does murals. He began tattooing in San Francisco and has now tattooed for 12 years and counting.\r\n\r\n\r\nHe thanks God for giving him such a wonderful life where he is able to have the opportunity to do what he loves and still put his family first. As a married father of five, when he isn’t busy tattooing or painting, he is either at church or hanging out with his family.\r\n	2015-03-09 00:00:00	2015-04-08 00:00:00	2015-03-09 21:49:35.657821	2015-03-09 21:49:35.657821
\.


--
-- Name: newsposts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('newsposts_id_seq', 7, true);


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
1	Josh : Unassigned Images	Images that Josh does that are not assigned to any client	\N	f	1	1	2014-05-15 00:49:09.670795	2014-05-15 00:49:17.095446
\.


--
-- Name: stories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('stories_id_seq', 1, true);


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

