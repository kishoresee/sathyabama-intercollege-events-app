import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_project/imageEventAdd.dart';
import 'dart:developer';

class EventRegImg extends ChangeNotifier {
  List<File> eventImg = [];
  List<String> eventImgUrl = []; // Change the type to List<String>

  Future<void> getEventImg(BuildContext context) async {
    eventImg = await ImageServices.getImagesFromGallery(
      context: context,
    );
    notifyListeners();
  }

  Future<void> updateEventImgUrl(BuildContext context) async {
    try {
      List<File> selectedImages = await ImageServices.getImagesFromGallery(
        context: context,
      );
      List<String> imageUrls =
          await ImageServices.uploadImagesToFirebaseStorageNGetURL(
        images: selectedImages,
        context: context,
      );
      eventImgUrl = imageUrls;
      notifyListeners();
    } catch (e) {
      log('Error uploading images: $e');
    }
  }
}
