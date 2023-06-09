PGDMP         5    
            {            ReservasiTiketBioskop    15.2    15.2 &    .           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            /           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            0           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            1           1262    24826    ReservasiTiketBioskop    DATABASE     �   CREATE DATABASE "ReservasiTiketBioskop" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
 '   DROP DATABASE "ReservasiTiketBioskop";
                postgres    false            �            1259    24827    film    TABLE     �   CREATE TABLE public.film (
    film_code character varying(10) NOT NULL,
    film_name character varying(50) NOT NULL,
    tayang_atau_tidak character varying(20)
);
    DROP TABLE public.film;
       public         heap    postgres    false            �            1259    24830    jadwal    TABLE       CREATE TABLE public.jadwal (
    id_jadwal integer NOT NULL,
    tanggal_tayang date NOT NULL,
    jam_mulai time with time zone NOT NULL,
    jam_selesai time with time zone NOT NULL,
    harga_tiket integer NOT NULL,
    film_code character varying(10)
);
    DROP TABLE public.jadwal;
       public         heap    postgres    false            �            1259    24833    report    TABLE     a  CREATE TABLE public.report (
    film_name character varying(255),
    tayang_atau_tidak character varying(255),
    tanggal_tayang date,
    jam_mulai time without time zone,
    jam_selesai time without time zone,
    harga_tiket integer,
    id_jadwal integer NOT NULL,
    film_code character varying(10) NOT NULL,
    id_report integer NOT NULL
);
    DROP TABLE public.report;
       public         heap    postgres    false            �            1259    24913    report_id_report_seq    SEQUENCE     �   CREATE SEQUENCE public.report_id_report_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.report_id_report_seq;
       public          postgres    false    216            2           0    0    report_id_report_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.report_id_report_seq OWNED BY public.report.id_report;
          public          postgres    false    220            �            1259    24838    seats    TABLE     X   CREATE TABLE public.seats (
    nomor_kursi integer NOT NULL,
    studio_name "char"
);
    DROP TABLE public.seats;
       public         heap    postgres    false            �            1259    24841    studio    TABLE     @   CREATE TABLE public.studio (
    studio_name "char" NOT NULL
);
    DROP TABLE public.studio;
       public         heap    postgres    false            �            1259    24844    users    TABLE     �   CREATE TABLE public.users (
    id_user integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    nomor_kursi integer,
    id_jadwal integer
);
    DROP TABLE public.users;
       public         heap    postgres    false            y           2604    24914    report id_report    DEFAULT     t   ALTER TABLE ONLY public.report ALTER COLUMN id_report SET DEFAULT nextval('public.report_id_report_seq'::regclass);
 ?   ALTER TABLE public.report ALTER COLUMN id_report DROP DEFAULT;
       public          postgres    false    220    216            %          0    24827    film 
   TABLE DATA           G   COPY public.film (film_code, film_name, tayang_atau_tidak) FROM stdin;
    public          postgres    false    214   M,       &          0    24830    jadwal 
   TABLE DATA           k   COPY public.jadwal (id_jadwal, tanggal_tayang, jam_mulai, jam_selesai, harga_tiket, film_code) FROM stdin;
    public          postgres    false    215   �,       '          0    24833    report 
   TABLE DATA           �   COPY public.report (film_name, tayang_atau_tidak, tanggal_tayang, jam_mulai, jam_selesai, harga_tiket, id_jadwal, film_code, id_report) FROM stdin;
    public          postgres    false    216   v-       (          0    24838    seats 
   TABLE DATA           9   COPY public.seats (nomor_kursi, studio_name) FROM stdin;
    public          postgres    false    217   =.       )          0    24841    studio 
   TABLE DATA           -   COPY public.studio (studio_name) FROM stdin;
    public          postgres    false    218   d.       *          0    24844    users 
   TABLE DATA           [   COPY public.users (id_user, username, email, password, nomor_kursi, id_jadwal) FROM stdin;
    public          postgres    false    219   �.       3           0    0    report_id_report_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.report_id_report_seq', 6, true);
          public          postgres    false    220            {           2606    24850    film film_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_pkey PRIMARY KEY (film_code);
 8   ALTER TABLE ONLY public.film DROP CONSTRAINT film_pkey;
       public            postgres    false    214            ~           2606    24852    jadwal jadwal_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.jadwal
    ADD CONSTRAINT jadwal_pkey PRIMARY KEY (id_jadwal);
 <   ALTER TABLE ONLY public.jadwal DROP CONSTRAINT jadwal_pkey;
       public            postgres    false    215            �           2606    24916    report report_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id_report);
 <   ALTER TABLE ONLY public.report DROP CONSTRAINT report_pkey;
       public            postgres    false    216            �           2606    24856    seats seats_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.seats
    ADD CONSTRAINT seats_pkey PRIMARY KEY (nomor_kursi);
 :   ALTER TABLE ONLY public.seats DROP CONSTRAINT seats_pkey;
       public            postgres    false    217            �           2606    24858    seats seats_studio_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.seats
    ADD CONSTRAINT seats_studio_name_key UNIQUE (studio_name);
 E   ALTER TABLE ONLY public.seats DROP CONSTRAINT seats_studio_name_key;
       public            postgres    false    217            �           2606    24860    studio studio_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.studio
    ADD CONSTRAINT studio_pkey PRIMARY KEY (studio_name);
 <   ALTER TABLE ONLY public.studio DROP CONSTRAINT studio_pkey;
       public            postgres    false    218            �           2606    24862    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    219            �           2606    24864    users users_id_jadwal_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_id_jadwal_key UNIQUE (id_jadwal);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_id_jadwal_key;
       public            postgres    false    219            �           2606    24866    users users_nomor_kursi_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nomor_kursi_key UNIQUE (nomor_kursi);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_nomor_kursi_key;
       public            postgres    false    219            �           2606    24868    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    219            �           2606    24870    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            postgres    false    219            |           1259    24871 	   film_code    INDEX     A   CREATE INDEX film_code ON public.jadwal USING btree (film_code);
    DROP INDEX public.film_code;
       public            postgres    false    215            �           2606    24872    jadwal fk_jadwal_film    FK CONSTRAINT     |   ALTER TABLE ONLY public.jadwal
    ADD CONSTRAINT fk_jadwal_film FOREIGN KEY (film_code) REFERENCES public.film(film_code);
 ?   ALTER TABLE ONLY public.jadwal DROP CONSTRAINT fk_jadwal_film;
       public          postgres    false    214    3195    215            �           2606    24897    report forign_key_film_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.report
    ADD CONSTRAINT forign_key_film_code FOREIGN KEY (film_code) REFERENCES public.film(film_code);
 E   ALTER TABLE ONLY public.report DROP CONSTRAINT forign_key_film_code;
       public          postgres    false    214    3195    216            �           2606    24892    report forign_key_id_jadwal    FK CONSTRAINT     �   ALTER TABLE ONLY public.report
    ADD CONSTRAINT forign_key_id_jadwal FOREIGN KEY (id_jadwal) REFERENCES public.jadwal(id_jadwal);
 E   ALTER TABLE ONLY public.report DROP CONSTRAINT forign_key_id_jadwal;
       public          postgres    false    216    3198    215            �           2606    24877    seats seats_studio_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.seats
    ADD CONSTRAINT seats_studio_name_fkey FOREIGN KEY (studio_name) REFERENCES public.studio(studio_name);
 F   ALTER TABLE ONLY public.seats DROP CONSTRAINT seats_studio_name_fkey;
       public          postgres    false    217    3206    218            �           2606    24882    users users_id_jadwal_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_id_jadwal_fkey FOREIGN KEY (id_jadwal) REFERENCES public.jadwal(id_jadwal);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_id_jadwal_fkey;
       public          postgres    false    3198    215    219            �           2606    24887    users users_nomor_kursi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nomor_kursi_fkey FOREIGN KEY (nomor_kursi) REFERENCES public.seats(nomor_kursi);
 F   ALTER TABLE ONLY public.users DROP CONSTRAINT users_nomor_kursi_fkey;
       public          postgres    false    217    3202    219            %   �   x�e���@D뻯�Ш��C(Ja$���'�\�.ƿ�0h��N��M2�f+j��z:�ҍ�*pM9�>��[��0��50V����v"d�����6�
L&��[׃5~:ɻ�(U�)��^M��+r]�M��t=�!����]@�Ah��u-�|6GF@      &   j   x����	�@E�u�y�)�K��:�G�,����@4�2�XC<�#���hu �����z�ă����^�ZP�\�Un�ع�{��ι��^�����B�2>      '   �   x����
�0�s�}�I���=����x�:ܜV����UE�	�I����E��r[Y9.���R�"����K��3�2(�d,"(c	ہ�_��%����C���Q�H���_ɉ?���5�����X@�4PYNa�1L#��韇�M�h��f^���T����p(��Z\\�uOq�ks      (      x�3���2� "F��� 'Tv      )   #   x�s�r�r�r�r�r�r������������� <      *   �   x�]��
�0@��ǌ��u��0��E�K��Q���������� T����@k�t�iD!�ݡsd���x���J+,;0J�USބ�M��s&��yL6�m��#u4�^r����-����N�)�V���K�b�;=��;�{[�xq��c���Q!     