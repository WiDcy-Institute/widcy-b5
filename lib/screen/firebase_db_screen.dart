
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

  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final data = {
      "username":"sokchanna",
      "email":"sokchanna@gmail.com",
      "phone":"0123456"
    };
    FirebaseDatabaseService().createData(FirebaseDatabaseService().path, data);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Firebase Realtime Database"),
    //     actions: [
    //       GestureDetector(
    //         child: Icon(Icons.add),
    //         onTap: (){
    //           ;
    //         },
    //       )
    //     ],
    //   ),
    //   body:
    //
    //   AlertDialog(
    //     title: Icon(Icons.question_mark),
    //     content: Text('This is a custom dialog.'),
    //     actions: <Widget>[
    //       TextButton(
    //         child: Text('Cancel'),
    //         onPressed: () {
    //           Navigator.of(context).pop();
    //         },
    //       ),
    //       TextButton(
    //         child: Text('OK'),
    //         onPressed: () {
    //           // Perform your desired action here
    //           Navigator.of(context).pop();
    //         },
    //       ),
    //     ],
    //   )
    //
    //
    //   // Center(
    //   //   child: FutureBuilder<List<Product>>(
    //   //     future: ProductService().fetchData(),
    //   //     builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
    //   //       if (snapshot.connectionState == ConnectionState.waiting) {
    //   //         return CircularProgressIndicator();
    //   //       }
    //   //
    //   //       if (snapshot.hasError) {
    //   //         return Text('Error: ${snapshot.error}');
    //   //       }
    //   //       List<Product> products = snapshot.data as List<Product>;
    //   //       return ListView.builder(
    //   //           itemCount: products.length,
    //   //           itemBuilder: ((context, index)  {
    //   //
    //   //             Product product = products[index];
    //   //
    //   //             return GestureDetector(
    //   //               child: Card(
    //   //                   elevation: 3,
    //   //                   child:ListTile(
    //   //                     leading: Image.network("http://localhost/shopapi/${product.image}"),
    //   //                     title: Text("${product.name}"),
    //   //                     subtitle: Text("${product.price}"),
    //   //                     trailing: Icon(Icons.navigate_next),
    //   //                   )
    //   //               ),
    //   //               onTap: (){
    //   //                 //navigatorToProductDetail(product);
    //   //               },
    //   //             );
    //   //           }));
    //   //     },
    //   //   ),
    //   // )
    //
    //
    //
    //
    // );
    return AlertDialog(
      title: Text('Add User'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter an email';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Save'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // Perform form submission actions
              String name = _nameController.text;
              String email = _emailController.text;
              // You can handle the form data as needed
              // e.g., save it to a database, send it to a server, etc.
              print('Name: $name, Email: $email');
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
