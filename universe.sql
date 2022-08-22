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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_stars integer,
    have_blackhole boolean,
    lookslike text,
    description character varying(30)
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
    planet_id integer,
    name character varying(30) NOT NULL,
    description character varying(30),
    unique_moon boolean
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
    star_id integer,
    name character varying(30) NOT NULL,
    weight numeric(4,1),
    moon_id integer
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
-- Name: relation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.relation (
    galaxy_id integer NOT NULL,
    star_id integer,
    relation_id integer NOT NULL,
    name character varying(40),
    total_relation integer
);


ALTER TABLE public.relation OWNER TO freecodecamp;

--
-- Name: relation_relation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.relation_relation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.relation_relation_id_seq OWNER TO freecodecamp;

--
-- Name: relation_relation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.relation_relation_id_seq OWNED BY public.relation.relation_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_planets integer,
    galaxy_id integer,
    description character varying(30)
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
-- Name: relation relation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relation ALTER COLUMN relation_id SET DEFAULT nextval('public.relation_relation_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'andromeda', 1, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'GLASS-Z-13', 1, true, 'red spot', 'the oldest galaxy');
INSERT INTO public.galaxy VALUES (3, 'MILKY WAY', 4, true, 'LIKE MILK IN THE SKY', 'OUR HOME');
INSERT INTO public.galaxy VALUES (4, 'canis major dwarf', 1, false, 'ITS LIKE A BELT SURROUNDING OUR GALAXY', 'NEAREST OF THE MILKY WAY');
INSERT INTO public.galaxy VALUES (5, 'condor galaxy', 3000000, true, 'LIKE A CONDOR ', 'THE BIGGEST GALAXY');
INSERT INTO public.galaxy VALUES (6, 'whirlpool', 1, true, 'the first spiral', 'we can look it with binoculars');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'moon', NULL, NULL);
INSERT INTO public.moon VALUES (2, 2, 'phobos', NULL, NULL);
INSERT INTO public.moon VALUES (3, 3, 'deimos', NULL, NULL);
INSERT INTO public.moon VALUES (4, 3, 'io', NULL, NULL);
INSERT INTO public.moon VALUES (5, 3, 'europa', NULL, NULL);
INSERT INTO public.moon VALUES (6, 3, 'ganymede', NULL, NULL);
INSERT INTO public.moon VALUES (7, 3, 'callisto', NULL, NULL);
INSERT INTO public.moon VALUES (8, 3, 'amaltea', NULL, NULL);
INSERT INTO public.moon VALUES (9, 3, 'sinope', NULL, NULL);
INSERT INTO public.moon VALUES (10, 3, 'ananke', NULL, NULL);
INSERT INTO public.moon VALUES (11, 3, 'thehys', NULL, NULL);
INSERT INTO public.moon VALUES (12, 3, 'titan', NULL, NULL);
INSERT INTO public.moon VALUES (13, 3, 'hyperion', NULL, NULL);
INSERT INTO public.moon VALUES (14, 3, 'iapetus', NULL, NULL);
INSERT INTO public.moon VALUES (15, 3, 'ariel', NULL, NULL);
INSERT INTO public.moon VALUES (16, 3, 'ophelia', NULL, NULL);
INSERT INTO public.moon VALUES (17, 3, 'bianca', NULL, NULL);
INSERT INTO public.moon VALUES (18, 4, 'cressida', NULL, NULL);
INSERT INTO public.moon VALUES (19, 3, 'desdemona', NULL, NULL);
INSERT INTO public.moon VALUES (20, 3, 'triton', NULL, NULL);
INSERT INTO public.moon VALUES (21, 3, 'cupido', NULL, NULL);
INSERT INTO public.moon VALUES (22, 3, 'thalasa', NULL, NULL);
INSERT INTO public.moon VALUES (23, 3, 'xiangliu', NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 2, 'TRAPPIST-1e', 77.0, NULL);
INSERT INTO public.planet VALUES (2, 2, 'Proxima Centauri b', 120.0, NULL);
INSERT INTO public.planet VALUES (3, 3, 'LHS 1140 b', 170.0, NULL);
INSERT INTO public.planet VALUES (4, 3, 'Kepler-737b', 450.0, NULL);
INSERT INTO public.planet VALUES (5, 3, 'TRAPPIST-1f', 93.0, NULL);
INSERT INTO public.planet VALUES (6, 2, 'Teegarden"s Star b', 100.0, NULL);
INSERT INTO public.planet VALUES (7, 3, 'Jupiter', 111.1, NULL);
INSERT INTO public.planet VALUES (8, 4, 'Gliese 1061 d', 77.0, NULL);
INSERT INTO public.planet VALUES (9, 2, 'Ross 128 b', 120.0, NULL);
INSERT INTO public.planet VALUES (10, 3, 'Luyten b', 170.0, NULL);
INSERT INTO public.planet VALUES (11, 3, 'Wolf 1061c', 450.0, NULL);
INSERT INTO public.planet VALUES (12, 3, 'Tau Ceti f', 93.0, NULL);


--
-- Data for Name: relation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.relation VALUES (3, 3, 1, '2', NULL);
INSERT INTO public.relation VALUES (5, 4, 2, '1', NULL);
INSERT INTO public.relation VALUES (4, 3, 3, '1', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'alpha_centauri', 1, 1, NULL);
INSERT INTO public.star VALUES (3, 'Epsilon Eridani', 1, 1, 'young star');
INSERT INTO public.star VALUES (4, ' 61 Cygni A', 3, 1, 'possibly have three planets');
INSERT INTO public.star VALUES (5, 'Epsilon Indi', 0, 1, 'group of 12 stars');
INSERT INTO public.star VALUES (6, '70 Ophiuchi B', 0, 1, 'exentrict orbit');
INSERT INTO public.star VALUES (7, 'leo', 3, 2, 'i am leo and i am a star');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: relation_relation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.relation_relation_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: relation relation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relation
    ADD CONSTRAINT relation_pkey PRIMARY KEY (relation_id);


--
-- Name: relation relation_relation_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relation
    ADD CONSTRAINT relation_relation_id_key UNIQUE (relation_id);


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
-- Name: relation galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relation
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: relation star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relation
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

