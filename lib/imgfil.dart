// image_pick_binding.dart

import 'package:flutter_project/newimagepick.dart';
import 'package:get/get.dart';
// Adjust the import path as needed

class ImagePickBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ImagePickController());
  }
}
