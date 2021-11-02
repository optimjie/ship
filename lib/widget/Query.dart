import 'package:dynamic_treeview/dynamic_treeview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:ship/widget/FieldQuery.dart';

import 'FieldQuery.dart';
import 'Settings.dart';

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
            RaisedButton(
              child: Text("Open PDF"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PDFScreen("/data/data/com.example.ship/files/2.pdf")),
              ),
            ),
          ]
        )
      )
    );
  }
}
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
        path: pathPDF);
  }
}

