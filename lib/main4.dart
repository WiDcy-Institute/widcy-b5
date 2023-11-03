import 'package:flutter/material.dart';

void main() {
  Widget loginFormWidget = Container(
    margin: EdgeInsets.only(left: 16, right: 16),
    child: Column(
      children: [
        TextField(
          decoration: InputDecoration(hintText: "username"),
        ),
        TextField(
          decoration: InputDecoration(hintText: "password"),
        ),
      ],
    ),
  );

  Widget containerDemo = Container(
    child: Column(
      children: [
        Text("Hello Container Widget1"),
        Text("Hello Container Widget2")
      ],
    ),
  );

  Widget centerDemo = Center(
    child: Text("Hello Center Demo"),
  );

  Widget pendingDemo = Padding(
    padding: EdgeInsets.only(top: 50, left: 100),
    child: Text("Hello Pending Demo"),
  );

  Widget sizeBoxDemo = Column(
    children: [
      TextField(
        decoration: InputDecoration(hintText: "username"),
      ),
      TextField(
        decoration: InputDecoration(hintText: "password"),
      ),
      SizedBox(
        height: 20,
      ),
      ElevatedButton(onPressed: () {}, child: Text("Login"))
    ],
  );

  Widget rowDemo = Row(
    children: [
      Text("Name : "),
      Expanded(
        child:TextField(
          decoration: InputDecoration(hintText: "Name"),
        ),
      ),
    ],
  );

  List<String> data  = List<String>.generate(50, (index) => "Item ${index}");

  List<Widget> listWidget = data.map((e) =>
        Card(
          elevation: 5,
          child: ListTile( leading: Icon(Icons.add), title: Text("Demo $e"), subtitle: Text("Demo Subtle"), trailing: Icon(Icons.navigate_next), ),
        )
  ).toList();

  Widget listViewDemo = ListView(
    children: listWidget,
  );

  Widget imageDemo = Image.asset("images/logo.jpg");

  final homeScreen = Scaffold(
    appBar: AppBar(
      title: Text("HomeScreen"),
    ),
    //body: Center(
    //child: Text("Welcome!!!"),
    //),
    body: imageDemo,
    // drawer: Drawer(
    //   child: ListView(
    //     children: [
    //       Card(
    //         elevation: 5,
    //         child: ListTile(
    //             trailing: Icon(Icons.navigate_next),
    //             title: Text("Home"),
    //             leading: Icon(Icons.home),
    //         ),
    //       )
    //     ],
    //   ) ,
    // ),
    bottomNavigationBar: BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home" ),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home" ),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home" ),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home" ),
      ],
    ),
  );

  final app = MaterialApp(
    title: 'MyApp',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: homeScreen,
  );

  runApp(app);
}
