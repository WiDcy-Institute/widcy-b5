
import 'package:flutter/material.dart';

class ProductDetailScreen2 extends StatefulWidget {

  final String productTitle;

  const ProductDetailScreen2({super.key, required this.productTitle});

  @override
  State<ProductDetailScreen2> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productTitle),
      ),
      body: Center(
        child: Text(widget.productTitle),
      ),
    );
  }
}
