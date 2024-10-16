import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/Imagepick.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickController extends GetxController {
  Rx<File?> image = Rx<File?>(null);
  RxString imageUrl = RxString('');

  Future pickImage() async {
    try {
      final imagePick =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imagePick == null) {
        return;
      }
      final imageTemp = File(imagePick.path);
      image.value = imageTemp;
    } on PlatformException catch (e) {
      return e;
    }
  }

  Rx<String> networkImage = ''.obs;
  Future<String?> uploadImageToFirebase() async {
    String fileName = DateTime.now().microsecondsSinceEpoch.toString();
    try {
      Reference reference =
          FirebaseStorage.instance.ref().child('mypicture/$fileName.jpg');
      await reference.putFile(
          image.value!,
          SettableMetadata(
            contentType: 'image/jpg', // Explicitly set the content type
          ));
      String downloadUrl = await reference.getDownloadURL();
      networkImage.value = downloadUrl;
      imageUrl.value = downloadUrl;
      return downloadUrl;
    } catch (e) {
      print('Error uploading image: $e'); // Log the error
      return null;
    }
  }
}
