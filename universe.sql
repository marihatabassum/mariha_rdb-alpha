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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type text,
    distance_from_earth_mly numeric,
    diameter_ly integer,
    local_group boolean,
    largest boolean,
    magnitude_absolute integer,
    has_star character varying(30)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_name_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_name_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_name_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_name_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    mass_kg numeric,
    diameter_km numeric
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
    made_of text,
    number_of_moons integer
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
-- Name: solar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solar_system (
    solar_system_id integer NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    name character varying(40)
);


ALTER TABLE public.solar_system OWNER TO freecodecamp;

--
-- Name: solar_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.solar_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_system_id_seq OWNER TO freecodecamp;

--
-- Name: solar_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.solar_system_id_seq OWNED BY public.solar_system.solar_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_ly numeric,
    mass_ms numeric,
    planets text,
    of_galaxy character varying(30),
    galaxy_id integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_name_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: solar_system solar_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system ALTER COLUMN solar_system_id SET DEFAULT nextval('public.solar_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred spiral galaxy', 0.0265, 87400, true, false, -21, NULL);
INSERT INTO public.galaxy VALUES (2, 'Ursa Major III', 'Dwarf spheroidal galaxy', 0.033, 120, true, false, 2, NULL);
INSERT INTO public.galaxy VALUES (3, 'Draco II', 'Dwarf spheroidal galaxy', 0.0701, 120, true, false, -1, NULL);
INSERT INTO public.galaxy VALUES (4, 'Tucana III', 'Dwarf spheroidal galaxy', 0.0747, 220, true, false, -1, NULL);
INSERT INTO public.galaxy VALUES (5, 'Segue 2', 'Dwarf spheroidal galaxy', 0.114, 220, true, false, -2, NULL);
INSERT INTO public.galaxy VALUES (6, 'Large Magellenic Cloud', 'SBsm', 0.163, 32200, true, false, -18, NULL);
INSERT INTO public.galaxy VALUES (7, 'Centaurus', NULL, NULL, NULL, true, false, NULL, NULL);
INSERT INTO public.galaxy VALUES (8, 'Canis Major', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (9, 'Eridanus', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (10, 'Sagittarius', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (11, 'Andromeda', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Mimas', 6, 40000000000000000000, 3960);
INSERT INTO public.moon VALUES (2, 'Enceladus', 6, 110000000000000000000, 504);
INSERT INTO public.moon VALUES (3, 'Tethys', 6, 620000000000000000000, 1062);
INSERT INTO public.moon VALUES (4, 'Dione', 6, 1100000000000000000000, 1123);
INSERT INTO public.moon VALUES (5, 'Rhea', 6, 2300000000000000000000, 1527);
INSERT INTO public.moon VALUES (6, 'Titan', 6, 135000000000000000000000, 5149);
INSERT INTO public.moon VALUES (7, 'Lapetus', 6, 1800000000000000000000, 1470);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 2080000000000000000, 167);
INSERT INTO public.moon VALUES (9, 'Thebe', 5, 430000000000000000, 98.6);
INSERT INTO public.moon VALUES (10, 'Lo', 5, 89000000000000000000000, 3643.2);
INSERT INTO public.moon VALUES (11, 'Europa', 5, 48000000000000000000000, 3121.6);
INSERT INTO public.moon VALUES (12, 'Ganymede', 5, 148000000000000000000000, 5268.2);
INSERT INTO public.moon VALUES (13, 'Callisto', 5, 107000000000000000000000, 4820.6);
INSERT INTO public.moon VALUES (14, 'Themisto', 5, 380000000000000, 9);
INSERT INTO public.moon VALUES (15, 'Leda', 5, 5200000000000000, 21.5);
INSERT INTO public.moon VALUES (16, 'Himalia', 5, 4200000000000000000, 139.6);
INSERT INTO public.moon VALUES (17, 'Mneme', 5, 4200000000000, 2);
INSERT INTO public.moon VALUES (18, 'Phobos', 4, 10700000000000000, 22.2);
INSERT INTO public.moon VALUES (19, 'Deimos', 4, 1500000000000000, 12.6);
INSERT INTO public.moon VALUES (20, 'Moon', 1, 73460000000000000000000, 3474);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Water, Oxygen,Nitrogen, land', 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 1, 'Rocks', 0);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 'Rocks, Carbon dioxide, Sulfuric acid', 0);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Rocks, Carbon dioxide', 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gases, hydrogen, helium', 95);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gases, liquid hydrogen, ammonia', 274);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Water, ammonia, methane', 28);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Gases and liquids', 16);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 'Ice and rocks', 5);
INSERT INTO public.planet VALUES (10, 'Ceres', 1, 'Water,Ice,Hydrated minerals', 0);
INSERT INTO public.planet VALUES (11, 'Orcus', 1, 'Water ice, methane, ammonia', 1);
INSERT INTO public.planet VALUES (12, 'Gonggong', 1, 'Tholins, Water ice', 1);


--
-- Data for Name: solar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solar_system VALUES (1, 1, 20, 'Solar System');
INSERT INTO public.solar_system VALUES (2, 4, 19, 'Martian System');
INSERT INTO public.solar_system VALUES (3, 6, 5, 'Saturn System');
INSERT INTO public.solar_system VALUES (4, 5, 12, 'Jovian System');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0.0000158, 1, 'Earth', 'Milky Way', 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4.2465, 0.122, 'Proxima Centauri b', 'Centaurus', 7);
INSERT INTO public.star VALUES (3, 'Sirius A', 8.7094, 2.063, 'Brightest star in the night sky', 'Canis Major', 8);
INSERT INTO public.star VALUES (4, 'Epsilon Epidani', 10.4749, 0.820, 'AEgir', 'Eridanus', 9);
INSERT INTO public.star VALUES (5, 'Rose 154', 9.7063, 0.17, 'flare star', 'Sagittarius', 10);
INSERT INTO public.star VALUES (6, 'Rose 248', 10.3057, 0.136, 'flare star', 'Andromeda', 11);


--
-- Name: galaxy_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_name_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: solar_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.solar_system_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


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
-- Name: solar_system id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT id_key UNIQUE (solar_system_id);


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
-- Name: solar_system solar_system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_name_key UNIQUE (name);


--
-- Name: solar_system solar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_pkey PRIMARY KEY (solar_system_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_of_galaxy_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_of_galaxy_key UNIQUE (of_galaxy);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: solar_system solar_system_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: solar_system solar_system_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

