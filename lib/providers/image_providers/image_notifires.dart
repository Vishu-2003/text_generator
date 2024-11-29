import 'dart:io';
import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:river_pod_todo/providers/image_providers/image_states.dart';

final imageProvider = StateNotifierProvider<ImageNotifier,ImageStates>((ref){
  return ImageNotifier();
});

class ImageNotifier extends StateNotifier<ImageStates>{
  ImageNotifier():super(ImageStates(isLoading: false));
  final picker=ImagePicker();
  Future<void> pickImageFromGallery() async {
    state = ImageStates(isLoading: true);
    final permission=await Permission.camera.request();
    if(permission.isDenied){
      state=ImageStates(massage: "Camera permission Denied");
      return;
    }
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if(pickedImage!=null){
      state=ImageStates(image: File(pickedImage.path),isLoading: false);
    }
    else{
      state=ImageStates(massage: "image not selected",isLoading: false);
    }

  }
}