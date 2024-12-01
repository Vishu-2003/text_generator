import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:river_pod_todo/presentation/components/c_core_button.dart';
import 'package:river_pod_todo/providers/image_providers/image_states.dart';
import 'package:river_pod_todo/utils/app_assets.dart';
import 'package:river_pod_todo/utils/app_extension.dart';

import '../../providers/image_providers/image_notifires.dart';
import '../../providers/text_providers/text_notifires.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_textxtheme.dart';
import '../components/c_dilogbox.dart';
import '../components/c_seticon.dart';
import '../components/c_text.dart';


class HomeView extends ConsumerWidget{
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageState = ref.watch(imageProvider);
    final textState  = ref.watch(textProvider);
    return Scaffold(
      backgroundColor:white,
      appBar: AppBar(
      backgroundColor: blueWhite,
      title: CText("Text Generator",style: TextThemeX.text18),
      actions: [
        setIcon(
            AppIcon.faq,
            color:black,
            onPressed:()=>showInfoDialog(title: 'about this app', description: 'this is text generation ap kddbcjbhsvh sacgscgdcvwdvjcvxn bvhxgcv sbc sbvchgcvhvdhvh cn cn bs iscjbc  cwn bcsjgcuwgdu2yedkwbfjwgfutqw37fdgwqvdjwbcjgwoyd8 ydkhdklqhduwycajwbcjSBCSBCjBJCguawyfi', context: context)
        ).defaultPadding(),
      ],
      ),
      body:Column(
        children: [
          if(imageState.image!=null)
          Container(
              height: 300,
              width: double.infinity,
              child: imageState.isLoading!
                 ? SpinKitChasingDots()
                 : Image.file(
                imageState.image!,
                fit: BoxFit.contain,
              ),
            )   .animate()
                .scale(begin: Offset(0,0),end: Offset(1,1),duration: Duration(milliseconds:800))
                .fade(),      
          if(imageState.image==null)
            CustomPaint(
              painter:SlashedBorderPainter() ,
              child: CCoreButton(
                child: Container(
                  height: 300,
                  width: double.infinity,
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      setIcon(AppIcon.uploadImage,color: green,width: 80),
                      SizedBox(height: 10),
                      CText(" Tap Upload Image From Gallery",style: TextThemeX.text16)
                    ],
                  ),
                ),
                onPressed:(){
                  ref.read(imageProvider.notifier).pickImageFromGallery();
                },
              ),
            ),
          if(textState.generatedText!=null)
            textState.isLoading
          ? SpinKitChasingDots()
          : Expanded(
              child: ListView(
                children: [
                  AnimatedTextKit(
                    isRepeatingAnimation: false,
                    animatedTexts: [
                      TypewriterAnimatedText(
                          textState.generatedText!,
                          textStyle: TextThemeX.text14,
                          textAlign: TextAlign.start,
                          cursor: " | "
                      )
                    ],)
                ],
              ),
            ),
          Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (){
               ref.read(imageProvider.notifier).deleteSelectedImage();
               ref.read(textProvider.notifier).deleteGeneratedText();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)
                ),
                side:BorderSide(color: green),
              ),
              child:CText("Remove",style: TextThemeX.text16.copyWith(color: green),),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: (){
                   ref.read(imageProvider.notifier).clickImageFromCamera();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)
                  ),
                  side:BorderSide(color: green),
                ),
                child:CText("Camera",style: TextThemeX.text16.copyWith(color: green),),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (){
                ref.read(textProvider.notifier).generateTextFromImage(imageState.image);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)
                ),
              ),
              child:CText("Generate",style: TextThemeX.text16.copyWith(color:white),),
            ),
          )
        ],
      ).defaultPadding()
    );
  }

}

class SlashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = green// Border color
      ..strokeWidth = 2; // Thickness of slashes

    const double slashLength = 10; // Length of each slash
    const double gap = 5; // Gap between slashes

    // Clip the canvas to ensure the slashes are within the bounds
    canvas.clipRect(Rect.fromLTWH(0, 0, size.width, size.height));

    // Draw top border with slashes
    for (double x = 0; x < size.width; x += slashLength + gap) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x + slashLength, 0),
        paint,
      );
    }

    // Draw right border with slashes
    for (double y = 0; y < size.height; y += slashLength + gap) {
      canvas.drawLine(
        Offset(size.width, y),
        Offset(size.width, y + slashLength),
        paint,
      );
    }

    // Draw bottom border with slashes
    for (double x = size.width; x > 0; x -= slashLength + gap) {
      canvas.drawLine(
        Offset(x, size.height),
        Offset(x - slashLength, size.height),
        paint,
      );
    }

    // Draw left border with slashes
    for (double y = size.height; y > 0; y -= slashLength + gap) {
      canvas.drawLine(
        Offset(0, y),
        Offset(0, y - slashLength),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


