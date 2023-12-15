
import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Language"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Khmer Language"),
            trailing: Checkbox(value: true, onChanged: (val){

            }),
          ),
          ListTile(
            title: Text("English Language"),
            trailing: Checkbox(value: true, onChanged: (val){

            }),
          )
        ],
      ),
    );
  }
}
