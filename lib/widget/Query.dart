// ignore: import_of_legacy_library_into_null_safe
import 'dart:typed_data';
import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';

import 'package:dynamic_treeview/dynamic_treeview.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ship/model/Device.dart';
import 'package:ship/widget/FieldQuery.dart';

import 'FieldQuery.dart';
import 'LedgerQuery.dart';
import 'Settings.dart';
import 'FieldQueryTest.dart';
import 'package:permission_handler/permission_handler.dart';
class Query extends StatelessWidget {

  final List<BaseData> treeListShow;
  final List<Device> devices;
  const Query({Key? key, required this.treeListShow, required this.devices}) : super(key: key);




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
            /*ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => Settings(treeListShow: this.treeListShow))
                );
              },
              child: Text('设置'),
            ),*/
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => LedgerQuery(devices: this.devices))
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
              child: Text('实地查询'),
            ),
            /*ElevatedButton(
              child: Text("Open PDF"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PDFScreen("/data/user/0/com.example.ship/app_flutter/test2.pdf")),
              ),
            ),*/
            /*MaterialButton(
              color: Colors.blue,
              child: new Text('点我'),
              onPressed: () {
                DateTime now = new DateTime.now();
                print("当前时间：$now");
                DateTime moonLanding = DateTime.parse("2022-01-07");
                print(moonLanding.difference(now).inDays);
                print(now.difference(moonLanding));
                List<String>  sj=moonLanding.difference(now).toString().split(":");
                print(sj[2]);
                print(moonLanding.difference(now).inDays<30);
                PDFScreen("/data/user/0/com.example.ship/app_flutter/test.pdf");
                // createFileOfPdfUrl().then((f) {
                //   print(f.path.toString()+"sdf");
                //   PDFScreen(f.path);
                //
                // });

              },
            ),*/
          ]
        )
      )
    );
  }

  Future<void> writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return new File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }


  Future<File> createFileOfPdfUrl() async {
    //final url = "http://africau.edu/images/default/sample.pdf";
    final filename = 'test.pdf';
    //var request = await HttpClient().getUrl(Uri.parse(url));
    //var response = await request.close();
    var bytes = await rootBundle.load("assets/1.pdf");

    String dir = (await getApplicationDocumentsDirectory()).path;
    writeToFile(bytes,'$dir/$filename');
    File file = new File('$dir/$filename');
    //await file.writeAsBytes(bytes);

    return file;
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
        title: Text("返回"),
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