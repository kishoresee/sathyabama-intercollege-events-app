import 'package:flutter/material.dart';
import 'package:flutter_project/sign_Page.dart';
import 'package:get/get.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.transparent,
      body:
       SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 110, 50, 201),
                    Color.fromARGB(255, 38, 41, 228)
                  ]),
              image: DecorationImage(
                  image: AssetImage('asset/login_bg4.png'), fit: BoxFit.fill)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(width: 60,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset('asset/logo.png',width: 90,height: 90,)),
                ],
              ),
            
              SizedBox(
                height: 100,
              ),
              Icon(
                Icons.event_available_sharp,
                color: const Color.fromARGB(255, 206, 190, 47),
                size: 70,
              ),
              SizedBox(
                height: 30,
              ),
             // Image.asset('asset/logo.png',width: 100,height: 100,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'SATHYABAMA ',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    Text(
                      ' EVENTS',
                      style: TextStyle(color: Colors.yellow, fontSize: 25),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(7.0),
                child: Text(
                  "Welcome to Sathaybama Events Site, your gateway to view and register for exciting events ! ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Get.to(() => SigninPage());
                    },
                    child: Text(
                      'Get Started ',
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
              SizedBox(
                height: 200,
              ),
              
              SizedBox(
                height: 200,
              )
            ],
          ),
        ),
      ),
    );
  }
}
