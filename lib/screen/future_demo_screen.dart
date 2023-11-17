
import 'package:flutter/material.dart';

class FutureDemoScreen extends StatefulWidget {
  const FutureDemoScreen({super.key});

  @override
  State<FutureDemoScreen> createState() => _FutureDemoScreenState();
}

class _FutureDemoScreenState extends State<FutureDemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Async Demo"),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: _fetchData(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            return Text('Fetched data: ${snapshot.data}');
          },
        ),
      ),
    );
  }

  Future<String> _fetchData() async {
    await Future.delayed(Duration(seconds: 10));
    return 'Welcome to using Future Async Function!';
  }
}
