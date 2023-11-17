import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemoScreen extends StatefulWidget {
  const StreamDemoScreen({super.key});

  @override
  State<StreamDemoScreen> createState() => _StreamDemoScreenState();
}

class _StreamDemoScreenState extends State<StreamDemoScreen> {

  final StreamController<int> _streamController = StreamController<int>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Async Demo'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: _streamController.stream,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            return Text('Received number: ${snapshot.data}');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          _startCounting();
        },
      ),
    );
  }

  void _startCounting() async {
    for (int i = 1; i <= 5; i++) {
      await Future.delayed(Duration(seconds: 2));
      _streamController.add(i);
    }
  }
}
