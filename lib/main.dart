import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:widcy/screen/order_screen.dart';
import 'package:widcy/screen/firebase_auth_demo_screen.dart';
import 'package:widcy/screen/future_demo_screen.dart';
import 'package:widcy/screen/localization_demo_screen.dart';
import 'package:widcy/screen/network_demo_screen.dart';
import 'package:widcy/screen/storage_demo_screen.dart';
import 'package:widcy/screen/stream_demo_screen.dart';
import 'package:widcy/screen/splash_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();
  final myApp = MyApp();

  EasyLocalization easyLocalization = EasyLocalization(
      child: myApp,
      supportedLocales: [
        Locale('en', 'US'),
        Locale('km', 'KH')
      ],
      path: 'assets/lang',
    fallbackLocale: Locale('en', 'US'),
    startLocale: Locale('en', 'US'),
    saveLocale: false,
    useOnlyLangCode: true,
  );
  runApp(easyLocalization);
}

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

void setupFirebaseMessaging() {
  _firebaseMessaging.requestPermission();
  _firebaseMessaging.getToken().then((token) {
    print('FCM Token: $token');
  });

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    // Handle the received message when the app is in the foreground.
    print("onMessage: $message");
    // Display a notification or update the UI.
  });

  FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    // Handle the received message when the app is opened from a terminated or background state.
    print("onMessageOpenedApp: $message");
    // Display a notification or update the UI.
  });
}

Future<void> myBackgroundMessageHandler(RemoteMessage message) async {
  // Handle the received message when the app is in the background.
  print("onBackgroundMessage: $message");
  // Display a notification or update the UI.
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'WiDcy Institute',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Hanuman'
      ),
      debugShowCheckedModeBanner: false,
      home:  SplashScreen(),
    );
  }
}