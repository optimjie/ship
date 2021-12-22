import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:ship/ScreenOne.dart';
import 'package:ship/ScreenTwo.dart';
// ignore: unused_import
// ignore: import_of_legacy_library_into_null_safe
import 'package:dynamic_treeview/dynamic_treeview.dart';

import 'package:ship/db/ShipDatabase.dart';
import 'package:ship/model/Ledger.dart';
import 'package:ship/model/Tree.dart';
import 'package:ship/model/User.dart';
import 'package:ship/model/Device.dart';
import 'package:ship/widget/Query.dart';
import 'package:ship/widget/QueryNoSet.dart';

// nox_adb.exe connect 127.0.0.1:62001
// flutter run --no-sound-null-safety
// adb shell data/data
// 静态stss 动态stf

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '船舶台账查询系统',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: '船舶台账查询系统'),
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

  late List<User> users;

  late List<Device> devices = [];

  GlobalKey _key = GlobalKey<FormState>();
  TextEditingController _user = TextEditingController();
  TextEditingController _pass = TextEditingController();
  FocusNode _u = FocusNode();
  FocusNode _p = FocusNode();

  @override
  void initState() {
    super.initState();
    refreshTrees();
  }

  @override
  void dispose() {
    ShipDatabase.instance.close();
    super.dispose();

    _user.dispose();
    _pass.dispose();
    _u.dispose();
    _p.dispose();
  }

  Future refreshTrees() async {

    try {
      await ShipDatabase.instance.treeQueryById(1);
    } on Exception {
      print("没有根结点需要创建");
      
      await ShipDatabase.instance.treeInsert(Tree(treeid: "1", treepid: "-1", name: "root", shipname: "shipname"));
    }

    try {
      await ShipDatabase.instance.userQueryById(1);
    } on Exception {
      print("没有超级管理员需要创建");
      await ShipDatabase.instance.userInsert(User(name: "admin", password: "admin", level: "1"));
    }

    // ==========测试数据，只要第一次需要 =======st  后期只在第一次运行软件时插入数据
    // this.devices = createTmpDeviceData();
    // for (int i = 0; i < this.devices.length; i++) {
    //   await ShipDatabase.instance.deviceInsert(devices[i]);
    // }

    // await ShipDatabase.instance.userInsert(User(name: "test", password: "test", level: "2"));

    // this.trees = createTmpTreeData();  
    // for (int i = 0; i < trees.length; i++) {
    //   dynamic treeid = trees[i].getId();
    //   dynamic treepid = trees[i].getParentId();
    //   dynamic name = trees[i].name;
    //   dynamic shipname = trees[i].shipname;
    //   Tree t = Tree(treeid: treeid, treepid: treepid, name: name, shipname: shipname);
    //   await ShipDatabase.instance.treeInsert(t);
    // }
    // ==========测试数据，只要第一次需要 =======ed

    // =====测试台账==== st
    // for (int i = 0; i < 12; i++) {
    //   dynamic name = "_" + i.toString();
    //   dynamic location = "xx";
    //   dynamic category;
    //   if (i % 3 == 0) {
    //     category = "A";
    //   } else if (i % 3 == 1) {
    //     category = "B";
    //   } else {
    //     category = "C";
    //   }
    //   await ShipDatabase.instance.ledgerInsert(Ledger(name: name, location: location, category: category));
    // }
    // =====测试台账==== ed



    this.trees = await ShipDatabase.instance.treeQueryAll();
    this.users = await ShipDatabase.instance.userQueryAll();
    this.devices = await ShipDatabase.instance.deviceQueryAll();

    print("devices len:" + devices.length.toString());
    print("users len:" + users.length.toString());
    for (int i = 0; i < users.length; i++) {
      print(users[i].id.toString() + " " + 
            users[i].name + " " +
            users[i].password + " " + 
            users[i].level);
    }

    for (int i = 0; i < trees.length; i++) {
      String id = trees[i].getId();
      String parentId = trees[i].getParentId();
      String title = trees[i].getTitle();
      this.treeListShow.add(Tree(treeid: id, treepid: parentId, name: title, shipname: "shipname"));
    }

    print("trees len:" + treeListShow.length.toString());
    for (int i = 0; i < treeListShow.length; i++) {
      print(treeListShow[i].getId() + " " +
        treeListShow[i].getParentId() + " " +
        treeListShow[i].getTitle() + " " + 
        treeListShow[i].getExtraData().toString()
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    final login = Form(
      key: _key,
      child: Column(
        children: [
          TextFormField(
            autofocus: true,
            focusNode: _u,
            controller: _user,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              labelText: "账号",
              hintText: "请输入账号",
            ),
            validator: (v) {
              if (v == null || v.isEmpty) {
                return "账号必须输入！";
              }
            },
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (v) {
              print(_user.text);
              print("object");
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            focusNode: _p,
            controller: _pass,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.vpn_key),
              labelText: "密码",
              hintText: "请输入密码",
            ),
            validator: (v) {
              if (v == null || v.length < 5) {
                return "密码必须输入且大于5";
              }
            },
            textInputAction: TextInputAction.send,
            obscureText: true,
          ),
          SizedBox(height: 16),
          ElevatedButton(

            onPressed: () {
              bool userIsExist = false;
              bool passwdIsCorrect = false;
              for (int i = 0; i < users.length; i++) {
                if (_user.text.toString() == users[i].name) {
                  userIsExist = true;
                  if (_pass.text.toString() == users[i].password) {
                    passwdIsCorrect = true;
                  }
                }
              }

              String hint = "";
              if (!userIsExist) {
                hint = "用户不存在";
              } else if (!passwdIsCorrect) {
                hint = "密码错误";
              }

              if (!userIsExist || !passwdIsCorrect) {
                // 弹窗提示
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(hint),
                      // content: Text(''),
                      actions: <Widget>[
                        TextButton(
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                          child: Text('确定'),
                        ),
                      ],
                    );
                  }
                );
              } else {

                // 验证通过以后应该看用户的等级
                int level = -1;
                for (int i = 0; i < users.length; i++) {
                  if (users[i].name == _user.text.toString()) {
                    level = int.parse(users[i].level);
                  }
                }

                Navigator.push(
                  context, 
                  level == 1 ? 
                  MaterialPageRoute(builder: (ctx) => Query(
                    treeListShow: this.treeListShow, devices: this.devices)
                  )
                  :
                  MaterialPageRoute(builder: (ctx) => QueryNoSet(
                    treeListShow: this.treeListShow)
                  )
                );
              }
  
            },
            child: Text("提交"),
          )
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
        elevation: 10.0,
        centerTitle: true,
      ),
      body: login,
    );
  }
}
