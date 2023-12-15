
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationDemoScreen extends StatefulWidget {

  const LocalizationDemoScreen({super.key});

  @override
  State<LocalizationDemoScreen> createState() => _LocalizationDemoScreenState();
}

class _LocalizationDemoScreenState extends State<LocalizationDemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Localization Demo"),
        actions: [
         GestureDetector(
           child:  Padding(padding: EdgeInsets.only(right: 10),
             child: Icon(Icons.settings),),
           onTap: (){

           },
         )
        ],
      ),
      body: Center(
        child: Text("greeting".tr()),
      ),
    );
  }
}
