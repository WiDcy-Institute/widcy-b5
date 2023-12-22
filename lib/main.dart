import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widcy/screen/splash_screen.dart';
import 'package:widcy/util/language_provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LanguageProvider languageProvider = LanguageProvider();
  languageProvider.fetchLocale();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupFirebaseMessaging();
  runApp(
      App(languageProvider: languageProvider,)
  );
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


class App extends StatelessWidget {

  final LanguageProvider languageProvider;

  App({required this.languageProvider});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
        create: (context) => languageProvider,
        builder: (context, child) {
          final provider = Provider.of<LanguageProvider>(context);
          return MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: provider.appLocal,
            onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              // useMaterial3: true,
              primarySwatch: Colors.blue,
              fontFamily: 'Hanuman'
            ),
            debugShowCheckedModeBanner: false,
            home:  SplashScreen(),
          );
        }
    );
  }
}