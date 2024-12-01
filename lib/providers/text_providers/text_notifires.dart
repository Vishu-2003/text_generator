import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_todo/providers/text_providers/text_states.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

final textProvider =  StateNotifierProvider<TextNotifier,TextStates>((ref){
  return TextNotifier();
});

class TextNotifier extends StateNotifier<TextStates>{
  TextNotifier():super(TextStates(isLoading: false));
  final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  Future<void>generateTextFromImage(File? image) async {
    if(image==null){
      state=TextStates(massage: "Please select Image first");
      return;
    }
    state=TextStates(isLoading: true);
    final  inputImage=InputImage.fromFile(image);
    final  recognizedText = await textRecognizer.processImage(inputImage);
    state=TextStates(generatedText:recognizedText.text,isLoading: false);
    await textRecognizer.close();
  }

  Future<void> deleteGeneratedText()async{
    state = TextStates(generatedText: null,isLoading: false);
  }
}