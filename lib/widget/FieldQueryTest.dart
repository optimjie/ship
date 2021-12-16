import 'package:dynamic_treeview/dynamic_treeview.dart';
import 'package:flutter/material.dart';
import 'package:ship/db/ShipDatabase.dart';
import 'package:ship/model/Tree.dart';

import '../DataModel.dart';
import '../ScreenTwo.dart';

class FieldQueryTest extends StatelessWidget {

  final List<BaseData> treeListShow;


  FieldQueryTest({ Key? key, required this.treeListShow }) : super(key: key);
  // 用于船的添加
  var shipId;
  var shipName;

  @override
  Widget build(BuildContext context) {
    final addShip = DecoratedBox(
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
          // ElevatedButton(
          //   onPressed: () async {
          //     if (_formKey.currentState!.validate()) {
          //       // Process data.
          //     }
          //     // 执行添加船操作
          //     Tree addTree = Tree(treeid: shipId, treepid: "1", name: shipName, shipname: shipName);
          //     ShipDatabase.instance.treeInsert(addTree);
          //     setState(() {
          //       this.treeListShow.add(addTree);
          //     });
          //   },
          //   child: const Text(
          //     '添加',
          //     style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 28.0,
          //         fontFamily: "Courier",
          //         decorationStyle: TextDecorationStyle.dashed
          //     ),
          //   ),
          // ),
        ],
      ),
    );
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("实地查询"),
            elevation: 10.0,
            centerTitle: true,
          ),
          body: Row(
            children: [
              Column(
                  children:[ DynamicTreeView(
                    data: treeListShow,

                    config: Config(
                        parentTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                        rootId: "1",
                        parentPaddingEdgeInsets: EdgeInsets.only(left: 0, top: 0, bottom: 0)
                    ),
                    onTap: (m) {
                      print("onChildTap -> $m");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => ScreenTwo(
                                data: m,
                              )
                          )
                      );
                    },
                    width: 260.0,
                  ),]
              ),
              Expanded(
                flex: 4,
                child:addShip,
              )
            ],
          )

      ),
    );
  }
}