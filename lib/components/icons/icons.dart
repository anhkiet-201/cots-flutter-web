import 'package:cdio_web/components/icons/icons-define.dart';
import 'package:flutter/cupertino.dart';

Widget IconNet(IconsType iconsType, {Size size = const Size(24, 24)}) =>
    Image.network(
      iconsType.url,
      fit: BoxFit.fill,
      width: size.width,
      height: size.height,
    );
