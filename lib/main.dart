import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ship/DataModel.dart';
import 'package:ship/ScreenOne.dart';
import 'package:ship/ScreenTwo.dart';
// ignore: unused_import
// ignore: import_of_legacy_library_into_null_safe
import 'package:dynamic_treeview/dynamic_treeview.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ship/db/ShipDatabase.dart';
import 'package:ship/model/tree.dart';

// nox_adb.exe connect 127.0.0.1:62001
// flutter run --no-sound-null-safety
// 静态sts 动态stf

void main() {
  runApp(MyApp());
}

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
  late List<Tree> trees;
  bool isLoading = false;
  bool first = true;
  List<BaseData> l = [];

  @override
  void initState() {
    super.initState();
    refreshTrees();
  }

  @override
  void dispose() {
    ShipDatabase.instance.close();

    super.dispose();
  }

  Future refreshTrees() async {
    /* 数据库测试，测试功能是否可用。可用
      Tree tree = Tree(parentId: -1, name: "root", extras: "extras");
      // 添加
      // await ShipDatabase.instance.create(tree);
      this.trees = await ShipDatabase.instance.readAllNotes();

      print("删除前");

      for (int i = 0; i < trees.length; i++) {
        print("name:" + trees[i].name);
        print("id:" + trees[i].id.toString());
      }

      await ShipDatabase.instance.delete(1);
      await ShipDatabase.instance.delete(2);

      print("删除后");

      this.trees = await ShipDatabase.instance.readAllNotes();

      for (int i = 0; i < trees.length; i++) {
        print("name:" + trees[i].name);
        print("id:" + trees[i].id.toString());
      }
    */
    // 将测试数据导入数据库中，以后直接从数据库中读取。 读取完成

    List<BaseData> tmp = getData();
    for (int i = 0; i < tmp.length; i++) {
      // 遍历extras
      Map<String, dynamic> mp = tmp[i].getExtraData();
      String extras = "";
      mp.forEach((key, value) {
        extras = extras + key + " " + value + " "; // 这样的话回导致最后多一个空格
        // print("$key---$value");
      });
      Tree t = Tree(
          parentId: int.parse(tmp[i].getParentId()),
          name: tmp[i].getTitle(),
          extras: extras);
      await ShipDatabase.instance.create(t);
    }

    this.trees = await ShipDatabase.instance.readAllNotes();

    // 打印数据库中的数据
    // for (int i = 0; i < trees.length; i++) {
    //   print("id:" + trees[i].id.toString());
    //   print("pId:" + trees[i].parentId.toString());
    //   print("name:" + trees[i].name);
    //   print("extras:" + trees[i].extras);
    // }
    for (int i = 0; i < trees.length; i++) {
      String id = trees[i].id.toString();
      String parendId = trees[i].parentId.toString();
      String name = trees[i].name;
      String ex = trees[i].extras;
      ex = ex.substring(0, ex.length - 1);
      List<String> exItem = ex.split(' ');
      var extras = new Map<String, dynamic>();
      for (int i = 0; i < exItem.length; i += 2) {
        String a = exItem[i];
        dynamic b = exItem[i + 1];
        extras[a] = b;
      }
      this.l.add(DataModel(
          id: int.parse(id),
          parentId: int.parse(parendId),
          name: name,
          extras: extras));
    }
  }

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
            data: this.l,
            config: Config(
                parentTextStyle:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                parentPaddingEdgeInsets:
                    EdgeInsets.only(left: 16, top: 0, bottom: 0)),
            width: 220.0,
            onTap: (m) {
              print("onChildTap -> $m");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => ScreenTwo(
                            data: m,
                          )));
            },
          ),
          color: Colors.white,
        ),
        body: Center(
          child: Text(
            'Hello, world!',
            textDirection: TextDirection.ltr,
          ),
        ),
        // body: Column(
        //   children: <Widget>[
        //     ElevatedButton(
        //       onPressed: () {
        //         Navigator.push(
        //             context, MaterialPageRoute(builder: (ctx) => ScreenOne()));
        //       },
        //       child: Text('Full Screen TreeView'),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
