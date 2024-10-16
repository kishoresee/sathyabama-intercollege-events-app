import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Newtry.dart';
import 'package:flutter_project/dispImg.dart';
import 'package:flutter_project/dumyImg.dart';
//import 'package:flutter_project/dummy.dart';
import 'package:flutter_project/eventAdd.dart';
import 'package:flutter_project/extraActivities.dart';
import 'package:flutter_project/extraCuricular.dart';
import 'package:flutter_project/item_list.dart';
import 'package:flutter_project/item_list1.dart';
import 'package:flutter_project/newHackathon.dart';
//import 'package:flutter_project/item_details.dart';
//import 'package:flutter_project/item_list.dart';
//import 'package:flutter_project/newHackathon.dart';
import 'package:flutter_project/worShopsNew.dart';
import 'package:flutter_project/workShopPage.dart';
import 'package:flutter_project/workShops.dart';
import 'package:get/get.dart';
import 'package:flutter_project/culturalsFest.dart';

class MainEvents extends StatefulWidget {
  const MainEvents({Key? key}) : super(key: key);

  @override
  State<MainEvents> createState() => _MainEventsState();
}

class _MainEventsState extends State<MainEvents> {
  bool _isColorOn = false;
  Color _scaffoldColor = Colors.white;

  String? imageUrl;

  void changeBackgroundColor() {
    setState(() {
      _scaffoldColor = _scaffoldColor == Color.fromARGB(255, 17, 13, 13)
          ? Colors.white
          : Color.fromARGB(255, 17, 13, 13);
    });
  }

  void initState() {
    super.initState();
    // Fetch the image URL from Firebase Storage
    fetchImageUrl();
  }

  void fetchImageUrl() async {
    // Retrieve the image URL from Firebase Storage
    // Example: "mypicture/image.jpg"
    // Replace "image.jpg" with the actual image filename
    // Replace "mypicture" with the folder name in your Firebase Storage
    // Make sure to include appropriate error handling
    imageUrl =
        await getImageUrlFromFirebaseStorage("mypicture/1712681653110697.jpg");
    setState(() {});
  }

  Future<String?> getImageUrlFromFirebaseStorage(String imagePath) async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child(imagePath);
      return await ref.getDownloadURL();
    } catch (e) {
      print("Error fetching image URL: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 151, 11, 32),
        toolbarHeight: 18,
        automaticallyImplyLeading: false,
        actions: [
          Transform.scale(
            scale: 0.6,
            child: Switch(
              activeColor: Colors.grey,
              value: _isColorOn,
              onChanged: (value) {
                setState(() {
                  _isColorOn = value;
                  if (_isColorOn) {
                    changeBackgroundColor();
                  }
                });
              },
            ),
          ),
          SizedBox(
            width: 0,
          ),
        ],
      ),
      backgroundColor: _scaffoldColor,
      body: Expanded(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                    width: 500,
                    height: 220,
                    color: Color.fromARGB(255, 0, 100, 200),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Hackathons',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.computer_sharp,
                              color: Color.fromARGB(255, 12, 6, 6),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Text(
                            "Register and upskill your technical talents in hackathons  ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                Get.to(ItemLiyy());
                              },
                              child: Text(
                                'See events ',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 218, 218, 119),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                    width: 500,
                    height: 220,
                    color: Color.fromARGB(255, 151, 0, 151),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Workshops',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.auto_stories_outlined,
                              color: Color.fromARGB(255, 12, 6, 6),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Text(
                            "Register and upskill your technical talents   ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                Get.to(() => ItemLizz());
                              },
                              child: Text(
                                'See events ',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 236, 236, 81),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                    width: 500,
                    height: 240,
                    color: Color.fromARGB(255, 32, 151, 128),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Internships',
                                style: TextStyle(
                                  color: Color.fromARGB(251, 240, 243, 255),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.cast_for_education_sharp,
                              color: Colors.pink,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Text(
                            "workshops are designed to empower skills, knowledge, and strategies  ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                Get.to(WorShop());
                              },
                              child: Text(
                                'See events ',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 236, 236, 81),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                    width: 500,
                    height: 220,
                    color: Color.fromARGB(255, 200, 50, 70),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Non-technical events',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.sports,
                              color: Color.fromARGB(255, 132, 167, 17),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Text(
                            " Discover opportunities to enhance your talents, cultivate teamwork and coordination ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                Get.to(ExtraActivities());
                              },
                              child: Text(
                                'See events ',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 236, 236, 81),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                    width: 500,
                    height: 220,
                    color: Color.fromARGB(255, 229, 168, 71),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Culturals and Fest',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.celebration,
                              color: Color.fromARGB(255, 4, 241, 162),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Text(
                            "Welcome to the vibrant world of sathyabama culturals and festivals! ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                Get.to(CulturalsFest());
                              },
                              child: Text(
                                'See events ',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 236, 236, 81),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
