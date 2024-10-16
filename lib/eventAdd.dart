import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_project/Newtry.dart';
import 'package:flutter_project/newimagepick.dart';
import 'package:get/get.dart';

String? imageUrl;
class EventAdd extends StatefulWidget {
  const EventAdd({super.key});

  @override
  State<EventAdd> createState() => _EventAddState();
}

class _EventAddState extends State<EventAdd> {
  final controller = Get.put(ImagePickController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('upload image'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    controller.pickImage();
                  },
                  child: const Text('Pick your image'),
                ),
              ),
              Obx(() {
                if (controller.imageUrl.isNotEmpty) {
                  return Image.network(controller.imageUrl.value);
                } else if (controller.image.value != null) {
                  return Image.file(controller.image.value!);
                } else {
                  return Icon(Icons.camera, size: 50);
                }
              }),
              ElevatedButton(
                onPressed: () async {
                  String? downloadUrl =
                      await controller.uploadImageToFirebase();
                  if (downloadUrl != null) {
                    // Navigate to another page and pass the image URL as a parameter
                    Get.to(() => AnotherPage(imageUrl: downloadUrl));
                  }
                },
                child: const Text('upload to firebase storage'),
              ),
              Obx(() {
                if (controller.networkImage.value.isNotEmpty) {
                  return Image.network(controller.networkImage.value);
                } else {
                  // Show a placeholder or loading indicator while waiting for the image URL
                  return CircularProgressIndicator();
                }
              }),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the DisplayImagePage and pass the image URL
                  if (controller.networkImage.value.isNotEmpty) {
                    Get.to(() => AnotherPage(
                        imageUrl: controller.networkImage.value));
                  }
                },
                child: const Text('View Uploaded Image'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
