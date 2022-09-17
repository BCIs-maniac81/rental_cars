--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

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
-- Name: booking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking (
    id integer NOT NULL,
    client_id integer NOT NULL,
    vehicleid smallint NOT NULL,
    start_day date NOT NULL,
    end_day date NOT NULL
);


ALTER TABLE public.booking OWNER TO postgres;

--
-- Name: booking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_id_seq OWNER TO postgres;

--
-- Name: booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_id_seq OWNED BY public.booking.id;


--
-- Name: brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brand (
    id integer NOT NULL,
    brand character varying(40),
    site character varying(30)
);


ALTER TABLE public.brand OWNER TO postgres;

--
-- Name: brand_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brand_id_seq OWNER TO postgres;

--
-- Name: brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brand_id_seq OWNED BY public.brand.id;


--
-- Name: car; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.car (
    vehicleid integer NOT NULL,
    name character varying(40) NOT NULL,
    brand_id smallint NOT NULL,
    air_cond character varying(12),
    heating character varying(12),
    fuel character varying(40),
    category_id smallint NOT NULL,
    daily_cost numeric(7,3)
);


ALTER TABLE public.car OWNER TO postgres;

--
-- Name: car_vehicleid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.car_vehicleid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.car_vehicleid_seq OWNER TO postgres;

--
-- Name: car_vehicleid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.car_vehicleid_seq OWNED BY public.car.vehicleid;


--
-- Name: old_cars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.old_cars (
    vehicleid integer NOT NULL,
    name character varying(32),
    brand character varying(32),
    air_cond character varying(8),
    heating character varying(8),
    fuel character varying(32),
    category character varying(32)
);


ALTER TABLE public.old_cars OWNER TO postgres;

--
-- Name: cars_vehicleid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cars_vehicleid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cars_vehicleid_seq OWNER TO postgres;

--
-- Name: cars_vehicleid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cars_vehicleid_seq OWNED BY public.old_cars.vehicleid;


--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    category character varying(40)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id integer NOT NULL,
    first_name character varying(40) NOT NULL,
    last_name character varying(40) NOT NULL,
    birthday date NOT NULL,
    address_1 text NOT NULL,
    address_2 text,
    address_3 text,
    city character varying(100) NOT NULL,
    zip_code character varying(12) NOT NULL,
    country character varying(40) NOT NULL,
    email character varying(255) NOT NULL,
    phone_number character varying(40) NOT NULL,
    password character varying(32)
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_id_seq OWNER TO postgres;

--
-- Name: client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.client_id_seq OWNED BY public.client.id;


--
-- Name: promo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promo (
    id integer NOT NULL,
    vehicleid smallint NOT NULL,
    start_day date NOT NULL,
    end_day date NOT NULL,
    rate numeric(3,2) NOT NULL
);


ALTER TABLE public.promo OWNER TO postgres;

--
-- Name: promo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.promo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promo_id_seq OWNER TO postgres;

--
-- Name: promo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.promo_id_seq OWNED BY public.promo.id;


--
-- Name: booking id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking ALTER COLUMN id SET DEFAULT nextval('public.booking_id_seq'::regclass);


--
-- Name: brand id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand ALTER COLUMN id SET DEFAULT nextval('public.brand_id_seq'::regclass);


--
-- Name: car vehicleid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car ALTER COLUMN vehicleid SET DEFAULT nextval('public.car_vehicleid_seq'::regclass);


--
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- Name: client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client ALTER COLUMN id SET DEFAULT nextval('public.client_id_seq'::regclass);


--
-- Name: old_cars vehicleid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.old_cars ALTER COLUMN vehicleid SET DEFAULT nextval('public.cars_vehicleid_seq'::regclass);


--
-- Name: promo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promo ALTER COLUMN id SET DEFAULT nextval('public.promo_id_seq'::regclass);


--
-- Data for Name: booking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking (id, client_id, vehicleid, start_day, end_day) FROM stdin;
2	1	103	2022-10-01	2023-10-14
\.


--
-- Data for Name: brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brand (id, brand, site) FROM stdin;
1	FIAT	ITALY
2	PEUGEOT	FRANCE
3	OPEL	GERMANY
4	BMW	GERMANY
5	CITROEN	FRNACE
\.


--
-- Data for Name: car; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.car (vehicleid, name, brand_id, air_cond, heating, fuel, category_id, daily_cost) FROM stdin;
100	500	1	yes	yes	gasoline	1	102.300
101	207	2	yes	yes	diesel	1	143.217
102	cargo	3	no	yes	diesel	2	170.100
103	serie 2	4	yes	yes	diesel	3	250.500
104	berlingo	5	yes	no	diesel	3	300.000
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, category) FROM stdin;
1	city car
2	utility
3	monospace
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (id, first_name, last_name, birthday, address_1, address_2, address_3, city, zip_code, country, email, phone_number, password) FROM stdin;
1	jim	john 	1990-05-02	London	NA 	NA	London	55555 	UK	jj@email.com	6566666666 	0000
2	joe	bill 	1980-05-11	NY	NA 	NA	NY	8989 	UK	jb@email.com	787878787 	1234
\.


--
-- Data for Name: old_cars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.old_cars (vehicleid, name, brand, air_cond, heating, fuel, category) FROM stdin;
104	Berlingo	CITROEN	yes	no	diesel	monospace
103	serie 2	BMW	yes	yes	diesel	monospace
100	500	FIAT	yes	yes	gasoline	city car
101	207	PEUGEOT	yes	yes	diesel	city car
102	cargo	OPEL	no	yes	diesel	utility
\.


--
-- Data for Name: promo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promo (id, vehicleid, start_day, end_day, rate) FROM stdin;
1	100	2022-09-10	2022-09-17	0.10
2	100	2022-09-10	2022-09-17	0.20
3	101	2022-09-01	2022-09-10	0.20
4	102	2022-09-01	2022-09-10	0.50
5	103	2022-10-01	2022-10-10	0.60
6	103	2022-10-01	2022-10-10	0.70
7	102	2022-09-01	2022-10-10	0.50
8	102	2022-09-01	2022-10-11	0.50
9	102	2022-09-01	2022-10-11	0.60
10	102	2022-09-01	2022-10-17	0.60
11	103	2022-09-01	2022-10-17	0.60
\.


--
-- Name: booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_id_seq', 2, true);


--
-- Name: brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brand_id_seq', 5, true);


--
-- Name: car_vehicleid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.car_vehicleid_seq', 104, true);


--
-- Name: cars_vehicleid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cars_vehicleid_seq', 1, false);


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 3, true);


--
-- Name: client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_id_seq', 2, true);


--
-- Name: promo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.promo_id_seq', 11, true);


--
-- Name: booking booking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (id);


--
-- Name: brand brand_brand_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_brand_key UNIQUE (brand);


--
-- Name: brand brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (id);


--
-- Name: car car_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_pkey PRIMARY KEY (vehicleid);


--
-- Name: old_cars cars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.old_cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (vehicleid);


--
-- Name: category category_category_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_category_key UNIQUE (category);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- Name: promo promo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promo
    ADD CONSTRAINT promo_pkey PRIMARY KEY (id);


--
-- Name: booking_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX booking_id_idx ON public.booking USING btree (id);


--
-- Name: booking_vehicleid_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX booking_vehicleid_idx ON public.booking USING btree (vehicleid);


--
-- Name: brand_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX brand_id_idx ON public.brand USING btree (id);


--
-- Name: car_brand_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX car_brand_id_idx ON public.car USING btree (brand_id);


--
-- Name: car_category_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX car_category_id_idx ON public.car USING btree (category_id);


--
-- Name: car_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX car_name_idx ON public.car USING btree (name);


--
-- Name: car_vehicleid_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX car_vehicleid_idx ON public.car USING btree (vehicleid);


--
-- Name: category_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX category_id_idx ON public.category USING btree (id);


--
-- Name: client_birthday_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX client_birthday_idx ON public.client USING btree (birthday);


--
-- Name: client_firstname_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX client_firstname_idx ON public.client USING btree (first_name);


--
-- Name: client_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX client_id_idx ON public.client USING btree (id);


--
-- Name: client_lastname_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX client_lastname_idx ON public.client USING btree (last_name);


--
-- Name: client_phonenumber_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX client_phonenumber_idx ON public.client USING btree (phone_number);


--
-- Name: client_zipcode_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX client_zipcode_idx ON public.client USING btree (zip_code);


--
-- Name: idx_name_cars; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_name_cars ON public.old_cars USING btree (name);


--
-- Name: promo_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX promo_id_idx ON public.promo USING btree (id);


--
-- Name: promo_rate_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX promo_rate_idx ON public.promo USING btree (rate);


--
-- Name: promo_vehicleid_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX promo_vehicleid_idx ON public.promo USING btree (vehicleid);


--
-- Name: booking booking_client_id_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_client_id_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: booking booking_vehicleid_car_vehicleid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_vehicleid_car_vehicleid_fkey FOREIGN KEY (vehicleid) REFERENCES public.car(vehicleid);


--
-- Name: promo promo_vaehicleid_car_vehicleid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promo
    ADD CONSTRAINT promo_vaehicleid_car_vehicleid_fkey FOREIGN KEY (vehicleid) REFERENCES public.car(vehicleid);


--
-- PostgreSQL database dump complete
--

