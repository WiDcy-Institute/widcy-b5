
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {

  final String productTitle;

  const ProductDetailScreen({super.key, required this.productTitle});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
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
