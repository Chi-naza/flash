import 'package:firebase_core/firebase_core.dart';
import 'package:flash/app_bindings.dart';
import 'package:flash/firebase_options.dart';
import 'package:flash/screens/auth/profile_screen.dart';
import 'package:flash/screens/intro/onboarding_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  AppBindings().dependencies();  
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'flash',
      home: const ProfileScreen(),
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
    );
  }
}
