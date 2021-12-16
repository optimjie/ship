// ignore: import_of_legacy_library_into_null_safe
import 'package:dynamic_treeview/dynamic_treeview.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:ship/widget/FieldQuery.dart';

import 'FieldQuery.dart';
import 'LedgerQuery.dart';
import 'Settings.dart';
import 'FieldQueryTest.dart';

class Query extends StatelessWidget {

  final List<BaseData> treeListShow;

  const Query({Key? key, required this.treeListShow}) : super(key: key);

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
              onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => Settings(treeListShow: this.treeListShow))
                );
              },
              child: Text('设置'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => LedgerQuery(treeListShow: this.treeListShow))
                );
              },
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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => FieldQueryTest(treeListShow: this.treeListShow))
                );
              },
              child: Text('实地查询测试'),
            ),
            ElevatedButton(
              child: Text("Open PDF"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PDFScreen("/data/data/com.example.ship/files/2.pdf")),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              child: new Text('点我'),
              onPressed: () {
                showDialog<Null>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return new AlertDialog(
                      title: new Text('标题'),
                      content: new SingleChildScrollView(
                        child: new ListBody(
                          children: <Widget>[
                            new Text('内容 1'),
                            new PDFScreen("/data/data/com.example.ship/files/2.pdf"),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        new FlatButton(
                          child: new Text('确定'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                ).then((val) {
                  print(val);
                });
              },
            ),
          ]
        )
      )
    );
  }
}

// ignore: must_be_immutable
class PDFScreen extends StatelessWidget {
  String pathPDF = "";
  PDFScreen(this.pathPDF);

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      appBar: AppBar(
        title: Text("Document"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      path: pathPDF
    );
  }
}