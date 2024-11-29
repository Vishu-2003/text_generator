import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:river_pod_todo/presentation/components/c_seticon.dart';
import 'package:river_pod_todo/presentation/views/home_view.dart';
import 'package:river_pod_todo/utils/app_assets.dart';
import 'package:river_pod_todo/utils/app_colors.dart';
import 'package:river_pod_todo/utils/app_extension.dart';

import '../../utils/app_textxtheme.dart';
import 'c_core_button.dart';
import 'c_text.dart';

Future<void> showInfoDialog({
  required String title,
  required String description,
  Widget? bottomChild,
  required BuildContext context,
  String? dialogImage,
  VoidCallback? onPositiveButtonPressed,
  VoidCallback? onNegativeButtonPressed,
}) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shadowColor: green,
        elevation: 3,
        backgroundColor: blueWhite,
        child:Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CText(title,style: TextThemeX.text18,),
              SizedBox(height: 10,),
              CText(description,style: TextThemeX.text14),
              SizedBox(height: 10,),
            ],
          ).defaultPadding(),
      );
    },
  );
}