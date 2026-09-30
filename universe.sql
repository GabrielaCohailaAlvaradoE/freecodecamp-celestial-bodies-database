--
-- PostgreSQL database dump
--

\restrict pVS19ds6ACMR0qgOz3dhKNTBFLF9F3dfXdN1ryhMeB11LARt9f9A5rkQExy59Tr

-- Dumped from database version 18.6 (Ubuntu 18.6-0ubuntu0.26.04.1)
-- Dumped by pg_dump version 18.6 (Ubuntu 18.6-0ubuntu0.26.04.1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';


\unrestrict pVS19ds6ACMR0qgOz3dhKNTBFLF9F3dfXdN1ryhMeB11LARt9f9A5rkQExy59Tr
\connect universe
\restrict pVS19ds6ACMR0qgOz3dhKNTBFLF9F3dfXdN1ryhMeB11LARt9f9A5rkQExy59Tr

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
-- Name: comet; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    discovery_year integer NOT NULL,
    is_periodic boolean NOT NULL,
    orbital_period_in_years numeric(12,3),
    description text
);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    distance_from_earth numeric(12,2),
    age_in_millions_of_years integer NOT NULL,
    has_supermassive_black_hole boolean DEFAULT true NOT NULL,
    description text
);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter_in_km integer NOT NULL,
    orbital_period_in_days numeric(12,3),
    is_spherical boolean DEFAULT true NOT NULL,
    description text
);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(50) NOT NULL,
    orbital_period_in_days integer NOT NULL,
    mass_in_earth_masses numeric(12,3),
    has_life boolean DEFAULT false NOT NULL
);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    star_type character varying(50) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    is_visible_to_naked_eye boolean DEFAULT false NOT NULL,
    mass_in_solar_masses numeric(10,3)
);


--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.comet VALUES (1, 'Halley', 1758, true, 75.320, 'The best-known short-period comet.');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 1995, false, 2533.000, 'A very bright comet visible in 1997.');
INSERT INTO public.comet VALUES (3, 'Encke', 1786, true, 3.300, 'A short-period comet.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred spiral', 0.00, 13600, true, 'The galaxy containing the Solar System.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000.00, 10100, true, 'The nearest large galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 2730000.00, 12000, true, 'The third-largest member of the Local Group.');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Grand-design spiral', 23000000.00, 400, true, 'Also known as Messier 51.');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Unbarred spiral', 29300000.00, 13000, true, 'Known for its bright central bulge.');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Dwarf irregular', 158200.00, 13600, false, 'A satellite galaxy of the Milky Way.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3475, 27.322, true, 'Earth''s natural satellite.');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, 0.319, false, 'The larger moon of Mars.');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, 1.263, false, 'The smaller moon of Mars.');
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, 1.769, true, 'Volcanically active moon of Jupiter.');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, 3.551, true, 'An icy moon with a subsurface ocean.');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, 7.155, true, 'The largest moon in the Solar System.');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, 16.689, true, 'A heavily cratered moon of Jupiter.');
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 167, 0.498, false, 'A small inner moon of Jupiter.');
INSERT INTO public.moon VALUES (9, 'Titan', 6, 5150, 15.945, true, 'Saturn''s largest moon.');
INSERT INTO public.moon VALUES (10, 'Rhea', 6, 1528, 4.518, true, 'An icy moon of Saturn.');
INSERT INTO public.moon VALUES (11, 'Iapetus', 6, 1469, 79.321, true, 'A two-toned moon of Saturn.');
INSERT INTO public.moon VALUES (12, 'Dione', 6, 1123, 2.737, true, 'A moon of Saturn with bright cliffs.');
INSERT INTO public.moon VALUES (13, 'Tethys', 6, 1062, 1.888, true, 'An icy moon of Saturn.');
INSERT INTO public.moon VALUES (14, 'Enceladus', 6, 504, 1.370, true, 'An active icy moon of Saturn.');
INSERT INTO public.moon VALUES (15, 'Mimas', 6, 396, 0.942, true, 'A small moon with a large crater.');
INSERT INTO public.moon VALUES (16, 'Miranda', 7, 472, 1.413, true, 'The smallest major moon of Uranus.');
INSERT INTO public.moon VALUES (17, 'Ariel', 7, 1158, 2.520, true, 'A bright moon of Uranus.');
INSERT INTO public.moon VALUES (18, 'Umbriel', 7, 1169, 4.144, true, 'A dark moon of Uranus.');
INSERT INTO public.moon VALUES (19, 'Titania', 7, 1577, 8.706, true, 'The largest moon of Uranus.');
INSERT INTO public.moon VALUES (20, 'Oberon', 7, 1523, 13.463, true, 'An outer moon of Uranus.');
INSERT INTO public.moon VALUES (21, 'Triton', 8, 2707, -5.877, true, 'Neptune''s largest moon.');
INSERT INTO public.moon VALUES (22, 'Nereid', 8, 340, 360.140, false, 'An irregular moon of Neptune.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 88, 0.055, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 225, 0.815, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 365, 1.000, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 687, 0.107, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas giant', 4333, 317.800, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas giant', 10759, 95.200, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice giant', 30687, 14.500, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice giant', 60190, 17.100, false);
INSERT INTO public.planet VALUES (9, 'Sirius b', 2, 'Gas giant', 420, 2.400, false);
INSERT INTO public.planet VALUES (10, 'Betelgeuse I', 3, 'Super-Jupiter', 900, 600.000, false);
INSERT INTO public.planet VALUES (11, 'Rigel I', 4, 'Gas giant', 760, 310.000, false);
INSERT INTO public.planet VALUES (12, 'Proxima b', 5, 'Terrestrial', 11, 1.270, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type main-sequence', 4600, true, 1.000);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A-type main-sequence', 242, true, 2.063);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'Red supergiant', 10, true, 16.500);
INSERT INTO public.star VALUES (4, 'Rigel', 1, 'Blue supergiant', 8, true, 21.000);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 1, 'Red dwarf', 4850, false, 0.122);
INSERT INTO public.star VALUES (6, 'Alpheratz', 2, 'B-type subgiant', 60, true, 3.800);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: DATABASE universe; Type: ACL; Schema: -; Owner: -
--

GRANT CONNECT ON DATABASE universe TO fccuser;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT USAGE ON SCHEMA public TO fccuser;


--
-- PostgreSQL database dump complete
--

\unrestrict pVS19ds6ACMR0qgOz3dhKNTBFLF9F3dfXdN1ryhMeB11LARt9f9A5rkQExy59Tr

