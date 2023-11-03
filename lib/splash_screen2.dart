import 'package:flutter/material.dart';
import 'package:widcy/home_screen.dart';

class SplashScreen2 extends StatefulWidget {

  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Center(
              child: Column(
            children: [
              Image.asset(
                "images/logo.jpg",
                width: 100,
                height: 100,
              ),
              SizedBox(
                height: 10,
              ),
              Text("Welcome to WIDCY !!!")
            ],
          )),
        ),
        ElevatedButton(
            onPressed: () {
              navigationToHomeScreen();
            },
            child: Text("Get Start")),
        SizedBox(
          height: 10,
        )
      ],
    ));
  }

  void navigationToHomeScreen(){
    final route = MaterialPageRoute(builder: (context) => HomeScreen());
    Navigator.pushReplacement(context, route);
  }

}
