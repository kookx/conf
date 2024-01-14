#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�<Σenruan.sh �=msE���+:9�b�G��\�D�u(�^-gyUcilO"���vPtXB����d�`Y�H���8�@����d����{�m�g�G��1��g������޳[��l}�p�v���S/��7�A�]~�f�4�b�i�^>�?��H�Χ�d����kv�+�֍�4y�xz٨�
���sFe�j 58(�#�e2��b���x����֮F�lxf�4g�NfX�g��Y$�<�n]�8%�Bl��=��aZКA�H3NU0�:��9Ӧ%��}2+��'իH�� p��"z�es^��
}lo�V�G~����Lr���47������JsU���7>
�4� �4����e��a��8�S��6J%�ug���ݘO�3kys�iBN�f\W/9�&�6�f�'Ο�<�l�3*=�fEf�X+��a@����YU�'q�82<	V*��2���7T��VB/���>���Ċ͠�)ၗqb�L�i��T�mL�L�A�C�?��b��4g�0eu��c�]�9d��@��UkhƩ��l6�es���`K��Pg �F����s�Ws'tݨY#��Hɩ�d�]=%��ϴ=W��p�B&�,�I�h�����4JO�4J7Q�n�I��V:ӭoDp �(T�hh�e���t���
10jBCQ�#�g�Q�X4\ך��0Z�0ms��hX�"-�d]p*eE괳Im�5m�ND� ���KӨӧh�|� 4�:w�P���vu�}�y����k�sw:�../�m���Go�}��ڇ_����۷�\���ҹ�?_|�8����',{V{�Y\^�f��P�w.�%W��\���ӧ��n���ר����Fi� r��O���i�������scy���7����wW�^_�wv��ҋ+7�>\�u���EtԫW����߯~��ʽ�:_7V7�2�j(E5�X���^�܍՛��΅+��o�@VϾ]�կ�y���k�/O ��U@LoZ��adɧh<e2�Q��E���0��\U��bU^�T��8%�p�TJ$�x;R)��K��ɒ���*@>��,7Ш���|���1��d�3������a�v�l�������/��Ͼ.I�E�CY��#-ئ��EB�D�X�E�v���i�q)3ku�h�"��Tg �bl��{�p�zѲg�X��Z��T�0`g5朅"�"Q���bj�
@�LV����bհ à�;aSa=Y�3��(]��^F��+�~��3 2d\bA��F�[�a����F��n�|L � ���9bx�Y�#�F�h�^b��0/R*��$�(d�\:�:ϩ��'�j%L�7>�9p>��d�Z�%J4�4SJ2�SH0��RI.��RH��..�,���v��lJb&�(�0v�0HW���E�!<��d�	��]8A7�	J���|�����Y=�U�w_0�r���Gaq�y*	L�<�%�$���w���#��?�>�ǡBjv�a?�q�q�K��	�Uw_"�`�J��]`�`�k�^�_0N���n�$�nh�QkR�p��X�K�rإ��� G����.�c?�N^,Mat�<ʂ����b�*등�͂j� h����	�a�)Ŝ[�Ӵe{3S8����
6F��d<I����ɾt�i��k����6�m���>���.�qg~S�t�\	<��J9H"�ю�W7�'<�G���E�jFĂ�4��jI"� ^ "D�`��܂�D�E�`(��cڬ�q*�%ޚ�"�x���TΆ��'�
Ma�i��Q�\͒Q�P���?(mÃ�Fw2��A`�� ��_$����*L~S��	M�ٽ+�T	��gk۪nOa�I�1��\�%*��ZaB:&�Z�j�Z��B�ɭr-0Ҥ�^b��`�j.�̵���.߻�y����oW����'�K�XDjdd�i�5�Gd$��ʱ���_w.�'���{й�>@]���	�tN;�z�>�hO��RBY0?�#Iu���/K�A��5%�%J�2�A��8�W$�\�<xu�j�և��Rj�5Ɯ6:�I�9���|b��HFJ����q!��'�A�>��1w$Y2c-w�#_�l�k���N�
v^�a"Fwr���В�������o�k{�y�@�kW?\�uKq�0���K`�����y�K�S򜘰����>e{p*�/b�^F��G�&P�q$�\��_s%.__�˯���N=]��?G�r:|�u�T�\F�9m��=kًI�b��]6Y�ߡ���Q�(��*��<�5''⻃���籉�����s+��'⬠AϘuCk�$!?�tM�5�:��i�Xe�ú��؋�ji%9��|��� O�}��/���ST��u�y���)J0j��[�֓Y]�_|�TMo��=gԍ�g����Ѭf�ތVs*�sc��\ T����Wq�z����[������>�AɊ59�J�t	t1�y�! )�2���tJYoU�B!��n�1ҥF�TJr�̞��R7���$]
b�ϳ�DS4�AHݲ�&^��52��d$�l�Ϋ�\�U�tb��)��LCX/��Z �T��;j"H���XCԽTQۓ��dG
ߐ2�J��nc2��Jg��<�Ы8�Ő'�n�C/��'� �`U�����Z�� %X��z��V�9Ƅj�z��u�&�l2Zש��k�t���ATGt�g	7��M@,��d�3A�1��F��X�ww@�2ڿ>{�ĉ��KϞ���9oB~��V42_�U�� ����ԫ;'�@������۝3�΂�N�n3)����H��6\�Bg�s�K�p�U�=($����=��lz''��Y��J�gZ�3!Ht7�`4�q�؇'�(=H�P��IFsԩ;�貯�s0�yU�ى�� �B���t�k�����S�>eb�9��1ڝ���d)�ݜ��J�^�,R1	毫���0�c^,�����E� 	=<g�q&���c�Q$ԋm��&(n7�*������#�~���a�2q�D��c���D��)�#��ǐ,�����S��I��!7z2��j�FI��3��B��l`/S	=Q��zu�<��
��+��2�H7C@���}`8"��̢閌�+,Z��Ť)N��dA�;�
{��t��%�Jx*6�ݟY�Ԙ�@��
���a}J�)�L�e:��W��T]�f�^���S��X�XdS8�<�T��O�1PA<F�%V�3G���V�-+sZ��g�ȑ#R���s@\[ �[�I�\"�v�)��bԖ� !n]`L��o}��"`b����0�l���ˇ�X�zY�fy�/�[b�x�Px�"��%^��X7/�/�?/> ���G�xN��y��{�>1^�ԋ/�g��'s��z���{�ߋ�5�K�����z�]���oЋ�J����w��/~ǋ���K���x�Q{�r?��ŋ�|/�li��ހ�&�u�pߧ_��E�0�c!1�-	ȍu���"@>�����
\}d_�w�@�pa�2<�O/䘌��M.դM�URPQ�@���!HjO]�Hrt��:��V	�������@�5�^�Q�x����Wz��#�y���[	�6�y��%��6�����G����̥[��Ƿo�͏�x�n~��q�~��i(�2F�OǙo�S�
[��]���6��u�?����FME⃏���ٌ���>�5�ҧ1����J�3vb�<���]h�؈�lHж0��nT��8�@uTC�G��F�rP#|<�҈o(��3Ю��Vo���T3v�k+�u0���"���wn��x����>�����{�|����3�O�m�[�Eqߥ- ;Xl��|�6�5�����E�gS�2d��h����}>e߽���q`D��Ę/��D�8R�#���V[�*�y������s�cĺ�:��3e!��?8�9~ e2J���㓱�<�0���ޭ���m2{�	���"��m^y)d��겍�+��;�
w�׎��Q^;�k�(�֮ة|�3h��y�b��U�#��*KN���T"~3������S̓-M~��kn��Q"D����'��~�Ԥ��M�{��1:�Ȩ��]lѡpF
=�L��&�٢�����^��e4I���=J�8�jih�,oN����F�O���0� �r��О�&"�Ų#M�� �-Q|O��T�5g����>8������@G}d}!�
��o��ÿ�8����F��3�n�o��\�5|"#�w��3�to��o����Lw�?j	�1/Vd��U(��b�/�mxqf݄[�(�P�5C��!���0��Q���Qtl���֚����j��]�S�ɄLv\4��R�9~R���9��3HUT����p�ש4�vq�*{sy~�R�� O.��P�ܐ3�bJq�P�/JX�����ώ�K@�>��������P�=�*�2"�t(�((��,�xo9�7�8O�q���թ~(��R�<n�n�@�%����T2Ʋ���ҩ���"V�w?�W���ۖ���,L�"�?*�Y/���5���@.�"�!���E�X�.��HHEu*-�+eRʼ���s�r=�.�����S�s��w8L{@
q�ܥ��߲S?�j}��5s�o�k��>@���9�J�Pw<��G2��)z���`4�mA�K@$�^I�}���'][�i�A�^0~�E�D�'��6�����X\��f�d>,&��o��u�x�e���͍�a z������s��˜��&w}h�T�`�њd�0�Y$8x��㱍�����K�Yb�K/�ia�d0W��3�k��V�ۂ�k0�PSY(�?C����I�{p��z]�������>%�:���q��A����>ShD�+����ag�jߺ�����Go��5��6{l;<U�.�)��U��A�����W��ۥJ+-st(�s��J�#b.=8���%��%�ܛȏG��I�jR�-��h��(�!��aOb
i����e$�̾8��ܤvؐ�J�Us���2�rZ�g�VTg�ň�՗VjB���ڜq�^S��,#.[�چ&���R�'0gn��
��8Q�Hi�q+l��^��Q�y&܌��ƁI%r�rr~�k\]M3I�o�J��aʹ����������ZcsM��lQm*i�ݠK��)�lV��8�Çk�<K4&�<��x�}�	�wA[h��|�J&��u����8��Mm�TsH�*�������BDn�յ�P�
Ը�=��z\]��	=���(�èE�zK8��n��k�	�E�O���R���^<v�x>]Ȏ�Mf��g���"��F{�q%]��K�+q���t���[���}#�D8~�,�`q����A���ѿ���ę�uc!tH�V7+��#�\��O&k�u���ge5i��]>r��t����|�Y���o/�~vn�K�s�-����_�o�}n��|����,���_�>�s�����|�=!~���O�]��b��s###B����V�zn�����o���z�?�/_oA6߾rk�{+�����3��o^bw�JFо�^��%�=~�&�#{��T��2�牁�&N���T3J��Y�vA�	�k�	9u Jr#9Q�mx9vW\g�L7�JY3]��E���k�u+L{1�!���
�Y�2[*iU �m��8�S���ϼg\K�~cH��O� ����x�=[��Ǆ�5!�K��cZ�Wڿ�Φ�o$�<~�������ڟ���o��jV�;�ͺQ.#�)rӇ�[�m`PHA�s�R&<�p�=� ��j���Q�A�i�����ϟ*[�v�bt`�H���#��jɫ ��C��P#���D[���{�D�)5t@���[Io<��(z�@��ވQ��E��9�ܸ��@��F��j���4u�@��֋r�l��	�P�$�U�ncf�Z{e��'�?��sh  rwȿ��?�R����MZ5'�����h��nfGF����PZ����J���{D{�Լ�Xj�����zB�7C{5������Y���#ft���-��2k,��1�������S��뽮b:Tw���f�!�ʂο����K���g���}�]І�+�Ei���,.��\���������\��T�:(�K�h�����h�L12�j!��_�ܛ���W���}��O�  �KoM ܕ��w[����ۗf(pDT�lU�����t�wh��M�&����=4��#hW���8_�������8��￣OQiK�gԚ�M�̐�8	���	O���G-i�,�,���z�L��m9	0�HN x��9�*Q����
o�ں��z��h��Y@�]]˭[�����u�~�g��8�'���
����Y<�0��/�,ͮ����GWH��-b�X=�~���/ސz+x�Va���|Gpu�	�B�/�Ξ&�r&�a�xCY���%��zŐ�pf�t�2�3͊�bo�H�GEx2٘�BV����[\��������U�7b��bպ������~�S'�~���P	2�}q
O$&�}��;����O�g���<>$S^��d_��~�}�M��4�ﮝ����(!�RA�b�\-d+V�/o��5����,h=�~g���91���֏��G�Q�Wt��O��d�>
1`�dz�^��=2���m����~>����;�X>n����e�X��ݨ��St�'���|�'��D�sF�vi6.\����᧫�_�����%{i��H=�|�{�L�羢T��ܭ�1��=�,����.ܲ�������2f��7�{]��v��Õ�o�������F٦q�.��s��/!9ܕ���>M�ƹ�x�4>�|e�-�����"�����w��.7>�L�ez�-�2h���D�ƌ�ID-��ؾ�O�����t��\Mb&��A��~�r=|���z_�%.�Z�r̪T1��g�u��F�n����w�q�<��������ٿ��{�܅��W��}`_�[]XX�s	�w�߷&�Dk��6�_t��˘�@ڌ����ݩ\:�K�oo2mR��W���g�g���+]y�땯��d�7>�_���*Ǆ%���92�Tk��֞�EM�\�����}�F,.?����;��!�H�ʒ���9�A��0���	t`*g�ӕ�k\�ܾ�+�~�_�~�� �h�����%��n:��I�:���q��T5H\m�Y����.X���xFE�Y���d괜�O�  .��{�t�����>�Bp�^�9@A�8[�jo�=��L�-�d7�Ӄz�$�Z�UeR��<9,@�ƣ���.�^�e:NOIj�G�������#=�<�KJ�;���P}lȸR%���L��9P�K�b���٬D1���ʎv�]�a�ӵAt�����-|D������g�x�`����$��?�//--�����b�&>[�g ,��Յ����_�|�.P�`�!-v����_fD�R0KYJ�;K)���BC�D�,K�C4�+�'_*'�
زs�

 �T�$���b�k���#��z��#������H6C$"H������5�au�	Nq y�Q��E�s�t�j�n��33>�v���x�����E�{�;4(Ѵ�w��ވ��M��{��*?�2Z����c`�rX��~���.��*=+R�En^�g��VpZY1[ˍ[#��lc�O�q�o�����XKlɣS�PŪ��rɏ���ĹV��8<P���,�4�:�5PN''��g��`C�9����S3��V\T���\�jv�����{	J�c߫׬a�u���̮�<r��u�������U��h��ix�|ÐJ�������=�����s��F4x	�R��A��;�D����Nu����%1��:㽼ޞ�oa��]��~6G�;��ɖ��k���XG�W�b��%����lŜ����E�f��U�R�rb���/�v�]�y��Jp��f��o|��A���q�P��!gy�Õ��z4���윖>��r9r5Xn�؇-Ё׉��y�Erg�}�_�7�a��2��Y!in�;9q2���S�H&+� �+�l���Q���#�|�.����7��V��[e��1�;�[�dz���Q��-�d�j�m��l�4��:e�5�8DՀEpU.՛�/a�e���QKa�J6v��<쑨p��a7X�XgqF�n�l�t3B���i�,0��0-�V� ��3Q�LBD৆��N�Wf��/��Ja偐7��� ,��Zy�[|�BUշ���T+u�'�}����w���#���Z��7?��m�V�Q�52G=����qU��U��J�j�A���S{����Iy˓#�U���޾>�Ț��^�f�}{�!��:�R�l(I8�ħ�����x��\ގ�#�g?���o�T�����.6�ѐ�U[?S ���L"5��ZY�xc�9m/�E�:ٙ@̣��%�z��	�YP�p�W���~�
�#H���d�J@L
���M�T�L�����x\ꊶ����&f�
���#�9f���Ê�)�F��,�g6�.r��Q
����F��m���MC�$���o��1������$H�%�L�h:z�iV�*0&�Q:����w��M���V]p�4gZe���;�~I�y�������[	$��ݫ����V�jߑ���ãp�H��G�+SE�ʢ}ᦏ^yX�G������,n���&��t��w߾~�����T{�]�����k��"�c�NRt�6G�6u�������l�R�Ӏ� �#$�"�P��e���z�\s�įK���|����ߵ$P����uD��"l_�b�m��h^���Q#J��z�s�sU���\�W�(����"��[S��i�Ƚ8����+EL�F�P7V��EL�]��ɲ�t�OƔ�#W�7�3hh?��> f��n��I\��4��7�<�#�w"�}���X.��Gg�zS*��D�RD��Q	-�o�,��q�pMƤh�3,;rr�� ���� �z�Ig�F���1$����.vUt���T<�J�aSc���j\�Jd�Oeb'Ke�+$!$��v>'ִߝ�p�ҙ��v6͘�,�k/X� ���5c�In3���U�9����G�ڋ��J#���G!���[��:��,�=��	�He�H�Or�Ui�n��'�ڜ�4U��W��W�n������̕A%Hc���T����}K%��L������y������'L,�p$l����0I�m�7x���;����������t�~H+
��U�G�PlV��x��@�	(���U{�6Cvᝥ`�j����Z�]rlWC\cydw'��D[,9f�����`���CXm�_�K]��R�N�A��L���7n�͞o����{g�f�jY�z}�����$��G��w�1���x��ͻ^K��@˨�y��1"q�Op�BO�G���v��-��ǳz�Z�(��O����Wp~����K5�R7�4�(�T���� Įw ���;�h�>^�&�@��,� 4g����įK#��q�\��sgF�2*���S��hu�|��Z�+�d��Ǵ���l�� ;��pӈNo�Fz�7��D��ڄ0���Lt��h>�Y��b�tE��q��!�̣���ڐ�F����h6d$���5�Mo��,�3�n�2CFh/��%^.�W��X�I��
�+;-@�t���z�AS��法O��Y/��.U�h��#hX��s���ۋ�o�m��hJ+8I�����*�2A����H'�ޖ&�]S��%��H��tˁ�8�ŞG�k�(B��)5�g�0a�������ܦ6�R����O(��B�\��f�)�0W��D��-�Y�VHj��^�J�}�x��ʽm�鞘O^v�C�������#���u'��~��A4M����J�ȏ��><�+�������vP�]%Lr{	|�r���� W�8R
Ӓd@F�!Bz]�;Z��s���?���
p�f�)[����0/C�a%��U�-X���(-�(�H�F��&{ud%��pxa(>ޏw�ВG"5��kY�iv_�*�����p��Te��R���������Y/^���]����{|����s��a�y�����#��M�Ґ�t?惦��Mn�ν��p�&��T�#QsM��&@�65�g�nY�G���$ą����rO�	_��g1B���\�݅*J�x���ucI�3�W�L��:����ڃt2(Ӣl�0&���,yj�`��A��?ӊ��%��[+��L�Q��[�-(T�U'k�	�Ć��O��%H6����*���V��!c�h�Ʋ�����`y�5;"�,j����|�9n2����r�����ڋ7݇P��(2�V�ܶ�:�5NG��QPނU2�d�=���ֆ!�O|^��9X����O�l9Xt��]�Hmݬ�n��ݞ��Δ�be�3V��E�3q���!��s���L�sZ�bfğ�D�p 7��n��K�����5K�e+�0��X��"6����Dl�et�|��3�-��;B�]���<9�	%��~:\�N��B*1��O�������#�TP )�lІoeN�/�/��]A
���"�Ē�	#�`%��&`�S2� '&� ;4$}�c=���11W�ޱ���9�h.ޢ�Sl��I��e�L��&��; �3���G"U�E�X6qN�q�X��q�lax$_�r�r��
&&Gح#�a�$��,�����;��q�4�S����6�*�G���#�>��$-�8�i��S��f���>;�w������o�k��}(կ�I¢٥~�T�N���eU~io�ϕ�\�wZe�M;���s6�)g���l�t������s���,_��hDft8Q�N���� ��J��ko4&�c�,š��d6v�T�7ǒ�DnQ�}�y!��	i��7�>HW[j�wR߆/�w����&`\�m͈�%$�Bjq
�Nd��4Y"�y�쌉<��{�D.���T>W�h�0���1y.�c�=��5:S��{Z\J������e?D���\-�0z\�@:ժ)�*K
��J�T��ㇳ�$b7�b�t��M�sg���O.��+�=����������N�s�4|�q�S��%*.#�<H��!ֲӣ,�ۆ�4?�E���2PX,ͦqj��t �m�L����o|{���� ��V	b�>}��%j/\[������ 3c�����
-E���Wn$������_��yw�k@2�|������Y��=w�!�Z��Y2��q�^E��B�"=+�,ܝ���x�&,�	��{A���sWߟ��c+V�^))6,OV��g��(i�� �2������'�.9%���r�.i�&�?r� ���������7Z�h�X���X'|0�LL���b��g�O0��}�q�gp��<���*vI%���\]��ۤ�k1����������O�]*��t'�PH�';�K�6H�	�cAjZRlS�@R�R�1���b1�1�����.���㱸�3�����;�`e���U^,��G�jO@�Mi�������g�����|�q�e���C��<����^���U~�Ku@�����}i���k�d_{Ҟ�ه�x����g���r�k� �#��=Y�#e��fÆ����׭���R^�8����p�|���h��돝]R�"0,mA$Ev]f�+�咸4R�B� ��-qR�y�V�'���ѷ���<K6d=��a�a7���)��S?��~�4^�a%��P���Ӽ�<�4��$Xw0��i��}7��f���n�!i���D��UkH�x��_�V�R�(!�>>x�BN�#rCO��K���!N��C��ܗ��S�wh>�շ������X�d��"�Z�g�s���Vp{�F���_.�3\iO�,�.���#�_�Ð�k���t��ٜ�dr�C��Ԡr�s��["���v2k'�P�gڤ�5У�ܗ����	d���f�Z{�}���ߗ�]^��<�g?�J,s�RltJ48�|��5x~�d�u'Y��{�l�]b���|�r.�~���hryV��}�\A����|��������..�S��?�c5'�֮�5��у��'��Y��,z7�ϕ�-.J�$9-Ve�Is"�W�1�,���{JrQ����	������n�s��zb���9�{���:#"ON�����WJ�[�����n�'t^�,�	��FJ+�A��G�BF���1��)�^IkN��a�u-�rՖV&*�Zϒ�T��t��ז�xNw��@�{�q�Iv�
�+�?]5���Q�Ѥ۾H��VIK*)��-��K$��ᖶDl ,n��Jީ�Y� -R�F%V\ED^�+���D� ��/vS�^�̀��/I�I��i�r�rg;��|�-�:\�Q�ƭ[�.��e]�'�G
-����N��Vm�<2\��jdIی.�=��1`����hoM�	a�]c�{�E?�U��A��J��ޥ�9˄�{���Lp�D®`L�C��H
i��)�D�`�
�h)ɪ{�ϙfcE5��M+���)���E�<0�!��F >\��M��4)S �@]�ɤ�'2�җ�T�G��J�D��B\�l�����׃~�HO�P������V +ݬ�ξD>���8����@����(��:p�%Ƥ<��s頻��j"�ZdK����u��^$�ѫ4��/A���Z�}&������>�(�g��R���e���l����=�19��˙��q~��G<�R�>�T�թ��Q���
J��<�
�&Y6��u�������x�4�)6�P�Md�.vZ���M��}+b��B�C�
x�����Hdx�{��@�� �M���i�<���3J�h�["Lvss��63M<M���ॱi3L���7�!�@�Mk�m2����N�vB�y+�"^��:Ѕ�n�]���7�* Odk�e�3E2�$�m���i''L6���d��S�W�� JJ�T�_�GnGLiu@� ��q����'�o�������v�<�
��$ط\'o��g@�&��i/���Û��~�u��;��w��w�y�X�))A�� �k?��o��5]\�s� ���o�e��uL��{7������95!��O��}�����5>�ؾr9��s��޿�R��yy�>�Eb=����Oo苔�%V�#�����g�h2`^k��CCZ�
��Z�nbnum�� djׯ_��� ׯn�6ҴU��O����7 � c���wO����L����	�!H�Pn�� ��*Xh샿�|���-tt�ri�0��"(�E����މ���n^
@���ҭ�/�(2o������"�gZ���4}�0Эg.X��G�N+(��+(����S<R(֐b)֐b)֐b)֐�Iw�R�̍���37v�n�3w������V&�r���
٣$_�h5���&7����f����Ux4�����(��#V�<<R.W�'ʕZ5r����6MHn�%@��5�k#�@+	�5�P����N�K�,&a���� ���_�o�����_	X�WkVi�o�N��e�5�J�B/񡿄���բ=����}{�*���t

zY$X@�ٹ�LV��~�hT�zK���ˁK�����7i�h_ڳ�uN��ud�%]���4RV���|M�%҆�U�O�j�e��]TP�XT��P����Vn�����Ä\#�p��Ї���H�w3�PI|��Eh�i*�̑�~:ݗ�3CCPE�$��{����c�X�rǆ�0�G7|2*Y5��Q�0Qlw ���ӻ���F�ϖ��Ȗ�Te��&�`e28�i���r>�@�A���+��u̍t[$"�ۗ���s8zng:l�N��׏Ջ�?�.�$�'�ϔJA]�%��.���ڛ�%o�ݦk��޵XD��9D�/\��ו��n���m"
�g�K����d�2��M�[vM�#}�v���m�R%t,;yR_�:�)OV˹cU�=���O��HK��6���zwD"͇�W諸��p�dM­ʼ_Ҳ�ٿ�PH3tq7y�E��r�y*�����/�Y�~�ǥ��|D0�]�4�^,�a�F���/I��i�ʝ��]h�3�F�' ��( K�ݙ.�;�R�T�'@x��q������@�9��\SAh�"{���k�@��iV�Y�I	�D4��֍����V0s�T�ѢE�3+ph��6rj��+�O�8W�q/�`xp��s�:8��C���_���X���
 |ZG����#�Q�� |�b̏����5�gQ�{���R�q��
��1�6���7��$�� �� �.�c�'="�5t��C7�=�=�l���~:��e׳�}6ª#��z���Lƈ�w��G�Jew���ٺ]��f��I�w���{t�$��v���T2����"-�ɺ�Y��#�A��ة���0:�U,�&˘���*�A�e %�3��`̫VA�0�頕j���� %5�g�+������^�si��/�+�V�8����u�^�����d��m�g
��Gz������Q�t�4��`Jlǉ;ȹ������m�g��|��k��;��;w�#p@�s�~'It�*����^Ϗ88��lJ���JE|����n���4��p?.]�o�Y^�ָsz���+�y��-\"��n6��^~�I��"0�_���4iW���G�T���Sk\�|���q��_�\�?�|��{�������x�X�v���{��\�nf�1~��lZxS�
}�����y�%|Z;;'6'�1�E&���g��s '=�t�_cV���n�́�Q�o��L�ә�s���"������:0:��}	D�фh��ۚ��P_�r��-�,MzG.�ݡ���z�L�~Bn l�o��Yj���-ճ�v�^s����.��`r*	l�;����O��-�_	�u��Q��#Z^��Y���x��ɇ�5���$��z�P��	�P�k@u3��v��Y]��o»C��#[�ƫ��)a-������)�����č��c(���6Pj�^jov���2�o���pu��V��nM��Wvsf_���'�M�e�*�����ݼ��ۜ�:���I��=Jb���"33���_�o�&���/��1���o��Urk;Hr��$���-�ܾ<��w=�7��,O��@T �f��o���&���q����B�Bէ%R��d�6^�Kٚ�Y�j�\_-���r��!BF��1_���Ʈ�\�V�yp�:a�!�혲rİN�LϠ���O�< �ڡ�n��I\��4�W�Cq@r2wn1;5L�Ұ�)�A@���g$^��/�d��t��!G�rZ�ۢ�^�O#�)�9h��?��y�X���^�i���X�5�9ט����y�x��	��Z@S{��AI��ϯ�O���6ѥr�"#ٚUE;�� a�ʃ�xcng��S�R����	a�hz�Z?��<ɘ	d	��ɉ�=�}3]�p&!�J#���GkVE�)y�tG�� �������N�����K��k�SH>UL>5�᜚�.D�G�f�itvwK+�F{{z�(��+b =UE�g�EO�|�ĕ�c	�<M�*�W�sD���x�s܃տ���
@!m����l$T��wh�9�q�4զ[i��~rx� b��C�@��<��Cb��t�L�^�Ho�%њ�p`_`��~�ܶ�Ķr�rzF�Ox{�+�1o�S��d�N����7/`�.@�gOe��=�\t�6{m��Y����p�$� 6��^%�������ln�7ٿQ2��V�dݺ?F�Id�V���I�`�0s�X�%	��g;�1��Y��i������C�*�^�(L;ǓR�@�����%�KE9�_�R.�j�0l�r��J/��^��2!�"J�*���PF�{��|'].3�|�M���?F�Y����� wV=x�-�]��]����2TAp�����H/:��||\��*��\�<�^��Vn<[&�uʡx��2�<�akOF(	��T�M�5+SP�)B����?ɏ�?'Ќ�)�#���j��G�q��Q�4��pA�4��$"~�k0����D�:zPĒ��^���n��H�.u��JBmJ��sx�����`���^L�,l�䕴���s��1uu�!�x 
:���9� S�οճ��>���g��B��;��+�Q�����AzN#��]�x�n_Z��5���*�/.�t֕�Ί���>z��UWvL� ���9�EPu16��j�����	BU}�`hl,3u��Dat�`�\��,�.�����R�xԪhd$�Pʰ\�,����i�A��
x_��y�Wg��3AƟ��ޮ�����0��!��GZWˑ�w���)�5:o2lM06M�G��7��:��\#?Tʯg��+71�U-��a-۠Lr $"��T���ↁ={�^��N����`��3[�(e����ҿL��v�{p�;kU����N,Sk��x��c�}����+����N���<Q�W�/m;c���z[�:vJ)	3���#�N��a`{L1O�7Z(Of��de�2�<��ݩ��Z���9:�ɍW�E��I�]W�#��^J�Zn	�$��du�͆�m��	����jvMǍ#m$��*���Oّ�[j��+)�	�#�E/���U͝�e�2�Q���*�z� ��/�{�*&�CA'(Z ��������u����{�K�<]9.�[1�ɪ3,����D����KW�:d�w6m�Ь3�z)d��z<�������{�W�6�/�Ks��s��ۋgW���l���K�%�Vm49Q.�H����E<��C�i�D��Y�]�;+0�hy�:좗�VС_�G_�~vz���� �%H~�$�=��<�(�HY����Ń{m�=6`���o�j�����]e�	���[LH�&f|>��kUs�	K`�xP��K����C��#���Ns�e;�_�c��u�T��(���>9��c��r}F�ӌ��;�t��ȭ�D���)���ܝӀ
#u��5mRz��d�NI�aR.m�a�ma��h-�Ɖ_io���Ø@}*��'�w캽�t��pZ�"�J/^����j�q~J��3���΍`�j�I���P��n��z!���a���q��������Xl�Rtm�[�dBq����C,n�q�/$S��曤u��p3����ϙ`b�s勵��g&&7�W�QfN:~��H�3I5L���M�o
����gh���8Vx�I�+-����}�n-�U�Ṭ�N�p��r�W�5�X  �����3R��yK�j���&�&���Cb5�!~�bu��	w�Re�A_����t�;�1^��yMeL��t��������"F�$V�Z����ȍ����}rCg��Df']�����z��蝏Y��hu�x-��I^[��|��%H�+Gc��%�l��T�!; :U��LVJX�U��*;�����f]+��r�)3��=�{�!�0ME�t��)3C���Eҷ�B�A+4&|8�[��`I?���ܲ����ಇ��>jn��J&S�"���������y|���������=��|�s�֙Շﯝ��:���]j|�q�Sz�Y���B,�7�3�텻Q�cU���^h$����j���������{�r�}��wW��b�ο|#Q8�e,@��<�kD��}A�g��b�}�[*�o����7Y"/�r�|�~���hm~�-|
w|��i�<{�>.�O�?���������ƹ+��bi�ŗ
D�[}m��^'�r������}�����W.������fϿ�*�@Y���8q�����#������ˍ�E��aŝ*c�x����1V<Ɗ�X�+��a�98�~?I��'ۭ��:�^��ʠmtY����՜�2 3E�2�7�(����C�c�v�n/t[�*Z�n�dc	��(�� K�����#n�n�&�P�ڎQ�1j;FmǨm��U����u�m�Ll/Զ�Oj[�/j������E�6቗F�~ȂD�m
��J�lW��Ҥ��V})��U�< ʖ�e�1|@�������ڀ��m�]�#��}���r��s�W��gy*8Ň��r.[`:wJ��{���7�}>��#��f���=��L�g�YL��&��VfK%B��SZ\1�I	�R
�B�kdz!�!L� `�rvq�yC'%I��(ɒET(��5(O���=���H`
�r�6���	�b�:&=��J�z��`/ y����H����I_�[$]���`z��\�(;���^�x=��{<��L�����CCi��~��=��{�����o������&	bOY'�����7��9�&��!�c�5��Ic�U���EM��X	��P�S��J��ix�VaZe��f���Ϣ��E+���0�|���l�y��_���]n�H�i������r�K�'��sWKw��ܚ�ۓ�M�[vz��9�!�7Vm�<2��H�ߏ��/D�Fz�bZ?���N7H�}��97f?�;�?Ǜ֘U�ƈ#�R.dr���k��3����płcL�<beJ�Z������ŏ\�#�v���pBi��=�*�l�U���t��*�f��B��-�X���;)�(�kxbrg�f��v�Kd��L�M����G�c 2���P��B�K�̑/�E������v��bn���#�i�ݒv�٘�3�U^*�r�`�oO�e�}��'�;�fl~��.�(�Y�k6�-����Q��7m�Y�9���W��<^����8_�'$�K,�@X�`a�jY���>�J�:�M*:i�������c���E��%��#}�'�v��[8�3�:�)�q�󲳢_��?�x]��'��zM)�:��S��*� k����y;�[:��.��QxB��Y��tP�u7UK����iK^P����T}������ꚬv��&��2p(�-���K���ġAv���N_)Q�%-E�Dp��^/-�V��#u��~����~4��&�3�P,����4�&dr������J��xz�Yh�mu�t]p6��Q]�S�mF��ğ`�dKUr|�⌙ޝ1RK�[;eb����oƜs�<2�wX�g���Do�A+���4�B��d����+�����W}۴.�����C���p��~kJ���/��&�b��D�A���(n8ǹ���p�3A3����cp�i�i�V�j�/'��Wc�d�ء���Q��h�w��M �/����e�z��6py�e./��˷�( ǐ��ۀ�F���B�q�x���Z��ר�Y�S�l(������5�B/��r�h��ZI�Q�2��c�=h'�@���؃�j�h5W�Fl�0^+�G�a֫���$I}Mxe�h���b�B�V�z�B�e�x�qr��t���$�b�C���1�!�?�����b�C���1�!�?�����?����btC�n��1�!F7����С� }zGT|�N�	���tx�U�@�<ۅ���x�L~lvi�N.�#�G���t��P�ku�ӵ�N������W���qp���ΏKi*�ƛ��_A��y檶���赫x"������)�(|�/�[~pɄv���7<��Y�x6���1<#�gl<#������{{����^��"JVF��)���8?ۘ?�94~�`?xǾ��Ɲ�+�����6�Y� �|����"�tX�������(�@�!#�@(A���R�������� �3hj�1f(��u��z���/�	����A#l<"acQ	�L���P�C)h����M�#��^�4�b�j$����a�PQ��nF8�QMl	QAa��&�� O"��	�"669��1@b}+������%��x��a�P<� �0�ES<�����jv�� �E@7=WI����X�G[U{o?�"h���j q�󨐋̀[�B-H���5�pgɣ8�1�Fk�%	y�������G�ᐨL`(ď���M}�����2TA�P����H/:0���Kc�-'~�X�ۼ6`\q ȍ��r�DP//���y~���R��&���������/o�T�G�XBpnoĽ�O�x����Ŀ3���o�e_�����1�G3n�z)���5,Y��:=6TO�c&e���/���5<<�ǧ�zmO�U���,���i�r&�P�;hu�	���]��J�(;�Y'4ԃҔ�#�����AC��f~ C���㓸|�i�3AJ�q�OW阓c5���u�D��L�	͟�o\[��%��^(ASC�n��xj����}�}������A}���s�Q���?��?�^ǖ&����T�X+���q�	����i�B�����D �����@1QV��:�t!��T/�*�xMWC������]������`����te&������t����\��x�s
cwN4�(z���@�����C��FY��-���-|��^��'�T�It��1"�M���\�``מ=�*��h�1��/S�)� �U���U9?	��r�J�ǘy����L=�L�!�Ŗ���R�\?�1nL��"î�=7D
<��%Y��L%��aFw��F'2��J�h�:)��*���K)W��-���4N�%V���l����P�P�kZ�]�B��Aq'thF���)���@��H�A?��QF.Rd�X��N��lQ�ܰqߪ�M6,�B���4B�T,]I�U�ٴAC�ΰ�ꥐQ7?��~�� ��{�W�R�7�y!��u{�L��]�` �Ƴ��dު�&'ʅ�����Y�~j���4���,�.�V�Z��>@�f	��tv�Ks��Ћ�£/W?;�����Go�;�^��@b�pz��O��7���uu��ڠ{l�	���r��?���/���%�����M��|�-�W��,�'���|���94��R����%�E�y,RD�WE7����k�w����Z@�J�gj��φ!9����j�	1ɄVlg���݌{�TX��|ʥv���Zs�u�$�}�]��֡�O���$�	U~.��*��J����/=��%�t�ԻN"����R[�3�+��m��ԫ�Ȱ$h��T�u��"�	��݃ER��ߋ��I�	�Y2&�:�]���7`R�Ar�$(� $��$'�fʔ}�2�3��$��SvQ�P����-��|�ق�f�$�oxqMC2	�N�ˆ��:�O��}���2`�<�@p��_�zwƼN��b��E0H҇CLI�0�g}��L�g����83,{�ׁ�8D�I����	ɱ�����f�U[��OM337�< ��K ����J��,$����#�k����|T���եqB�H6W�Qu�IJ�F���Rh=����fݫ���G�)3��}��@�u���T�g%�)���D�Oj��F<Q'C���%�"E��.?����棱��$[�8��=�[ײ���=~D�.��m�o3�^��F܃!1��PԽ�Sr���d!�{O�4�h��;_��\C�ҍw�O���Y{����)x�o�a�m�8w�����_Fk~�x�.��K���/�֡��8�.`�~m���!����Y��f�+��N��eQ-nyy齵��/����r+�a�WlC�A�d��|Œ�lՕ���F�HHZ#+E�<�y�� �H�k�~��r���.i�u�sEGuC�d$�s#��?��rF�I:�Ŧ��Јn�׳T���o�~|��0hs�8˄�yC�f���d����|N���{��J� �)Ls�4g\;>�˥ቊ5���s����V� |�:��L&5=��Ľ��A���Z�{"�R	T�Jc�q�l�����׃~�HO�P������V`�NĪ��K����S=��D؏\�擩�t��Kl�&f��Eau*�`1n[�%`'[�%7�%ʵ/ ˩2������EOhqV��`�1X��
R�WgO5��mKDى��� �'7+�U������*M����9�	ꩲ0#�Â�h$Q`X�Vq�U`�� +�ŇXmې�����H�eC19Y>4�g����Km���X?�����`�8~'���`(u�����w0�w��o0������zxSNf>%�,�J&M`@�o#��D�Mu��{��q�v��v���)<F�"�Tڱ^*=&q
-��v���d<�X�X�1ly[��U�T; �z���]j�"q��&��%xoU���`̞�ko�P���1o(Y�/���8>7'��)�7�֌0���P̌�̑��飤�s<Q�o��k�xMៀc9{�q����u�6�>s��hM�3k�5(g��O�X>�#Ә�R�+�5O��S�V���)���s�[����_Ip	�%�e\"%�
��R:��[!��o�G(���
҄�
+�`��#@&z�&ҙA`�a�
 ��U��!>�����o���C��P*c�X21���~�J���OV��1����7��x�*��d��O�l���uw�610͜�f���{���HR@��鐏��q��q�^����)	�y���j 0�����:��0-}���=b�u�m�Ng�Hyc��L�_��/ӆʳ�]��.d5�\p#Y�=��K�]���xc��;9�q�ݒ����v��ʃ�I�����p��&?O���c�����gG������/�a��6��tc��(�}���m������_���=uު>B7^��?�>���@�sZ*� ���_�����u��W�')���!mbg������_�r&(��^�|��+�(��3��<M��4E�����N�W1Ӷ�>��\g{��؏˵Z��O�S��199�KrQ��K�Ӣz1/U(�E�򚕓7U�
��J�N����������������a����`�ǥs�$�O��:��f���`2�I�j�e����p_r���	�b�l);f��$���.�y��X�z��*��v#�����NJ�:�'A8R�NG���j�-�����2��'h�.NB��BkSސ���1���- M���?s�p}bk٬��F�Z�BC*=YSι�<�=���c$D����Ny7R>V��e�8>���k❓��g�A9f�K�<����C�
�z&�8�;��'}z��O�O�I����+�oqn0�7(G,?��qj�Е�T�WZ�b�2H#�h(Ec�cWa{�}������Bm����^[}x� ��#���*��,�'ﵯy�]/�.4޾�B|��[��=�U 4j����7}�@e�w�y����KX^RTe`���_s1J�a�%�{�D`�I)����O�;wܻl߸�z}�KG<�{4��]�������R*i�L���L��h5�T�#'S$ �G�X��z�Wۊ�w�Y%�� ���AU�EB��s�I�=ʗ���J�4��Ca��yP�� �<��k	��A
��_�nJ�z�U�Ic�D��l���z�K��M�'A�ā�׋�O��ھ�==�ڧ��H#�>WM	�8�.C��yϸ�ɸJ��̭��:OW|Mҩ�s����<����[(��D�:X�]�p�D�?��\����@���*{E�`��k���z�Xk���Xk�����5��u�0/�ŉ�+�;etv��J�"�qcX��%`��=�ʠ����d����Y�N��$+>�T���x��~��c��R.��X�8H���H��e}�:ݪ2Aޛ��0G���K�rh3� ��E���������ې��F'�U⛔1�tYWǙ�Y,���SHyʮ�"P�B9�-�Gq�z�!7KuL��s;��Z<.���09�����W��+�s}=b4M��_�5������00퉓�,�V`vtYux��[B�9׽�I�3�0��/H��˹�j�E5�Y�U�yۓ�ʄG�/\5ײ�z��\NZ��gh�����Q���(�lT�q+w���s��ݵ�sMkϢ@Ɛ��%�h��T����M<������vӏ�C>�'�f߶Q�ɇ���o��OK��e�����cPJ�x��fP���E!���u����<��~%0�I>w�^\�����`/�_��4��L�G��Z���}���>\��U��i������f�2k�.��;jR�D�W�ZW���x�a{nѾ�&��4�|�/����]����\��ڪ�Y�@�J[z�ν�_=�w���Rҽ�w%{�b��9�Y��)zu���h5��`N�W��q�{��+7�iʭ>����ŕ�7fO:\�3����"�/P"Ј�j���	��s��c�۩M}�lVi]:�[`�|,̻~�{J�f�i�X+��,��4����Y�ɆZ{�y�1����{��M���J��K5�9��JB,�\�z�:>�Sui����C9��������z�0�����.��<e'K[muJ�r�"��e�Z^��n��ڭRnGs��c��L"{u� 