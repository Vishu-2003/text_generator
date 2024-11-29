import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_textxtheme.dart';

class CTextField extends StatelessWidget {
  final int? maxLength;
  final bool showBorders;
  final Key? formFieldKey;
  final bool readOnly;
  final bool enabled;
  final bool obscureText;
  final String? labelText;
  final String? hintText;
  final double? fontSize;
  final int? maxLines;
  final TextAlign textAlign;
  final int? minLines;
  final Color? fillColor;
  final Color? textColor;
  final String? helperText;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? suffixText;
  final EdgeInsets? contentPadding;
  final void Function()? onTap;
  final Color? hintTextColor;
  final void Function(String)? onSubmit;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final List<TextInputFormatter>? inputFormatters;

  const CTextField({
    Key? key,
    this.maxLength,
    this.formFieldKey,
    this.enabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.showBorders = true,
    this.labelText,
    this.hintText,
    this.helperText,
    this.fontSize,
    this.maxLines = 1,
    this.minLines = 1,
    this.focusNode,
    this.onTap,
    this.fillColor,
    this.onSubmit,
    this.textColor,
    this.onChanged,
    this.suffixText,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.controller,
    this.validator,
    this.keyboardType,
    this.hintTextColor,
    this.floatingLabelBehavior,
    this.textAlign = TextAlign.start,
    this.textInputAction = TextInputAction.next,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
  }) : super(key: key);

  static FilteringTextInputFormatter get decimalFormatter =>
      FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'));

  static OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(width: 1, color: green),
  );

  static OutlineInputBorder disabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(width: 1, color: green),
  );

  static OutlineInputBorder enabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(width: 1, color: green),
  );

  static OutlineInputBorder focusedErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(width: 1, color:Colors.redAccent),
  );

  static OutlineInputBorder errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(width: 1, color:green.withOpacity(.5)),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      key: formFieldKey,
      enabled: enabled,
      cursorHeight: 20,
      autocorrect: false,
      minLines: minLines,
      readOnly: readOnly,
      maxLines: maxLines,
      textAlign: textAlign,
      focusNode: focusNode,
      validator: validator,
      maxLength: maxLength,
      controller: controller,
      obscureText: obscureText,
      onFieldSubmitted: onSubmit,
      keyboardType: keyboardType,
      cursorColor: green,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      style: TextThemeX.text18.copyWith(fontSize: fontSize,),
      decoration: InputDecoration(
        isDense: true,
        errorMaxLines: 2,
        hintText: hintText,
        labelText: labelText,
        floatingLabelBehavior: floatingLabelBehavior,
        hintStyle: TextThemeX.text14.copyWith(fontSize: fontSize,),
        labelStyle:
        TextThemeX.text14.copyWith(fontSize: fontSize),
        filled: true,
        helperMaxLines: 3,
        fillColor: fillColor ?? green,
        border: showBorders ? focusedBorder : InputBorder.none,
        errorBorder: showBorders ? errorBorder : InputBorder.none,
        enabledBorder: showBorders ? enabledBorder : InputBorder.none,
        focusedBorder: showBorders ? focusedBorder : InputBorder.none,
        disabledBorder: showBorders ? disabledBorder : InputBorder.none,
        focusedErrorBorder: showBorders ? focusedErrorBorder : InputBorder.none,
        suffixStyle: TextThemeX.text18.copyWith(color: Colors.grey),
        helperStyle: TextThemeX.text16.copyWith(color: green),
      ),
    );
  }
}