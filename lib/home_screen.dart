
import 'package:flutter/material.dart';
import 'package:widcy/product_detail_screen.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String> data  = List<String>.generate(20, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            String item = data[index];
            return GestureDetector(
              child: Card(
                elevation: 10,
                child: ListTile(
                  leading: Image.network("https://images.khmer24.co/23-11-03/oppo-f9-652759169900112242560803-b.jpg"),
                  title: Text("$item"),
                  trailing: Icon(Icons.navigate_next),
                ),
              ),
              onTap: (){
                navigatorToProductDetail(item);
              },
            );
          }),
    );
  }
  void navigatorToProductDetail(String item){

    final route = MaterialPageRoute(builder: (context) => ProductDetailScreen(productTitle: item,));
    Navigator.push(context, route);
  }
}
