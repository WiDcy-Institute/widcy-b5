import 'package:flutter/material.dart';
import 'package:widcy/order_screen.dart';
import 'package:widcy/screen/future_demo_screen.dart';
import 'package:widcy/screen/network_demo_screen.dart';
import 'package:widcy/screen/storage_demo_screen.dart';
import 'package:widcy/screen/stream_demo_screen.dart';
import 'package:widcy/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'WiDcy Institute',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      // home:  SplashScreen(),
      // home:  StreamDemoScreen(),
      // home:  FutureDemoScreen(),
      home:  StorageDemoScreen(),
    );
  }
}