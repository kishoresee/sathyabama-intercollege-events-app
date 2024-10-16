import 'dart:ffi' as ffi;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_project/utils.dart';
import 'package:flutter_project/SavedEvents.dart'; 
class DisplaySavedEvent extends StatefulWidget {
  final RxString savedEvent; 

  DisplaySavedEvent({required this.savedEvent, Key? key}) : super(key: key);

  @override
  _DisplaySavedEventState createState() => _DisplaySavedEventState();
}


class _DisplaySavedEventState extends State<DisplaySavedEvent> {
  final RxString savedEvent = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 151, 11, 32),
        title: Row(
          children: [SizedBox(width: 53,),
            Text('Saved events',style: TextStyle(color: Colors.white),),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: SizedBox(width: 400,height: 200,
            child: Column(
              children: [SizedBox(height: 30,),Text('You saved the ideathon event:',style: TextStyle(fontSize: 20),),
              Text('Click to apply',style: TextStyle(fontSize: 20),),
                ElevatedButton(
                  onPressed: () async {
                    const urlString = 'https://shorturl.at/bhGVY';
                    final uri = Uri.parse(urlString);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    } else {
                      Utils.showSnackBar(context, 'Could not launch $uri');
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  child: Container(
                    width: 150.0,
                    height: 40.0,
                    child: Center(
                      child: Text(
                        'Apply',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Obx(() => Text(
                        savedEvent.value,
                        style: TextStyle(fontSize: 18),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
