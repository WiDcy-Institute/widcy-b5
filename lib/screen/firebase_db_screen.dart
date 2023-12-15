
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:widcy/model/product.dart';
import 'package:widcy/service/firebase_database_service.dart';
import 'package:widcy/service/product_service.dart';

class FirebaseDBScreen extends StatefulWidget {

  FirebaseDBScreen({super.key});

  @override
  State<FirebaseDBScreen> createState() => _FirebaseDBScreenState();
}

class _FirebaseDBScreenState extends State<FirebaseDBScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Realtime Database"),
      ),
      body: Center(
        child: FutureBuilder<List<Product>>(
          future: ProductService().fetchData(),
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
                          leading: Image.network("http://localhost/shopapi/${product.image}"),
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
      )
    );
  }
}
