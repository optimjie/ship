import 'package:flutter/material.dart';
import 'package:ship/ScreenOne.dart';
import 'package:ship/ScreenTwo.dart';
// ignore: unused_import
// ignore: import_of_legacy_library_into_null_safe
import 'package:dynamic_treeview/dynamic_treeview.dart';

import 'package:ship/db/ShipDatabase.dart';
import 'package:ship/model/Tree.dart';

import 'model/TreeModel.dart';

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
      title: 'xx系统',
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
  List<BaseData> treeListShow = [];

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
    this.trees = createTmpTreeModelData();
    // 将测试数据存到数据库中
    // for (int i = 0; i < trees.length; i++) {
    //   dynamic treeid = trees[i].getTreeid();
    //   dynamic treepid = trees[i].getTreepid();
    //   dynamic name = trees[i].name;
    //   dynamic shipname = trees[i].shipname;
    //   Tree t = Tree(
    //       treeid: treeid, treepid: treepid, name: name, shipname: shipname);
    //   await ShipDatabase.instance.create(t);
    // }

    this.trees = await ShipDatabase.instance.readAllNotes();

    for (int i = 0; i < trees.length; i++) {
      String id = trees[i].getTreeid();
      String parentId = trees[i].getTreepid();
      String title = trees[i].getName();
      this.treeListShow.add(TreeModel(
          id: id,
          parentId: parentId,
          title: title,
          extras: Map<String, dynamic>()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("xx系统"),
        ),
        drawer: Container(
          height: MediaQuery.of(context).size.height,
          child: DynamicTreeView(
            data: treeListShow,
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
