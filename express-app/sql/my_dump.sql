--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.7 (Homebrew)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Spending; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Spending" (
    record_time bigint NOT NULL,
    amount numeric(12,2) NOT NULL,
    "userId" integer NOT NULL
);


ALTER TABLE public."Spending" OWNER TO postgres;

--
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    id integer NOT NULL,
    email text NOT NULL,
    name text
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Users_id_seq" OWNER TO postgres;

--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;


--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);


--
-- Data for Name: Spending; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Spending" (record_time, amount, "userId") FROM stdin;
1672600264	500.00	1
1672910560	100.00	1
1673342560	50.00	1
1673601760	300.00	1
1674206560	400.00	1
1674474089	230.55	1
1674733289	343.55	1
1675165289	500.22	1
1675338089	666.00	1
1675510889	122.11	1
1676029289	88.00	1
1676402350	1000.00	1
1676920750	40.99	1
1677352750	400.22	1
1677871150	700.23	1
1678648750	888.00	1
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Users" (id, email, name) FROM stdin;
1	Alice@gmail.com	Alice
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
3116f548-6199-4e86-b209-0fd1d7453e8e	dd1a561597b45416d582fb79694ba66b22f0cb23a598847a49aa0b5b6e6550b1	2023-03-17 17:48:03.199004+00	20230317125705_init	\N	\N	2023-03-17 17:48:03.189402+00	1
ec7317b1-7595-431c-a36d-0e6795d9408d	d71828a3079be5d27539e1d6cd283a7431b9b4b5ca8e2828e3ee90119b01b6b7	2023-03-18 09:21:54.928689+00	20230318092154_init	\N	\N	2023-03-18 09:21:54.922078+00	1
a69ed8b4-ff86-489f-b600-15e761b150fd	746ff301f7b670aa00784095f787ba0727e6be69e34c232b7d170474dd8522ee	2023-03-18 17:09:17.462313+00	20230318170917_init	\N	\N	2023-03-18 17:09:17.441179+00	1
\.


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Users_id_seq"', 2, true);


--
-- Name: Spending Spending_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Spending"
    ADD CONSTRAINT "Spending_pkey" PRIMARY KEY (record_time);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Users_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Users_email_key" ON public."Users" USING btree (email);


--
-- Name: Spending Spending_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Spending"
    ADD CONSTRAINT "Spending_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--