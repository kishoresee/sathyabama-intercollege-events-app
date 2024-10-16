//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_settings_screen_ex/flutter_settings_screen_ex.dart';
import 'package:flutter_project/utils.dart';

class CulturalsFest extends StatefulWidget {
  const CulturalsFest({super.key});

  @override
  State<CulturalsFest> createState() => _CulturalsFestState();
}

class _CulturalsFestState extends State<CulturalsFest> {
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
                    'Culturals and Fest ',
                    style: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.white),
                  ),
                  Icon(
                    Icons.auto_stories_outlined,
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
                      Image.asset('asset/culturals.png'),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          const urlString =
                              'https://docs.google.com/forms/d/e/1FAIpQLSeIroMxF5REgOkyPoVEuDWEYIq9PqMEf5ILCTw8Co-3oqXmWQ/alreadyresponded';
                          final uri = Uri.parse(urlString);
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri);
                          } else {
                            Utils.showSnackBar(
                                context, 'Could not launch $uri');
                          }
                        },
                        child: Text('Apply'),
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
