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
�֣enruan.sh �=mwŚ��E1a2$��I�qU�]�*zĻ纙�9��N�0�=N���0{�%W�rq��\Wᨫ���^���s��f&ɿا޺���'�0\%鮗���zޫ�j�N}ڲ�iÝ�Qr*N���`5w ���5���%�a{���,O�"EZ8�.���j��W��9�8[7N����e�~"H> ����b������t4��в5Û���^�SZ;����ҜY:1�aݟ�*f�4�Xo�u�┌
�]o��;�iAkM"�D8T�h� ��L�� ?�ɬ���T�"�>�T�QB��	��͓�ݨT���s>��I�J���$ׯ�Hsk*���4Wu�hha�0Ks��QɩYfv��>�n�T2]wj�ډ�$�?��7ט&��qif�u��c��`"m�j�qx����c�v=�R�S~aVd��b�^d�@��U5}��#Ó`���((#N�xC@��/i%4�j��
O�F�� ��x'τ�fO������D�90�o�����,F��+s�SV��9v�E�C��$�[��f�:�f�Z6������yupPj�+@��!<�y5wB׍�5�
����N&��S���L�su��,d"�B����6H�1iϢ�J�t��H��(j�3��F�ʀBU��\VX�H���&4�<}f@nu��E�u�Y�
��	�6狍�U.��A��RV�N;��֎Y�6�D$
@��T1�:}���çB� �s���wP�귝/,߿�^�ӹz~y�L��'+������k=�ڷ�Y�������_.�l�j��c�=�=�,,/}���m��;�ϐ��_u��Y�����v"�C���Q�4@\�����^�v}�;�__^z���uh�}��ז�Y�{�p�F��ǫ��t�;�{���a������[��a��k���QFZ��V�B�՟>l/^_���윻ԹrF�z���o~��3�?�^;{q�I#�|�����:�O�x�d���3��	 �f(`d1��<1���0��qJ$�8t��H��v�R"��*;6�#e˭U�t�1Xn�M1C��|ec"���g�����h�̙��V/^m_����yS�`���\GZ�ME���
�f���\?��$�Rf���PEZ0�� ��2�"������e�8���9�B٩ ]��
j�9�E�mE�"A_�$���y�`��<�bհ �����`��`=9�3���\��^F�+�~��12d\JA��F�[a������F����|�߄<�s��d�XG������Ă�a^�Tj�I�Q�G�t��t�S�]�!O>9�J�tn|4s�|.��U�DK�fJI��bJ	��^jɥ�Z*���V�\Yv��m[)q���*LQ�a�a����(3(�]�ł�Żp�n���e#�����ճߴ��(�:�}Bp�����Ǥ���_�0I�_�x�)�>2�1���*$f7�S���6��0^�`�% ��I���ƹ&�	��!�j���6Kb=��6�&7��+�]�h�p�9���=�#\9�����'ʣ,ؙ�P(N��<;�,��ŭ<>�`��R���9M[�70���}�K�`c���LƓD�_�M���E0�q�{�m��ژ���Y�;�8�~�t$G��M��Qs^$�+� E��G;�^]���@R�C��Pn�%���x���1r�% ��!W�i��ǩ�|wkƋ�Q:�zRR9���+4�]�16G=r4KF�BQ^������ɜ&�Q�낤��|���o�3�0�M��&4f��pR%`px��>[�����İ!��)O
i��\�b�&�c�)�����_�+���J �#MZ�%����\�!n��{��/�]�������>[^�ǢQ### N��o<"#YDW������s�?ADD݃ι+ u���'l�E8�4�=���]�
K	�c����%�M�7�,ъ֔$�(��̧��_��l�B����JUZJ�K�A�s��h&	�P��-�#))g�Z6ą��O;�;��3G�	�d�X����|]��B�:�+�y�E����r�CK�B*2
�n��ؾy�y�@�k�?^�uKp�0���`���9�y�k�S򜘰����>e�p*�/b�^F��G�&P�Q$�Y��<_g%._S�K��*�N=]���@cr:|�u�	TO"���sڌ?*{ֲ���2-�l�"��C)�3F��Q$%�%TH�%y0�kNN�w-!��c]1j��*VP�O:�YA��1�֣IB~05�Tk�ul�Ӡ��.ևu����Jr���K(��(�{p�_&���D�k�'~��gp(��Y8,�oUWXO2dE=|�QS5�9t��Q7J�Y�cx��G��ez3Zͩ�ʍe�rPq��^�����v�r-��������JV���!WR�K��	ϣ�HY�ƀ�t�P��z+J��4wʍᐐ.5�u�R��g�-����F~&�XP�|�M&���B��0�0�B$���\&#f;s^����ژ���Ha�e�z!����B �QA�U�����>�4&�P�&��V�g�w�����P:v���a�^�q-�<�v"�jxAx��;I�
$H�D����])��xh��k���1&T��̬�4��`�ѺND\���4����"8:�=�H�!�nb�&�Ø	2�	��$�3
�&�
��s ������#ǎ^y��W̓&�g[iE#'����V`a���u�zu�a�5�u�za�sFٙw��	�m&e TT� �qن�5@�L�pNp�N�
��P������M��D�V3�Si�L��s&�����<����!�	J�0�h�:u�]��|f2�jp";�?b��T������'��p���T�O�X�@�0D�v�a%�'Y
�d7�6�§W�7�TL����>��*��0���g�-HBDǙa�I츨E�Xt	�b�7�	��� ��/=E�<~ȑD��s�@��K���1��<D��)�#��ǐ,�����S��I��!7z2��#�t����g���h���,^�z�\���+x�5 �W�#4e��n��HE���pD�˙E�-5�?X�,ړ�IS�v�ɂ�{J/v��x?K���T>.l��?�r�1;�
V�s���^S���-�t.������$�Z�4+-��?P�T��FpZy2��9��c��x��K�Rg��땭d=ZV�b�	�¡C�"� ('��"�$�"�& ��ؓ-�D0�S6�Ũ-Bܺ��
������E���=�a>�(���"|������*_t��x�$^���EcK�x��n^�_�^| rۋ�x�26������}b�x��^�/֋O�����+���# �k�����1�+�� bۋߠ��D���o{��^����Ћ����{�ȣ���~����7�^<�Ұ���M�l�O���
a��Bb4["��"���/D�|8!	�	��Ȟ��)�� $e
xd�^�1% )"�\�I������>:���C�Ԟ�2.���R�u��v=����@k��f�|�\9ѕ���G�=�V�70	��mX'M����4�"�2E�n~2�n���r�a7?������^��s�\�t�}�>Ug��O�*l�?|w�;t��/g�������5�>j�3j�^���J���[`��*y�1��x䱍����B�F�_`C���a���p���y��� �r?�G5�X������F|CA���v�>��zp�_ܧ��s[[ѯ�������4ؾsc������������@أ�ﶿ�"���>p��n��}���l`��o��3������f(B>�ږ!smu@�+}g��)�ō#�%�|I'�đZo�Ee<���2U��+���ޟ�;� �E��!8̝)i ���8���(�Q�,��0�M����O�n��No�ٓM��)/r:�敗B�o�.�ȾB(���p[ym+�m嵭����;��w-�xҨXlc��*�ʒ�%,=���Mf��6���TsK�_�7�m�@�H�������_,5iih�p�#Ċ,2�fdW [t(��B� ӱ�A�It�hG$z:y�ׇ�M$�Gz���3N�Z�$˛�>+���4�9�3��f"��F9 ��l��H�72�fK�ս<Ue�Y�1=�� �e��x�7�QFY_�i��(����o/δr����̿[���,b�����]���ě�d�[bi$�ӝ��Z��@̋Y�r
�������l^�Y7�VC#�$�g�н�q�a(̥a�d6~�[�l��fy0m��ef��o2!��ݺo��T�7dΧ�Ri���8\m�u*��]����\�ߨ�d9ȓ�m4�'�"Ō��R#����z�>�����P��5>�7�@�c�d&�fFO�
��1J 
�A�q1� �[N�M>�l�'bsu����!���[e�Cv�y��2���lpd�tj(?��U�ݏ���.�c!'����鏊m�� �T��7A5�˲~�;�|�&��m�:CQ�J��J��2��\�\ϴ�&�;����n����>��B\[��r�&;�S��Gq���;P3�����F��}��/;ʟ���Ku�s 8y$����_�F��$�tA��5T�w0~�}ҵ�����% �_�J$|B�i3	9z����U�h��J��9�b��6LYg��^ �I��X����\_�l?ǎ��I;�`rׇFJš	F�I�	#��A��w|<�1p�~Ru�:K��=�y7-lA���<�@q���݊x[�}�j*��g��r�U�2)b�c�Z�W|[�>�اdR�1V7��2H��S��g
��(~�����,�LbZ�[w�?\^��mv��t�f�m��JՅ�:�Ӵ�?3(��c3�ᓺa�Ti�a��q�#]��`D̥g?�xA��<�ἤ�{���<��UM��ś-�>9�IL!uq���$���|����^	�j��S&UN��يJ�졝�����JM��PS�3��k��1ˈ��֮C�ltTp)���3�7�Y�Uv�(E��θ���^��Q�y&܌��ƁI%r�rr~�k\]M3I�o�J��aʹ����������ZcsM��lQm*i���K��	�lV��8�Çk�<K4&�<��x�}���	�wA[h��|�J&��u����8��Mm�TsH�*�������BDn�յ�P�
Ը�=��z\]��	=���(���E�zK8��n��k�	�E�O���Z���^>r�h>]Ȏ�Mf��g����"��F��Q&]��K�+qm��t���[���=#{D8~�,�`qs���A�ҝѿ���ę�uc>tH�V7+��#�\�'O&k�u���ge5i��Q>r��t����|�E��W��W�X\��R{���>]���{��h�ƕη����G[��/�[�Wzk��"=!~�̥��o�|w�����ȈЁ��Ǡ�տ-��|6��}?\�|�����-���ۗn�|o�޵����Q����nP���?l���������b�W���6PF�<1����1��jF�1K�.�4�c��=!�DIn!!j��"�n�������U)k��P��}��bM�nE��`/�I�⯯�{n��̖JZ�r^��7����3��Ң�������-H#%�&�p�V��1akM��R�&�V�ܥ�ﯱ��I5�n�{M;<D��������(y������r�n�ˈb������&rR���z��	q�q�<Hb�ڴ�0b�jPqZ�a3���'��]D��?�Gā ��;�Hd�Z�*�ŭ��6�ňA�~)�V�d�)Q��@J���f<�V��N3�n)�^7�o�7b��Dd/mN=7n�<P�F���)$8M]+�c���\6��w��(.�tաۘ���^|���ϼ� ���f��`{ ju�V�Ii�d>56��ّ���f��)�V�i�F@�����^�F �� 5/)�uÆ*b��������^�j|+���z�x���切5�;h� �̅K%jLl!`uG{���g�u�z�k���ｮYn�����oEa����w��g�o�� �a��Q�a7:��{;W�i�xf��:W�J.U���-�ƛ A9Z'S�̦ZH���/��}���3o��}���W dy��	��R�n�r]y�����<��
?6�[Z��.M|��	cфq����u�H�3�+��\����k�˻�8����>E���3j�'^H�s���O":�LK3�23B�z�p�j�Hb����m�/���s�U�I�+�uk���eF��,�����[�nս�w��Yo,��I���D'�qnO?�ﹹ��+����%ҿ����!V�|�_���˷��
�U�go-�;��\]a�й���S�[N1̗o)��o��9�(�^1$���5!��L�"���(���Q�L6�}�!+zh�/.��b��m{�����^��]��œKw����t�<M�¾<�'�̾q����O�������)/\���j_>m�x��D0͹��g���X��v)�� x�X�ȏ�U+��7]ؚT�}%��^D��rpi����G�&���G�Q�Wt�.���dlbb�R����0+�d0k/��/�����la�V�r�����^9��Q�J���OR?y��O^��T�48��l�?�'k���V}��������y�#�����2a���R�s����g���0z^90��p�~"f�ދ��V޾
�u���)���߽�_g�n/=�+e�ƕ���̍g���p��-�Y5�^�+������qj�v�D�Ã��_Y�����Ƨ�k[�L/��[�ޜ(�?ɂH����ط��yؾt�nP��iA�d�0(c�ՏU�G��y\�˿��ިT�Z�f[��w.�[��mx}��=�ǝX>w��p�1�7�tϞ?����ҽ�������;sx�+��5Y#Z�$����{5^Ɣ�fL���w���s����&�&��}�h��y����w�Y��Ky��k��f�0��1a	<�{� ��w���oQ�7!l�AC��v�z��ćK����pF�c;Ҹ�����Y�A��g1���	�*g����o\�¾�+�a���|�� ��D9W/T�,)$�tjÓxu`�,�cX3�i�����U);5\�ʣ����L��V	W��i9u�& \�������-5-}����<Q�T 5��l�Yp����2Q�ԓ�hW�q��f�qW�I"��\� ɓ�Γ��`z���8=%��2�����K�{�y��&bg�����ؐq-�J��c��Is�>���T	q�Y�bt]���\;>?�ڧk��4-i��-|D�������x�`����$��?�/=x���;p�;7����l�����o��V�����{D@}�冴�i��W1�YJ�,e)���,�P���]��,u�<�4Ȟ|�p�l*`���*( �S�����*�Z���&��e�O���"��� �NWl��V^�,��_$8Ł�G�y�ϩ�����uFb���LK�3_��Y�g�p��5vhP�i#�]o��=�rkUa�e�,Y={���L�D��?Q]|�uzV�
=�ܜ�g?�VpZY)[ύY�af�1ԧ���7�b��H�%����)K�j�&��r�F�Nr��\+�@��gs�r_s�(��M�3t�J���s��Ja���e+.*hjO�Q3;���zMӽ%ұ��kְ�:�kmf�qZ��º�S�����r�l�I�4�S�aH�CW��á?������{Q#<�
	B��Ơ��
c"np�s�:�zV��@��^^oO�0	��My_�?��ƝS�dK���bm���#�+Y1�����X�jNNNj
s����h�kV9W=>^��q;����2�u%8vr� �O^k|�����q�P��!gy�Õ��z4���윖>��r9r5Xn�؇-Ё׉��y�Erg�}�����c��6��Y!in�;9q2���S�H&��( ӫ�l���Q����R��s��{т(�j�[e��Q�8;�[�dz���Vϖ��"��|s�&�6#�N�e]3Q5`F�K���Kq@�6t�Rؾ��]��7{$j�"*�B��.�Y�Ѻ�!�0݌P���y�#��0LK��8/�L�+����k����������RXy ��M�G@)+ �!*������PU�-�����J��	d��he��ҝ{D��wXk\��G0�m�
;���CFC��C]~�<"����*�V�V+�3�Qrjw�sx?���<�����=����#k�{��H��ڋ@6T&���g�@I���&>�Oy������u��X��G?��O��|�����%����p��xYCWm�L��v>2�԰GkeU��}���pi�dg1�2��<�G�' fA��5_�N�R� *$� �r#��1)�#����D�h:�cRW�]���\X31T)��H��Q#�FV�|H)��F�X�YG��-�RF)lx����Zf`�uk n7�\��W���$v>&�� �#��3E���赦Y���GBPD�0��ǧߑH7݂vZu�,Ҝie��v��<�%�sT���{���Wn%�,�Bw�f�֓Zu�}G�f��éZ �E�L��K����>z�!�^I���㳸�����Bө�޽{g���#��R�IWt��Vg��<:�H�;I��W����A�/x#t���}J�O��,��Hw�hBEv��_�kYrͭ�,�O��Ѯ�|גX@��Z�~�q��}m��^��y��F�(���΅W�IT���s�_y�<�j�6�4lM��Y"������g�A0	AC�X�ʖ0�w��&+�2С<SV�\�C�LϠ�}<�{?���z���'p��Ԇ�p�p��߉�]�f`��g.�Q�M�TaK5�3F%��	��H��ƅ3��U�2�ϰ��əZ܃��w� |�'�M-F�ǐ|��w̻�UT���S�+q�M���[�q*�-h>��U�,W���������X�~w��IhJg:���4c:�\��da�X&b׌�'�Q�H��>,W��o�K�k/V�*�׹�/�@RO���AK�u�Y8{·̑�,�h�d�Ui�N��'�ڜ�4U��W�W�N������̕A%H��'��Z9���J
i	�<�5n����S#`�/pO6�X �H����a�@�(o�z��+����+�g��t�~H+
��W',�����dw�X5��P��W���؅w����[y ����خ2������Nv퉶XrԂ���}�
��3��ڸ�ܗ�]�4�T����T1o�\�=�x��K�N��ղf��ꃹ�#I G��y���[bz�q����{^K��@˨�y��1"q�Op�BO�G�k�v��-��ǳv�V�(��O����Wp~{���K5�R7�4�(�T�k7�A�]�@`�Kw��B}��M>,���Y*0h�>u�ɉ_�F��6�+��Όde&T4$��M�)��r�N��Wz���i�}a���Avd���ޖ%���o���Z�	a\w���B������wE��q��!�,�������F����h6d$���5�Mo��,�3�n�2CFh/��%^.�W��X�I��
�+;-@�t���r�AS�����O��k�4^�]�>�"t�+Fа&��j�+���f۲�єVp���K�U�e��':�+�N$�-M<v��PCK,�.4�^����qP�=����Q�:�)Rjl�Da�6IO�-�Eg�Mm�������P
���J���SZa<��Y��l5[��`����7���޽�X��ʽm�鞘O^v�C�������#���u'��K���4M����J�(���><�+��#�r�\;�(ٮ&��>M9��>r_�+I)�iI� �w�!�.����9�J��'��
p�f�)[̾��0/C�a%��U�)Z���(-�(�H�F��&{ud��e��Pxa(>֏w�В�#5��kY�iv_�*�����p��Te�g(�MÈ�V{}����/���{�y��=��|��9N԰����6�B�\�niH�
��A�M�&�t��Zw8}^u�֑��&|wQ	�l��ێ�l�,ϣ��A��T�}N�'ń/L�3��U� h����b%S�Z�އ�����+�S�Wq��U�x�A:���iQ���^�~
�<�^0���Z�R�iE��S̭�k&ި��-D���j���8DbC��=}}	��5;�>�ʹ���U�xȘ1���l��'­73X��D͎"K����Gd(�a��̡dQx���b��j$���M�!T�2��U$����{�F@��Q+d��`�L9-�|nO,fk�a�����}V�l��S<[]��e�)R[7��[4�Eh�����3�XY��U�p��D�G�FtȤ�vz1������Ә��jQ�vIVz�f)�l�fc��X��"6��������r��B���tGH4�+��'7����O�K�q�VH%�T���{�W�!]z8�

$呭 ��������e4�+H�cC#Z��X�< !�	�P�Zo� �:%�rb"�CC�7N1ֳ}��p�����Î��-�;���m�d�X��4�w-`�=�R<���`�x$R�_D�e#�$����j���󅪕�W���V0>�g�N���	��Y`!��U?�w���vh�TC77m�U���;�F�}��-IZ&q����g{w�ē3>`}v��N}����E���ң�(�P�_}��E�K���(؝.w�˪��ޤ�+=�(��F�vn;��>l�S���E����Kg!�6�Y�H�����p���*�C��QAV�.A��hLR�HY�C;��l�4�>�o�%��ܢ&���BN{�.)�o�}���� 菉_�� 76M���uۚ�KH4@����5I��tIi�Dj��9��y��S�<*�\-�|�H��ab#�c�\��r{P�kt�������}���)���~��+Ƌ�z�5`����t�UShU�F�ՉrsX��ʓ�ݼ�e���6�Ν�G�V>����\ʿ>Lǃ�i��/���Ei�Z��g��9).�<@��!���ң��ۆ�4?�E��f2P8�fqj��l �e�L����	�o|w���� ��V	`�>u�^%j/\]����'c��k|�)E���ý�+7�q��K���߾�� ��?^y����}�
;�q��d��UҸ ���`f!���R��T"q<o	���P佟����?��+��z�U�>Q-+&,OR��'�(i�� o2������'�*9%��9y��v��)Z���HJ��Ӎ�-o�e,}%ȫ>_&��hl1�ı�'��?M�Ҹr�J3�{����*vG%���\Y��ۤ�[1���������O��)��t'�PH�%;�K�6H��c@jZRlQ�@2�R�	���b1�1����������3����	�1;�\e���U^��#B�'��&l�4Ax�	��N�3{�tf:_[\s	�=��|���W@��ǹ�A�tv��R�~پ�k_�i���$�׮�'y�A<*�({#�!;�����ǆ�D�jO��H	��ɰ!b%0�u�)�=�î��;%�j&�5�2_��-Z���Cg��K[9�]w��*�R�,�̇��)��vK��>�{���I>Bc�i�-+�&O�IϤg�i�btwJy���$��7�WD�uX�D-/v1ě4-5�,�!��] lڹq�M '_���rG�pH<�9��q��3��a�W�U�V�J���}������\�ӿ�pΞ?Oĉ��۞��>ure�M���?���s�_.Лz<�(�k�G�k�>����;Õ����� n�r
͐+"��.)���jI�x����'W8���A�)��6��%�+��j7 �6�a�y�MzY=Z�E�i)�@��h���ˏ�{_�7��t�����?�� Tf��5�b�S��i�$���ӫ&sh�;�*@��r��v���ҭʩd��N�ߣIq�Y{�ڹ"�&�e)Z�~qe���w?XY\ħʕ��jN�^�o\�G��{��&gه�P��>7����([��X�A&͉h^E�T�$���)�E.:@�&��;���}���Mn����T���Z�t<1d8���f:d�^)}�o��7��={��y�7� `$tJ`(�d��S��
1�G}���z%�9UK�Ե\�U[Z�V�<KjS=��Yo_[��9ݝ�h��Ʃ&�1*�F���t�`gH�F!�Gsn�"�Z]$-���ƶ�^.��_��[�B�����3(y��g��H]�Xqy�o 2���s��aL|m�3b�,�I$m��-��ʝ퐃�շd�p!G]�fl�
�<Ζuq��U(����;�}[��J~�����r�] {hIc�����^���R;F���~X� [����"�-�K=�	r�	�:g;������$�M��r�S�8���R�U�>�3���j��1V�/�S*Q8�Ny`�C�h� x�z��R3hR�@����6�IM�g��/3��M�ի��	�J��p���Wwg_�< =�C���.dR�
�gX�t��:��D�'�T?��!W��.3h��W���ε��J�憎dj�--��NWԁ
z�G��l~� fh2k����>�gb���d�qoK6��F��f���L����.gN���=���JM��S�V�v�F��+(���+(d٤f��͚"..JF��ҀK���bs4����i)p��5�
�������m(�}P#,؇F ���6�.��7��k�i��
$��(ѣUn�0��͕���4�,��o��Ɔ�0�F"�8��|�� 7,���ɨF�ON�9��	Y�Ȋx<��@�%x[v s�ވ{ <q�������]c���-��f��M�N�^5��~(�RY~/�1�� ]��L�ǅ��������|�|v���i���&x�&����:wӜ?��� .{�w=��D�/f`��g���L�N�rNIىh��\���Ĥ�����ҝ{��̼}��K�c:.ݻ�t�/�ϩ	�'�|����S7������'���	d������O���p-�ц�@|L|z3_�|`,�%�/��3�V�y ZK?҂T�׊ms�f��qO�S�~����� �{uK� ����2@w}*׿��� h� �r|�{:�V�gڴ�'�MA��r�?�V)�c�y���na���K��a@.�4�̇�8�N=x�p�R J��[J7[8޽X��Pȼ�b@f�'KP��,�i	�����@���T`�;E���
J��<�

�C�H�XC�5�XC�5�XC�5�XCz:4$ݕK�37v����ؙ���ܙ�Gjx2[gȝ�j�P/f��dI#�\��P�LB�*��
?�譑��#Y�o�;O���Re8_�T��+�z-r����6LHn�@��5�k#�@+	�5�0����NBK�,&a���� ���_�o�����_X,��Vy�o�N��e�%�J�B�𡿂�����=����}{�
ş=r��	rv�
Uj��7U���r�b`Ξ_\~�&mq ��C�v���iA�C;ϸ����t��ɪC�����oh�D�p����@�C-������)����^�����}{�z���1d����0���I�n�'���>M%�;|bO���fh��(��Cڳ{w�n=��H�1+wt�|r���UT >M�˂��cqz73t���ٱ�ٱ�J���t�D�L�g8���TƧ1��6���}m�]��HwE�ҋ}i�ggp���t�.��ׯ+�d�}*I�Oڝ)�z�Kͫ],p��շ5�ݞ�MW
'�k��Cs��^���*���͂�D ��Ək��J5��%��vC�c}u�V�����R%t�,;qB_�6��W&k��њ����' Q	i�%}�S����!���C�+�u\��z�&�Be�/iY��^Q(��������}�K9�<�^z8���������O�tD�7�5�4�^,�a�:���/I��{i����[h�3�F�" ��# K���.�;�R�T�'@v��a��W����@�~9���PAh�"{��k�@�iV��Y�9	�D4��֍����V0s�T�Ѣ�E�+pd���sj��+�N�8��~/��` xx��s�:7��C�y�����X��2
 |VG�����Qԛ |�b̏�͋�5�bQ�{���R�q�����n0�6���7��$�� �� �.�c�'="�5t��C7�]k=�l���~��ֳk��>a�zp3���L&cD�;]ۣT��;J��ݮ�p#HᇤA�;}�I�]�c�Dm��II*��`��d�Ǭ������ʉ{�X���R��J�j� �2���J0�U��̈	�t��5���Q}`�����f�K�����^�3��͗���+_�l��-�8e?�����c��m�g��Ez�����I�l�4��`Fl�y;ȯ��ވ��M�g��|���k�����v�#p>�_�%~I|s���`b��w� p���*��.��K�|�?���g��if	��[��\m�9�����8t�.�ːZ7go/=��qr���?M�u�~�1x�?�b��_����܂=�g,����.�=�[���}�p�\8�^�W�;_F��{+�^��e�)~��lWx�R�
ǝ���y�|�Y=3/�%�+ȺD&�5������Ɏ��רU��&����#�5z�!�o:�r�;~I$��}zזAFG�9�/�h>�M�n[S�:��PN����iA￥w:Tr^��Oȵ�����>B�9 ��l����x���p�E08����@K����
Q�ǂ��Z���(�A�a-�K���c~�P����þ�z�B��Qu='�ȄR���U���	�D���l�eq{7��!E*���������GH��⎷EZs��5'q"�Jk<�u��@�M��[��������#�5$���2[S�ٜ֕��&��	~#���e^~<d6�y��5��N\�w�G������Ȍ����s�W�Bۣr��m��������~r���m�����j� ���w�$�/�ky]���z5+�ê�Q���Mx�ڄ�T?N�����^���D��,��*x[Su�\+T���%� @��7DT�P7�K����ћ����8�Z�4�SV���ɛ�4��yc���!;�ۍ?>������p(hM�-e��i��6�>s�����~c��e�̸]k�5�ڨ�_N�z���+�iD{d?�5��G���C�
�s��k�4��=��峍k��9#�2�_֊hjw�s(	��5�)X8<�&�\���#��[5�݉����<(�7�v6�8�,W�/Y����GkG��'3�#�:� ��h�o���$�Y9��]}q�nU垒Mwԉ�q����9���D��x��
�v>��䳥��������t!r=�=��-���[Zyh'���SCID�X��Z9�zV$D%�#H h~Ty�R�#b���{_������Ǘh� 
i3 ���V#�H�]��l�g�ı�T�nq��6����}x�����@{�8z�)�ӽ=�z����d�Á}�	6$�+�r�
[�z���=?�����<Ƽ]��֒]h:�ۻw����+z���7<��WC�3r����ՕGgx���1�0��4��z�<���3{�9�z�d�F�d�V� ���1JN"�X�jNNN�E��ɘ���-IxD?�!�Q7U΂ M�P7�.7���SI��Eaڡ8�������U,�M�_*�����J��P�=�a+�3Uz1���}�_��	��PrD�ͼ�2�ޓ��;�p�� �Sn
���1z�b6�?ml�����Si��	�
T�T�
�fĝ�(�{�~����z�V�g����}ﺼ�r�A2Q�S��;�ŉ��P�	[{R>I�3�Joަ�i��RJR7�B�F�I!��G3�O�pH�`(��.�3��^��i��3p�4��$�!~�k0�c��D�:zP\��c�\��5,�S  �^���*�)9���3�_6���3�0��bb�`��$q�}oޞ��q��C�R�; Q�����Đ�Hu���U<�����E�:������_�=\�5���s���jœ�o��r��^?U��x���X��.��uV|�W&�ø8� ���c:��(���).����i�V�?@�=�N���C�_����&j���+΂�bk���'JG��F�@
�K��Ҩf����M���E+�|uF^=d�I���j:�n
c�X1�
q�u�9?gh8H�O��&��c�,�z��NzC˨�y��1"�A��f��r��X�ֲ�p�$B"nMe�[�fص��g5串���8۳��r.qx6��Toj;�� W� �V� �,�o�2����چ�];�ܗ���B���m'�F�㕉*��mg�:�[kKP�v)�`F��"q ���i�<l��B �	�F���Ԓ��W���
0�ە^�����G�3��j�d�:)��*���K)W��-��D۝����V���8��v�2B�Cͮi�1`���1^���	#����R�P��:a�N�x/z	_�'}��Z�8�+;Q��e���⿡������ǿ�b��t��E��O\_�@��Z���ÿg����ӵ���㚬9�b/ذ\MD���k�t%�CVyg��:��(����A���Ö��T��x�b�ʙ�����L�������Ӎ+w�|��������>������v�"?�!�4"���,�.����f	���:�s�+��˯ã�V>?����������$� ��� ��,Pyt������1��C��7�]��w������p��M&�v3>p��j��%px<�O�%Ex�!s�ashh�9�������:�E���D��ɏ��Q�Q�6�N�iFI�d�q��VF�M��Xk���i@�����6(��Z�o���/)Y���0薰f���z�ĩ��O@�aL�>�^�һv�^u:\M8-P�@���kx�E�A��h>�ΝCك�<��`�j�IbBס�&�!W��M��	V^h�	����ߋ��`�iKEе��V�	��+&����ǵ��\�RĚo�IN\�{��>g��I����vv�I�\g^-D�	8��M��F#�4$U�0uBT6�6ٿ)|�
�zkcX�'-\��D��J���W��J:	F�ͽ�D^�ּ� ��Ë�{�H:�-m0��װ���qڞ��؆�yl��mB'�&K�m}mJ�[�}�4Gy)v�5�1�af�ә3������~�͒X�ji���c7�7�2��u�u���t]�C�_k!��w>d���E��>1$yc-"��Z:� -��!ۗ(�ɃSe�� �T��0QX)a�fT�3�l�ʶV���5��R��q���(��`��g�4��UJ����z�I��
-�И��o]��%AL� �K:p�b��C�N��n�����w+�L-�O�J�����?��!��/t���*�Z6��_�Fx��p4 �X���y�׈�����K���6T���.ѯ�D���\�v�~�h��,$Z�B��^�o�f�7r-���^E�z�x�n��%H�`��W�	+}c��%fcZ�}������߽	�{]Zą�KEy\�҃�WgϽ�:zɀ*m<����1�[x�6�-7���ڇ�v����1�;Fr�H��#�c$����P���4��^����nt��+C�5�b��B�r�������@�A�c`u����1����ja�h	Xݒ�%�R� ��,).`�2��@0���՚4?1�:�Tǘ�Sc�9RV�ZbL��a��3��0���=5�jy辘���ɭ��m�O.�v��*[b���٪��M�I�	A��Rf[��y��-��f#��O*|����i@E�g�����F�2w�U�~w�j�ǲ��k�Cr�w%�-2�8%�h�%���M�������3I��f~��3��%�Ps�>�^a��_�)-���������:�kdj�!L��G�rn��C'���u��D4��5�6���=���HX
�r�6���	p�a�7*=���Չl9�^ 0&A3�e���Z��K
����/�-�<�E��ݽ��z�?wy����nJ%�����������w=3)O߈M���8M@��NG��k�o
�sG�	�C
�@kx���(� E�$z�����V�tՕ�b������*���(.�+>E?jr�V�%@S-@��V����@W����������k?2�z�̍)D�M�.��ye�$�j
���B�3⯭�X%?�SkH�ߏ�kDD�FzaZ?�0�v7��}�B�LrnH~$w6
	~�7�Q��?O�R��&�r��~�`&���U�1�J�ʔ���1K�[9��:G���,�9��V�{nޯ�iW�c�ӑ&�rd���e��R������wR�8��������H�m/��[���"j��o�x�@d����З�P�g��)XKН-T7�4��ļlC�GL��%툳1_���8T �P��ߞ>�r�]Ofލ���y=�Q��Z�i����c��r�!Эٺ/�s:m�+өx,�6*�ݵq�J�K�W��aU��QdF���*U�7�l�
;��~�8ڳ�"�x���|O��>��p�g�q�S����egE�		"�|�
��oOf��R�Mh�p[*��k���sly;�S:��)��Q�kB�X��tP�u7TK����iK^̰���T}�����}ꚬu��&��2p(�*��u�c�ġA�ʺ�N_)Q�%-E�,j��^/-�V��#u�e����x~4��&�3�P,�ҝ�4W%�A������J�K/�߳��4Ӷ:U�.8�눮��)�6#yf⏰�U��9�tq�L��)�e"���21���Έ7cιP� ���{�ѳI�a�7�\�n��T鏁��{�����ut���g���yS<̡�ej8Xo�2%��Ɨ���u��i�� �q�C/��{xcp�sڙ��V�d����V���4j����6���]J�M�elSE�6����4�;P�&�ڗ�u��2p��z���2����[V�cHK��m@�J� N��M!ܸn<E�p-��k��(�)A*x�z���Z���P�Q4c�L�$\/���A�	���&��r��fpc�Rq8_�fs�V5�v[�L��քWF&��1� �`���.JG�'7up�nJ'"�=L1<!�'�����bxBO��	1<!�'�����bxBO�XxB>��1� ���|�b�A>������� ��=�]O������h����l�|fT��1��֥p3��������%d?��}n�jD+���j��?6.~���'�������	D��4�>g?���U��J�KH���(�t�wz�|�2em���ޥ�s&�z�{���C�{p"�9{�q��;c'b��fa'b�v�ڎ]۱k��K��n٥]-�duā������s��k�4G�쇗���l�9���{*jc=�
���H!r,KĊ��_G�~�~�����߿�.>�u���׿�����o����o���1�fq 3��X&`�p�����hh������2�>��tx��?�f�Z��N�D?�aa�McA�͆�M��	rv�Ѓ`����Ė���Jh����!�!��
OZaCa���ֶ�kZO�!�`!����F�0t�ӊp�[��S�v!ގf7���+�5�e�A>y"}���! �P )�~��6a܎���,�/�d]+[�a8wv6
�����H�(mll�9���V=�π?�Fv���y��)*P��NO��h�T�^(�J��X�	�S�ڻ,��u_n<(bO����1 d�<���By��&W���� ��W��/�=�k[#5)!87�^�' <��A��a�����C���`�D�a�8<�J�ьOm�\��5,Y2�:=6T7�c�d���/#&�U��+��2�i�s&x�Q�-hu�)�,����j��8�Z�4ԃ�Δ�#�����AC��޺��C�����|�i�s2�>o��K��5&�mh��!��cg~k凕���vp�N�Z�D�Ѥ�u]�.��������Kw����hk�9�VO.���?�o��`��]�8�#�==;w�k�����l���S���YC��K�΄�i�Jl��M��< 3��/��0�\q.��B"=Uy�tĪj�%]e�;����KtŒ�����"��iI�k�r%��h��i�j,�u�joi�uӹq���;�����Ok�V��I��Љ�lI��۸|���=�M$~�Lu�x)搪�Q�"ó\H�`|֮]�*��ba�����/R�)
��Un�U=?	TǍ�qaC���y��`�L=&L�òŖ���RbW?�QL��"���=7�	��%Y�N%�`J�b�F�3��j�d�:)��*���K)W��-���4ܬ%V�d�l����P�P�kZ`�\AL�!q't�DĨ�)V�� 	����1��Q R���;���ÿ�P��\�qߪL6,�B�4B(T,]I�U�ٰAC�ΰG'�!�n~�ci���q���/6����r&�B������ƕ��� ʍe���}ɂUI�W��S�}�{.�|��+�f��X�]-�h�>�0Ͱ.��:l�s�+��˯ã�V>?�������%=�^��@b�p(��O�r8���t��Ơ{l�	���t��?������%7����M��|�-�W�;,a ���
�А���94�O����%|>�,R�.����'�sC��o��Wn� ��ϴU�d�g�_*3��&�xb�Q �A&w3�S�I�)�ڙr��j�q�)����ktـ[G�zlA퇈J��S�A�lKX�d\Q+=�߮G�����MR�8���S�jJmIΉ�@w\B�I��R��#���	pф�s-B�&"����{ E���{�s��E2!9K��\L�w�h�!���Oro�L�.S8��Orn�=�gu
�I��^/D�-8mM���'�4$��1`��l�o��S����h��M���
���5�w'a�k�)�8_ �$}8b��t
�}�79��dz����3òw{����`��j�Z� [�on�u*p��dh1sc��l�R�O��DY�B�Zɟ8�1��Ǖ8kZ]'�/�ds����$<k��/���ݯ׼�J���qԘ2�[��ڊg_��N�ZVr`�A<�M�ڤF)Xjēu2$�|Mb*R���򃘪nl>��L�5�o�N�5-{_�ܓG�6��7 3�fȼl��ͻ'�}!5�b��]���׎%R��!�/�ΗX��f J\ȍ�~H��k������gxh�l�u�9�Q���N'x���a�ݻx�Kw���/�r@�J��>�U��t��7�_��.:`���u���}i�i_�(��-/=xu�ܫ�#LQ����� �!t�C2F��Hg`���C�(#��DM�#L��9�"�O���a����4L�Nw���^����9��:���ǹ�a��Zw#�xxe�b}�VD7��Y*�@��S?�5���M�eB/���[NB�IvNos>���<��H%
����9d�3�]�J���x�)Le�����V� �@]~�ɤ��3����U3� QV�v�'P*��Vy�>��ϰ��;�z�����)
uw!��Wx>�
lߎXu�}�B"Փq���������B2�3��x�M��c��ȪN�,jm���@d3���ƃ��D��Y9U�AV�d��SQ��(�8�*�����67�*H�^�=�$F�-1[<('�z�B����Hw��_�N��4!DJ��w'l���h����BqUB�P�!TqU{C���B�e��"�QBl)!�Td1ј�w��'�-����8�)w�Ý��8�i�ÝԽ6w���N��ں�N޾�#�)��M9���~ش�)�4�!S�)�[;L�	��4����$
m�H��@���%�S|�B|��m�TzB"Zf��~��x�����c`r�d����s��eרZ���@t�I6t	�[�@x=0�=}�Ϳ	�=�%K��5^�G�d);%�&�<C�X���L��CJq��N �˷���k�+_�L ����k\��<{I������D`�YS�t��cMǙ%�gj���f��
�\��w�S,�ԧ��~�HeJ�fj���p���5�W\a�{wHI�V�âE ��N��V�:��[�J1s����">(�Db��08"�5��cV� ����0�3{���������߃������Kb�!*��>]�t��Og�_rcY��~��H�?Nd��h���S��	�i�6���A&J#IQ��C>N��i�Ǖ���D�|�����g{�j踝����҇H�a��!�\��6�t���7��˴�eZ�2m�<����i.@VCʅ���s}�T�U����w_y�����MI	�(���.h H��Ŏ��ׄ#_�L5�y�}��t�];b���;_�à5Dm��oBFv%oV�7+�޵?�x�����k���[՗���;���'��tNK���S����7�r����$e��6"�!�,c�܃ !���kS��2~�׋�/�|��:z.��i��h't��	}��е�F�ϧ:�^�/$v�J�^)��T=cLNN����V��ô�^�K��yQG��f��MF��B6���S�k����n>�/e=���q
q�A���-=���gSI����t��͚�}pn ���H:T�,;��,��Rɽ����4ɫpi�}ޯ�V}�Zv����FREB�$t�逳 ���tw�[3��?F�a��-gG�f��Xe���!�֦�!G_�c�7��[��*/1����<V�Y!��j�l�Mz����A%_9�N��$����Ny����R7���$��x��Q�iP����;�r�-��#���Ƀ|,��í�Y��d��Sz�o|���w87���#�}�8�h�JG*ī-Hр_��84Ρq�Wa��=�������~�W�ܜ��C��WW�9 k���c���K����{�k�c�˥G�w�·|q��fObe ��ڂ�~�m�2P�ҝo_a�2�
���X%��W\�RleXq�D�eR�����S��o�� �.�7��^���ϵ��+g����-D�!���Dڂ��0��0>:�s�O�Hxb�&x�u�ߊz1}��w�Ze�
� X��IU�5<Y��A;���>{T(���H��������8�>��y�)��O�>!���}ݔJ�d�*��~�XWY/]e��W����W�Ɖ��/8�0�}�z��O�@�Fh}���q�\�2=�8�qG�q�
�[��u��<��1��ҝ{ҩ}e�=��?{����{vQ�0�B��6��������+$b�a���UoG��} �V�/�X\s�O֢`�ZS�5�ZS�5m=���ɫ�lI��zA��-N�X_�('��;7Q-��k 7����#���_4��,��Y�X4��I���؃d��ǟ��[�1��{w>U+� ��)q���O#�A�[5&�{���f�:»-�6"\^��߈��z�a:YX~nd�V3!I�I�um�i��J�B�Sv�A�+�l�<�+�E��Y���J���j��c���#�o�x}�|��=��#F�T���Zc��� ��sӞ8���lhG�U��@ѡu�:��I�3�0��/I��˹�j�E5�Y�U�yۓ��G�/\5׳����c���t��<�B����.&�Q�٨rcV�h��ƹ��g�֞E���!��+֑^S�4����x��k����M?�����}[Fi'��~ؿ��>-ѯ����o�e@)�����5�.h�dX��J��� 8���@12 ��y{�}枮{���秈�g*>Z���w�S�-���ʿ��N���7s>��Yse�G�Q�J$�h�fջjԏ�c	������`��K��ܸ�/�<�띣�:��P[�7��TiK/ݹ����v�N���AJ�7�d�_h\?K9�>E�̞��U�)~��ʼ:.w���q��=M��G�V>��|����ICǃKwfW�]�]��J, Amx;��rN��?v�����f�օ�3��pV�����w��nv�����Y̲�٠I���lO����l������W׾��}߾v���p@����R�dN|-���-ףޭ���T].fk�P �������Xo&z�0��Et���dia��m�NiPn[D!��lY�]��vS�Uʭhn}���)���� 