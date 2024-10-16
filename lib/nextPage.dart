import 'dart:io';
import 'package:flutter_project/add_item.dart';
import 'package:flutter_project/adminLogaddimg.dart';
import 'package:carousel_slider/carousel_slider.dart' as slider;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Imagereg.dart';
import 'package:flutter_project/SavedEvents.dart';
import 'package:flutter_project/eventAdd.dart';
import 'package:flutter_project/help.dart';
import 'package:flutter_project/imageEventAdd.dart';
import 'package:flutter_project/imgfil.dart';
import 'package:flutter_project/item_list2.dart';
//import 'package:flutter_project/lms.dart';
import 'package:flutter_project/mainEvents.dart';
import 'package:flutter_project/myHomePage.dart';
import 'package:flutter_project/newChatbot.dart';
import 'package:flutter_project/newHackathon.dart';
import 'package:flutter_project/registeredEvents.dart';
import 'package:flutter_project/settingsPage.dart';
import 'package:flutter_project/sign_Page.dart';
import 'package:flutter_project/upcomingEvents.dart';
import 'package:flutter_project/utils.dart';
import 'package:get/get.dart';
import 'package:flutter_project/searchOption.dart';
import 'package:flutter_project/SavedEvents.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NextPage extends StatefulWidget {
  final String? username; // Define username parameter
  const NextPage({Key? key, this.username}) : super(key: key);
  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  final RxString savedEvent = ''.obs;
  final currentUser = FirebaseAuth.instance.currentUser;
  String? _username;
  CarouselController controller = CarouselController();

  @override
  void initState() {
    super.initState();
    _fetchUsername();
  }

  Future<void> _fetchUsername() async {
    try {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('user')
          .doc(currentUser?.uid)
          .get();

      setState(() {
        _username = userSnapshot['username'];
      });
    } catch (error) {
      print("Error fetching username: $error");
    }
  }

  final currentuser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        actions: [
          SizedBox(
            width: 25,
          ),
          Image.asset(
            'asset/logo.png',
            width: 35,
            height: 35,
          ),
          SizedBox(
            width: 18,
          ),
          Text(
            'SATHYABAMA',
            style: TextStyle(
                fontSize: 17, color: Color.fromARGB(255, 228, 217, 8)),
          ),
          Text(
            ' EVENTS',
            style: TextStyle(
                fontSize: 17, color: Color.fromARGB(255, 245, 245, 240)),
          ),
          SizedBox(
            width: 10,
          ),
          /*IconButton(
            icon: const Icon(Icons.search),
            color: Colors.white,
            onPressed: () {
              showSearch(context: context, delegate: MySearchDelegate());
            },
          ),*/
          IconButton(
            icon: const Icon(Icons.notifications),
            color: Colors.white,
            onPressed: () {
              //Get.offAll(SigninPage());
            },
          ),
          SizedBox(
            width: 20,
          )
        ],
        backgroundColor: Color.fromARGB(255, 151, 11, 32),
      ),
      drawer: Container(
        width: 300,
        child: Drawer(
          backgroundColor: Color.fromARGB(255, 151, 11, 32),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 200, // Set the desired height for the header
                color: Color.fromARGB(
                    255, 151, 11, 32), // Color for the header background
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: ClipOval(
                        child: Image.asset(
                          'asset/logo1.png',
                          width: 120,
                          height: 120,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${widget.username ?? _username ?? 'Loading...'}',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(height: 5),
                    Text(
                      currentuser?.email ?? 'No email available',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Divider(
                    height: 7,
                  ),
                  /*Consumer<EventRegImg>(
                      builder: (context, EventProvider, child) {
                    if (EventProvider.eventImg.isEmpty) {
                      return InkWell(
                        onTap: () async {
                          await EventProvider.getEventImg(context);
                        },
                        child: Container(
                          height: 50,
                          width: 94,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 10,
                                width: 10,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                ),
                                child: Icon(
                                  Icons.hdr_plus,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Add event',
                              )
                            ],
                          ),
                        ),
                      );
                    } else {
                      List<File> EventImg = EventProvider.eventImg;
                      return Container(
                          height: 30,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.green)),
                          child: CarouselSlider(
                              carouselController: controller,
                              items: EventImg.map(
                                (image) => Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: FileImage(image),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ).toList(),
                              options: CarouselOptions(
                                  height: 30,
                                  autoPlay: true,
                                  viewportFraction: 1)));
                    }
                  }),*/
                  ListTile(
                    leading: Icon(
                      Icons.next_plan,
                      color: Color.fromARGB(255, 192, 216, 94),
                    ),
                    title: Text(
                      'Upcoming Events',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () async {
                      Get.to(ItemLihh());
                    },
                  ),
                ],
              ),
              ListTile(
                leading: Icon(
                  Icons.done_all,
                  color: Colors.deepPurpleAccent,
                ),
                title: Text(
                  'Ongoing events',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () async {
                  const urlString = 'https://www.sathyabama.ac.in/events';
                  final uri = Uri.parse(urlString);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  } else {
                    Utils.showSnackBar(context, 'Could not launch $uri');
                  }
                },
              ),
              /*ListTile(
                leading: Icon(
                  Icons.done_all,
                  color: Colors.deepPurpleAccent,
                ),
                title: Text(
                  'add events',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Get.to(EventAdd());
                },
              ),*/
              ListTile(
                leading: Icon(
                  Icons.online_prediction_sharp,
                  color: const Color.fromARGB(255, 231, 13, 85),
                ),
                title: Text(
                  'Social media',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () async {
                  const urlString =
                      'https://www.instagram.com/sathyabama.official/?hl=en';
                  final uri = Uri.parse(urlString);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  } else {
                    Utils.showSnackBar(context, 'Could not launch $uri');
                  }
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Color.fromARGB(255, 189, 182, 182),
                ),
                title: Text(
                  'Settings',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Get.to(SettingsPage());
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.library_books,
                  color: Color.fromARGB(255, 220, 103, 202),
                ),
                title: Text(
                  'LMS',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () async {
                  const urlString =
                      'https://sathyabama.cognibot.in/login/index.php';
                  final uri = Uri.parse(urlString);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  } else {
                    Utils.showSnackBar(context, 'Could not launch $uri');
                  }
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.help,
                  color: Color.fromARGB(255, 6, 134, 112),
                ),
                title: Text(
                  'Help',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Get.to(Help());
                },
              ),

              /*InkWell(
                onTap: () async {
                  await ImageServices.getImagesFromGallery(context: context);
                },
                child: Container(
                  height: 50,
                  width: 94,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Icon(
                          Icons.hdr_plus,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Add event',
                      )
                    ],
                  ),
                ),
              ),*/
            ],
          ),
        ),
      ),
      body: Center(
        child: MainEvents(),
      ),
    );
  }
}
