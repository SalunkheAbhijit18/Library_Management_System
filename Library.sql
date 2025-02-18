PGDMP  #                    }            Library    17.2    17.2     D           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            E           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            F           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            G           1262    24866    Library    DATABASE     |   CREATE DATABASE "Library" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE "Library";
                     postgres    false            �            1259    24882    books    TABLE     �  CREATE TABLE public.books (
    isbn character varying(25) NOT NULL,
    books_title character varying(50),
    category character varying(20),
    rental_price numeric(10,2),
    status character varying(3),
    author character varying(30),
    publisher character varying(30),
    CONSTRAINT books_status_check CHECK (((status)::text = ANY ((ARRAY['Yes'::character varying, 'No'::character varying])::text[])))
);
    DROP TABLE public.books;
       public         heap r       postgres    false            �            1259    24867    branch    TABLE     �   CREATE TABLE public.branch (
    branch_no character varying(20) NOT NULL,
    manager_id character varying(20),
    branch_address character varying(30),
    contact_no character varying(15)
);
    DROP TABLE public.branch;
       public         heap r       postgres    false            �            1259    24877    customer    TABLE     �   CREATE TABLE public.customer (
    customer_id character varying(10) NOT NULL,
    customer_name character varying(20),
    customer_address character varying(30),
    reg_date date
);
    DROP TABLE public.customer;
       public         heap r       postgres    false            �            1259    24872    employee    TABLE     �   CREATE TABLE public.employee (
    emp_id character varying(10) NOT NULL,
    emp_name character varying(20),
    "position" character varying(20),
    salary numeric(10,2),
    branch_no character varying(10)
);
    DROP TABLE public.employee;
       public         heap r       postgres    false            �            1259    24888    issue_status    TABLE     �   CREATE TABLE public.issue_status (
    issue_id character varying(10) NOT NULL,
    issued_cust character varying(30),
    issued_book_name character varying(80),
    issue_date date,
    isbn_book character varying(25)
);
     DROP TABLE public.issue_status;
       public         heap r       postgres    false            �            1259    24903    return_status    TABLE     �   CREATE TABLE public.return_status (
    return_id character varying(10) NOT NULL,
    return_cust character varying(20),
    return_book_name character varying(80),
    return_date date,
    isbn_book2 character varying(25)
);
 !   DROP TABLE public.return_status;
       public         heap r       postgres    false            ?          0    24882    books 
   TABLE DATA           e   COPY public.books (isbn, books_title, category, rental_price, status, author, publisher) FROM stdin;
    public               postgres    false    220   �"       <          0    24867    branch 
   TABLE DATA           S   COPY public.branch (branch_no, manager_id, branch_address, contact_no) FROM stdin;
    public               postgres    false    217   �%       >          0    24877    customer 
   TABLE DATA           Z   COPY public.customer (customer_id, customer_name, customer_address, reg_date) FROM stdin;
    public               postgres    false    219   &       =          0    24872    employee 
   TABLE DATA           S   COPY public.employee (emp_id, emp_name, "position", salary, branch_no) FROM stdin;
    public               postgres    false    218   ?'       @          0    24888    issue_status 
   TABLE DATA           f   COPY public.issue_status (issue_id, issued_cust, issued_book_name, issue_date, isbn_book) FROM stdin;
    public               postgres    false    221   (       A          0    24903    return_status 
   TABLE DATA           j   COPY public.return_status (return_id, return_cust, return_book_name, return_date, isbn_book2) FROM stdin;
    public               postgres    false    222   �(       �           2606    24887    books books_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (isbn);
 :   ALTER TABLE ONLY public.books DROP CONSTRAINT books_pkey;
       public                 postgres    false    220            �           2606    24871    branch branch_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_pkey PRIMARY KEY (branch_no);
 <   ALTER TABLE ONLY public.branch DROP CONSTRAINT branch_pkey;
       public                 postgres    false    217            �           2606    24881    customer customer_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);
 @   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_pkey;
       public                 postgres    false    219            �           2606    24876    employee employee_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (emp_id);
 @   ALTER TABLE ONLY public.employee DROP CONSTRAINT employee_pkey;
       public                 postgres    false    218            �           2606    24892    issue_status issue_status_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.issue_status
    ADD CONSTRAINT issue_status_pkey PRIMARY KEY (issue_id);
 H   ALTER TABLE ONLY public.issue_status DROP CONSTRAINT issue_status_pkey;
       public                 postgres    false    221            �           2606    24907     return_status return_status_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.return_status
    ADD CONSTRAINT return_status_pkey PRIMARY KEY (return_id);
 J   ALTER TABLE ONLY public.return_status DROP CONSTRAINT return_status_pkey;
       public                 postgres    false    222            �           2606    24918    employee fk_branch_no    FK CONSTRAINT     ~   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT fk_branch_no FOREIGN KEY (branch_no) REFERENCES public.branch(branch_no);
 ?   ALTER TABLE ONLY public.employee DROP CONSTRAINT fk_branch_no;
       public               postgres    false    4763    217    218            �           2606    24898 (   issue_status issue_status_isbn_book_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.issue_status
    ADD CONSTRAINT issue_status_isbn_book_fkey FOREIGN KEY (isbn_book) REFERENCES public.books(isbn) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.issue_status DROP CONSTRAINT issue_status_isbn_book_fkey;
       public               postgres    false    4769    220    221            �           2606    24893 *   issue_status issue_status_issued_cust_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.issue_status
    ADD CONSTRAINT issue_status_issued_cust_fkey FOREIGN KEY (issued_cust) REFERENCES public.customer(customer_id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.issue_status DROP CONSTRAINT issue_status_issued_cust_fkey;
       public               postgres    false    219    221    4767            �           2606    24913 +   return_status return_status_isbn_book2_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.return_status
    ADD CONSTRAINT return_status_isbn_book2_fkey FOREIGN KEY (isbn_book2) REFERENCES public.books(isbn) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.return_status DROP CONSTRAINT return_status_isbn_book2_fkey;
       public               postgres    false    222    220    4769            �           2606    24908 ,   return_status return_status_return_cust_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.return_status
    ADD CONSTRAINT return_status_return_cust_fkey FOREIGN KEY (return_cust) REFERENCES public.customer(customer_id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.return_status DROP CONSTRAINT return_status_return_cust_fkey;
       public               postgres    false    222    4767    219            ?   �  x����n�6��'O��BԿz�8�h���5�fb3&#�tI*���-�?�)��ٲ���9g�T5oxVT<M���,�"B�Ct~z�!I`+tJ��f�����*"[�OF�큵n�!b«��i�SXD7�k�IG�H�̕4G����H����0j����pE%���,�w��|$,�����]�~�l�^�����p���٭s}���/�2/i�G%�Fce��6Hh%�� /�����74���/�1����5�d%O����X��b �`5E�;L����O���#F�a#C44�I\��,�x+m�AFX�i��s���3��M�z�EC������uI��nx�z}@k���&�/�V�(zv�~���q3-y"�T��8a�WC�o�c�(z_��﻽y��2�*.`��8���_)���E�9�a�v����E&�����i�B���}<�[pQ7Y�+�pxR��B���rmxSP���-��A2���wTB�H�a���{/�?H�BOS���*f�������o�^���Բ�.jg!���G���I��=����$�W�U;ڽ�{��}���ǽ�_u���N�e�����kif����w�KsA��iJ��"��6:*�i�p;=�'�Y>��8���,��q���A�O�4�����	�Hw��Q%'�(8j�E󯕝/�:�+��Qӽ�[�[���}/��Q;h{��K[�ӉۑNb_*�&����������_��      <      x�-ͱ
1��:y
{A&�$��;���&����pp���z�4�S����;So���k�)ED}�qt�6�ۏE�P�*dL���s�6����E�X��HnZ�k� `d�g���޷V)�E9x�?�*#<      >     x�]��N�0Eד���itYu�Eh�`����Q=y8�iZ��� �w>s_k�����^=.�=�M���@�N3cfz���N�p��bP��k+:��-O���9�V�h���FdrgX��N�^N�z�j�,���^n?�0�6�hD�*I���|���M��L����<���P��F`	���T�>І7�#�U^Жԡ��W��V��O��}�*z���%��bKYg,:����}W�O�y\�F-�}\��
�#z�,V6Y�q�$���vo      =   �   x�]ϱ� �9<�
ڎ���k���%�yꉴ�������|	����2�	Z48%w/�.����ɋ�h��~�GGsOH3P)�pG��v��d����vsy�%t����U�3�D�ܾ=��2i�ݼ^]�C�*6�C7�D�]"��^	��C���W��&:a�      @   �   x�Mα� ����/p�8��X;8uuAkR[c��o/��0\��|4�B%����;AHh ]�u�A���lRN9'q�C7�浧�+�A�$ K�s�E��'t!<�j���<�#��g�b7��x����iU\��H)�@E�������H������2���a��y#��+8�      A   �   x�Eͱ
1��}�{�H���ft����E��������#�LHj��-�cT�l�2J| �<0�� z*9ל�:/�t���+��7���)S�Q�e�=�o)w����Fg�ي�:�O̩��� �� f�rWs��t�='l9�#�A���Jk��%6c     