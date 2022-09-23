
import 'package:flash/screens/home/home_screen.dart';
import 'package:flash/test_home.dart';
import 'package:flash/shoe_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'flash',
      home: const HomeScreen(),
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
    );
  }
}
