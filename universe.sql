--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

ALTER TABLE ONLY public.star DROP CONSTRAINT star_galaxy_id_fkey;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_star_id_fkey;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_planet_id_fkey;
ALTER TABLE ONLY public.star DROP CONSTRAINT star_pkey;
ALTER TABLE ONLY public.star DROP CONSTRAINT star_name_key;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_pkey;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_name_key;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_pkey;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_name_key;
ALTER TABLE ONLY public.galaxy DROP CONSTRAINT galaxy_pkey;
ALTER TABLE ONLY public.galaxy DROP CONSTRAINT galaxy_name_key;
ALTER TABLE ONLY public.element DROP CONSTRAINT element_symbol_key;
ALTER TABLE ONLY public.element DROP CONSTRAINT element_pkey;
ALTER TABLE ONLY public.element DROP CONSTRAINT element_name_key;
ALTER TABLE public.star ALTER COLUMN star_id DROP DEFAULT;
ALTER TABLE public.planet ALTER COLUMN planet_id DROP DEFAULT;
ALTER TABLE public.moon ALTER COLUMN moon_id DROP DEFAULT;
ALTER TABLE public.galaxy ALTER COLUMN galaxy_id DROP DEFAULT;
ALTER TABLE public.element ALTER COLUMN element_id DROP DEFAULT;
DROP SEQUENCE public.star_star_id_seq;
DROP TABLE public.star;
DROP SEQUENCE public.planet_planet_id_seq;
DROP TABLE public.planet;
DROP SEQUENCE public.moon_moon_id_seq;
DROP TABLE public.moon;
DROP SEQUENCE public.galaxy_galaxy_id_seq;
DROP TABLE public.galaxy;
DROP SEQUENCE public.element_element_id_seq;
DROP TABLE public.element;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: element; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.element (
    element_id integer NOT NULL,
    name character varying(30) NOT NULL,
    symbol character varying(5) NOT NULL,
    atomic_number integer NOT NULL
);


ALTER TABLE public.element OWNER TO freecodecamp;

--
-- Name: element_element_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.element_element_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.element_element_id_seq OWNER TO freecodecamp;

--
-- Name: element_element_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.element_element_id_seq OWNED BY public.element.element_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    age_in_millions_of_years integer
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
    name character varying(30) NOT NULL,
    planet_id integer,
    is_spherical boolean,
    distance_from_earth numeric
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
    name character varying(30) NOT NULL,
    star_id integer,
    has_life boolean,
    planet_types text,
    age_in_millions_of_years integer
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
    name character varying(30) NOT NULL,
    galaxy_id integer,
    is_spherical boolean,
    distance_from_earth numeric
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
-- Name: element element_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element ALTER COLUMN element_id SET DEFAULT nextval('public.element_element_id_seq'::regclass);


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
-- Data for Name: element; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.element (element_id, name, symbol, atomic_number) VALUES (1, 'Hydrogen', 'H', 1);
INSERT INTO public.element (element_id, name, symbol, atomic_number) VALUES (2, 'Helium', 'He', 2);
INSERT INTO public.element (element_id, name, symbol, atomic_number) VALUES (3, 'Carbon', 'C', 6);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy (galaxy_id, name, description, has_life, age_in_millions_of_years) VALUES (1, 'Milky Way', NULL, true, 13600);
INSERT INTO public.galaxy (galaxy_id, name, description, has_life, age_in_millions_of_years) VALUES (2, 'Andromeda', NULL, false, 10000);
INSERT INTO public.galaxy (galaxy_id, name, description, has_life, age_in_millions_of_years) VALUES (3, 'Triangulum', NULL, false, 12000);
INSERT INTO public.galaxy (galaxy_id, name, description, has_life, age_in_millions_of_years) VALUES (4, 'Sombrero', NULL, false, 13000);
INSERT INTO public.galaxy (galaxy_id, name, description, has_life, age_in_millions_of_years) VALUES (5, 'Whirlpool', NULL, false, 400);
INSERT INTO public.galaxy (galaxy_id, name, description, has_life, age_in_millions_of_years) VALUES (6, 'Centaurus A', NULL, false, 13200);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon (moon_id, name, planet_id, is_spherical, distance_from_earth) VALUES (1, 'Moon', 1, true, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, is_spherical, distance_from_earth) VALUES (2, 'Phobos', 2, false, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, is_spherical, distance_from_earth) VALUES (3, 'Deimos', 2, false, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, is_spherical, distance_from_earth) VALUES (4, 'Io', 3, true, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, is_spherical, distance_from_earth) VALUES (5, 'Europa', 3, true, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, is_spherical, distance_from_earth) VALUES (6, 'Ganymede', 3, true, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, is_spherical, distance_from_earth) VALUES (7, 'Callisto', 3, true, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, is_spherical, distance_from_earth) VALUES (8, 'Mimas', 4, true, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, is_spherical, distance_from_earth) VALUES (9, 'Enceladus', 4, true, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, is_spherical, distance_from_earth) VALUES (10, 'Tethys', 4, true, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, is_spherical, distance_from_earth) VALUES (11, 'Dione', 4, true, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, is_spherical, distance_from_earth) VALUES (12, 'Rhea', 4, true, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, is_spherical, distance_from_earth) VALUES (13, 'Titan', 4, true, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, is_spherical, distance_from_earth) VALUES (14, 'Hyperion', 4, false, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, is_spherical, distance_from_earth) VALUES (15, 'Iapetus', 4, true, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, is_spherical, distance_from_earth) VALUES (16, 'Phoebe', 4, false, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, is_spherical, distance_from_earth) VALUES (17, 'Miranda', 7, true, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, is_spherical, distance_from_earth) VALUES (18, 'Ariel', 7, true, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, is_spherical, distance_from_earth) VALUES (19, 'Umbriel', 7, true, NULL);
INSERT INTO public.moon (moon_id, name, planet_id, is_spherical, distance_from_earth) VALUES (20, 'Triton', 8, true, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet (planet_id, name, star_id, has_life, planet_types, age_in_millions_of_years) VALUES (1, 'Earth', 1, true, 'Terrestrial', NULL);
INSERT INTO public.planet (planet_id, name, star_id, has_life, planet_types, age_in_millions_of_years) VALUES (2, 'Mars', 1, false, 'Terrestrial', NULL);
INSERT INTO public.planet (planet_id, name, star_id, has_life, planet_types, age_in_millions_of_years) VALUES (3, 'Jupiter', 1, false, 'Gas Giant', NULL);
INSERT INTO public.planet (planet_id, name, star_id, has_life, planet_types, age_in_millions_of_years) VALUES (4, 'Saturn', 1, false, 'Gas Giant', NULL);
INSERT INTO public.planet (planet_id, name, star_id, has_life, planet_types, age_in_millions_of_years) VALUES (5, 'Mercury', 1, false, 'Terrestrial', NULL);
INSERT INTO public.planet (planet_id, name, star_id, has_life, planet_types, age_in_millions_of_years) VALUES (6, 'Venus', 1, false, 'Terrestrial', NULL);
INSERT INTO public.planet (planet_id, name, star_id, has_life, planet_types, age_in_millions_of_years) VALUES (7, 'Uranus', 1, false, 'Ice Giant', NULL);
INSERT INTO public.planet (planet_id, name, star_id, has_life, planet_types, age_in_millions_of_years) VALUES (8, 'Neptune', 1, false, 'Ice Giant', NULL);
INSERT INTO public.planet (planet_id, name, star_id, has_life, planet_types, age_in_millions_of_years) VALUES (9, 'Proxima b', 2, false, 'Exoplanet', NULL);
INSERT INTO public.planet (planet_id, name, star_id, has_life, planet_types, age_in_millions_of_years) VALUES (10, 'Proxima c', 2, false, 'Exoplanet', NULL);
INSERT INTO public.planet (planet_id, name, star_id, has_life, planet_types, age_in_millions_of_years) VALUES (11, 'Sirius b', 4, false, 'White Dwarf', NULL);
INSERT INTO public.planet (planet_id, name, star_id, has_life, planet_types, age_in_millions_of_years) VALUES (12, 'Kepler-22b', 3, false, 'Exoplanet', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star (star_id, name, galaxy_id, is_spherical, distance_from_earth) VALUES (1, 'Sun', 1, true, 0.0);
INSERT INTO public.star (star_id, name, galaxy_id, is_spherical, distance_from_earth) VALUES (2, 'Proxima Centauri', 1, true, 4.24);
INSERT INTO public.star (star_id, name, galaxy_id, is_spherical, distance_from_earth) VALUES (3, 'Betelgeuse', 1, true, 642.5);
INSERT INTO public.star (star_id, name, galaxy_id, is_spherical, distance_from_earth) VALUES (4, 'Sirius', 1, true, 8.6);
INSERT INTO public.star (star_id, name, galaxy_id, is_spherical, distance_from_earth) VALUES (5, 'Alpha Andromeda', 2, true, 97.0);
INSERT INTO public.star (star_id, name, galaxy_id, is_spherical, distance_from_earth) VALUES (6, 'Mira', 1, true, 300.0);


--
-- Name: element_element_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.element_element_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: element element_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT element_name_key UNIQUE (name);


--
-- Name: element element_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT element_pkey PRIMARY KEY (element_id);


--
-- Name: element element_symbol_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT element_symbol_key UNIQUE (symbol);


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

