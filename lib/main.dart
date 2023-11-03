import 'package:flutter/material.dart';
import 'package:widcy/order_screen.dart';
import 'package:widcy/splash_screen.dart';
import 'package:widcy/splash_screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final splashScreen2 = SplashScreen2();

    return MaterialApp(
      title: 'WiDcy Institute',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home:  splashScreen2,
    );
  }
}