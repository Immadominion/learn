import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  ImagePicker picker;

  ImagePickerService({
    required this.picker,
  });

  Future<File?> pickImageFromGallery() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return null;
    }
  }

  Future<File?> pickImageFromCamera() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return null;
    }
  }
}
