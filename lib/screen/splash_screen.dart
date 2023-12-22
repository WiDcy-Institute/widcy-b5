import 'package:flutter/material.dart';
import 'package:widcy/screen/firebase_db_screen.dart';
import 'package:widcy/screen/home_screen.dart';
import 'package:widcy/screen/main_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState()  => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>{

  bool isGreen = true;
  Widget customIconWidget = Icon(Icons.heart_broken,size: 100, color: Colors.green);

  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      "images/logo.jpg",
                      width: 100,
                      height: 100,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Welcome to WIDCY !!!")
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  navigationToHomeScreen();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  shadowColor: Colors.greenAccent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  minimumSize: const Size(100, 40),
                ),
              child: Text(AppLocalizations.of(context)!.getStart),
            )
          ],
        )
    );
  }

  void navigationToHomeScreen(){
    final route = MaterialPageRoute(builder: (context) => MainScreen());
    //final route = MaterialPageRoute(builder: (context) => FirebaseDBScreen());
    Navigator.pushReplacement(context, route);
  }
}



