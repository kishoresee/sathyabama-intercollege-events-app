import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class NewAddItem extends StatefulWidget {
  const NewAddItem({Key? key}) : super(key: key);

  @override
  State<NewAddItem> createState() => _NewAddItemState();
}

class _NewAddItemState extends State<NewAddItem> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerQuantity = TextEditingController();

  GlobalKey<FormState> key = GlobalKey();

  CollectionReference _reference =
      FirebaseFirestore.instance.collection('Event_list');

  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add an item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: key,
          child: Column(
            children: [
              TextFormField(
                controller: _controllerName,
                decoration: InputDecoration(hintText: 'Enter event name and venue'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the item name';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _controllerQuantity,
                decoration: InputDecoration(hintText: 'Register link(Google docs..etc)'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the item quantity';
                  }

                  return null;
                },
              ),
              IconButton(
                  onPressed: () async {
                    

                    ImagePicker imagePicker = ImagePicker();
                    XFile? file =
                        await imagePicker.pickImage(source: ImageSource.gallery);
                    print('${file?.path}');

                    if (file == null) return;
                    //Import dart:core
                    String uniqueFileName =
                        DateTime.now().millisecondsSinceEpoch.toString();

                    /*Step 2: Upload to Firebase storage*/
                    //Install firebase_storage
                    //Import the library

                    //Get a reference to storage root
                    Reference referenceRoot = FirebaseStorage.instance.ref();
                    Reference referenceDirImages = referenceRoot.child('event');

                    //Create a reference for the image to be stored
                    Reference referenceImageToUpload =
                        referenceDirImages.child(uniqueFileName);

                    //Handle errors/success
                    try {
                      //Store the file
                      await referenceImageToUpload.putFile(
                          File(file!.path),
                          SettableMetadata(
                            contentType:
                                'image/jpg', // Explicitly set the content type
                          ));
                      //Success: get the download URL

                      //Success: get the download URL
                      imageUrl = await referenceImageToUpload.getDownloadURL();

                      //Add the image URL to the Firebase Firestore document
                      // Update the imageUrl variable
                      setState(() {
                        imageUrl = imageUrl;
                      });
                    } catch (error) {
                      //Some error occurred
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Error uploading image: $error')));
                    }
                  },
                  icon: Icon(Icons.camera_alt)),
              ElevatedButton(
                  onPressed: () async {
                    if (imageUrl.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please upload an image')));

                      return;
                    }

                    if (key.currentState!.validate()) {
                      String itemName = _controllerName.text;
                      String itemQuantity = _controllerQuantity.text;

                      //Create a Map of data
                      Map<String, String> dataToSend = {
                        'name': itemName,
                        'quantity': itemQuantity,
                        'image': imageUrl,
                      };

                      //Add a new item
                      _reference.add(dataToSend);
                    }
                  },
                  child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
