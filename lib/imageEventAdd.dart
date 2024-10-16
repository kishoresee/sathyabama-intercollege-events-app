import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/constant.dart';
import 'package:image_picker/image_picker.dart';

class ImageServices {
  static Future<List<File>> getImagesFromGallery(
      {required BuildContext context}) async {
    List<File> selectedImages = [];
    final pickedFile = await ImagePicker().pickMultiImage(imageQuality: 100);
    List<XFile> filePick = pickedFile ?? [];
    if (filePick.isNotEmpty) {
      for (var image in filePick) {
        selectedImages.add(File(image.path));
      }
    } else {
      log('No images selected');
    }
    log('The Images are \n ${selectedImages.toList().toString()}');
    return selectedImages;
  }

  static Future<List<String>> uploadImagesToFirebaseStorageNGetURL(
      {required List<File> images, required BuildContext context}) async {
    List<String> imagesURL = [];
    try {
      for (var image in images) {
        Reference ref = FirebaseStorage.instance
            .ref()
            .child('EventImages')
            .child(uuid.v1().toString());
        TaskSnapshot taskSnapshot = await ref.putFile(image);
        String imageURL = await taskSnapshot.ref.getDownloadURL();
        imagesURL.add(imageURL);
      }
    } catch (e) {
      log('Error uploading images: $e');
    }
    return imagesURL;
  }
}
