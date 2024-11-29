import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'c_core_button.dart';
Widget setIcon(
    String icon, {
      double? width,
      Color? color,
      void Function()? onPressed,
    }) {
  return CCoreButton(
    onPressed: onPressed,
    child: SvgPicture.asset(
      icon,
      width: width,
      height: width,
      color: color,
    ),
  );
}