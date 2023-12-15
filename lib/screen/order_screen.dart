
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {

  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  List<String> data = ["A","B","C"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> listWidgets = data.map((e) => Card(child: ListTile(title: Text(e),), elevation: 2,)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Order"),
        centerTitle: true,
      ),
      body: ListView(
        children: listWidgets,
      ),
    );
  }
}
