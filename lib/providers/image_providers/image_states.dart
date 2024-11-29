import 'dart:io';

class ImageStates {
  final File? image;
  final bool? isLoading;
  final String? massage;
  ImageStates({
    this.image,
    this.isLoading=false,
    this.massage});
}