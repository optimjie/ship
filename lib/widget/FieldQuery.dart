import 'package:dynamic_treeview/dynamic_treeview.dart';
import 'package:flutter/material.dart';
import 'package:ship/db/ShipDatabase.dart';
import 'package:ship/model/Tree.dart';

import '../DataModel.dart';
import '../ScreenTwo.dart';

class FieldQuery extends StatelessWidget {

  final List<BaseData> treeListShow;

  const FieldQuery({ Key? key, required this.treeListShow }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("实地查询"),
          elevation: 10.0,
          centerTitle: true,
        ),
        body: 
        DynamicTreeView(
          data: treeListShow,
          config: Config(
            parentTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            rootId: "1",
            parentPaddingEdgeInsets: EdgeInsets.only(left: 16, top: 0, bottom: 0)),
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
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}