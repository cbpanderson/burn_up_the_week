--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

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
-- Name: login_security; Type: TABLE; Schema: public; Owner: juliomorenobustillos
--

CREATE TABLE public.login_security (
    security_id integer NOT NULL,
    email character varying(15) NOT NULL,
    password character varying(15) NOT NULL,
    user_id integer
);


ALTER TABLE public.login_security OWNER TO juliomorenobustillos;

--
-- Name: login_security_security_id_seq; Type: SEQUENCE; Schema: public; Owner: juliomorenobustillos
--

CREATE SEQUENCE public.login_security_security_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.login_security_security_id_seq OWNER TO juliomorenobustillos;

--
-- Name: login_security_security_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: juliomorenobustillos
--

ALTER SEQUENCE public.login_security_security_id_seq OWNED BY public.login_security.security_id;


--
-- Name: scheduled_workouts; Type: TABLE; Schema: public; Owner: juliomorenobustillos
--

CREATE TABLE public.scheduled_workouts (
    schedule_id integer NOT NULL,
    weekday character varying(15),
    date_schedule date,
    completed boolean,
    workout_id integer,
    user_id integer
);


ALTER TABLE public.scheduled_workouts OWNER TO juliomorenobustillos;

--
-- Name: scheduled_workouts_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: juliomorenobustillos
--

CREATE SEQUENCE public.scheduled_workouts_schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scheduled_workouts_schedule_id_seq OWNER TO juliomorenobustillos;

--
-- Name: scheduled_workouts_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: juliomorenobustillos
--

ALTER SEQUENCE public.scheduled_workouts_schedule_id_seq OWNED BY public.scheduled_workouts.schedule_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: juliomorenobustillos
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(15) NOT NULL,
    last_name character varying(15) NOT NULL,
    age integer NOT NULL,
    weight character varying(15) NOT NULL,
    height character varying(15) NOT NULL
);


ALTER TABLE public.users OWNER TO juliomorenobustillos;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: juliomorenobustillos
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO juliomorenobustillos;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: juliomorenobustillos
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: workouts; Type: TABLE; Schema: public; Owner: juliomorenobustillos
--

CREATE TABLE public.workouts (
    workout_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(500) NOT NULL,
    calories_amount integer NOT NULL,
    body_part character varying(20)
);


ALTER TABLE public.workouts OWNER TO juliomorenobustillos;

--
-- Name: workouts_workout_id_seq; Type: SEQUENCE; Schema: public; Owner: juliomorenobustillos
--

CREATE SEQUENCE public.workouts_workout_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workouts_workout_id_seq OWNER TO juliomorenobustillos;

--
-- Name: workouts_workout_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: juliomorenobustillos
--

ALTER SEQUENCE public.workouts_workout_id_seq OWNED BY public.workouts.workout_id;


--
-- Name: login_security security_id; Type: DEFAULT; Schema: public; Owner: juliomorenobustillos
--

ALTER TABLE ONLY public.login_security ALTER COLUMN security_id SET DEFAULT nextval('public.login_security_security_id_seq'::regclass);


--
-- Name: scheduled_workouts schedule_id; Type: DEFAULT; Schema: public; Owner: juliomorenobustillos
--

ALTER TABLE ONLY public.scheduled_workouts ALTER COLUMN schedule_id SET DEFAULT nextval('public.scheduled_workouts_schedule_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: juliomorenobustillos
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: workouts workout_id; Type: DEFAULT; Schema: public; Owner: juliomorenobustillos
--

ALTER TABLE ONLY public.workouts ALTER COLUMN workout_id SET DEFAULT nextval('public.workouts_workout_id_seq'::regclass);


--
-- Data for Name: login_security; Type: TABLE DATA; Schema: public; Owner: juliomorenobustillos
--

COPY public.login_security (security_id, email, password, user_id) FROM stdin;
\.


--
-- Data for Name: scheduled_workouts; Type: TABLE DATA; Schema: public; Owner: juliomorenobustillos
--

COPY public.scheduled_workouts (schedule_id, weekday, date_schedule, completed, workout_id, user_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: juliomorenobustillos
--

COPY public.users (user_id, name, last_name, age, weight, height) FROM stdin;
\.


--
-- Data for Name: workouts; Type: TABLE DATA; Schema: public; Owner: juliomorenobustillos
--

COPY public.workouts (workout_id, name, description, calories_amount, body_part) FROM stdin;
2	Incline barbell press	Instructions. Position your body on an incline bench on a 30-45 degree angle. Grab a barbell with an overhand grip that's shoulder-width apart and hold it above your chest. Extend arms upward, locking out elbows. Lower the bar straight down in a slow, controlled movement to your chest.	180	Chest
3	Incline Dumbbell Press	Hold a dumbbell in each hand, with hands positioned at your shoulders, elbows bent and angled down below your ribs. Relax your neck against the bench. Keep your feet flat on the floor. Brace your core and press both dumbbells straight up over your chest as you exhale.	180	Chest
4	Flat Dumbbell Bench Press instructions	Set up a bench at an incline of 30-45° and sit with your feet flat on the floor and your back on the bench. Lift the dumbbells to chest height with your palms facing forwards. Breathe out and push the dumbbells up until your arms are fully extended, using your pecs to power the movement. Don't let the dumbbells touch.	180	Chest
5	All Weighted Pull-up & Chin-up Variations	Pull yourself all the way up until your chin passes the bar. ... You can also loop a resistance band around your leg to help you up.	150	Back
6	The Sternum Chin-Up	The Gironda sternum chin up is a unique chin up variation named after Vince Gironda and used to target the entire back as opposed to just the lats. By leaning back while performing the Gironda sternum chin up, you get a greater contraction on all of the back muscles of the upper back.	100	Back
7	Bent-Over One-Arm Dumbbell	ry to keeping your back parallel to ceiling. And then come back down to a slight bend your elbow. And come back up like this breathe out on the way up you jerk for so hold the dumbbell.	140	Back
8	Standing Barbell Press	Stand with your body upright and core muscles braced, looking straight ahead. Hold the bar on your upper chest, gripping it with hands just wider than shoulder-	130	Shoulder
9	Standing One- Arm Barbell Press	Hold the barbell in a front-rack position (resting on the front of your shoulders), with your elbows pointing forward. Breathe, tighten your core, and press the barbell overhead. Press until your arms are fully locked out.	40	Shoulder
10	Seated Dumbbell Press	Hold the dumbbells by your shoulders with your palms facing forwards and your elbows out to the sides and bent at a 90° angle. Without leaning back, extend through your elbows to press the weights above your head. Then slowly return to the starting position.	180	Shoulder
11	Skullcrushers	Lie down on a bench or the floor holding a pair of dumbbells directly above your chest with your palms facing each other. Your feet should be flat on the floor. Without moving your upper arms, bend your elbows and slowly lower the weights toward the sides of your head. Avoid flaring your elbows.	135	Arm
12	Sumo Deadlifts	Feet under bar with a wide stance. And your toes. Out squat down and grasp bar squeeze the bar off the floor and drag it up your legs until it locks out of the top do not pull back into the shins	183	Arm
13	Bulgarian Split Squats instructions	Stand 2 to 3 feet in front of a knee-high platform. Extend your right leg behind you and rest your toes on the bench. ... Keeping your torso upright, slowly lower your right knee toward the floor. ... Reverse the move and return to the starting position.	100	Arm
\.


--
-- Name: login_security_security_id_seq; Type: SEQUENCE SET; Schema: public; Owner: juliomorenobustillos
--

SELECT pg_catalog.setval('public.login_security_security_id_seq', 1, false);


--
-- Name: scheduled_workouts_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: juliomorenobustillos
--

SELECT pg_catalog.setval('public.scheduled_workouts_schedule_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: juliomorenobustillos
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);


--
-- Name: workouts_workout_id_seq; Type: SEQUENCE SET; Schema: public; Owner: juliomorenobustillos
--

SELECT pg_catalog.setval('public.workouts_workout_id_seq', 13, true);


--
-- Name: login_security login_security_pkey; Type: CONSTRAINT; Schema: public; Owner: juliomorenobustillos
--

ALTER TABLE ONLY public.login_security
    ADD CONSTRAINT login_security_pkey PRIMARY KEY (security_id);


--
-- Name: scheduled_workouts scheduled_workouts_pkey; Type: CONSTRAINT; Schema: public; Owner: juliomorenobustillos
--

ALTER TABLE ONLY public.scheduled_workouts
    ADD CONSTRAINT scheduled_workouts_pkey PRIMARY KEY (schedule_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: juliomorenobustillos
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: workouts workouts_pkey; Type: CONSTRAINT; Schema: public; Owner: juliomorenobustillos
--

ALTER TABLE ONLY public.workouts
    ADD CONSTRAINT workouts_pkey PRIMARY KEY (workout_id);


--
-- Name: login_security login_security_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: juliomorenobustillos
--

ALTER TABLE ONLY public.login_security
    ADD CONSTRAINT login_security_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: scheduled_workouts scheduled_workouts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: juliomorenobustillos
--

ALTER TABLE ONLY public.scheduled_workouts
    ADD CONSTRAINT scheduled_workouts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: scheduled_workouts scheduled_workouts_workout_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: juliomorenobustillos
--

ALTER TABLE ONLY public.scheduled_workouts
    ADD CONSTRAINT scheduled_workouts_workout_id_fkey FOREIGN KEY (workout_id) REFERENCES public.workouts(workout_id);


--
-- PostgreSQL database dump complete
--

