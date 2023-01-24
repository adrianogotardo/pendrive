--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg22.04+1)
-- Dumped by pg_dump version 15.1 (Ubuntu 15.1-1.pgdg22.04+1)

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
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_id_seq OWNER TO postgres;

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    id integer NOT NULL,
    wage integer NOT NULL,
    start_day timestamp(3) without time zone NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_id_seq OWNER TO postgres;

--
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;


--
-- Name: employees_worked_days; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees_worked_days (
    id integer NOT NULL,
    employee_id integer NOT NULL,
    client_id integer NOT NULL,
    date timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.employees_worked_days OWNER TO postgres;

--
-- Name: employees_worked_days_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employees_worked_days_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_worked_days_id_seq OWNER TO postgres;

--
-- Name: employees_worked_days_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employees_worked_days_id_seq OWNED BY public.employees_worked_days.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    invoice text NOT NULL,
    date timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    store_id integer NOT NULL,
    client_id integer NOT NULL,
    value integer NOT NULL,
    value_negotiated integer,
    value_cash integer NOT NULL,
    value_financed integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: stores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stores (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.stores OWNER TO postgres;

--
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stores_id_seq OWNER TO postgres;

--
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stores_id_seq OWNED BY public.stores.id;


--
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- Name: employees id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);


--
-- Name: employees_worked_days id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees_worked_days ALTER COLUMN id SET DEFAULT nextval('public.employees_worked_days_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: stores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores ALTER COLUMN id SET DEFAULT nextval('public.stores_id_seq'::regclass);


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('c506c9ca-821e-4706-a396-96978a789816', '271ccc1259355f66850c6fb6539a46d002fed8cbb0cffbbc9a303b70451dc08b', '2022-12-14 14:41:50.618545+00', '20221027180716_create_database_default_v1', NULL, NULL, '2022-12-14 14:41:50.564006+00', 1);
INSERT INTO public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('dca4810c-23cd-4387-b901-8249e2559a7d', '193307977b9ec82a55b94e101acdbf4487dfb73ebf8eb3e63fdab1c9c1f983e2', '2022-12-14 14:41:50.630045+00', '20221027183330_alter_date_time_default_worked_days', NULL, NULL, '2022-12-14 14:41:50.624877+00', 1);
INSERT INTO public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('abe6d2e7-6d26-4d7c-b8e4-422bc1114be9', '553dac479b3eb51c41a03a7b3b5122c93d07df782bfd925e06bde537a3ed3e31', '2022-12-14 14:41:50.639772+00', '20221027183548_alter_date_time_default_general', NULL, NULL, '2022-12-14 14:41:50.634349+00', 1);
INSERT INTO public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('a6fed643-d70d-48b4-b118-6c81fb492240', '3f111904b7c6ba8080adb5c880b734a36ea45830adc2cf69036ea7543f1c6c24', '2022-12-14 14:41:50.653128+00', '20221027183818_alter_table_test', NULL, NULL, '2022-12-14 14:41:50.647426+00', 1);
INSERT INTO public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('e791029d-9d4e-40f4-a83e-9bc0f11f2150', '2724fdb2401f76aeb8f7af2efe3069e7a3f098970188c6667fc9ff244a883756', '2022-12-14 14:41:50.671547+00', '20221027184020_back_to_default', NULL, NULL, '2022-12-14 14:41:50.656665+00', 1);
INSERT INTO public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('a91ba28f-ff16-4269-8ece-0cb8b1e995da', 'a11d14bcec8bb4d4a1ddce45ea7b1f126ee89cca2cfa31b3f7d3aaa0b63da397', '2022-12-14 14:41:50.707672+00', '20221027185243_alter_timestamp_config', NULL, NULL, '2022-12-14 14:41:50.681326+00', 1);
INSERT INTO public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('9e630b0a-24f9-4eb0-a02d-c4cd6f2aa8ae', '8c582f1052c0e370f3f0bd96a020ca7a3b7a173fb7cd2f56a8e1e918d5fb7889', '2022-12-14 14:41:50.728013+00', '20221027194908_add_unique_constraint_to_names', NULL, NULL, '2022-12-14 14:41:50.713314+00', 1);
INSERT INTO public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('a8ff2f20-a06e-4d86-82a6-157960353456', '880656b16cb7e45c40f6b3110563365ccd2deec1cabb58f0d26561dc9a245995', '2022-12-27 15:47:07.209246+00', '20221215140844_negotiated_as_nullable', NULL, NULL, '2022-12-27 15:47:07.19698+00', 1);


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.clients (id, name) VALUES (13, 'BARBARA');
INSERT INTO public.clients (id, name) VALUES (15, 'MARLON');
INSERT INTO public.clients (id, name) VALUES (14, 'KARINA E TOBIAS');
INSERT INTO public.clients (id, name) VALUES (16, 'BRUNA THIEDE');
INSERT INTO public.clients (id, name) VALUES (17, '4 CASA BOREBI');
INSERT INTO public.clients (id, name) VALUES (18, 'IGREJA FRUTO SAGRADO');
INSERT INTO public.clients (id, name) VALUES (19, 'SENGER');
INSERT INTO public.clients (id, name) VALUES (20, 'HOSPITAL');
INSERT INTO public.clients (id, name) VALUES (22, 'MANFLIM');
INSERT INTO public.clients (id, name) VALUES (23, 'THIAGO FREITAS');
INSERT INTO public.clients (id, name) VALUES (24, 'ANDRÉ');
INSERT INTO public.clients (id, name) VALUES (25, 'PIOTTO ESCRITÓRIO ');
INSERT INTO public.clients (id, name) VALUES (21, 'PIOTTO CASA');


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.employees (id, wage, start_day, name) VALUES (1, 5000, '2022-12-14 21:03:22.751', 'Tite');
INSERT INTO public.employees (id, wage, start_day, name) VALUES (2, 200, '2022-12-14 21:11:22.334', 'Michel');
INSERT INTO public.employees (id, wage, start_day, name) VALUES (3, 25000, '2022-12-14 21:39:39.981', 'Lady Gaga');
INSERT INTO public.employees (id, wage, start_day, name) VALUES (4, 1000, '2022-12-17 18:53:08.063', 'testonho');


--
-- Data for Name: employees_worked_days; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (38, '278206', '2022-12-28 11:21:06', 13, 25, 6750, NULL, 5594, 6750);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (40, '278236', '2022-12-28 11:23:29', 13, 25, 15750, NULL, 13053, 15750);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (41, '278364', '2022-12-29 11:24:33', 13, 16, 99800, NULL, 82709, 99800);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (42, '278416', '2022-12-29 11:25:12', 13, 16, 4425, NULL, 3667, 4425);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (43, '278507', '2022-12-29 11:25:58', 13, 25, 32900, NULL, 27266, 32900);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (44, '278582', '2022-12-30 11:26:27', 13, 20, 33500, NULL, 27763, 33500);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (45, '278921', '2023-01-02 11:27:12', 13, 13, 31589, NULL, 26180, 31589);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (46, '278892', '2023-01-02 11:33:00', 13, 15, 34800, NULL, 28841, 34800);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (47, '278889', '2023-01-02 11:33:31', 13, 16, 48290, NULL, 40020, 48290);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (48, '278925', '2023-01-02 11:37:14', 13, 14, 16750, NULL, 13882, 16750);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (49, '279080', '2023-01-03 11:37:59', 13, 19, 550, NULL, 455, 550);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (50, '279081', '2023-01-03 11:40:12', 13, 13, 5085, NULL, 4214, 5085);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (51, '279082', '2023-01-03 11:42:42', 13, 16, 73800, NULL, 61162, 73800);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (52, '279070', '2023-01-03 11:43:19', 13, 15, 38000, NULL, 31493, 38000);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (53, '279179', '2023-01-03 11:43:47', 13, 13, 29130, NULL, 24141, 29130);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (54, '279206', '2023-01-03 11:44:14', 13, 16, 24792, NULL, 20546, 24792);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (55, '279209', '2023-01-03 11:44:48', 13, 15, 100000, NULL, 82875, 100000);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (56, '279232', '2023-01-03 11:45:31', 13, 13, 99800, NULL, 82709, 99800);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (57, '279234', '2023-01-03 11:46:06', 13, 23, 39280, NULL, 32552, 39280);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (58, '279323', '2023-01-04 11:51:55', 13, 16, 2500, NULL, 2072, 2500);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (59, '279321', '2023-01-04 11:52:35', 13, 13, 4250, NULL, 3522, 4250);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (60, '279320', '2023-01-04 11:54:04', 13, 23, 9150, NULL, 7583, 9150);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (61, '279339', '2023-01-04 11:54:34', 13, 13, 6350, NULL, 5263, 6350);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (62, '279352', '2023-01-04 11:55:12', 13, 13, 2955, NULL, 2449, 2955);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (63, '279511', '2023-01-05 11:55:38', 13, 20, 49200, NULL, 40775, 49200);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (64, '279536', '2023-01-05 11:56:29', 13, 20, 7600, NULL, 6298, 7600);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (65, '279537', '2023-01-05 11:57:02', 13, 20, 1100, NULL, 911, 1100);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (66, '279581', '2023-01-05 11:57:28', 13, 16, 112209, NULL, 92994, 112209);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (67, '279578', '2023-01-05 11:58:02', 13, 15, 31095, NULL, 25770, 31095);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (68, '279636', '2023-01-06 11:59:46', 13, 25, 3900, NULL, 3232, 3900);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (69, '279642', '2023-01-06 12:02:08', 13, 13, 4970, NULL, 4119, 4970);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (70, '279075', '2023-01-03 12:02:55', 13, 13, 134870, NULL, 111774, 134870);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (71, '279638', '2023-01-06 12:04:44', 13, 23, 56529, NULL, 46849, 56529);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (72, '279646', '2023-01-06 12:06:55', 13, 14, 8350, NULL, 6920, 8350);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (73, '279712', '2023-01-06 12:07:38', 13, 14, 6620, NULL, 5486, 6620);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (74, '279668', '2023-01-06 12:08:14', 13, 14, 79400, NULL, 65803, 79400);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (75, '279692', '2023-01-06 12:08:53', 13, 14, 5250, NULL, 4351, 5250);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (76, '279796', '2023-01-06 12:09:40', 13, 15, 99800, NULL, 82709, 99800);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (77, '279800', '2023-01-06 12:10:09', 13, 16, 37900, NULL, 31410, 37900);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (78, '279801', '2023-01-06 12:10:40', 13, 15, 22000, NULL, 18232, 22000);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (79, '279881', '2023-01-07 12:11:14', 13, 21, 13400, NULL, 11105, 13400);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (80, '280025', '2023-01-09 12:12:43', 13, 14, 132658, NULL, 109940, 132658);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (81, '280174', '2023-01-09 12:13:24', 13, 14, 160140, NULL, 132716, 160140);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (82, '280303', '2023-01-10 18:09:59.65', 13, 15, 135390, NULL, 112204, 135390);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (83, '280306', '2023-01-10 18:10:34.382', 13, 16, 41850, NULL, 34683, 41850);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (84, '280508', '2023-01-11 16:51:37', 13, 23, 11150, NULL, 9241, 11150);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (85, '280506', '2023-01-11 16:52:32', 13, 15, 17600, NULL, 14586, 17600);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (86, '280660', '2023-01-12 16:53:04.921', 13, 15, 7000, NULL, 5801, 7000);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (87, '280723', '2023-01-12 16:53:37.031', 13, 23, 2250, NULL, 1864, 2250);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (88, '280724', '2023-01-12 16:54:11.242', 13, 13, 19080, NULL, 15813, 19080);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (89, '280758', '2023-01-12 16:54:37.313', 13, 25, 5800, NULL, 4807, 5800);
INSERT INTO public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed) VALUES (90, '280766', '2023-01-12 17:08:26.549', 13, 25, 3900, NULL, 3232, 3900);


--
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.stores (id, name) VALUES (13, 'CIAL SANDRI');
INSERT INTO public.stores (id, name) VALUES (14, 'COMACO LOJA');
INSERT INTO public.stores (id, name) VALUES (15, 'PINTURA CLEBINHO');


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_id_seq', 25, true);


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employees_id_seq', 4, true);


--
-- Name: employees_worked_days_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employees_worked_days_id_seq', 1, false);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 90, true);


--
-- Name: stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stores_id_seq', 16, true);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- Name: employees_worked_days employees_worked_days_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees_worked_days
    ADD CONSTRAINT employees_worked_days_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: stores stores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- Name: clients_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX clients_name_key ON public.clients USING btree (name);


--
-- Name: employees_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX employees_name_key ON public.employees USING btree (name);


--
-- Name: stores_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX stores_name_key ON public.stores USING btree (name);


--
-- Name: employees_worked_days employees_worked_days_client_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees_worked_days
    ADD CONSTRAINT employees_worked_days_client_id_foreign FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: employees_worked_days employees_worked_days_employee_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees_worked_days
    ADD CONSTRAINT employees_worked_days_employee_id_foreign FOREIGN KEY (employee_id) REFERENCES public.employees(id);


--
-- Name: orders orders_client_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_client_id_foreign FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: orders orders_store_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_store_id_foreign FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- PostgreSQL database dump complete
--

