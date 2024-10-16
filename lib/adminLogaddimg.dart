import 'package:flutter/material.dart';
import 'package:flutter_project/eventAdd.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:untitled_one/mainHome.dart';
//import 'secondPage.dart'; // Ensure the correct import path

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key); // Fix the super key parameter

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void loginAuth() {
    String login_email = 'kishore@gmail.com'; // Fix the login email
    String login_password = 'kishore';
    String _email =
        email.text.trim(); // Trim to remove leading/trailing whitespaces
    String _password = password.text.trim();

    if (_email.isEmpty) {
      Fluttertoast.showToast(
          msg: "Enter a valid email", toastLength: Toast.LENGTH_LONG);
    } else if (_password.isEmpty) {
      Fluttertoast.showToast(
          msg: "Enter a valid password", toastLength: Toast.LENGTH_LONG);
    } else {
      if (_email == login_email && _password == login_password) {
        Fluttertoast.showToast(
            msg: 'Login success', toastLength: Toast.LENGTH_LONG);
        Get.to(EventAdd());
      } else {
        Fluttertoast.showToast(
            msg: 'Invalid email or password', toastLength: Toast.LENGTH_LONG);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('asset/logo.png'),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email",
                    labelText: 'Email',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(7.0),
                child: TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Password",
                    labelText: 'Password',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    loginAuth();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                  ),
                  child: Text('SUBMIT'),
                ),
              ),
              Text(
                'Queries: kishore@gmail.com',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

