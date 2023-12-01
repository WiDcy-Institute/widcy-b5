import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'package:widcy/model/product.dart';
import 'package:widcy/screen/product_detail_screen.dart';


class NetworkDemoScreen extends StatefulWidget {

  const NetworkDemoScreen({super.key});

  @override
  State<NetworkDemoScreen> createState() => _NetworkDemoScreenState();
}

class _NetworkDemoScreenState extends State<NetworkDemoScreen> {

  Future<List<Product>> fetchData() async {

    var url = Uri.http('localhost', '/shopapi/products_api.php');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> jsonRes = convert.jsonDecode(response.body);
      print('Number of books about http: $jsonRes.');
      List<Product> products = jsonRes.map((json) => Product.fromJson(json)).toList();
      print('Number of books about http: $products.');
      return products;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      throw("Error");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SHOP APP"),
      ),
      body: Center(
        child: FutureBuilder<List<Product>>(
          future: fetchData(),
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
                      navigatorToProductDetail(product);
                    },
                  );
            }));
          },
        ),
      )
    );
  }

  void navigatorToProductDetail(Product product){
    final route = MaterialPageRoute(builder: (context) => ProductDetailScreen(product: product,));
    Navigator.push(context, route);
  }
}
