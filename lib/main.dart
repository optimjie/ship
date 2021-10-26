import 'package:flutter/material.dart';
import 'package:ship/DataModel.dart';
import 'package:ship/ScreenOne.dart';
import 'package:ship/ScreenTwo.dart';
// ignore: unused_import
// ignore: import_of_legacy_library_into_null_safe
import 'package:dynamic_treeview/dynamic_treeview.dart';

// nox_adb.exe connect 127.0.0.1:62001
// flutter run --no-sound-null-safety

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'hello',
//         home: Scaffold(
//             appBar: AppBar(
//               title: Text('123'),
//             ),
//             body: HomeContent()));
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Treeview Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title}) : super();
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Dynamic treeview sample"),
        ),
        drawer: Container(
          height: MediaQuery.of(context).size.height,
          child: DynamicTreeView(
            data: getData(),
            config: Config(
                parentTextStyle:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                parentPaddingEdgeInsets:
                    EdgeInsets.only(left: 16, top: 0, bottom: 0)),
            width: 220.0,
          ),
          color: Colors.white,
        ),
        body: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => ScreenOne()));
              },
              child: Text('Full Screen TreeView'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView(
        children: [],
      ),
    );
  }
}
