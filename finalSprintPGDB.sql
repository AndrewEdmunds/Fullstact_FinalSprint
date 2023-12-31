PGDMP     "    (                {           cooking_and_baking    15.3    15.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16734    cooking_and_baking    DATABASE     �   CREATE DATABASE cooking_and_baking WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
 "   DROP DATABASE cooking_and_baking;
                postgres    false            �            1259    16757 
   query_logs    TABLE     �   CREATE TABLE public.query_logs (
    id integer NOT NULL,
    user_id integer,
    query_keyword text,
    datetime timestamp without time zone
);
    DROP TABLE public.query_logs;
       public         heap    postgres    false            �            1259    16756    query_logs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.query_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.query_logs_id_seq;
       public          postgres    false    219                       0    0    query_logs_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.query_logs_id_seq OWNED BY public.query_logs.id;
          public          postgres    false    218            �            1259    16736    recipes    TABLE     3  CREATE TABLE public.recipes (
    recipe_id integer NOT NULL,
    title text NOT NULL,
    ingredients text,
    instructions text,
    prep_time text,
    cook_time text,
    total_time text,
    servings text,
    image_url text,
    datbase character varying(50) DEFAULT 'postgres'::character varying
);
    DROP TABLE public.recipes;
       public         heap    postgres    false            �            1259    16735    recipes_recipe_id_seq    SEQUENCE     �   CREATE SEQUENCE public.recipes_recipe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.recipes_recipe_id_seq;
       public          postgres    false    215                       0    0    recipes_recipe_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.recipes_recipe_id_seq OWNED BY public.recipes.recipe_id;
          public          postgres    false    214            �            1259    16745    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    password text NOT NULL,
    email character varying(255)
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16744    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    217                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    216            r           2604    16760    query_logs id    DEFAULT     n   ALTER TABLE ONLY public.query_logs ALTER COLUMN id SET DEFAULT nextval('public.query_logs_id_seq'::regclass);
 <   ALTER TABLE public.query_logs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            o           2604    16739    recipes recipe_id    DEFAULT     v   ALTER TABLE ONLY public.recipes ALTER COLUMN recipe_id SET DEFAULT nextval('public.recipes_recipe_id_seq'::regclass);
 @   ALTER TABLE public.recipes ALTER COLUMN recipe_id DROP DEFAULT;
       public          postgres    false    215    214    215            q           2604    16748    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217                      0    16757 
   query_logs 
   TABLE DATA           J   COPY public.query_logs (id, user_id, query_keyword, datetime) FROM stdin;
    public          postgres    false    219   �       
          0    16736    recipes 
   TABLE DATA           �   COPY public.recipes (recipe_id, title, ingredients, instructions, prep_time, cook_time, total_time, servings, image_url, datbase) FROM stdin;
    public          postgres    false    215                    0    16745    users 
   TABLE DATA           >   COPY public.users (id, username, password, email) FROM stdin;
    public          postgres    false    217   .V                  0    0    query_logs_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.query_logs_id_seq', 8, true);
          public          postgres    false    218                       0    0    recipes_recipe_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.recipes_recipe_id_seq', 1000, true);
          public          postgres    false    214                       0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 20, true);
          public          postgres    false    216            z           2606    16764    query_logs query_logs_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.query_logs
    ADD CONSTRAINT query_logs_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.query_logs DROP CONSTRAINT query_logs_pkey;
       public            postgres    false    219            t           2606    16743    recipes recipes_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (recipe_id);
 >   ALTER TABLE ONLY public.recipes DROP CONSTRAINT recipes_pkey;
       public            postgres    false    215            v           2606    16752    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    217            x           2606    16754    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            postgres    false    217                  x������ � �      
      x��}˖�ȵݘ���w#�@ܙ����gZ����l��bV�b�J=���sV�DF��;� hs"�b�
@<��g?Ի?��������ߟ{w�����y>�=��߽��������χ������ݯχχ����χ���8�^��l���������t�ߞ�����}�|��>����x��_�O���__��������/�������ߒ����~yz�S�R������|���wߎ/�w��>�<�v��������;���w�����~�mx��������߾|�������O�����៪�~�����_~��_��x���ק�/��_���������8�=��?=��������y���������W?�t�ߟ�_9<�����z��|x}������ׯ����[|����X�>��o�ߟ��ｽ����O�x}?������xֳ7a����Ӈ������_>?�z�����?���~���?���¢1�mѼ���z{}������'���'���8~�ѷt?~ۃ��]���|�Н~%c����%���~W�a�[�_������������ǋs��r�z�|��������{y9<���ş֌G��<x��{�~O��/�O�j�s��Ā����[�^������?>����[X�B��+.w�����6��@W�q��؆�o�����??�r�
O�-���~7�\>��h7i�������^�^^��Uw�ٿ<<��!���遟�]���2z�������x���gg�����Ϫ��Ya�k��q����C�w���������ݟ��>_o�������9חQ�bQ��m_^�6�r�;v�����z�����K������H�m��e�v[��E׷r}!>ZC;�ّ
���� ,;���D#��Q?m2:)tx��v�����8�s
+�������<�*�]-��o=_LZi
Su����x���t�����C|{���겘�؇�ۉ��� F��M�ևn��ӷO`����ͻ??~;�?<?�v�����ϖ��Z,lF�d�%��
|wo�9R��t�%����,�N#L`�z��㥽s���h�a��R�O����B�,i���}_����x���p�Eay�0�)οJ���7�Vst�r�?jƯI���w�;jL'����4m�!lg��F����o��g,��e�7�=(��;���V<$���m�c��n{<����~{�p����s����o+����AZh���(K���/)�¹�`�K������b�NUM�,���h���xP�Q�Zʐ0�R�>���u+_[WjD�[a�zza_�ԉ�(?�����ח���g|#�<f��6�U�p�\3l~�R�Ii{`u�E����
���Y>EϬ<Z}[/���]�p2#v�?��a�2"J��3.�������v�V����v�{�kVtXn�:�?����w��<�xi��P��Ǘ�p�ĬR��&��(Ԇ?�Q�rE�'��}�z��۵�q��8�Q�d��f���bqC�ژ�� ܿ���Z�V&�x�ʞq�tI^��������C�������W�d���Q��F̕�V��)���Z��8h�SR ^
���8N.q�&J�=Y��N=��h�m�O��4t$�#���x ��\���֋ҼC8ʵ�������+�����0�Rt���=�	v�ʰ����.���>����P{���e�і����Y��\Ua�e��Gk���M���uE�D�NWߊ�
4A��@�ЦN���H��9j�6}'��K��Nω�>O綽Xk���v#\m:�3�4��c�/��X;A��>*p�P���o)`�<-M{�4���8��s�^V�~J�{���
�\�/Oﱰ��7B�p�����zsViE�p�[������D�_,��nO�F;�b~��r�^!;���S���Pڥ�@��Z�%���h<�nDC*�y Z.Sq�iҺ��ӷ��gA�n�;�rDg�G��
|��9Dr\������Pj×k:�mA��E�p�A�J�<��
k�5�ґNxƄ;�b.&|jZ9������h��22n��%�UY[�=/,�:Z���c,9l��'�p��_dܾ\�h��mC�N!-ݎ͛�Ɇ�I!�n�,��J	�G\�4hMZ0FS(Fz��l��O�3>�Զw%J��Fn�A`Y9����
�6;�Dy�u�@o�����P�ţ:q��≹V:S]Z�f��4`��°�Mu��V��� �OQa��b���z�`ۿ�v�mUG��� ����'{�b^X�V�|C+M�%���c/
)�s(�Ǐ'���@�t�e��I�)�
�TB�T
=>}�/Z�x+E�9J]�mc�].D5��(%Nj��\~�tP�6ޮ��61�Es9�R6G7��/O�	�cz��]"Z��(�����P.�Os�d"�����P)���ٚhO�{w�f�v��k�Lԁ"�TJE�ЩB|���8��VhKhQ�Ѻ�Wq;<v?A7�N���`�I������f���ۮ�J-�R ua���G��=�_#�����Q��Ek~Ҥ�11�Fp���Bߤ�Y'�aլĝ)R�Ӹ&���-� hjy��P^9��-�6O<&[i8�]{YJ�ˠT��J��y�-��%<L��ֹ��rE%Cʈ��40{*�x}a�ý��B�ZdO������ȸ��9�I�yᤋ$+��� ��#� �I�2���m�g� 3�dBV#HG����pD������ �9���b�ꮰ�b����SE�D'�NBs��64I�,�aN��Qw$e���T8��j���SDY�($��#�nfʒ�i1HX+8��&��k���=���3�����>�\� �<�QY��0j� <�G�V�r�&�s =�5�q���i���x��z��B�Bu>�dgC>aujb�F��1f�>�pr-��Șa)�
w|���ff �=�y�9"��!�>� t{���P)�r��RJ4�x^޸�4��-φpE�q���'�^1,� ����	+7���L�blkw�,�W��[9C�lM�#8)��˓�ֽ��cg3�a^��;�M(�e$g*/s��%�b>D�2�2d67Q�q� ��ry���)5Mu����)Z��S�~Ϗ1��Fݯ]�������p��Ρ匙0��C�w��0�L���������f��X��O���rsO��|��ü�,�^_S�l��у"�,���^,�.;��h.��3�@��Z��;f����w��T� C&~�J�U�Q��V�r���p9$�uJ0aIãa�ޱ�O]�Z���5��{H���"�j�3��C��F�&�2���xV}4�Ҽata$�:�t��V���ҽ��$yn�Q>��۹��@��V֜jP��\{˕��Ãf���!�1k>ՋM��3�.8^�(�Vo0��%@�D�A�D��
�´)��s�A��-"���)�!��/�ِ��O� ޞq�6��iҗ��-⠯ч6���r�~Hu���i����h�p���c#��ȭ�>h	K�A� ��^ƣm��SZ=T*�v��vf��r�
,<w�Ɋv,��}�kPą]�����:�\��vx��=BW�.{�
Op�G����t'��V����)��;9�u�wv�a�(͙�qü��ǃ:�ԝ8�yʤ8��(wGwrm8&��?��wQ�%��)�۹-�����8�m���0����N�Z�)b��y���t�z�B�0�<nF��/6�>P�n|q9�Vp�:�̝�-�(�T"��,���؂��p��1�Z�h�A7A#��c��W%@ga���'�r��S�ε�ؼ����>)7��&��I	�@Ji�]Θ�*��6���+8���|9h-S�U�W,h(C���յܬ�ƄvC��(�E�Gf���� ��MfX{�%��ԡ�A5�5U����B��ƕ͉0��#�ZF�Z�%nh�tơ�'�V:;�o^ihl�_r�y�B\���j-h.j��ƵW(KjεQ��K�v5���+�Cg    )��1��Q�7^\�i�TJQ�m^��eVO�3��Z0��
��݌�V� ψ�7���s
��Hx�W����t�̚���^luTNb�
1��ç��=GFPV����H��p��g�k�?9���T�ȴ�	�Q��N���aGE��6w�m���P�2�F/�u�:�.a�>"�3��&�[�m���q4\W17fM�����%nB-����E��ӣ�<%(���M{�>T�Om:<M�;�	�ؚ-㲈'��yc2h�_���?v|���9��A��`xf�u)�o�@C����;�)�#	2R�h\9+6E=8�nT߫�qܺ�/O��Q�-�4�yK�h,�g�K���&�ފbI|B�ax�dL����G�к� �1��V�2N�bo5�8h*��Z�h��:SL8�%��`\��`��Θ�T�:_�U�X��ٸ>kN�������*n\�}<�\��vz�Zosm�vPNk�����9��'����]Ƿ$g�y��L*�+b"#�����)���堉O��5K�Y�l�d�P���'��W�Ӏ>udX|'���ѝ�_�j��@�H�V������}��S��9~��))�<po���;7��=��6d*�-b�_j��A����Y�74ǽ\���^�X
�z>5�a��~U�r�=||q��[�W��:C��f�WX勋F�4N�k�4��[��h&Y��,�ƾ���vw=q�t�E0$�HQe^��8�y�S=��,p�*�c��rͮr���C�x77�%��t��c�!��q�YrSq��t}��=G˧����e���;z��a����D�jZ$sf��o��NP(	w��Dq�oN3�X���`�e�����	&�z���w"�;��o����	�
��}�F2�|^s�ҖD1��I9�Ƽx�3��z�낶%%�C5����ڤ��I���׬A,\^��$�=ō���	��������D��A&��Q8���NI�����R�+�t0�����p�M��Mg�۷{P,v�|T�]�v��`E�Sr��b������6���n:�Հ;�<��h�G�#|�X�W�/��R�5]�=��)~1ý��E�9��[�����?�d�|=���F��ʨ8�{k�´������;~�E�b]�LY�lrV�DU[n�4vAD7��q�c�&`�j��i�q��a�-xZRSH�䈠j��r��GŔ~m��"c��l8��w�*�I�b�zl'd(O��X!8o�����W��ѱ�A6��^Ll;����߱�S���`���aC>�a�c�t�h8$�q~���}޹똷޺-��w�d��!b3ӫ�5=���+A�>�n�@���_���=`�q��&=�;_Q:��3��)�Ͱ��[�r�[N�8�ؘF3�X닧mp6Z
���O��Fqx�T��Hr���H*^��E\��Y ��񹧑���dCS ' d�����*m��M�S�11�~W7�'x�K�ƈJ�]�?f ����
J�������#~Z�t_#��M$�Sh>�������4_۴�����,�?���;��
�ddl:H|��֘��lUȫF�&5~��/����	���\�C��!Zȼ:�h�-QopG̀�m�^]l���"�2�����"��%�cy�b~��l\�_K9�c��sL�m�|3�3�*u:��X@*����՞���]��u��Q�+���������8�0I������D����$��	h�x�g�N����P^�w�bϸ�M?�!���H>\J��g�����A=g�y #mM5�ʨv2l��(�'�Q2��Ĉ~N1qy����%���Y�%���@2>Ŧ&m�5��2���co�F�1p���c/�i�+�eLOr9?��R��6��4��9n�8�[�ܥ�[�R�L�eG�}E�r���9��{��ո��z�/�54�H՟y��*�+h6/��Q�r���XL�5�In�|_eel��
����̦��)^D�lF�~1I�m��'*>z?�K�2O�26��F/K��&Q`>ɐ�)S_��ḍ>\�v�5�4}
j��(Cd1U��@C,1ld�f���O�>;�@�v\۫�ޯ쌑$�)S��Xl�o;�4~,Ѕ+�Z��n�l��#��bks�-���K���̫)|�����ƢΌ��v[�v3�pDN�.���u\��� �-0i�Z�_>󩛸de� <0yb�	����{R�;`	�9h�0{kap�h��	y��D�7=M6�\~ua(��bmv1�gf�8����6�p��jA�#�����E:�� ��qf��]_4�C�8�q������c�
�U�bp�׾��G~>�S���_����B#|��@�ۥa7�N$����(�:�v{N�fKܿ� ���ird�U�1��-o;�N:�-�_E�$�3���N%��t��˦���%�������[����X�J>k��9�s)�C�P�<F��~/�&+���;}~��Xa�`��Z�f�.�(�kC;1���N���<�w��ۂu�Vw��
�"��ꭂ��yy���� j5j�E�o1�U�8X�ڊZ�#�άv++Ƈ�N3���*���a��GŚV�h�:��5�$�pt�ac���)��O�XvaA��b0�;6[��x�q�a���TiMq�bNc�X�Ϝ��?�o
-��&8�������Z���T12Q4P>�թ9տ��,�f<GJg���z�+z�nu/�R�q(u���Cz-P������y������T���؁��Y#ӈ�?R�����ZN��D�p���k��v�3�M��ӈYS��kV+О�;0Xc#�d'!����2v�L�� ۙR�B�;���Z����i�W�&�v�ڙ�_�5w���va*J)�Fવ{�0+�As^����<���>�	x��Ġ�A��.ƶ�|�fa�f���
���"k��3������>�uY�=MT4S�m�kqM��C�,����$��Z'B�N	3K8+��>�;��?�DE��]^�S�E�i�;�W�L4�E۔�UӼ@�{�m���A�~����0��ɳ.��[ל�B��
�N���cZkX�r{_����F]��5���R�ƅ��L^�Il_����VO[P8��N2�ɔ�:�r\��5@���=���tRNqp���X`7��j|�͛uз��F�t��㨠ﶘ_�J��-��4 Ag�+�mDx�g0��j�k
����؈j�[���D/�Zwa@]G�[ gry=^(��⨵ �m2��^.��V��j	5/t|:��j+���\1����Cה��H��,xn,o�x�y�����wA��������ʴf��q_6����}Gڙl��}1�}dq6�qeu=A`��mT\��m�6�����f>���*;N��Ţw��� L�1u�H�h���{�Z�W��*��^*x���R�ٞIl�o��������r~Kt	� 7hݵ��6n @Eˑ~��4N�X��&�WpSX;ĩ���Ť���8�����	s�9aH)+�ࣉK8�X�z!F�$A��Cߘڞ�"����	z񮋜̶�9n�T ��4�l�K�f�ϑ�A.r��a����q�<q��%K��9[�#�������k3CKdC�}��赊��\%@������p�Q�
g'�Q����@H�t涀��g w���;}'fs���ljV5�>\a�!����@ĴoqU	!z%�H(u�ԆND]�
��|̯�%}p��ٮ�͑��J�2\P\�c���)^3��^������fA ~�Zh�.�ř���>aE,f5�bs�����O�'3��\O��\��v�@,�W�����:��O�5�#<wND{�,沁S���uA��5~���:y��Y�i9`y��ֆ�N;��c�"&�.h���͋��>��2����3���p*N�rJ�A4bPMJ~X�Z
�9�v��a�1�rZ�#&�r���[��nN�Xخ�[�؁y���T�p��H�~��ZCaD�b�lm�]�ؐ��:���!��X2T5y�jrZ�"�F0i¯F�0���Փ�KO����������L�(��iS?}�    x���Y��C<zBN���'da��@Xib׏-�3~x�+��O��2-r���`7,7:�vZ�K��̖AJ�Ҡg�����|�Fd��˝I��/��Dj��p��uj� �p��Q�v��r�,�Mʉ�~�-��WM��KY�͝�L�=8<��vM<ꙻ$�tuA�������p> e[;s���aJr�x�g�Υi�����Ҵ0�s'�P��CFb�{�f��Q(�Br
�M!���e( ��#�$�ٴ��kK��«]q���A���3�S)˧RV�Z�n���Z!������I��{����T���a�,�r���Өyy����G'��H2����Z��א�{v2��8g��ò�_
��{*���L+p@ߥ��\�R��$��$�歷�W̳�c3��G�OZ�s�`H?Vk;����M���a�!ކk_����L)�鳎+����������
g��%����r��ǖ���t����=�{.��Z�"�G;���9Z�&^�DhO��ރ�n��$o���x��Z��cj�PGݣ��ݣfU�Q,S<�f��jk��~.��ٱ>��'�;ثrI�Se�+��T�Ji���㹌w���h(|kRwf�o�̤~9X��K���̓���Ċ%~Z�)�8��M���q�Yk_%3Jq�����ܣ�"�p���|O0��g���;��k=0���퇷��}Z��X��������n���n'�SZ*�]�y���M�� ,�rBH�s��4eN��2a����qX(Z�b�ٖgJ�S�.��ߤ�(�r�5�1��wj�g�͏����:2�F��3����:<2��CZ�6�"��LxseL���ǵO��������:"�s�Te�;�๖����Y8��
r<�eC��9�Z�l.,�1A��	�ڜ�a��n�E;0XwX�R�hw�\�2�GÏ� ��m(Vc��`�s`��;+PBR����a�ج�� �8K%D`�qe���zϑ�@��m<�4O���3:Td�y-pO�B
�����������꩒�w*Z;鯩�0�	�� ��0�&=���	���8��A��#�<��R������()���8D����m��4V���OL�����M�}����%�d*heG�n����[ig��N�oܯ(T����@�����>vU���G�>5���J]�G���`'��^v�S�U ����� E }bj_o���xQ�r�b[=H�5�ŷ��� R�*���u�a(:��Ky9�<~:���z��~��K����<����)���k��ol��S�%ۏ
W�J���}�;n���Y��r�A���k"xxEP��Eøy�{E���@m"��Z��1v��8�K,�+zL�P&�ב���B�W��^A^�Ğ�	p������=/8ٷ~��ׁ�L�W�TKYM�,�*������#���v[��@��oB��b����)�B���u�%�Iw���`�W;�':�r�o��mm�1��l�"
���e��)lj�Y&:�������3��5W�-� 8�,��T�!��i�'��b��(kd�BMr0�8�#����N>#�u Vv�]�uIg1�zwoE�^�s����3>]����K�յpZ�c����l��)3����[�~��m���mXR�\c��O�w��K,��Z���߯ ��`�x���m�[V�(�G����	�]�e��3�$`*w��H|��9��6���IzS�!�g���g/�c�痸G�;�7���x��;��Xv<\�XQ)�wI|]L���:wqш�֐��3�|��d�؏s1�C��qܻ�:���0#b�ߙ�}�����K��7���qn�M�m����ߋ�J�"��Ẳ|~����w:m���k����ic�0�V�ԄWC~L���	� Mh��=�|�ſ�W�x<Xk�?/S�g����������lɷ���Z�g8��͉�3Dҹs��C}�$���@������v���Oʃ�}/Ox�od9�������X������}�	6���ؾk<��?|TV������x�g4k����Qs�D/:7�+���E,����^�����/���� ǋ�^�|��˅T��t��{Yx8;�I8�$�3�ԯ��.�o/��!%���.Wf*�O����_T�����8�}`q��o��ކq�Skr��DN�Qi�� �!����{�W?Q�1����X|�Q3��^�sH�v ^���R����v�o]�Iy����jq$Y��e��u�:C�#��ܟ���k��ab��c�~��!�@�:߸�7o�`�9�4@qe-��\M嫡� �j��Ғl�� _]<��<&V�l�ט��>��|���)9Y
+��!����\m3�6�G�����f�91!�Xޮ@Ja�����V�g�5�8"�%k�`�︣X�9�7h��w�ZЭ��bD��~
}bP�B,/�!��gP}�8�6Q�LTGG��ٴ�g[�h���I�o�������9��L�Np�ݜi5�֍}�G�3����
C��}KQk��4:Cg}����OL;%�����Pi��jͧ0*����M�	��Jm�}ỹ?G��s�U���s#�Ť?��KO	���o���uţ4{%VQy��mG�/���3Q ���,��;����e{�_g]���ɇ�	Q�x��N�f04�vFg=�$bF����挖��8{��|���S(b��h��:ikc?˟V�T��k9�hf�=�p�=���~��t�(���SD����2i��UE���Ю��)܋c�\ȱ�+����z�#:��ÖVAc?S��R�X���,u��GQ��^�؝��C����uL�k�L�]l�9��@��\ö{��� ��`���#��V�1�5�l��+~e��7w,mѰ��Ǎ�Q���^#9�s�*e��{�7r��ٴ�v�4Y�X�W�hr�.�L�Dhv�HLZ�?^�vg"%`�V�������}J.�8��'�M���a�;g�q�Vo��^d��tV��j~^H#'3r�����s�MV�D�sZ�8����b?�1O~��|gs���Vxw����b������1A�3Ͽe��
pm8���~_3�w��#|j��;j�̜2
1Ʌ� \�qٕ��^���0�K{��k�@�(���;Ȏ��9O���0��|5��ޜ����20֌�N�e�©*m�iN��`�E�,�������K��V��f�:�"�Ŝ9�v	gج�W�>��c��������m���9� #B>mZ��Q�e��߭q�A�(qV/a�|z���M��ƬF� �̧E�  ���!Ъ���;6��-&���ݿ��G����\L*xŒ��h�^H���X3Rs�#���?� j�j��x�A� n�;c P�C��8-�8�΁N+p�([�2�_N�^ q^Z���=D��9ɛ_Ҽ��|{j�����B�	hXeb��<z�j�jDԈ%(�񾡏�ַ�=��4ѯ�e�جZ�Z�:T�B�O���+Jmݴ�MF��&L�hCŢ��0�CW�׺4>��8MzPKQ�Y5>F
"�`����$U`~{�$��[y}�H� Eio���q��q�P�bx>��e�XR��D"{rb���p�|�Æ�rJ� �A�[���p�"Vq��A�o�(p���c���惘ص�D1�_�#ȹI�*X��M���Oh3���1n1�G�y�O;ɰ�23P�`���P/���4Q������ ���Cs�	����[�F8����r�v�$wC��"�b�2\Q�u���"hG9�C'O�f�9e8�����]*Bl]MW>�����M���#z���!�_
-�����9��:b���H&�&pk���2�����Cjp�]F6e�bC�3 �-d�<"߽���9�s�
f`��8�g���i�Ĉ�9G�7���
���q�X���A�o<z�:BC�[K�����T�GA�|U�#]�ED��~'�K�7�;:���la�2q�@�W��6�2��&Z7�>��NOY���˻�(�)�+�>�tL �	  ��S��k&�a�%:��]~��r�ǀ�Ml���!���	C���_;FL�-`�%�/Zp�F�lC5 ��tJ۝�B��ZF���.��7G�����F4]ų���O�y-5@Mcae�0bJ��Y	̑O;9��z���_yA��2�����/�����<���vǼ�&zQy��C�/�``�9'<[HeR�
�#S����*6�t|�g2ԕ-�RX_̡a#f2���=��0�\��N��*Ch%�e,r(R�_�C��
��������o)�w���hGb-�����祖����[��R��`b��vjϩ���>�s�(���k��P<�{��� ET�_�osl�D+*&�z�=]e�L+���^�����= ��:���*��3�am؀���,,�����qK�!6'�<�m�9�|6�9{ˊ��Y�[�uH�5�M��xO�f���-Z�Q�H:���*]T��r9�+7عfn.�Pv����0�C��GF����3|n��-a�J�>D�z���iv�!����}e�e|��e��&�v���(��K���Sls_��e������@f�A�H��(7�)l�v�����"c��b�����ꫣ/�:�d�pn�����Sy.'�}��l��Z%���<}8[�_��`�8%Vs�����غ�MǱJ�փ3簕7��~���Y f.d������?B�kZeh.��e{�z+����N����T��s��0�N����f�=��f�f�4��.@C��Q�b�^L(����4l��o���Ч��U��2d����Q��n`;���Q�h�Q�X�XX�;�������$�Sq��C�}b,{ɺ��[+g��3,��ݞޚ\�Z9��yQgt9ɏ)gt9t7'b�����0��b,�F�%L@t��� a���[S(���� �G2����j���*vl�Ϗ�ׄ�nw1�����=vP�����MלB8 ��z�8k�s�eT"K��4�5����q���:���!&�I�↘w�����ィ;a˵]%���H!Đ�x�.\w���8P��e�_��͂#�?h
�5NF�A�pqd��$�=��1ڐ�1��!Y���s̬�Ê��x��� ��3좃dp��Ί6�8:�����[���,9�3��Zu�h����k��.�|j"߳xfj��7tJ��-�������^�dˊ��$�_�).4<!ti����F|�P	���*tbXf�?�_��Q��Ơ�D��.Zc� P���_��xh���¯��.Zu�8�Wo����V���|��ŚC:�
]�e����Ia'�yE�䘧KEH����c�2U�!d`Kf�2<�ǳ�~%�(*���������B�bl�v�)u���������Q��9���:q�� �U3n��	
�����b���+g�p��z0��[��ŕo7�b�e΢�:(`��tY�(�>��C�87q�G���
�J��^�r���ᗘ���`t��e:�>M�ɛ��L�5�--�I�4x�J -�"Q�� �Ŏ�j�ݪlF�FetC" �%}c��*�C��Ⱝ�\�?����7Z�Zp�#G�e|\\.�bЃy���b�$ދ��:u.��r���R|cL��Ȝ��+��)��Oi�9n�8bD�a=�>���=�]����c);L��!�85�b7	QEE��@�fmp�n&�}�Xb�vS2�;cϡOmch{<�iC���y�K�pK@Y��F3�<P�A��y���oǜ��(9���6?d�@
��������u��u+<���^�[��5�mع�3:^�Y����%Bc��x-�A�~7�ƸmL�aH�)�<���s�!p&���̫��8EĻ��{N������ui��I'��בH�]��D��b�h%Rr���B���@���E;m�ĺ~w�B�$�������S�悰���F�����3���^wC�u��w�ђ6@~e4!'���qѫ�&���2�}�Q#~n��8kl��}츀��+������_N(\ɩ��ڮ�%�U�~,u�"vyC�&����R�iށ����x��D���>�r�=��Χ�<���Ǟ��n �=��U��u\����_�%���(�'/�j���������i{��j��V)��.�^��ؗ�����z�_X)l��`*�[�zQ"Xc�3vh���>�Us��;��1�l#?�B�vc2�����e�J��\�S>�q}� .�CDq�L�c;�҂���&I�>6X�v�iwA�r:�Е�M8��q�fS6�?Ξk�h7�܇!&��#ݒ�\$���fZ2�V�!]w���)*��5�����U��p�@�rӤ0�}�w@֜8����wMk�)V`���@_x�ɐY�0:1�g7�O���*������#Z�!r]�!&� ���Z3�v��C�1���azSh:�d8
(~��qZ��2 � �)WG�9!�5;Nn,Ub'0Nvr����%hb�xo+��7`�K�x�Ƨ�aHt&�09��HЄKg����ًݷƾ��Q��P�Hk�
W�0�j�������?�?��k�            x������ � �     