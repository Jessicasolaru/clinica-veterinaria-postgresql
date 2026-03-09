--
-- PostgreSQL database dump
--

\restrict ahIUoLLaXinrNPkt0arEUqZfegLb7oBejvsuIxrq4sZh1y06i0P4VxX6qAIeAYV

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.2

-- Started on 2026-03-09 20:39:41 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 226 (class 1259 OID 16609)
-- Name: atencion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.atencion (
    id_atencion integer NOT NULL,
    fecha_atencion date NOT NULL,
    descripcion text NOT NULL,
    id_mascota integer NOT NULL,
    id_profesional integer NOT NULL,
    tipo character varying(50) NOT NULL
);


ALTER TABLE public.atencion OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16608)
-- Name: atencion_id_atencion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.atencion ALTER COLUMN id_atencion ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.atencion_id_atencion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 16574)
-- Name: dueno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dueno (
    id_dueno integer NOT NULL,
    nombre character varying(100) NOT NULL,
    direccion character varying(200) NOT NULL,
    telefono character varying(20) NOT NULL
);


ALTER TABLE public.dueno OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16573)
-- Name: dueno_id_dueno_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.dueno ALTER COLUMN id_dueno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.dueno_id_dueno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 16593)
-- Name: mascota; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mascota (
    id_mascota integer NOT NULL,
    nombre character varying(100) NOT NULL,
    tipo character varying(50) NOT NULL,
    fecha_nacimiento date NOT NULL,
    id_dueno integer NOT NULL
);


ALTER TABLE public.mascota OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16592)
-- Name: mascota_id_mascota_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.mascota ALTER COLUMN id_mascota ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.mascota_id_mascota_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 16584)
-- Name: profesional; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profesional (
    id_profesional integer NOT NULL,
    nombre character varying(100) NOT NULL,
    especialidad character varying(100) NOT NULL
);


ALTER TABLE public.profesional OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16583)
-- Name: profesional_id_profesional_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.profesional ALTER COLUMN id_profesional ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.profesional_id_profesional_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3850 (class 0 OID 16609)
-- Dependencies: 226
-- Data for Name: atencion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.atencion (id_atencion, fecha_atencion, descripcion, id_mascota, id_profesional, tipo) FROM stdin;
1	2025-03-01	Chequeo general	1	1	Perro
3	2025-03-07	Consulta cardiológica	3	3	Perro
4	2026-03-09	Control anual y vacunas	4	1	Perro
\.


--
-- TOC entry 3844 (class 0 OID 16574)
-- Dependencies: 220
-- Data for Name: dueno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dueno (id_dueno, nombre, direccion, telefono) FROM stdin;
2	Ana Gómez	Avenida Siempre Viva 456	555-8765
3	Carlos Ruiz	Calle 8 de Octubre 789	555-8765
1	Juan Pérez	Pasaje Los Alerces 999	555-0001
\.


--
-- TOC entry 3848 (class 0 OID 16593)
-- Dependencies: 224
-- Data for Name: mascota; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mascota (id_mascota, nombre, tipo, fecha_nacimiento, id_dueno) FROM stdin;
1	Rex	Perro	2020-05-10	1
2	Luna	Gato	2019-02-20	2
3	Fido	Perro	2021-03-15	3
4	Milo	Perro	2022-11-03	1
\.


--
-- TOC entry 3846 (class 0 OID 16584)
-- Dependencies: 222
-- Data for Name: profesional; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profesional (id_profesional, nombre, especialidad) FROM stdin;
1	Dr. Martínez	Veterinario
2	Dr. Pérez	Especialista en dermatología
3	Dr. López	Cardiólogo veterinario
\.


--
-- TOC entry 3856 (class 0 OID 0)
-- Dependencies: 225
-- Name: atencion_id_atencion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.atencion_id_atencion_seq', 4, true);


--
-- TOC entry 3857 (class 0 OID 0)
-- Dependencies: 219
-- Name: dueno_id_dueno_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dueno_id_dueno_seq', 3, true);


--
-- TOC entry 3858 (class 0 OID 0)
-- Dependencies: 223
-- Name: mascota_id_mascota_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mascota_id_mascota_seq', 4, true);


--
-- TOC entry 3859 (class 0 OID 0)
-- Dependencies: 221
-- Name: profesional_id_profesional_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profesional_id_profesional_seq', 3, true);


--
-- TOC entry 3692 (class 2606 OID 16620)
-- Name: atencion atencion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atencion
    ADD CONSTRAINT atencion_pkey PRIMARY KEY (id_atencion);


--
-- TOC entry 3686 (class 2606 OID 16582)
-- Name: dueno dueno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dueno
    ADD CONSTRAINT dueno_pkey PRIMARY KEY (id_dueno);


--
-- TOC entry 3690 (class 2606 OID 16602)
-- Name: mascota mascota_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mascota
    ADD CONSTRAINT mascota_pkey PRIMARY KEY (id_mascota);


--
-- TOC entry 3688 (class 2606 OID 16591)
-- Name: profesional profesional_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesional
    ADD CONSTRAINT profesional_pkey PRIMARY KEY (id_profesional);


--
-- TOC entry 3694 (class 2606 OID 16621)
-- Name: atencion fk_atencion_mascota; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atencion
    ADD CONSTRAINT fk_atencion_mascota FOREIGN KEY (id_mascota) REFERENCES public.mascota(id_mascota) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3695 (class 2606 OID 16626)
-- Name: atencion fk_atencion_profesional; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atencion
    ADD CONSTRAINT fk_atencion_profesional FOREIGN KEY (id_profesional) REFERENCES public.profesional(id_profesional) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3693 (class 2606 OID 16603)
-- Name: mascota fk_mascota_dueno; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mascota
    ADD CONSTRAINT fk_mascota_dueno FOREIGN KEY (id_dueno) REFERENCES public.dueno(id_dueno) ON UPDATE CASCADE ON DELETE RESTRICT;


-- Completed on 2026-03-09 20:39:41 -03

--
-- PostgreSQL database dump complete
--

\unrestrict ahIUoLLaXinrNPkt0arEUqZfegLb7oBejvsuIxrq4sZh1y06i0P4VxX6qAIeAYV

