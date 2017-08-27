SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: bauji_dev; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA bauji_dev;


SET search_path = bauji_dev, pg_catalog;

--
-- Name: payment_gateway; Type: TYPE; Schema: bauji_dev; Owner: -
--

CREATE TYPE payment_gateway AS ENUM (
    'CCAvenue',
    'Instamojo',
    'PayUMoney',
    'RazorPay',
    'PayPal',
    'Stripe'
);


--
-- Name: transaction_status; Type: TYPE; Schema: bauji_dev; Owner: -
--

CREATE TYPE transaction_status AS ENUM (
    'Initiated',
    'Success',
    'Failed'
);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: bauji_dev; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: certifications; Type: TABLE; Schema: bauji_dev; Owner: -
--

CREATE TABLE certifications (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    terms text NOT NULL,
    seo_meta_keywords character varying[] NOT NULL,
    seo_meta_description character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slug character varying
);


--
-- Name: certifications_id_seq; Type: SEQUENCE; Schema: bauji_dev; Owner: -
--

CREATE SEQUENCE certifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: certifications_id_seq; Type: SEQUENCE OWNED BY; Schema: bauji_dev; Owner: -
--

ALTER SEQUENCE certifications_id_seq OWNED BY certifications.id;


--
-- Name: coupons; Type: TABLE; Schema: bauji_dev; Owner: -
--

CREATE TABLE coupons (
    id bigint NOT NULL,
    name character varying NOT NULL,
    voucher_code character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: coupons_id_seq; Type: SEQUENCE; Schema: bauji_dev; Owner: -
--

CREATE SEQUENCE coupons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: coupons_id_seq; Type: SEQUENCE OWNED BY; Schema: bauji_dev; Owner: -
--

ALTER SEQUENCE coupons_id_seq OWNED BY coupons.id;


--
-- Name: discounts; Type: TABLE; Schema: bauji_dev; Owner: -
--

CREATE TABLE discounts (
    id bigint NOT NULL,
    registration_quantity integer NOT NULL,
    discount_value numeric(6,2),
    discount_percentage numeric(3,2) DEFAULT 0.1,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: discounts_id_seq; Type: SEQUENCE; Schema: bauji_dev; Owner: -
--

CREATE SEQUENCE discounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: discounts_id_seq; Type: SEQUENCE OWNED BY; Schema: bauji_dev; Owner: -
--

ALTER SEQUENCE discounts_id_seq OWNED BY discounts.id;


--
-- Name: friendly_id_slugs; Type: TABLE; Schema: bauji_dev; Owner: -
--

CREATE TABLE friendly_id_slugs (
    id bigint NOT NULL,
    slug character varying NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying,
    created_at timestamp without time zone
);


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: bauji_dev; Owner: -
--

CREATE SEQUENCE friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: bauji_dev; Owner: -
--

ALTER SEQUENCE friendly_id_slugs_id_seq OWNED BY friendly_id_slugs.id;


--
-- Name: job_posts; Type: TABLE; Schema: bauji_dev; Owner: -
--

CREATE TABLE job_posts (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    location character varying(100) NOT NULL,
    experience int4range NOT NULL,
    description text NOT NULL,
    skills text NOT NULL,
    active boolean DEFAULT false NOT NULL,
    seo_meta_keywords character varying[] NOT NULL,
    seo_meta_description character varying(150) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slug character varying
);


--
-- Name: job_posts_id_seq; Type: SEQUENCE; Schema: bauji_dev; Owner: -
--

CREATE SEQUENCE job_posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: job_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: bauji_dev; Owner: -
--

ALTER SEQUENCE job_posts_id_seq OWNED BY job_posts.id;


--
-- Name: learners; Type: TABLE; Schema: bauji_dev; Owner: -
--

CREATE TABLE learners (
    id bigint NOT NULL,
    email character varying(100) NOT NULL,
    first_name character varying(50) NOT NULL,
    middle_name character varying DEFAULT ''::character varying,
    last_name character varying(50) NOT NULL,
    phone_number character varying(50) NOT NULL,
    company_name character varying NOT NULL,
    job_role character varying(50) NOT NULL,
    certifications text DEFAULT ''::text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: learners_id_seq; Type: SEQUENCE; Schema: bauji_dev; Owner: -
--

CREATE SEQUENCE learners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: learners_id_seq; Type: SEQUENCE OWNED BY; Schema: bauji_dev; Owner: -
--

ALTER SEQUENCE learners_id_seq OWNED BY learners.id;


--
-- Name: offers; Type: TABLE; Schema: bauji_dev; Owner: -
--

CREATE TABLE offers (
    id bigint NOT NULL,
    available_from date NOT NULL,
    available_to date NOT NULL,
    discount_id bigint,
    coupon_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    available_limit integer DEFAULT 5 NOT NULL
);


--
-- Name: offers_id_seq; Type: SEQUENCE; Schema: bauji_dev; Owner: -
--

CREATE SEQUENCE offers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: offers_id_seq; Type: SEQUENCE OWNED BY; Schema: bauji_dev; Owner: -
--

ALTER SEQUENCE offers_id_seq OWNED BY offers.id;


--
-- Name: orders; Type: TABLE; Schema: bauji_dev; Owner: -
--

CREATE TABLE orders (
    id bigint NOT NULL,
    order_id character varying,
    gateway_transaction_id character varying,
    order_value numeric(9,2) NOT NULL,
    offer_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    transaction_status transaction_status,
    payment_gateway payment_gateway
);


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: bauji_dev; Owner: -
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: bauji_dev; Owner: -
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: registrations; Type: TABLE; Schema: bauji_dev; Owner: -
--

CREATE TABLE registrations (
    id bigint NOT NULL,
    learner_id bigint,
    workshop_id bigint,
    order_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: registrations_id_seq; Type: SEQUENCE; Schema: bauji_dev; Owner: -
--

CREATE SEQUENCE registrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: registrations_id_seq; Type: SEQUENCE OWNED BY; Schema: bauji_dev; Owner: -
--

ALTER SEQUENCE registrations_id_seq OWNED BY registrations.id;


--
-- Name: roles; Type: TABLE; Schema: bauji_dev; Owner: -
--

CREATE TABLE roles (
    id bigint NOT NULL,
    name character varying,
    resource_type character varying,
    resource_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: bauji_dev; Owner: -
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: bauji_dev; Owner: -
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: bauji_dev; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: bauji_dev; Owner: -
--

CREATE TABLE users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    failed_attempts integer DEFAULT 0 NOT NULL,
    unlock_token character varying,
    locked_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    provider character varying,
    uid character varying,
    approved boolean DEFAULT false NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: bauji_dev; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: bauji_dev; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_roles; Type: TABLE; Schema: bauji_dev; Owner: -
--

CREATE TABLE users_roles (
    user_id bigint,
    role_id bigint
);


--
-- Name: workshop_offers; Type: TABLE; Schema: bauji_dev; Owner: -
--

CREATE TABLE workshop_offers (
    id bigint NOT NULL,
    offer_id bigint,
    workshop_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: workshop_offers_id_seq; Type: SEQUENCE; Schema: bauji_dev; Owner: -
--

CREATE SEQUENCE workshop_offers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: workshop_offers_id_seq; Type: SEQUENCE OWNED BY; Schema: bauji_dev; Owner: -
--

ALTER SEQUENCE workshop_offers_id_seq OWNED BY workshop_offers.id;


--
-- Name: workshops; Type: TABLE; Schema: bauji_dev; Owner: -
--

CREATE TABLE workshops (
    id bigint NOT NULL,
    venue character varying(50) DEFAULT ''::character varying,
    city character varying(50) NOT NULL,
    country character varying(30) DEFAULT 'India'::character varying NOT NULL,
    venue_map_link character varying,
    description text,
    starts_on date NOT NULL,
    ends_on date NOT NULL,
    starts_at time without time zone NOT NULL,
    ends_at time without time zone NOT NULL,
    seats integer DEFAULT 25 NOT NULL,
    ticket_price numeric(9,2) DEFAULT 35000.0 NOT NULL,
    order_number character varying,
    exam_id character varying,
    seo_meta_keywords character varying[] NOT NULL,
    seo_meta_description character varying NOT NULL,
    certification_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slug character varying
);


--
-- Name: workshops_id_seq; Type: SEQUENCE; Schema: bauji_dev; Owner: -
--

CREATE SEQUENCE workshops_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: workshops_id_seq; Type: SEQUENCE OWNED BY; Schema: bauji_dev; Owner: -
--

ALTER SEQUENCE workshops_id_seq OWNED BY workshops.id;


--
-- Name: certifications id; Type: DEFAULT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY certifications ALTER COLUMN id SET DEFAULT nextval('certifications_id_seq'::regclass);


--
-- Name: coupons id; Type: DEFAULT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY coupons ALTER COLUMN id SET DEFAULT nextval('coupons_id_seq'::regclass);


--
-- Name: discounts id; Type: DEFAULT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY discounts ALTER COLUMN id SET DEFAULT nextval('discounts_id_seq'::regclass);


--
-- Name: friendly_id_slugs id; Type: DEFAULT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('friendly_id_slugs_id_seq'::regclass);


--
-- Name: job_posts id; Type: DEFAULT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY job_posts ALTER COLUMN id SET DEFAULT nextval('job_posts_id_seq'::regclass);


--
-- Name: learners id; Type: DEFAULT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY learners ALTER COLUMN id SET DEFAULT nextval('learners_id_seq'::regclass);


--
-- Name: offers id; Type: DEFAULT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY offers ALTER COLUMN id SET DEFAULT nextval('offers_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: registrations id; Type: DEFAULT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY registrations ALTER COLUMN id SET DEFAULT nextval('registrations_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: workshop_offers id; Type: DEFAULT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY workshop_offers ALTER COLUMN id SET DEFAULT nextval('workshop_offers_id_seq'::regclass);


--
-- Name: workshops id; Type: DEFAULT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY workshops ALTER COLUMN id SET DEFAULT nextval('workshops_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: certifications certifications_pkey; Type: CONSTRAINT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY certifications
    ADD CONSTRAINT certifications_pkey PRIMARY KEY (id);


--
-- Name: coupons coupons_pkey; Type: CONSTRAINT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY coupons
    ADD CONSTRAINT coupons_pkey PRIMARY KEY (id);


--
-- Name: discounts discounts_pkey; Type: CONSTRAINT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY discounts
    ADD CONSTRAINT discounts_pkey PRIMARY KEY (id);


--
-- Name: friendly_id_slugs friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: job_posts job_posts_pkey; Type: CONSTRAINT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY job_posts
    ADD CONSTRAINT job_posts_pkey PRIMARY KEY (id);


--
-- Name: learners learners_pkey; Type: CONSTRAINT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY learners
    ADD CONSTRAINT learners_pkey PRIMARY KEY (id);


--
-- Name: offers offers_pkey; Type: CONSTRAINT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: registrations registrations_pkey; Type: CONSTRAINT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY registrations
    ADD CONSTRAINT registrations_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: workshop_offers workshop_offers_pkey; Type: CONSTRAINT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY workshop_offers
    ADD CONSTRAINT workshop_offers_pkey PRIMARY KEY (id);


--
-- Name: workshops workshops_pkey; Type: CONSTRAINT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY workshops
    ADD CONSTRAINT workshops_pkey PRIMARY KEY (id);


--
-- Name: index_certifications_on_name; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE UNIQUE INDEX index_certifications_on_name ON certifications USING btree (name);


--
-- Name: index_certifications_on_slug; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE UNIQUE INDEX index_certifications_on_slug ON certifications USING btree (slug);


--
-- Name: index_coupons_on_voucher_code; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE UNIQUE INDEX index_coupons_on_voucher_code ON coupons USING btree (voucher_code);


--
-- Name: index_discounts_on_discount_percentage; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_discounts_on_discount_percentage ON discounts USING btree (discount_percentage);


--
-- Name: index_discounts_on_discount_value; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_discounts_on_discount_value ON discounts USING btree (discount_value);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON friendly_id_slugs USING btree (slug, sluggable_type);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON friendly_id_slugs USING btree (slug, sluggable_type, scope);


--
-- Name: index_friendly_id_slugs_on_sluggable_id; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_id ON friendly_id_slugs USING btree (sluggable_id);


--
-- Name: index_friendly_id_slugs_on_sluggable_type; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type ON friendly_id_slugs USING btree (sluggable_type);


--
-- Name: index_job_posts_on_active; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_job_posts_on_active ON job_posts USING btree (active);


--
-- Name: index_job_posts_on_location; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_job_posts_on_location ON job_posts USING btree (location);


--
-- Name: index_job_posts_on_name; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE UNIQUE INDEX index_job_posts_on_name ON job_posts USING btree (name);


--
-- Name: index_job_posts_on_slug; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE UNIQUE INDEX index_job_posts_on_slug ON job_posts USING btree (slug);


--
-- Name: index_learners_on_company_name; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_learners_on_company_name ON learners USING btree (company_name);


--
-- Name: index_learners_on_email; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE UNIQUE INDEX index_learners_on_email ON learners USING btree (email);


--
-- Name: index_learners_on_first_name; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_learners_on_first_name ON learners USING btree (first_name);


--
-- Name: index_learners_on_last_name; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_learners_on_last_name ON learners USING btree (last_name);


--
-- Name: index_learners_on_middle_name; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_learners_on_middle_name ON learners USING btree (middle_name);


--
-- Name: index_learners_on_phone_number; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_learners_on_phone_number ON learners USING btree (phone_number);


--
-- Name: index_offers_on_available_from; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_offers_on_available_from ON offers USING btree (available_from);


--
-- Name: index_offers_on_available_limit; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_offers_on_available_limit ON offers USING btree (available_limit);


--
-- Name: index_offers_on_available_to; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_offers_on_available_to ON offers USING btree (available_to);


--
-- Name: index_offers_on_coupon_id; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_offers_on_coupon_id ON offers USING btree (coupon_id);


--
-- Name: index_offers_on_discount_id; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_offers_on_discount_id ON offers USING btree (discount_id);


--
-- Name: index_orders_on_offer_id; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_orders_on_offer_id ON orders USING btree (offer_id);


--
-- Name: index_orders_on_order_id; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE UNIQUE INDEX index_orders_on_order_id ON orders USING btree (order_id);


--
-- Name: index_orders_on_order_value; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_orders_on_order_value ON orders USING btree (order_value);


--
-- Name: index_registrations_on_learner_id; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_registrations_on_learner_id ON registrations USING btree (learner_id);


--
-- Name: index_registrations_on_order_id; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_registrations_on_order_id ON registrations USING btree (order_id);


--
-- Name: index_registrations_on_workshop_id; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_registrations_on_workshop_id ON registrations USING btree (workshop_id);


--
-- Name: index_roles_on_name; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_roles_on_name ON roles USING btree (name);


--
-- Name: index_roles_on_name_and_resource_type_and_resource_id; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_roles_on_name_and_resource_type_and_resource_id ON roles USING btree (name, resource_type, resource_id);


--
-- Name: index_roles_on_resource_type_and_resource_id; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_roles_on_resource_type_and_resource_id ON roles USING btree (resource_type, resource_id);


--
-- Name: index_users_on_approved; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_users_on_approved ON users USING btree (approved);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_users_on_unlock_token; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE UNIQUE INDEX index_users_on_unlock_token ON users USING btree (unlock_token);


--
-- Name: index_users_roles_on_role_id; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_users_roles_on_role_id ON users_roles USING btree (role_id);


--
-- Name: index_users_roles_on_user_id; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_users_roles_on_user_id ON users_roles USING btree (user_id);


--
-- Name: index_users_roles_on_user_id_and_role_id; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_users_roles_on_user_id_and_role_id ON users_roles USING btree (user_id, role_id);


--
-- Name: index_workshop_offers_on_offer_id; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_workshop_offers_on_offer_id ON workshop_offers USING btree (offer_id);


--
-- Name: index_workshop_offers_on_workshop_id; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_workshop_offers_on_workshop_id ON workshop_offers USING btree (workshop_id);


--
-- Name: index_workshops_on_certification_id; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_workshops_on_certification_id ON workshops USING btree (certification_id);


--
-- Name: index_workshops_on_city; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_workshops_on_city ON workshops USING btree (city);


--
-- Name: index_workshops_on_country; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_workshops_on_country ON workshops USING btree (country);


--
-- Name: index_workshops_on_ends_on; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_workshops_on_ends_on ON workshops USING btree (ends_on);


--
-- Name: index_workshops_on_exam_id; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_workshops_on_exam_id ON workshops USING btree (exam_id);


--
-- Name: index_workshops_on_order_number; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_workshops_on_order_number ON workshops USING btree (order_number);


--
-- Name: index_workshops_on_slug; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE UNIQUE INDEX index_workshops_on_slug ON workshops USING btree (slug);


--
-- Name: index_workshops_on_starts_on; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_workshops_on_starts_on ON workshops USING btree (starts_on);


--
-- Name: index_workshops_on_ticket_price; Type: INDEX; Schema: bauji_dev; Owner: -
--

CREATE INDEX index_workshops_on_ticket_price ON workshops USING btree (ticket_price);


--
-- Name: offers fk_rails_005dc51206; Type: FK CONSTRAINT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY offers
    ADD CONSTRAINT fk_rails_005dc51206 FOREIGN KEY (discount_id) REFERENCES discounts(id);


--
-- Name: workshop_offers fk_rails_10d02fabc2; Type: FK CONSTRAINT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY workshop_offers
    ADD CONSTRAINT fk_rails_10d02fabc2 FOREIGN KEY (workshop_id) REFERENCES workshops(id);


--
-- Name: orders fk_rails_14e52088de; Type: FK CONSTRAINT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT fk_rails_14e52088de FOREIGN KEY (offer_id) REFERENCES offers(id);


--
-- Name: workshops fk_rails_2b778a2cb7; Type: FK CONSTRAINT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY workshops
    ADD CONSTRAINT fk_rails_2b778a2cb7 FOREIGN KEY (certification_id) REFERENCES certifications(id);


--
-- Name: workshop_offers fk_rails_2ba689fb65; Type: FK CONSTRAINT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY workshop_offers
    ADD CONSTRAINT fk_rails_2ba689fb65 FOREIGN KEY (offer_id) REFERENCES offers(id);


--
-- Name: registrations fk_rails_49b70b746c; Type: FK CONSTRAINT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY registrations
    ADD CONSTRAINT fk_rails_49b70b746c FOREIGN KEY (order_id) REFERENCES orders(id);


--
-- Name: registrations fk_rails_5c35f516e9; Type: FK CONSTRAINT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY registrations
    ADD CONSTRAINT fk_rails_5c35f516e9 FOREIGN KEY (learner_id) REFERENCES learners(id);


--
-- Name: offers fk_rails_952ba600c5; Type: FK CONSTRAINT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY offers
    ADD CONSTRAINT fk_rails_952ba600c5 FOREIGN KEY (coupon_id) REFERENCES coupons(id);


--
-- Name: registrations fk_rails_c8d523d3bb; Type: FK CONSTRAINT; Schema: bauji_dev; Owner: -
--

ALTER TABLE ONLY registrations
    ADD CONSTRAINT fk_rails_c8d523d3bb FOREIGN KEY (workshop_id) REFERENCES workshops(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO bauji_dev;

INSERT INTO "schema_migrations" (version) VALUES
('20170525115816'),
('20170525121426'),
('20170525121503'),
('20170525151116'),
('20170708123700'),
('20170708123717'),
('20170722162944'),
('20170722163241'),
('20170722163451'),
('20170722163532'),
('20170728131301'),
('20170728131342'),
('20170728131403'),
('20170729115044'),
('20170730062429'),
('20170730063030'),
('20170730063101'),
('20170731111327'),
('20170803134908'),
('20170805155618'),
('20170822104522');


