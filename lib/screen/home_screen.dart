
import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:widcy/screen/product_detail_screen2.dart';
import 'package:widcy/widget/course_list_scroll_widget.dart';
import 'package:widcy/widget/news_list_scroll_widget.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String> data  = List<String>.generate(20, (index) => "Item $index");
  List<Widget> pages = [];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    pages = List.generate(6, (index) =>
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: TransparentImageCard(
            width: width,
            imageProvider: AssetImage('images/slide.jpg'),
            title: Text("ថ្នាក់សិក្សាវគ្គខ្លីភាសាអង់គ្លេស", style: TextStyle(color: Colors.white),),
            description: Text("15-Dec-2023", style: TextStyle(color: Colors.white),),
          )));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(150),
              child: Image.asset('images/logo.jpg', width: 50, height: 50,),
            ),
            Center(
              child: Padding(padding: EdgeInsets.only(left: 16),
                child:Text("WIDCY Institute", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
            )
          ],
        ),
        actions: [
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.more_vert, color: Colors.white),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          slideWidget,
          courseTitleWidget,
          CourseListScrollWidget(),
          newsTitleWidget,
          NewsListScrollWidget(),
        ],
      )
    );
  }

  Widget get courseTitleWidget {
    return Padding(
      padding: EdgeInsets.only(right: 16, left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Course", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontFamily: 'NotoSansKhmer'),),
          GestureDetector(
            child: Icon(Icons.navigate_next),
            onTap: (){

            },
          )
        ],
      ),);
  }

  Widget get newsTitleWidget {
    return Padding(
      padding: EdgeInsets.only(right: 16, left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("News", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontFamily: 'NotoSansKhmer'),),
          GestureDetector(
            child: Icon(Icons.navigate_next),
            onTap: (){

            },
          )
        ],
      ),);
  }

  Widget get slideWidget {
    final controller = PageController(viewportFraction: 0.8, keepPage: true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 8),
        SizedBox(
          height: 180,
          child: PageView.builder(
            controller: controller,
            // itemCount: pages.length,
            itemBuilder: (_, index) {
              return pages[index % pages.length];
            },
          ),
        ),
        Container(
          child: SmoothPageIndicator(
            controller: controller,
            count: pages.length,
            effect: JumpingDotEffect(
              dotHeight: 16,
              dotWidth: 16,
              jumpScale: .7,
              verticalOffset: 15,
            ),
          ),
        ),
      ],
    );
  }

  void navigatorToProductDetail(String item){
    final route = MaterialPageRoute(builder: (context) => ProductDetailScreen2(productTitle: item,));
    Navigator.push(context, route);
  }
}
