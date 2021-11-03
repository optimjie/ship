// ignore: import_of_legacy_library_into_null_safe
import 'dart:collection';

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

  List<BaseData> treeListShow;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  // 用于船的添加
  var shipId;
  var shipName;

  // 用于添加船下面的东西
  var parentId;
  var parentName = "";
  var name;
  var editName;

  _SettingsState(this.treeListShow);

  @override
  Widget build(BuildContext context) {

    final addShip = DecoratedBox(
      decoration: BoxDecoration(
        /*gradient: LinearGradient(
          colors: [
            Colors.lightBlue,
            Colors.green,
          ],
        ),*/
        // color: Colors.blueGrey,
        color: Color.fromRGBO(255,235,205, 1),
        // borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(2.0, 2.0),
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        children:<Widget>[
          Text("船舶添加",  style: TextStyle(
            color: Colors.black,
            fontSize: 28.0,
            height: 1.2,
            fontFamily: "Courier",
            decorationStyle: TextDecorationStyle.dashed
          ),),
          TextFormField(
            decoration: const InputDecoration(
              hintText: '船只编号',
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
              hintText: '船只名称',
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
            child: const Text(
              '添加', 
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontFamily: "Courier",
                decorationStyle: TextDecorationStyle.dashed
              ),
            ),
          ),
        ],
      ),
    );
    final addEquipment = DecoratedBox(
      decoration: BoxDecoration(
        /* gradient: LinearGradient(
                          colors: [
                            Colors.lightBlue,
                            Colors.green,
                          ],
                        ),*/
        // color: Colors.blueGrey,
        color: Color.fromRGBO(255,235,205, 1),
        // borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(2.0, 2.0),
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        children:<Widget>[
          Text("设备添加",
            style: TextStyle(
              color: Colors.black,
              fontSize: 28.0,
              height: 1.2,
              fontFamily: "Courier",
              decorationStyle: TextDecorationStyle.dashed
            ),
          ),
          Text( this.parentName=="" ? "请选择添加位置：":"已选择："+this.parentName),
          TextFormField(
            decoration: const InputDecoration(
              hintText: '设备名称',
            ),
            validator: (String? value) {
              // if (value == null || value.isEmpty) {
              //   return '请输入名称';
              // }
              this.name = value;
              print(this.name);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton (
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
                // print("====");
                // print(this.name);
                Tree addTree = Tree(treeid: myId, treepid: this.parentId, name: this.name, shipname: "shipname");
                ShipDatabase.instance.treeInsert(addTree);
                setState(() {
                  this.treeListShow.add(addTree);
                });
              },
              child: const Text('添加',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontFamily: "Courier",
                  decorationStyle: TextDecorationStyle.dashed
                ),
              ),
            ),
          ),
        ],
      ),
    );

    final modifyEquipment = DecoratedBox(
      decoration: BoxDecoration(
      /* gradient: LinearGradient(
        colors: [
          Colors.lightBlue,
          Colors.green,
        ],
      ),*/
      // color: Colors.blueGrey,
      color: Color.fromRGBO(255,235,205, 1),
      // borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(2.0, 2.0),
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        children:<Widget>[
          Text("设备修改", style: TextStyle(
              color: Colors.black,
              fontSize: 28.0,
              height: 1.2,
              fontFamily: "Courier",
              decorationStyle: TextDecorationStyle.dashed
            ),
          ),
          Text( this.parentName=="" ? "请选择要修改的设备：":"已选择："+this.parentName),
          TextFormField(
            decoration: const InputDecoration(
              hintText: '设备名称',
            ),
            validator: (String? value) {
              // if (value == null || value.isEmpty) {
              //   return '请输入名称';
              // }
              this.editName = value;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  // Process data.
                }
                //treeQueryById
                // Tree addTree = Tree(treeid: myId, treepid: this.parentId, name: this.name, shipname: "shipname");
                // ShipDatabase.instance.treeInsert(addTree);
                Tree editTree = await ShipDatabase.instance.treeQueryByTreeId(this.parentId);
                // print(editTree.name+"sdd"+editTree.shipname+" "+editTree.id.toString()+editTree.treeid+editTree.treepid);
                // print(this.editName);

                Tree tree2 = Tree(id:editTree.id,treeid: editTree.treeid, treepid: editTree.treepid, name: this.editName, shipname: editTree.shipname);
                ShipDatabase.instance.treeUpdate(tree2);

                setState(() {
                  for (int i = 0; i < treeListShow.length; i++) {
                    if (treeListShow[i].getId() == this.parentId) {
                      treeListShow[i] = tree2;
                    }
                  }
                });
              },
              child: const Text(
                '修改', 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontFamily: "Courier",
                  decorationStyle: TextDecorationStyle.dashed
                ),
              ),
            ),
          ),
        ],
      ),
    );

    final removeEquipment = DecoratedBox(
      decoration: BoxDecoration(
        color: Color.fromRGBO(255,235,205, 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(2.0, 2.0),
            blurRadius: 2,
          ),
        ],
      ),
      child:ConstrainedBox(
        constraints: BoxConstraints(minWidth: double.infinity),
        child: Column(
          children:<Widget>[
            Text("设备删除", style: TextStyle(
                color: Colors.black,
                fontSize: 28.0,
                height: 1.2,
                fontFamily: "Courier",
                decorationStyle: TextDecorationStyle.dashed
              ),
            ),
            Text( this.parentName=="" ? "请选择需要删除的设备：":"已选择："+this.parentName),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  // Process data.
                }

                // 执行删除操作考虑子节点 this.parentId就是点击的treeId
                Map<String, List<String>> child = Map();
                for (int i = 0; i < treeListShow.length; i++) {
                  String treeid = treeListShow[i].getId();
                  String treepid = treeListShow[i].getParentId();
                  var l = child[treepid];
                  if (l == null) {
                    child[treepid] = [];
                    child[treepid]!.add(treeid);
                  } else {
                    child[treepid]!.add(treeid);
                  }
                }

                List<String> needRemove = [];
                Queue<String> q = Queue();
                q.add(this.parentId);
                while (!q.isEmpty) {
                  dynamic t = q.removeFirst();
                  needRemove.add(t);
                  var l = child[t];
                  if (l != null) {
                    for (int i = 0; i < child[t]!.length; i++) {
                      q.add(child[t]![i]);
                    }
                  }
                }

                for (int i = 0; i < needRemove.length; i++) {
                  await ShipDatabase.instance.treeDeleteByTreeId(needRemove[i]);
                }
                setState(() {
                  for (int i = 0; i < needRemove.length; i++) {
                    for (int j = 0; j < treeListShow.length; j++) {
                      if (needRemove[i] == treeListShow[j].getId()) {
                        treeListShow.removeAt(j);
                        break;
                      }
                    }
                  }
                });
              },
              child: const Text('删除',style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontFamily: "Courier",
                  decorationStyle: TextDecorationStyle.dashed
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return SafeArea(
      child: isLoading ? CircularProgressIndicator() : Scaffold(
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
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    addShip,
                    SizedBox(height: 6),
                    addEquipment,
                    SizedBox(height: 6),
                    modifyEquipment,
                    SizedBox(height: 6),
                    removeEquipment,                
                  ],
                ),
              )
            ],
          )
        )
      )
    );
  }
}