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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    diameter_in_km integer NOT NULL,
    composition text NOT NULL,
    is_metallic boolean DEFAULT false NOT NULL,
    distance_from_sun integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    diameter_in_millions_of_miles integer NOT NULL,
    age_in_millions_of_years integer,
    has_life boolean DEFAULT false NOT NULL
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
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    moon_type character varying(50) NOT NULL,
    diameter_in_km integer NOT NULL,
    has_atmosphere boolean DEFAULT false NOT NULL,
    description text
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
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_type character varying(50) NOT NULL,
    distance_from_star_in_km numeric NOT NULL,
    is_habitable boolean DEFAULT false NOT NULL,
    gravity numeric
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
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_type character varying(50) NOT NULL,
    distance_from_earth integer NOT NULL,
    is_spherical boolean DEFAULT true NOT NULL
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 1, 'Ceres', 950, 'Rock and Ice', false, 413);
INSERT INTO public.asteroid VALUES (2, 1, 'Vesta', 530, 'Silicate Rock', false, 352);
INSERT INTO public.asteroid VALUES (3, 1, 'Pallas', 582, 'Carbon Rock', false, 414);
INSERT INTO public.asteroid VALUES (4, 1, 'Juno', 240, 'Carbon Rock', false, 500);
INSERT INTO public.asteroid VALUES (5, 1, 'Psyche', 225, 'Iron and Nickel', true, 532);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 100000, 13600, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 220000, 10000, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 60000, 13800, false);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'Elliptical', 130000, 12000, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 50000, 14000, false);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Spiral', 76000, 13400, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Moon', 'Rocky', 3474, false, 'Earth''s natural satellite');
INSERT INTO public.moon VALUES (2, 3, 'Luna Major', 'Rocky', 2500, false, 'Hypothetical second moon');
INSERT INTO public.moon VALUES (3, 4, 'Phobos', 'Rocky', 23, false, 'Mars'' inner moon');
INSERT INTO public.moon VALUES (4, 4, 'Deimos', 'Rocky', 12, false, 'Mars'' outer moon');
INSERT INTO public.moon VALUES (5, 5, 'Io', 'Volcanic', 3643, false, 'Volcanically active');
INSERT INTO public.moon VALUES (6, 5, 'Europa', 'Icy', 3122, false, 'Has subsurface ocean');
INSERT INTO public.moon VALUES (7, 5, 'Ganymede', 'Icy', 5268, false, 'Largest moon in solar system');
INSERT INTO public.moon VALUES (8, 5, 'Callisto', 'Rocky', 4821, false, 'Heavily cratered');
INSERT INTO public.moon VALUES (9, 6, 'Titan', 'Icy', 5150, true, 'Has thick atmosphere');
INSERT INTO public.moon VALUES (10, 6, 'Enceladus', 'Icy', 504, false, 'Geysers observed');
INSERT INTO public.moon VALUES (11, 6, 'Mimas', 'Rocky', 396, false, 'Has prominent crater');
INSERT INTO public.moon VALUES (12, 6, 'Triton', 'Icy', 2707, false, 'Retrograde orbit');
INSERT INTO public.moon VALUES (13, 7, 'Sirius Moon 1', 'Rocky', 1500, false, 'Small satellite');
INSERT INTO public.moon VALUES (14, 7, 'Sirius Moon 2', 'Rocky', 2000, false, 'Larger satellite');
INSERT INTO public.moon VALUES (15, 8, 'Sirius II Moon 1', 'Icy', 5000, false, 'Ice moon');
INSERT INTO public.moon VALUES (16, 9, 'Alpha Moon 1', 'Rocky', 1200, false, 'Small moon');
INSERT INTO public.moon VALUES (17, 10, 'Andromeda Moon 1', 'Icy', 3500, false, 'Ice giant moon');
INSERT INTO public.moon VALUES (18, 11, 'Triangulum Moon 1', 'Rocky', 1800, false, 'Small terrestrial moon');
INSERT INTO public.moon VALUES (19, 12, 'Centaurus Moon 1', 'Icy', 6000, false, 'Large ice moon');
INSERT INTO public.moon VALUES (20, 12, 'Centaurus Moon 2', 'Rocky', 2500, false, 'Rocky companion');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 'Terrestrial', 57909100, false, 3.7);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 'Terrestrial', 108208000, false, 8.87);
INSERT INTO public.planet VALUES (3, 1, 'Earth', 'Terrestrial', 149597870, true, 9.8);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 'Terrestrial', 227923000, false, 3.71);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 'Gas Giant', 778340821, false, 24.79);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', 'Gas Giant', 1426725000, false, 10.44);
INSERT INTO public.planet VALUES (7, 2, 'Sirius I', 'Terrestrial', 75000000, false, 5.5);
INSERT INTO public.planet VALUES (8, 2, 'Sirius II', 'Gas Giant', 200000000, false, 15.0);
INSERT INTO public.planet VALUES (9, 3, 'Alpha Centauri I', 'Terrestrial', 100000000, false, 4.2);
INSERT INTO public.planet VALUES (10, 4, 'Andromeda I', 'Ice Giant', 300000000, false, 12.5);
INSERT INTO public.planet VALUES (11, 5, 'Triangulum I', 'Terrestrial', 50000000, false, 6.1);
INSERT INTO public.planet VALUES (12, 6, 'Centaurus I', 'Gas Giant', 400000000, false, 20.0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'Yellow Dwarf', 0, true);
INSERT INTO public.star VALUES (2, 1, 'Sirius', 'Blue-White', 9, true);
INSERT INTO public.star VALUES (3, 1, 'Alpha Centauri A', 'Yellow Dwarf', 4, true);
INSERT INTO public.star VALUES (4, 2, 'Andromeda Prime', 'Red Giant', 25000, true);
INSERT INTO public.star VALUES (5, 3, 'Triangulum Star', 'White Dwarf', 28000, true);
INSERT INTO public.star VALUES (6, 4, 'Centaurus Star', 'Red Supergiant', 47000, true);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


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
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

