
import 'package:flutter/material.dart';
import 'package:widcy/model/product.dart';
import 'package:widcy/screen/product_detail_screen.dart';
import 'package:widcy/service/product_service.dart';


class NetworkDemoScreen extends StatefulWidget {

  const NetworkDemoScreen({super.key});

  @override
  State<NetworkDemoScreen> createState() => _NetworkDemoScreenState();
}

class _NetworkDemoScreenState extends State<NetworkDemoScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SHOP APP"),
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
