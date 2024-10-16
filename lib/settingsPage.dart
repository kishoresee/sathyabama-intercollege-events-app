import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project/accountsPage.dart';
import 'package:flutter_project/chatBot.dart';
import 'package:flutter_project/newChatbot.dart';
import 'package:flutter_project/nextPage.dart';
//import 'package:flutter_project/accountPage.dart';
import 'package:flutter_project/sign_Page.dart';
import 'package:flutter_settings_screen_ex/flutter_settings_screen_ex.dart';
//import 'package:basic_utils/basic_utils.dart';
//import 'package:flutter_settings_screen_ex/flutter_settings_screen_ex.dart';
import 'package:flutter_project/utils.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  static const keyDarkMode = 'key_dark_mode';

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(15),
            children: [
             Row(
  children: [
    IconButton(
      onPressed: () {
        Get.to(NextPage());
      },
      icon: Icon(
        Icons.arrow_back,
        color: Color.fromARGB(255, 238, 239, 247),
      ),
    ),
    // Add other widgets if needed
  ],
),
              SettingsGroup(title: 'GENERAL', children: <Widget>[
                //buildDarkMode(),
                buildLogout(),
                buildDeleteAccount(),
                buildSendFeedBack()
              ]),
              SizedBox(
                height: 22,
              ),
              
              SettingsGroup(title: 'FEEDBACK AND QURIES', children: <Widget>[
                const SizedBox(
                  height: 8,
                ),
                buildReportBug(),
                //buildSendFeedBack(),
              ]),
              SettingsGroup(title: 'PROFILE', children: <Widget>[
                const SizedBox(
                  height: 8,
                ),
                buildAccount()
                //buildReportBug(),
                //buildSendFeedBack(),
              ]),
              
            ],
          ),
        ),
      );

  Widget buildLogout() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: ClipRRect(borderRadius: BorderRadius.circular(30),
            child: SimpleSettingsTile(
              title: 'Logout',
              subtitle: '',
              leading: Icon(Icons.logout, color: Colors.blueAccent),
              onTap: () {
                Get.offAll(SigninPage());
              },
            ),
          ),
        ),
      );
Widget buildAccount() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Ink(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SimpleSettingsTile(
                title: 'Account page',
                subtitle: '',
                leading: Icon(Icons.account_box, color: Colors.blueAccent),
                onTap: () {
                  Get.offAll(AccountPage());
                },
              ),
            ),
          ),
        ),
      );


  Widget buildDeleteAccount() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: SimpleSettingsTile(
          title: 'Delete Account',
          subtitle: '',
          leading: Icon(Icons.delete, color: Colors.red),
          onTap: () async {
              const urlString =
                  'https://console.firebase.google.com/project/flutterlogin-54411/authentication/users'; // replace with the actual URL
              final uri = Uri.parse(urlString);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              } else {
                Utils.showSnackBar(context, 'Could not launch $uri');
              }
            },
        ),
      ),
    );
  }

  Widget buildReportBug() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: SimpleSettingsTile(
          title: 'Chat bot',
          subtitle: '',
          leading: Icon(Icons.chat_bubble, color: Colors.teal),
          onTap: () {
            Get.to(ChatBot());
          },
        ),
      ),
    );
  }

  Widget buildSendFeedBack() {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: SimpleSettingsTile(
            title: 'Reset Password',
            subtitle: '',
            leading: Icon(Icons.restore, color: Colors.purple),
            onTap: () async {
              const urlString =
                  'https://console.firebase.google.com/project/flutterlogin-54411/authentication/users'; // replace with the actual URL
              final uri = Uri.parse(urlString);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              } else {
                Utils.showSnackBar(context, 'Could not launch $uri');
              }
            },
          ),
        ),
      ),
    );
  }
}
