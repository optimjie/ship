import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hello',
      home: Scaffold(
        appBar: AppBar(
          title: Text('test'),
        ),
        body: HomeContent()  
      )
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text('aaa'),
    );
  }
}
