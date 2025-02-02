toc.dat                                                                                             0000600 0004000 0002000 00000016273 14743214351 0014454 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                        }            cms_app    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         �           1262    16860    cms_app    DATABASE     }   CREATE DATABASE cms_app WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Malaysia.1252';
    DROP DATABASE cms_app;
                postgres    false         �            1259    16923    cms_history    TABLE     �   CREATE TABLE public.cms_history (
    id bigint NOT NULL,
    qr_string character varying(999),
    user_id bigint,
    voucher_id bigint
);
    DROP TABLE public.cms_history;
       public         heap    postgres    false         �            1259    16922    cms_history_id_seq    SEQUENCE     {   CREATE SEQUENCE public.cms_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.cms_history_id_seq;
       public          postgres    false    220         �           0    0    cms_history_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.cms_history_id_seq OWNED BY public.cms_history.id;
          public          postgres    false    219         �            1259    16881    cms_useraccount    TABLE     �  CREATE TABLE public.cms_useraccount (
    user_id bigint NOT NULL,
    buy_type character varying(255),
    gift_limit integer,
    name character varying(255),
    phonenumber character varying(255),
    purchase_limit integer,
    status character varying(255),
    CONSTRAINT cms_useraccount_buy_type_check CHECK (((buy_type)::text = ANY ((ARRAY['MYSELF_ONLY'::character varying, 'GIFT_TO_OTHERS'::character varying])::text[])))
);
 #   DROP TABLE public.cms_useraccount;
       public         heap    postgres    false         �            1259    16880    cms_useraccount_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cms_useraccount_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.cms_useraccount_user_id_seq;
       public          postgres    false    218                     0    0    cms_useraccount_user_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.cms_useraccount_user_id_seq OWNED BY public.cms_useraccount.user_id;
          public          postgres    false    217         �            1259    16872    cms_voucher    TABLE     l  CREATE TABLE public.cms_voucher (
    id bigint NOT NULL,
    amount numeric(38,2),
    description text,
    expiry_date date,
    image_url character varying(900),
    payment_method character varying(255),
    payment_method_discount numeric(38,2),
    quantity integer,
    title character varying(255),
    userid bigint,
    status character varying(255)
);
    DROP TABLE public.cms_voucher;
       public         heap    postgres    false         �            1259    16871    cms_voucher_id_seq    SEQUENCE     {   CREATE SEQUENCE public.cms_voucher_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.cms_voucher_id_seq;
       public          postgres    false    216                    0    0    cms_voucher_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.cms_voucher_id_seq OWNED BY public.cms_voucher.id;
          public          postgres    false    215         \           2604    16926    cms_history id    DEFAULT     p   ALTER TABLE ONLY public.cms_history ALTER COLUMN id SET DEFAULT nextval('public.cms_history_id_seq'::regclass);
 =   ALTER TABLE public.cms_history ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220         [           2604    16884    cms_useraccount user_id    DEFAULT     �   ALTER TABLE ONLY public.cms_useraccount ALTER COLUMN user_id SET DEFAULT nextval('public.cms_useraccount_user_id_seq'::regclass);
 F   ALTER TABLE public.cms_useraccount ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    218    217    218         Z           2604    16875    cms_voucher id    DEFAULT     p   ALTER TABLE ONLY public.cms_voucher ALTER COLUMN id SET DEFAULT nextval('public.cms_voucher_id_seq'::regclass);
 =   ALTER TABLE public.cms_voucher ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216         �          0    16923    cms_history 
   TABLE DATA           I   COPY public.cms_history (id, qr_string, user_id, voucher_id) FROM stdin;
    public          postgres    false    220       4856.dat �          0    16881    cms_useraccount 
   TABLE DATA           s   COPY public.cms_useraccount (user_id, buy_type, gift_limit, name, phonenumber, purchase_limit, status) FROM stdin;
    public          postgres    false    218       4854.dat �          0    16872    cms_voucher 
   TABLE DATA           �   COPY public.cms_voucher (id, amount, description, expiry_date, image_url, payment_method, payment_method_discount, quantity, title, userid, status) FROM stdin;
    public          postgres    false    216       4852.dat            0    0    cms_history_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.cms_history_id_seq', 2, true);
          public          postgres    false    219                    0    0    cms_useraccount_user_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.cms_useraccount_user_id_seq', 24, true);
          public          postgres    false    217                    0    0    cms_voucher_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.cms_voucher_id_seq', 24, true);
          public          postgres    false    215         c           2606    16930    cms_history cms_history_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.cms_history
    ADD CONSTRAINT cms_history_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.cms_history DROP CONSTRAINT cms_history_pkey;
       public            postgres    false    220         a           2606    16889 $   cms_useraccount cms_useraccount_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.cms_useraccount
    ADD CONSTRAINT cms_useraccount_pkey PRIMARY KEY (user_id);
 N   ALTER TABLE ONLY public.cms_useraccount DROP CONSTRAINT cms_useraccount_pkey;
       public            postgres    false    218         _           2606    16879    cms_voucher cms_voucher_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.cms_voucher
    ADD CONSTRAINT cms_voucher_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.cms_voucher DROP CONSTRAINT cms_voucher_pkey;
       public            postgres    false    216                                                                                                                                                                                                                                                                                                                                             4856.dat                                                                                            0000600 0004000 0002000 00000001733 14743214351 0014270 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	iVBORw0KGgoAAAANSUhEUgAAASwAAAEsAQAAAABRBrPYAAABMUlEQVR4Xu3WMW7DMAwFUGbyMXRU66g+QkZPdfU/KacgXLQFamb5f3Ak5mkiKNuO3+RpuXIZsRSxFLEUsRSxFLGUv7HdIm1setsfR4/CQ6yO+W6IuX2tELEi1tEY7xPEWKF3Ym9h51bsnezD1s3bJlbPGDKz5esVJlbGLNJ29om9Y8Tq2CtkqSaWajcxv6SiO93vrOOcG7EahpcGH9syLy4cWdE7sSp29skWWrIhsBKrYt6smc2iT+OUV8RKWIT1eKBZM2KVzIenjV++Qzg8iFgFw59Mw6DgwXQcECtjZ50Mq6uREZu5i7HeOSjctgMfVWHFahle5/iqXX2MFv4tVszQLLAQ+zfNEruHMYPxAObmemTEbmSoIM7QLLZtnherYD9FLEUsRSxFLEUsRSzln9knubiqYpcXE1IAAAAASUVORK5CYII=	23	23
2	iVBORw0KGgoAAAANSUhEUgAAASwAAAEsAQAAAABRBrPYAAABLklEQVR4Xu3XMZLCMAwFUFP5GD5qfFQfgTJVhL+kGbxadhZmiNL8X4DjPFd/REiRd3IvcedlyELIQshCyELIQshCPmN78bS52mS/SfeNG1kesyvpTQ5nbb1BlsQ6iulNhX1od2QXMRkVtZFdyHBTyC5img6xrsjsO4cVT9u1Me1OQ5bHlhw2Mj9DFnIK07IqBkXLsv9T3h1ZGtNBmW8Uo7qYK7FHClkWE9/qaOx5Sgsky2RelrLiI0OWydAOtqwstX7g12SRncaewQF7fNgzhCyP6XggzfCB9RQjPGXITmV2hZ4wN3pAj1bbJ0tiHe04q37gRVlkGQwV6Q/XgP2zLLKz2WbvFmvIkphmsrkaS21kiax4cHMDE20Mc0OWxf4LWQhZCFkIWQhZCFnIl9kDOSvMIie90icAAAAASUVORK5CYII=	24	24
\.


                                     4854.dat                                                                                            0000600 0004000 0002000 00000002077 14743214351 0014270 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	MYSELF_ONLY	\N	John Doe	+6598765432	5	\N
2	MYSELF_ONLY	\N	John Doe	+6598765433	5	\N
3	MYSELF_ONLY	\N	John Doe	+6598765434	5	\N
4	MYSELF_ONLY	\N	John Doe	+6598765435	5	\N
5	MYSELF_ONLY	\N	John Doe	+6598765436	5	\N
6	MYSELF_ONLY	\N	John Doe	+65987654364	5	\N
7	MYSELF_ONLY	\N	John Doe	+6598765466	5	\N
8	MYSELF_ONLY	\N	John Doe	+65987654343	5	\N
9	MYSELF_ONLY	\N	John Doe	+65987654323	5	\N
10	MYSELF_ONLY	\N	John Doe	+65987652236	5	\N
11	MYSELF_ONLY	\N	John Doe	+659876522362	5	\N
12	MYSELF_ONLY	\N	John Doe	+65876522362	5	\N
13	MYSELF_ONLY	\N	John Doe	+658765223642	5	\N
14	MYSELF_ONLY	\N	John Doe	+658765223342	5	\N
15	MYSELF_ONLY	\N	John Doe	+658264223342	5	\N
16	MYSELF_ONLY	\N	John Doe	+6582264223342	5	\N
17	MYSELF_ONLY	\N	John Doe	+658228823342	5	\N
18	MYSELF_ONLY	\N	John Doe	+6582828823342	5	\N
19	MYSELF_ONLY	\N	John Doe	+6582828342	5	\N
20	MYSELF_ONLY	\N	John Doe	+658282822342	5	\N
21	MYSELF_ONLY	\N	John Doe	+65828282232562	5	\N
22	MYSELF_ONLY	\N	John Doe	+6582223253562	5	\N
23	MYSELF_ONLY	\N	John Doe	+658222388882	5	\N
24	MYSELF_ONLY	\N	John Doe	+6582222388882	5	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                 4852.dat                                                                                            0000600 0004000 0002000 00000012703 14743214351 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	50.00	Get a 20% discount on all purchases	\N	https://example.com/voucher.jpg	VISA	\N	2	Holiday Special Voucher	1	A
2	50.00	Get a 20% discount on all purchases	\N	https://example.com/voucher.jpg	VISA	\N	2	Holiday Special Voucher	2	A
3	50.00	Get a 20% discount on all purchases	\N	https://example.com/voucher.jpg	VISA	\N	2	Holiday Special Voucher	3	A
4	50.00	Get a 20% discount on all purchases	\N	https://example.com/voucher.jpg	Master	\N	2	Holiday Special Voucher	4	A
5	50.00	Get a 20% discount on all purchases	\N	https://example.com/voucher.jpg	Master	\N	2	Holiday Special Voucher	5	A
6	50.00	Get a 20% discount on all purchases	\N	https://example.com/voucher.jpg	VISA	\N	2	Holiday Special Voucher	6	A
7	50.00	Get a 20% discount on all purchases	\N	https://example.com/voucher.jpg	VISA	\N	2	Holiday Special Voucher	7	A
8	50.00	Get a 20% discount on all purchases	\N	https://example.com/voucher.jpg	VISA	\N	2	Holiday Special Voucher	8	A
9	50.00	Get a 20% discount on all purchases	\N	https://example.com/voucher.jpg	VISA	\N	2	Holiday Special Voucher	9	A
10	50.00	Get a 20% discount on all purchases	\N	https://example.com/voucher.jpg	Master	\N	2	Holiday Special Voucher	10	A
11	50.00	Get a 20% discount on all purchases	\N	https://example.com/voucher.jpg	Master	\N	2	Holiday Special Voucher	11	A
12	50.00	Get a 20% discount on all purchases	\N	https://example.com/voucher.jpg	Master	\N	2	Holiday Special Voucher	12	A
13	50.00	Get a 20% discount on all purchases	\N	https://example.com/voucher.jpg	Master	\N	2	Holiday Special Voucher	13	A
14	50.00	Get a 20% discount on all purchases	\N	https://example.com/voucher.jpg	Master	\N	2	Holiday Special Voucher	14	A
15	50.00	Get a 20% discount on all purchases	\N	https://example.com/voucher.jpg	Master	\N	2	Holiday Special Voucher	15	A
16	50.00	Get a 20% discount on all purchases	\N	https://example.com/voucher.jpg	Master	\N	2	Holiday Special Voucher	16	A
17	50.00	Get a 20% discount on all purchases	\N	https://example.com/voucher.jpg	VISA	\N	2	Holiday Special Voucher	17	A
18	50.00	Get a 20% discount on all purchases	\N	https://example.com/voucher.jpg	VISA	\N	2	Holiday Special Voucher	18	A
19	50.00	Get a 20% discount on all purchases	\N	iVBORw0KGgoAAAANSUhEUgAAASwAAAEsAQAAAABRBrPYAAABLklEQVR4Xu3ZMW7DMBAEwHPFZ/Cp5lP1hJSqzHD3TrFyCZAEiE/NbmFT5LBakLZhm7/Jm+WZbyOWIpYiliKWIpYilvI3tlukr9F97rc5YuImVsf8aY4+H8H6eUGsiA0UMzqFv7A7sYvY3BpqE7uQYXGKXcSYAXEeifl7DbNI39kYu2PE6tgpDz8ynyOW8hLGshoOCsvy71PRnVgZ4xlZU9vzM4QbxAqZtwPbcGQozodHrIRN9IRf18zO0WIsUKyIsZ21aHyxFjZGYjXsmeO03PmEewwRq2AsBumO484a+ciIvZT5U/S0HRuGNZ8XK2IDxZDxuhqg9rUssQqGERubxwaxC5hh8WDdlVgVY8jWxYUNYuUMFSEfzP+LsCZWx36KWIpYiliKWIpYiljKP7N3lq9NdD+IfMEAAAAASUVORK5CYII=	VISA	\N	2	Holiday Special Voucher	19	A
20	50.00	Get a 20% discount on all purchases	\N	iVBORw0KGgoAAAANSUhEUgAAASwAAAEsAQAAAABRBrPYAAABMUlEQVR4Xu3XMRKCMBAF0FhxjBw1HJUjWKYCs38XkEVHnTFL838RSfJS/QlqWr7JPfmVlyFzIXMhcyFzIXMhc/mN1WTJbTLmeltGW7iRxTGdmdDheYMsiI1SjIo04IB0R3YJ26ZkFzLZ3J/Ighlim3h63iALYajI2hkx2AJZHNtTrbZjyFy6sFZWmYZ2URIGeXHpMJAFMqkINuHAnNrlwfR4s8i6srabl60nMExPnZL1Y8ssFbXPrSeyCxh6kk0RsonGirsyZL2ZpbEi3VlOZVnIDug/DBVJct2/v1tZ6y8rshCms/UvnTwps5AFMa0oy23J2p0cPZVFFsHq8cUFSxbNIIaV5XdlkfVhiJY1oSK5N2ShzMrBOhorcm+KHiaLYZ9C5kLmQuZC5kLmQubyZ/YAqISwA0v+0HIAAAAASUVORK5CYII=	VISA	\N	2	Holiday Special Voucher	20	A
21	50.00	Get a 20% discount on all purchases	\N	iVBORw0KGgoAAAANSUhEUgAAASwAAAEsAQAAAABRBrPYAAABLklEQVR4Xu3WMW7DMBAEwHPFZ/Cp4lP5BJeqfOEu6UQ+OEgCRKdmt7Apcq5aUJD5b3K3uPM2YiFiIWIhYiFiIWIhf2O7rdSx2ny/eVsbN7E8Np+8VX8sVo8HYkmsoZhWKeYPuxO7iHkvqE3sQoZDF7uIMQ3iuBKb/znMVurOxtgdI5bHDnnMK/MasZBTGMsquCgsa35Pre7Estjc5xbKGmLrmMKoWCKz6twn49trWbFMZtjquDsU2G0YFctibIcWX7WfA7EssVPZV0ZPhgGKhssjlsVwyFA4awP79rtX7Aw2n+a92fpzgFYskTW+syosDhvoGIhliWUwrNiYs7bCY7F85r0sMQbEUhkzmCGYgl1KLIfxcGSWZc8pK2J57KeIhYiFiIWIhYiFiIX8M/sAxLF9RCG4g4UAAAAASUVORK5CYII=	VISA	\N	2	Holiday Special Voucher	21	A
22	50.00	Get a 20% discount on all purchases	\N	iVBORw0KGgoAAAANSUhEUgAAASwAAAEsAQAAAABRBrPYAAABNklEQVR4Xu3XsY7DIBAEUFLxGXyq+VQ+4UqqcMywtnybSLmTzutmpkhseFSjjZ00fpOv5FfeRsxFzEXMRcxFzEXM5W+sJ0uZV9voj1Ft4SEWx9bdqGU8jZXzhlgQqyimFor1we7EbmKjZdQmdiPD5hC7iTEV4nwltr5jWLKUzsbYHSMWx055rpH5GTGXSxjLyhgUlrXep6w7sSh2VNTy/kLLp4kfGbGrWcqwe0UV3fGlSiyKdftjbcFts54YsQg2y5rrzNxkRRiexMbEotgRTEvBKY4RhgcRi2B9FTXXuXmIfW7EQti6s54aT7wZGbGrWcVvFhk3K+T2WpZYBOt4nKMxfrTMbbFoNtvB83vD8uxOLJQxZHZgNSYWyJKFI9MSTvEqi8WxTxFzEXMRcxFzEXMRc/ln9g1wDYXw7FAIEAAAAABJRU5ErkJggg==	VISA	\N	2	Holiday Special Voucher	22	A
23	50.00	Get a 20% discount on all purchases	\N	iVBORw0KGgoAAAANSUhEUgAAASwAAAEsAQAAAABRBrPYAAABKklEQVR4Xu3WPQ7DIAwFYDLlGBw1HDVH6JgpFD87f1artlJxlvcGFMPHZJk21W/ySH7nZchcyFzIXMhcyFzIXH5jS7LkVpS8DLXYxkAWx7Qyocv5gCyIFWmMijTigvSO7Ba2l2Q3Mjk8vsiCGWKH+DofkIUwtMi6U7DYBlkcO7JY264hc+nCWrOmeWyDkrDIw6XLSBbIsLWmSYdHDmctr5NF1pO1tOcKYpW2rWa3kEWwxUamzkJxQW+la0/JurLzS6VLxoGFLIIdQZ8qRkYeLgtZBNPxELENSoHN7leGrCvTajvUr1PIglixFqE8euebRRbBmpiqdAylLGTxrF7/0L5rFlkfhrRm2YWKuZGSLIwlyz4yk97S22Qh7FPIXMhcyFzIXMhcyFz+zJ4PviwOL4rWVQAAAABJRU5ErkJggg==	VISA	\N	2	Holiday Special Voucher	23	A
24	50.00	Get a 20% discount on all purchases	\N	iVBORw0KGgoAAAANSUhEUgAAASwAAAEsAQAAAABRBrPYAAABMUlEQVR4Xu3WsW7EIBAEUK7iM/hU+FQ+IaWr2zCz6OKsLCWRcutmpuAwPKoRZxf7TT5KXLmMWIhYiFiIWIhYiFjI39hRdtqadTseNvbCQyyP+ZONZs/N2nlDLIkNFDMahQ/sTuwmZrOiNrEbGTZN7CbGDIjzTMx/c1jZaQcbY3eMWB475elX5nvEQt7CWFbFRWFZ/j21uxNLZbges6IsbE68TS5vlti7GJZYFq+MP64Z1sSyGIJ2fEB33QsUS2QHNtET1ycHP8ANsRT2FVSEe9Mx62KZDJsMhA9eGxsTS2L+tL+iJg/wKKxYHhtlFbOYvV7ndlWWWAbz2tgY1iq3xbJZWVnfsh1rr4glMWYz74kvErFExs2VhgOzYKj7L0wsi/0UsRCxELEQsRCxELGQf2afQe9tVKhRUR4AAAAASUVORK5CYII=	VISA	\N	2	Holiday Special Voucher	24	A
\.


                                                             restore.sql                                                                                         0000600 0004000 0002000 00000015105 14743214351 0015372 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

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

DROP DATABASE cms_app;
--
-- Name: cms_app; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE cms_app WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Malaysia.1252';


ALTER DATABASE cms_app OWNER TO postgres;

\connect cms_app

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
-- Name: cms_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cms_history (
    id bigint NOT NULL,
    qr_string character varying(999),
    user_id bigint,
    voucher_id bigint
);


ALTER TABLE public.cms_history OWNER TO postgres;

--
-- Name: cms_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cms_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cms_history_id_seq OWNER TO postgres;

--
-- Name: cms_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cms_history_id_seq OWNED BY public.cms_history.id;


--
-- Name: cms_useraccount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cms_useraccount (
    user_id bigint NOT NULL,
    buy_type character varying(255),
    gift_limit integer,
    name character varying(255),
    phonenumber character varying(255),
    purchase_limit integer,
    status character varying(255),
    CONSTRAINT cms_useraccount_buy_type_check CHECK (((buy_type)::text = ANY ((ARRAY['MYSELF_ONLY'::character varying, 'GIFT_TO_OTHERS'::character varying])::text[])))
);


ALTER TABLE public.cms_useraccount OWNER TO postgres;

--
-- Name: cms_useraccount_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cms_useraccount_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cms_useraccount_user_id_seq OWNER TO postgres;

--
-- Name: cms_useraccount_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cms_useraccount_user_id_seq OWNED BY public.cms_useraccount.user_id;


--
-- Name: cms_voucher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cms_voucher (
    id bigint NOT NULL,
    amount numeric(38,2),
    description text,
    expiry_date date,
    image_url character varying(900),
    payment_method character varying(255),
    payment_method_discount numeric(38,2),
    quantity integer,
    title character varying(255),
    userid bigint,
    status character varying(255)
);


ALTER TABLE public.cms_voucher OWNER TO postgres;

--
-- Name: cms_voucher_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cms_voucher_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cms_voucher_id_seq OWNER TO postgres;

--
-- Name: cms_voucher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cms_voucher_id_seq OWNED BY public.cms_voucher.id;


--
-- Name: cms_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cms_history ALTER COLUMN id SET DEFAULT nextval('public.cms_history_id_seq'::regclass);


--
-- Name: cms_useraccount user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cms_useraccount ALTER COLUMN user_id SET DEFAULT nextval('public.cms_useraccount_user_id_seq'::regclass);


--
-- Name: cms_voucher id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cms_voucher ALTER COLUMN id SET DEFAULT nextval('public.cms_voucher_id_seq'::regclass);


--
-- Data for Name: cms_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cms_history (id, qr_string, user_id, voucher_id) FROM stdin;
\.
COPY public.cms_history (id, qr_string, user_id, voucher_id) FROM '$$PATH$$/4856.dat';

--
-- Data for Name: cms_useraccount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cms_useraccount (user_id, buy_type, gift_limit, name, phonenumber, purchase_limit, status) FROM stdin;
\.
COPY public.cms_useraccount (user_id, buy_type, gift_limit, name, phonenumber, purchase_limit, status) FROM '$$PATH$$/4854.dat';

--
-- Data for Name: cms_voucher; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cms_voucher (id, amount, description, expiry_date, image_url, payment_method, payment_method_discount, quantity, title, userid, status) FROM stdin;
\.
COPY public.cms_voucher (id, amount, description, expiry_date, image_url, payment_method, payment_method_discount, quantity, title, userid, status) FROM '$$PATH$$/4852.dat';

--
-- Name: cms_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cms_history_id_seq', 2, true);


--
-- Name: cms_useraccount_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cms_useraccount_user_id_seq', 24, true);


--
-- Name: cms_voucher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cms_voucher_id_seq', 24, true);


--
-- Name: cms_history cms_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cms_history
    ADD CONSTRAINT cms_history_pkey PRIMARY KEY (id);


--
-- Name: cms_useraccount cms_useraccount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cms_useraccount
    ADD CONSTRAINT cms_useraccount_pkey PRIMARY KEY (user_id);


--
-- Name: cms_voucher cms_voucher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cms_voucher
    ADD CONSTRAINT cms_voucher_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           