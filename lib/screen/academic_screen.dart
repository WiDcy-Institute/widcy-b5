
import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';

class AcademicScreen extends StatefulWidget {
  const AcademicScreen({super.key});

  @override
  State<AcademicScreen> createState() => _AcademicScreenState();
}

class _AcademicScreenState extends State<AcademicScreen> {

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    List<Widget> data = List.generate(6, (index) =>
        Padding(
            padding: EdgeInsets.all(8),
            child: TransparentImageCard(
              width: width,
              imageProvider: AssetImage('images/slide.jpg'),
              title: Text("ថ្នាក់សិក្សាវគ្គខ្លីភាសាអង់គ្លេស", style: TextStyle(color: Colors.white),),
              description: Text("15-Dec-2023", style: TextStyle(color: Colors.white),),
            )));


    return Scaffold(
      appBar: AppBar(
        title: Text("Academic", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontFamily: 'NotoSansKhmer'),),
        backgroundColor: Colors.blueAccent,
        actions: [
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.search, color: Colors.white),
            ),
          ),
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.more_vert, color: Colors.white),
            ),
          )
        ],
      ),
      body: ListView(
        children: data,
      ),
    );
  }
}
