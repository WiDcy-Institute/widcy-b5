
import 'package:flutter/material.dart';
import 'package:widcy/model/product.dart';

class ProductDetailScreen extends StatefulWidget {

  Product product;

  ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.product.name}"),
      ),
      body: Center(
        child: Image.network("http://localhost/shopapi/${widget.product.image}"),
      ),
    );
  }
}
