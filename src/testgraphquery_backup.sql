--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 17.5

-- Started on 2025-06-08 17:44:33

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
-- TOC entry 220 (class 1259 OID 36116)
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    address_id text,
    address text
);


ALTER TABLE public.address OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 36091)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customer_id text,
    customer_name text
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 36106)
-- Name: order_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_type (
    order_type text
);


ALTER TABLE public.order_type OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 36111)
-- Name: product_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_type (
    product_type_id text,
    product_type_name text
);


ALTER TABLE public.product_type OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 36101)
-- Name: sales_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_order (
    order_id text,
    order_type text,
    description text,
    product_type_id text,
    customer_id text,
    quantity text,
    order_date text
);


ALTER TABLE public.sales_order OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 36096)
-- Name: sales_order_shipto_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_order_shipto_address (
    id text,
    order_id text,
    address_id text,
    quantity text
);


ALTER TABLE public.sales_order_shipto_address OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 36121)
-- Name: combine_nodeview; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.combine_nodeview AS
 SELECT (('sales_order'::text || ':'::text) || sales_order.order_id) AS entity_id,
    'sales_order'::text AS entity_type,
    sales_order.description AS entity_value
   FROM public.sales_order
UNION
 SELECT (('address'::text || ':'::text) || address.address_id) AS entity_id,
    'address'::text AS entity_type,
    address.address AS entity_value
   FROM public.address
UNION
 SELECT (('order_type'::text || ':'::text) || order_type.order_type) AS entity_id,
    'order_type'::text AS entity_type,
    order_type.order_type AS entity_value
   FROM public.order_type
UNION
 SELECT (('customer'::text || ':'::text) || customer.customer_id) AS entity_id,
    'customer'::text AS entity_type,
    customer.customer_name AS entity_value
   FROM public.customer
UNION
 SELECT (('product_type'::text || ':'::text) || product_type.product_type_id) AS entity_id,
    'product_type'::text AS entity_type,
    product_type.product_type_name AS entity_value
   FROM public.product_type
UNION
 SELECT (('sales_order_shipto_address'::text || ':'::text) || sales_order_shipto_address.id) AS entity_id,
    'sales_order_shipto_address'::text AS entity_type,
    sales_order_shipto_address.id AS entity_value
   FROM public.sales_order_shipto_address;


ALTER VIEW public.combine_nodeview OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 36126)
-- Name: combine_relation_edgeview; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.combine_relation_edgeview AS
 SELECT (('sales_order'::text || ':'::text) || sales_order.order_id) AS from_id,
    (('product_type'::text || ':'::text) || sales_order.product_type_id) AS to_id,
    'product_type'::text AS predicate
   FROM public.sales_order
UNION
 SELECT (('product_type'::text || ':'::text) || sales_order.product_type_id) AS from_id,
    (('sales_order'::text || ':'::text) || sales_order.order_id) AS to_id,
    'product_type'::text AS predicate
   FROM public.sales_order
UNION
 SELECT (('sales_order'::text || ':'::text) || sales_order.order_id) AS from_id,
    (('customer'::text || ':'::text) || sales_order.customer_id) AS to_id,
    'customer'::text AS predicate
   FROM public.sales_order
UNION
 SELECT (('customer'::text || ':'::text) || sales_order.customer_id) AS from_id,
    (('sales_order'::text || ':'::text) || sales_order.order_id) AS to_id,
    'product_type'::text AS predicate
   FROM public.sales_order
UNION
 SELECT (('sales_order'::text || ':'::text) || sales_order.order_id) AS from_id,
    (('order_type'::text || ':'::text) || sales_order.order_type) AS to_id,
    'order_type'::text AS predicate
   FROM public.sales_order
UNION
 SELECT (('order_type'::text || ':'::text) || sales_order.order_type) AS from_id,
    (('sales_order'::text || ':'::text) || sales_order.order_id) AS to_id,
    'order_type'::text AS predicate
   FROM public.sales_order
UNION
 SELECT (('sales_order'::text || ':'::text) || sales_order_shipto_address.order_id) AS from_id,
    (('address'::text || ':'::text) || sales_order_shipto_address.address_id) AS to_id,
    'order_address'::text AS predicate
   FROM public.sales_order_shipto_address
UNION
 SELECT (('address'::text || ':'::text) || sales_order_shipto_address.address_id) AS from_id,
    (('sales_order'::text || ':'::text) || sales_order_shipto_address.order_id) AS to_id,
    'order_address'::text AS predicate
   FROM public.sales_order_shipto_address;


ALTER VIEW public.combine_relation_edgeview OWNER TO postgres;

--
-- TOC entry 4865 (class 0 OID 36116)
-- Dependencies: 220
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.address (address_id, address) FROM stdin;
a1	street address1
a2	street address2
\.


--
-- TOC entry 4860 (class 0 OID 36091)
-- Dependencies: 215
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (customer_id, customer_name) FROM stdin;
c1	xyz
\.


--
-- TOC entry 4863 (class 0 OID 36106)
-- Dependencies: 218
-- Data for Name: order_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_type (order_type) FROM stdin;
retail
\.


--
-- TOC entry 4864 (class 0 OID 36111)
-- Dependencies: 219
-- Data for Name: product_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_type (product_type_id, product_type_name) FROM stdin;
p1	laptop
\.


--
-- TOC entry 4862 (class 0 OID 36101)
-- Dependencies: 217
-- Data for Name: sales_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales_order (order_id, order_type, description, product_type_id, customer_id, quantity, order_date) FROM stdin;
ord1	retail	new order	p1	c1	200	2025-04-25
\.


--
-- TOC entry 4861 (class 0 OID 36096)
-- Dependencies: 216
-- Data for Name: sales_order_shipto_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales_order_shipto_address (id, order_id, address_id, quantity) FROM stdin;
1-1	ord1	a1	100
1-2	ord1	a2	100
\.


-- Completed on 2025-06-08 17:44:34

--
-- PostgreSQL database dump complete
--

