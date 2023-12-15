import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';

class CourseListScrollWidget extends StatelessWidget {

  const CourseListScrollWidget({super.key});

  @override
  Widget build(BuildContext context) {

    List<String> data  = List<String>.generate(10, (index) => "Item $index");
    List<Widget> widgets =  data.map((e) =>
        Card(
          elevation: 5,
          child: TransparentImageCard(
            width: 200,
            imageProvider: AssetImage('images/slide.jpg'),
            title: Text("ថ្នាក់សិក្សាវគ្គខ្លីភាសាអង់គ្លេស", style: TextStyle(color: Colors.white),),
            description: Text("15-Dec-2023", style: TextStyle(color: Colors.white),),
          ),
        )
    ).toList();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widgets,
      ),
    );
  }
}
