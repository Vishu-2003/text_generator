import 'dart:io';
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
    final galleryPermission=await Permission.storage.request();
    if(galleryPermission.isDenied){
      state=ImageStates(massage: "Gallery permission Denied");
      return;
    }
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if(pickedImage!=null){
      state=ImageStates(image: File(pickedImage.path),isLoading: false);
    }
    else{
      state=ImageStates(massage: "image not selected",isLoading: false);
    }}
  Future<void> clickImageFromCamera() async {
    state = ImageStates(isLoading: true);
    final cameraPermission=await Permission.camera.request();
    if(cameraPermission.isDenied){
      state=ImageStates(massage: "Camera permission Denied");
    }
    final clickedImage = await picker.pickImage(source: ImageSource.camera);
    if(clickedImage!=null){
      state=ImageStates(image: File(clickedImage.path),isLoading: false);
    }
    else{
      state=ImageStates(massage: "image not clicked",isLoading: false);
    }}
  Future<void> deleteSelectedImage() async {
    state=ImageStates(image: null,isLoading: false);
  }

}