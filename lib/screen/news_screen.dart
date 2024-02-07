import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';
import 'package:widcy/model/product.dart';
import '../service/firebase_firestore_service.dart';

class NewsScreen extends StatefulWidget {

  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  @override
  void initState() {
    super.initState();
  }

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
        title: Text(AppLocalizations.of(context)!.news, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontFamily: 'NotoSansKhmer'),),
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
      // body: ListView(
      //   children: data,
      // ),
      body: Center(
        child: FutureBuilder<List<Product>>(
          future: FirebaseFirestoreService().readDocuments("product"),
          builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            List<Product> products = snapshot.data as List<Product>;
            return ListView.builder(
                itemCount: products.length,
                itemBuilder: ((context, index)  {

                  Product product = products[index];

                  return GestureDetector(
                    child: Card(
                        elevation: 3,
                        child:ListTile(
                          // leading: Image.network("http://localhost/shopapi/${product.image}"),
                          leading: Image.asset('images/slide.jpg'),
                          title: Text("${product.name}"),
                          subtitle: Text("${product.price}"),
                          trailing: Icon(Icons.navigate_next),
                        )
                    ),
                    onTap: (){
                      //navigatorToProductDetail(product);
                    },
                  );
                }));
          },
        ),
      ),
    );
  }
}
