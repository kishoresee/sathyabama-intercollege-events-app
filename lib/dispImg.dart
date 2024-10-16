import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DisplayUploadedImagePage extends StatefulWidget {
  final String imageUrl;

  const DisplayUploadedImagePage({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  _DisplayUploadedImagePageState createState() =>
      _DisplayUploadedImagePageState();
}

class _DisplayUploadedImagePageState extends State<DisplayUploadedImagePage> {
  Image? image; // Nullable Image variable

  @override
  void initState() {
    super.initState();
    loadImage();
  }

  void loadImage() async {
    try {
      // Load the image from Firebase Storage
      String imagePath = widget.imageUrl;
      String fullImagePath =
          'mypicture/1712681653110697.jpg'; // Specify the path to the image in "mypicture" folder
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child(fullImagePath);
      // Get the download URL
      String downloadUrl = await ref.getDownloadURL();
      // Create an Image widget with the download URL
      setState(() {
        image = Image.network(downloadUrl);
      });
    } catch (e) {
      print("Error loading image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uploaded Image'),
      ),
      body: Center(
        child: image != null
            ? image! // Display the image if loaded successfully
            : CircularProgressIndicator(), // Display a loading indicator while loading the image
      ),
    );
  }
}
