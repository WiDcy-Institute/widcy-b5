
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState()  => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>{

  bool isGreen = true;
  Widget customIconWidget = Icon(Icons.heart_broken,size: 100, color: Colors.green);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: customIconWidget,
          onTap: () {
              setState(() {
                isGreen = !isGreen;
                customIconWidget = Icon(Icons.heart_broken,size: 100, color: isGreen == true ? Colors.green : Colors.red);
              });
          }
        ),
      ),
    );
  }

}



