import 'package:flutter/cupertino.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_textxtheme.dart';
import 'c_text.dart';

class CCoreButton extends CupertinoButton {
  const CCoreButton({
    Key? key,
    Color? color,
    required Widget child,
    void Function()? onPressed,
    AlignmentGeometry alignment = Alignment.center,
    EdgeInsetsGeometry? padding = EdgeInsets.zero,
    BorderRadius? borderRadius = const BorderRadius.all(Radius.circular(12)),
  }) : super(
    key: key,
    minSize: 0,
    color: color,
    child: child,
    padding: padding,
    alignment: alignment,
    onPressed: onPressed,
    borderRadius: borderRadius,
  );
}
class CFlatButton extends StatelessWidget {
  final String text;
  final String? icon;
  final double? width;
  final double height;
  final Color? bgColor;
  final double? fontSize;
  final Color? iconColor;
  final Color? textColor;
  final BoxBorder? border;
  final Color? loaderColor;
  final String? sufficIcon;
  final bool isDisabled;
  final EdgeInsets padding;
  final double borderRadius;
  final void Function()? onPressed;
  const CFlatButton({
    Key? key,
    this.icon,
    this.border,
    this.bgColor,
    this.textColor,
    this.onPressed,
    this.fontSize,
    this.iconColor,
    this.sufficIcon,
    this.loaderColor,
    required this.text,
    this.borderRadius = 16,
    this.isDisabled = false,
    this.width = double.infinity,
    this.height =20,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CCoreButton(
      color: bgColor,
      onPressed: isDisabled ? null : onPressed,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Opacity(
        opacity: isDisabled || onPressed == null ? 0.5 : 1,
        child: Container(
          width: width,
          height: height,
          padding: padding,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: border,
            color: bgColor ?? white,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CText(
                text,
                textAlign: TextAlign.center,
                style: TextThemeX.text18.copyWith(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                  color: textColor ??black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
