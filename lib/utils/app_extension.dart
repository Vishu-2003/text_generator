import 'package:flutter/cupertino.dart';

extension WidgetExtension on Widget{
   Widget defaultPadding(){
     return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
       child: this,
     );
   }
}