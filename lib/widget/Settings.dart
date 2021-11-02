// ignore: import_of_legacy_library_into_null_safe
import 'package:dynamic_treeview/dynamic_treeview.dart';
import 'package:flutter/material.dart';
import 'package:ship/db/ShipDatabase.dart';
import 'package:ship/model/Tree.dart';

import '../ScreenOne.dart';
import '../ScreenTwo.dart';

class Settings extends StatefulWidget {

  final List<BaseData> treeListShow;

  const Settings({Key? key, required this.treeListShow}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState(treeListShow);
}

class _SettingsState extends State<Settings> {

  final List<BaseData> treeListShow;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // 用于船的添加
  var shipId;
  var shipName;

  // 用于添加船下面的东西
  var parentId;
  var parentName = "";
  var name;

  _SettingsState(this.treeListShow);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("设置"),
          elevation: 10.0,
          centerTitle: true,
        ),
        drawer: Container(
          height: MediaQuery.of(context).size.height,
          child: DynamicTreeView(
            data: treeListShow,
            config: Config(
              parentTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              parentPaddingEdgeInsets: EdgeInsets.only(left: 16, top: 0, bottom: 0)),
              width: 220.0,
              onTap: (m) {
                print("onChildTap -> $m"); // m: Map<String, dynamic>
                this.parentId = m['id'];
                Navigator.of(context).pop(); // 侧边栏弹回
                setState(() { // 动态显示
                  this.parentName = m['title'];
                });
              },
            ),
          color: Colors.white,
        ),
        body: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("添加船："),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: '船编号',
                    ),
                    validator: (String? value) {
                      // if (value == null || value.isEmpty) {
                      //   return '请输入船编号';
                      // }
                      this.shipId = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: '船名称',
                    ),
                    validator: (String? value) {
                      // if (value == null || value.isEmpty) {
                      //   return '请输入船名称';
                      // }
                      this.shipName = value;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Process data.
                      }
                      // 执行添加船操作
                      Tree addTree = Tree(treeid: shipId, treepid: "1", name: shipName, shipname: shipName);
                      ShipDatabase.instance.treeInsert(addTree);
                      setState(() {
                        this.treeListShow.add(addTree);
                      });
                    },
                    child: const Text('保存'),
                  ),
                  SizedBox(height: 16),
                  Text("请选择添加位置："),
                  Text("已选择：" + this.parentName),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: '名称',
                    ),
                    validator: (String? value) {
                      // if (value == null || value.isEmpty) {
                      //   return '请输入名称';
                      // }
                      this.name = value;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // Process data.
                        }

                        // 执行添加操作
                        // 获取父treeid，创建自己的treeid
                        // treeid 9位 xxxx 船名 x 级别 xxxx 设备编号
                        
                        String shipId = this.parentId.substring(0, 4);
                        String idLevel = (int.parse(this.parentId.toString().substring(4, 5))).toString();
                        String myidLevel = (int.parse(idLevel) + 1).toString();
                        String queryId = shipId + (int.parse(idLevel) + 1).toString();                     

                        List<Tree> tempTree = await ShipDatabase.instance.treeGetCnt(queryId + "%");
                        String cnt = tempTree.length.toString();
                        int len = cnt.length;
                        for (int i = 0; i < 4 - len; i++) {
                          cnt = "0" + cnt;
                        }
                        String myId = shipId + myidLevel + cnt;
                        // print("myId:" + myId);

                        Tree addTree = Tree(treeid: myId, treepid: this.parentId, name: this.name, shipname: "shipname");
                        ShipDatabase.instance.treeInsert(addTree);

                        setState(() {
                          this.treeListShow.add(addTree);
                        });

                      },
                      child: const Text('保存'),
                    ),
                  ),
                  Text("请选择需要删除的设备："),
                  Text("已选择：" + this.parentName),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Process data.
                      }
                      // 执行删除操作

                      print("============");
                      print(this.parentId);

                      await ShipDatabase.instance.treeDeleteByTreeId(this.parentId  );
                      setState(() {
                        for (int i = 0; i < treeListShow.length; i++) {
                          if (treeListShow[i].getId() == this.parentId) {
                            print("进来了");
                            treeListShow.removeAt(i);
                            break;
                          }
                        }
                      });
                      
                    },
                    child: const Text('删除'),
                  ),
                ],
              ),
            )
          ],
        )
        
      )
    );
  }
}