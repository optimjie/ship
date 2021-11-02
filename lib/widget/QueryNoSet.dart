import 'package:dynamic_treeview/dynamic_treeview.dart';
import 'package:flutter/material.dart';
import 'package:ship/widget/FieldQuery.dart';

import 'FieldQuery.dart';
import 'Settings.dart';

class QueryNoSet extends StatelessWidget {

  final List<BaseData> treeListShow;

  const QueryNoSet({Key? key, required this.treeListShow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("查询"),
        elevation: 10.0,
        centerTitle: true,
      ),
      body: Center(
        child: Column (
          children: <Widget>[
            ElevatedButton(
              onPressed: () {},
              child: Text('台账查询'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => FieldQuery(treeListShow: this.treeListShow))
                );
              },
              child: Text('实地查询'),
            ),
          ]
        )
      )
    );
  }
}


