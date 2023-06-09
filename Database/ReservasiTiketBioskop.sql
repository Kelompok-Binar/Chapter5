PGDMP                          {            ReservasiTiketBioskop    15.2    15.2 &    (           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            )           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            *           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            +           1262    16902    ReservasiTiketBioskop    DATABASE     �   CREATE DATABASE "ReservasiTiketBioskop" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Indonesian_Indonesia.1252';
 '   DROP DATABASE "ReservasiTiketBioskop";
                postgres    false            �            1259    16903    film    TABLE     �   CREATE TABLE public.film (
    film_code character varying(10) NOT NULL,
    film_name character varying(50) NOT NULL,
    tayang_atau_tidak character varying(20)
);
    DROP TABLE public.film;
       public         heap    postgres    false            �            1259    16908    jadwal    TABLE     #  CREATE TABLE public.jadwal (
    tanggal_tayang date NOT NULL,
    jam_mulai time with time zone NOT NULL,
    jam_selesai time with time zone NOT NULL,
    harga_tiket integer NOT NULL,
    film_code character varying(10),
    studio_name "char" NOT NULL,
    id_jadwal integer NOT NULL
);
    DROP TABLE public.jadwal;
       public         heap    postgres    false            �            1259    17014    jadwal_id_jadwal_seq    SEQUENCE     �   CREATE SEQUENCE public.jadwal_id_jadwal_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.jadwal_id_jadwal_seq;
       public          postgres    false    215            ,           0    0    jadwal_id_jadwal_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.jadwal_id_jadwal_seq OWNED BY public.jadwal.id_jadwal;
          public          postgres    false    221            �            1259    16916    report    TABLE     �  CREATE TABLE public.report (
    film_name character varying(255),
    tayang_atau_tidak character varying(255),
    tanggal_tayang date,
    jam_mulai time with time zone,
    jam_selesai time with time zone,
    harga_tiket integer,
    id_jadwal integer NOT NULL,
    film_code character varying(10) NOT NULL,
    nomor_kursi integer NOT NULL,
    studio_name "char" NOT NULL,
    id_report integer NOT NULL
);
    DROP TABLE public.report;
       public         heap    postgres    false            �            1259    16994    report_id_report_seq    SEQUENCE     �   CREATE SEQUENCE public.report_id_report_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.report_id_report_seq;
       public          postgres    false    216            -           0    0    report_id_report_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.report_id_report_seq OWNED BY public.report.id_report;
          public          postgres    false    220            �            1259    16923    seats    TABLE     x   CREATE TABLE public.seats (
    nomor_kursi integer NOT NULL,
    studio_name "char",
    id_jadwal integer NOT NULL
);
    DROP TABLE public.seats;
       public         heap    postgres    false            �            1259    16928    studio    TABLE     @   CREATE TABLE public.studio (
    studio_name "char" NOT NULL
);
    DROP TABLE public.studio;
       public         heap    postgres    false            �            1259    16933    users    TABLE     �   CREATE TABLE public.users (
    id_user integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    nomor_kursi integer,
    id_jadwal integer
);
    DROP TABLE public.users;
       public         heap    postgres    false            z           2604    17015    jadwal id_jadwal    DEFAULT     t   ALTER TABLE ONLY public.jadwal ALTER COLUMN id_jadwal SET DEFAULT nextval('public.jadwal_id_jadwal_seq'::regclass);
 ?   ALTER TABLE public.jadwal ALTER COLUMN id_jadwal DROP DEFAULT;
       public          postgres    false    221    215            {           2604    16995    report id_report    DEFAULT     t   ALTER TABLE ONLY public.report ALTER COLUMN id_report SET DEFAULT nextval('public.report_id_report_seq'::regclass);
 ?   ALTER TABLE public.report ALTER COLUMN id_report DROP DEFAULT;
       public          postgres    false    220    216                      0    16903    film 
   TABLE DATA           G   COPY public.film (film_code, film_name, tayang_atau_tidak) FROM stdin;
    public          postgres    false    214   �,                 0    16908    jadwal 
   TABLE DATA           x   COPY public.jadwal (tanggal_tayang, jam_mulai, jam_selesai, harga_tiket, film_code, studio_name, id_jadwal) FROM stdin;
    public          postgres    false    215   �,                  0    16916    report 
   TABLE DATA           �   COPY public.report (film_name, tayang_atau_tidak, tanggal_tayang, jam_mulai, jam_selesai, harga_tiket, id_jadwal, film_code, nomor_kursi, studio_name, id_report) FROM stdin;
    public          postgres    false    216   R-       !          0    16923    seats 
   TABLE DATA           D   COPY public.seats (nomor_kursi, studio_name, id_jadwal) FROM stdin;
    public          postgres    false    217   �-       "          0    16928    studio 
   TABLE DATA           -   COPY public.studio (studio_name) FROM stdin;
    public          postgres    false    218   .       #          0    16933    users 
   TABLE DATA           [   COPY public.users (id_user, username, email, password, nomor_kursi, id_jadwal) FROM stdin;
    public          postgres    false    219   C.       .           0    0    jadwal_id_jadwal_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.jadwal_id_jadwal_seq', 1, true);
          public          postgres    false    221            /           0    0    report_id_report_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.report_id_report_seq', 12, true);
          public          postgres    false    220            }           2606    16907    film film_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_pkey PRIMARY KEY (film_code);
 8   ALTER TABLE ONLY public.film DROP CONSTRAINT film_pkey;
       public            postgres    false    214                       2606    17017    jadwal jadwal_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.jadwal
    ADD CONSTRAINT jadwal_pkey PRIMARY KEY (id_jadwal);
 <   ALTER TABLE ONLY public.jadwal DROP CONSTRAINT jadwal_pkey;
       public            postgres    false    215            �           2606    16997    report report_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id_report);
 <   ALTER TABLE ONLY public.report DROP CONSTRAINT report_pkey;
       public            postgres    false    216            �           2606    16927    seats seats_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.seats
    ADD CONSTRAINT seats_pkey PRIMARY KEY (nomor_kursi);
 :   ALTER TABLE ONLY public.seats DROP CONSTRAINT seats_pkey;
       public            postgres    false    217            �           2606    16932    studio studio_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.studio
    ADD CONSTRAINT studio_pkey PRIMARY KEY (studio_name);
 <   ALTER TABLE ONLY public.studio DROP CONSTRAINT studio_pkey;
       public            postgres    false    218            �           2606    16939    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    219            �           2606    16940    jadwal fk_film_code    FK CONSTRAINT     z   ALTER TABLE ONLY public.jadwal
    ADD CONSTRAINT fk_film_code FOREIGN KEY (film_code) REFERENCES public.film(film_code);
 =   ALTER TABLE ONLY public.jadwal DROP CONSTRAINT fk_film_code;
       public          postgres    false    214    215    3197            �           2606    16950    report fk_film_code    FK CONSTRAINT     z   ALTER TABLE ONLY public.report
    ADD CONSTRAINT fk_film_code FOREIGN KEY (film_code) REFERENCES public.film(film_code);
 =   ALTER TABLE ONLY public.report DROP CONSTRAINT fk_film_code;
       public          postgres    false    214    3197    216            �           2606    17022    report fk_id_jadwal    FK CONSTRAINT     |   ALTER TABLE ONLY public.report
    ADD CONSTRAINT fk_id_jadwal FOREIGN KEY (id_jadwal) REFERENCES public.jadwal(id_jadwal);
 =   ALTER TABLE ONLY public.report DROP CONSTRAINT fk_id_jadwal;
       public          postgres    false    215    3199    216            �           2606    17027    seats fk_id_jadwal    FK CONSTRAINT     {   ALTER TABLE ONLY public.seats
    ADD CONSTRAINT fk_id_jadwal FOREIGN KEY (id_jadwal) REFERENCES public.jadwal(id_jadwal);
 <   ALTER TABLE ONLY public.seats DROP CONSTRAINT fk_id_jadwal;
       public          postgres    false    3199    215    217            �           2606    16945    jadwal fk_id_studio    FK CONSTRAINT     �   ALTER TABLE ONLY public.jadwal
    ADD CONSTRAINT fk_id_studio FOREIGN KEY (studio_name) REFERENCES public.studio(studio_name);
 =   ALTER TABLE ONLY public.jadwal DROP CONSTRAINT fk_id_studio;
       public          postgres    false    3205    215    218            �           2606    16960    report fk_nomor_kursi    FK CONSTRAINT     �   ALTER TABLE ONLY public.report
    ADD CONSTRAINT fk_nomor_kursi FOREIGN KEY (nomor_kursi) REFERENCES public.seats(nomor_kursi);
 ?   ALTER TABLE ONLY public.report DROP CONSTRAINT fk_nomor_kursi;
       public          postgres    false    216    3203    217            �           2606    16965    report fk_studio_name    FK CONSTRAINT     �   ALTER TABLE ONLY public.report
    ADD CONSTRAINT fk_studio_name FOREIGN KEY (studio_name) REFERENCES public.studio(studio_name);
 ?   ALTER TABLE ONLY public.report DROP CONSTRAINT fk_studio_name;
       public          postgres    false    3205    216    218            �           2606    16970    seats fk_studio_name    FK CONSTRAINT     �   ALTER TABLE ONLY public.seats
    ADD CONSTRAINT fk_studio_name FOREIGN KEY (studio_name) REFERENCES public.studio(studio_name);
 >   ALTER TABLE ONLY public.seats DROP CONSTRAINT fk_studio_name;
       public          postgres    false    218    217    3205               9   x��10�����S�L�V0�NMI�KWI�R\>F��E�y
��y
�h�1z\\\ k��         M   x�mͱ�@К��9�S;����<�	/���Zd�+yg�է�D�
w�i���/���aG�9F�1i          �   x�����S�L�V0�NMI�KWI�R�FFƺ&��F��FV@�m`�ih�`�pr�IGNC.Ϣ�<��<c<�!ah�n��8# ��ih��E����3B7��<cNg�W� )5\      !      x�3�t�4�2�t�4�2�t�4����� $s�      "   !   x�s�r�r�r�r�r������������� 3��      #      x������ � �     