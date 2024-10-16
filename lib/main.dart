import 'package:flutter/material.dart';
import 'package:flutter_project/Imagereg.dart';
import 'package:flutter_project/nextPage.dart';
import 'package:flutter_settings_screen_ex/flutter_settings_screen_ex.dart';
import 'package:get/get.dart';
import 'package:flutter_project/MyHomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_app_check_platform_interface/firebase_app_check_platform_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseAppCheck.instance.activate();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<EventRegImg>(
            create: (_) => EventRegImg()), // Add your provider here
      ],
      child: GetMaterialApp(
        title: 'HomePage',
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              //use spalsh screen here kishore
            }
            if (snapshot.hasData) {
              return const NextPage();
            }
            return const MyHomePage();
          },
        ),
      ),
    );
  }
}
