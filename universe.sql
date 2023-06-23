--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    dimensions_km character varying(25),
    notes text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type character varying(10) NOT NULL,
    diameter_light_years integer,
    distance_from_earth_light_years integer,
    notes text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(25) NOT NULL,
    planet_id integer NOT NULL,
    is_spherical boolean,
    discoverer character varying(25),
    notes text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(25) NOT NULL,
    star_id integer NOT NULL,
    it_has_satellites boolean,
    number_moons integer,
    is_dwarf_planet boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(25) NOT NULL,
    galaxy_id integer NOT NULL,
    constellation character varying(25),
    distance_from_earth_light_years numeric(12,10),
    notes text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Cometa Halley', 1, '15 x 8 x 8', NULL);
INSERT INTO public.comet VALUES (2, 'Témpel 1', 1, '7.6 x 4.9', NULL);
INSERT INTO public.comet VALUES (3, '19P/Borrelly', 1, '8 x 4 x 4', NULL);
INSERT INTO public.comet VALUES (4, '81P/Wild', 1, '5.5 x 4 x 3.3', NULL);
INSERT INTO public.comet VALUES (5, '67P/Churymov-Gerasimenko', 1, '4.1 x 3.3 x 1.8', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Galaxia de Andromeda', 'Sb I-II', 140000, 2650000, NULL);
INSERT INTO public.galaxy VALUES (2, 'Galaxia de la Via Láctea', 'SBbc I-II', 100012, NULL, 'Aquí se encuentra el Sol');
INSERT INTO public.galaxy VALUES (3, 'Galaxia del Triangulo', 'Sc II-III', 55000, 2850000, NULL);
INSERT INTO public.galaxy VALUES (4, 'Gran Nube de Magallanes', 'Irr III-IV', 30000, 179000, NULL);
INSERT INTO public.galaxy VALUES (5, 'NGC 3109', 'Irr IV-V', 25000, 4100000, NULL);
INSERT INTO public.galaxy VALUES (6, 'Pequeña Nube de Magallanes', 'Irr IV-V', 16000, 210000, NULL);
INSERT INTO public.galaxy VALUES (7, 'NGC 205', 'dSph/dE5', 15000, 2650000, NULL);
INSERT INTO public.galaxy VALUES (8, 'Enana Elíptica de Sagitario', 'dSph(E7)', 10000, 78000, NULL);
INSERT INTO public.galaxy VALUES (9, 'IC 1613', 'Irr V', 10000, 2300000, NULL);
INSERT INTO public.galaxy VALUES (10, 'NGC 147', 'dSph/dE5', 10000, 2350000, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, true, '', NULL);
INSERT INTO public.moon VALUES (2, 'Fobos', 4, false, 'Asaph Hall', NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, false, 'Asaph Hall', NULL);
INSERT INTO public.moon VALUES (4, 'Ganimedes', 5, true, 'Galileo Galilei', NULL);
INSERT INTO public.moon VALUES (5, 'Calisto', 5, true, 'Galileo Galilei', NULL);
INSERT INTO public.moon VALUES (6, 'Ío', 5, true, 'Galileo Galilei', NULL);
INSERT INTO public.moon VALUES (7, 'Europa', 5, true, 'Galileo Galilei', NULL);
INSERT INTO public.moon VALUES (8, 'Titán', 6, true, 'Christiaan Huygens', NULL);
INSERT INTO public.moon VALUES (9, 'Rea', 6, true, 'Giovanni Cassini', NULL);
INSERT INTO public.moon VALUES (10, 'Jápeto', 6, true, 'Giovanni Cassini', NULL);
INSERT INTO public.moon VALUES (11, 'Encélado', 6, true, 'William Herschel', NULL);
INSERT INTO public.moon VALUES (12, 'Mimas', 6, true, 'William Herschel', NULL);
INSERT INTO public.moon VALUES (14, 'Oberón', 7, true, 'William Herschel', NULL);
INSERT INTO public.moon VALUES (13, 'Titania', 7, true, 'William Herschel', NULL);
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, true, 'William Lassell', NULL);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, true, 'William Lassell', NULL);
INSERT INTO public.moon VALUES (17, 'Tritón', 8, true, 'William Lassell', NULL);
INSERT INTO public.moon VALUES (18, 'Caronte', 10, true, 'James Walter Christy', NULL);
INSERT INTO public.moon VALUES (19, 'Hidra', 10, false, '', NULL);
INSERT INTO public.moon VALUES (20, 'Nix', 10, false, '', NULL);
INSERT INTO public.moon VALUES (21, 'Cerbero', 10, false, 'Mark Robert Showalter', NULL);
INSERT INTO public.moon VALUES (22, 'Estigia', 10, false, 'Mark Robert Showalter', NULL);
INSERT INTO public.moon VALUES (23, 'Hi''iaka', 11, false, NULL, NULL);
INSERT INTO public.moon VALUES (24, 'Namaka', 11, false, NULL, NULL);
INSERT INTO public.moon VALUES (25, 'MK2', 12, false, NULL, NULL);
INSERT INTO public.moon VALUES (26, 'Disnomia', 13, false, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 1, false, 0, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, false, 0, false);
INSERT INTO public.planet VALUES (3, 'Tierra', 1, true, 1, false);
INSERT INTO public.planet VALUES (4, 'Marte', 1, true, 2, false);
INSERT INTO public.planet VALUES (5, 'Júpiter', 1, true, 92, false);
INSERT INTO public.planet VALUES (6, 'Saturno', 1, true, 83, false);
INSERT INTO public.planet VALUES (7, 'Urano', 1, true, 27, false);
INSERT INTO public.planet VALUES (8, 'Neptuno', 1, true, 14, false);
INSERT INTO public.planet VALUES (9, 'Ceres', 1, false, 0, true);
INSERT INTO public.planet VALUES (10, 'Plutón', 1, true, 5, true);
INSERT INTO public.planet VALUES (11, 'Haumea', 1, true, 2, true);
INSERT INTO public.planet VALUES (12, 'Makemake', 1, true, 1, true);
INSERT INTO public.planet VALUES (13, 'Eris', 1, true, 1, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (9, 'Wolf 359', 2, 'Leo', 7.7823000000, '');
INSERT INTO public.star VALUES (10, 'Lalande 21185', 2, 'Osa Mayor', 8.2903000000, '');
INSERT INTO public.star VALUES (1, 'Sol', 2, '', 0.0000158125, 'Aquí se encuentra la Tierra');
INSERT INTO public.star VALUES (2, 'Próxima Centauri', 2, 'Centauro', 4.2420000000, 'Pertenece al sistema estelar Alfa Centauri');
INSERT INTO public.star VALUES (3, 'Alfa Centauri A', 2, 'Centauro', 4.3649000000, 'Pertenece al sistema estelar Alfa Centauri');
INSERT INTO public.star VALUES (4, 'Alfa Centauri B', 2, 'Centauro', 4.3649000000, 'Pertenece al sistema estelar Alfa Centauri');
INSERT INTO public.star VALUES (5, 'Estrella de Barnard', 2, 'Ofiuco', 5.9629000000, '');
INSERT INTO public.star VALUES (6, 'Luhman 16 A', 2, 'Vela', 6.5900000000, 'Pertenece al sistema estelar Luhman 16');
INSERT INTO public.star VALUES (7, 'Luhman 16 B', 2, 'Vela', 6.5900000000, 'Pertenece al sistema estelar Luhman 16');
INSERT INTO public.star VALUES (8, 'WISE 0855-0714', 2, 'Hidra', 7.2000000000, '');


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 37, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: comet comet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--