
import 'package:flutter/material.dart';
import 'package:widcy/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState()  => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>{

  bool isGreen = true;
  Widget customIconWidget = Icon(Icons.heart_broken,size: 100, color: Colors.green);

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
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
                ),
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
          ),
        )
    );
  }

  void navigationToHomeScreen(){
    final route = MaterialPageRoute(builder: (context) => HomeScreen());
    Navigator.pushReplacement(context, route);
  }
}



