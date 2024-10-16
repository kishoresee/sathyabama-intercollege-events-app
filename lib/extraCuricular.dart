import 'dart:ffi' as ffi;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_project/utils.dart';
import 'package:flutter_project/SavedEvents.dart'; 
class ExtraCurricular extends StatefulWidget {
  const ExtraCurricular({super.key});

  @override
  State<ExtraCurricular> createState() => _ExtraCurricularState();
}

class _ExtraCurricularState extends State<ExtraCurricular> {
  final RxString savedEvent = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Container(
              child: Row(
                children: [
                 
                  Text(
                    'Hackathons  ',
                    style: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.white),
                  ),
                  Icon(
                    Icons.cast_for_education_sharp,
                    color: Color.fromARGB(255, 243, 4, 191),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
        backgroundColor: Color.fromARGB(255, 30, 7, 112),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 6,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Image.asset('asset/extra.png'),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              const urlString = 'https://shorturl.at/bhGVY';
                              final uri = Uri.parse(urlString);
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri);
                              } else {
                                Utils.showSnackBar(
                                    context, 'Could not launch $uri');
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
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
                          SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              savedEvent.value = 'Event Saved!';
                              Get.to(() =>
                                  DisplaySavedEvent(savedEvent: savedEvent));
                            },
                            child: Text(
                              'SAVE',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
