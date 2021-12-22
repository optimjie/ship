import 'package:dynamic_treeview/dynamic_treeview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:ship/db/ShipDatabase.dart';
import 'package:ship/model/Tree.dart';
import 'package:ship/model/Device.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

import '../DataModel.dart';
import '../ScreenTwo.dart';

class LedgerQuery extends StatefulWidget {
  // final List<BaseData> treeListShow;
  final List<Device> devices;
  const LedgerQuery({ Key? key, required this.devices, List<BaseData>? treeListShow }) : super(key: key);

  @override
  _LedgerQueryState createState() => _LedgerQueryState(devices);
}

class _LedgerQueryState extends State<LedgerQuery> {

  var vagueName = '1234';  // 用于模糊查询
  String categorySelect = 'A';

  // 用于测试表格
  HDTRefreshController _hdtRefreshController = HDTRefreshController();
  static const int sortName = 0;
  static const int sortStatus = 1;
  bool isAscending = true;
  int sortType = sortName;


  List<Device> devices;
  late List<Device> devicesToShow;

  _LedgerQueryState(this.devices);

  @override
  void initState() {
    devicesToShow = devices;
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("台账查询"),
            elevation: 10.0,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
                children:<Widget>[
                  Container(
                    child: Row(
                      children: [
                        ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: 200
                            ),
                            child: TextFormField(
                              onChanged: (v) {
                                this.vagueName = v;
                                // print(v);
                              },
                              decoration: const InputDecoration(
                                hintText: '名称',
                              ),
                              validator: (String? value) {
                                this.vagueName = value!;
                              },
                            )
                        ),
                        ElevatedButton(
                          onPressed: () {  
                            setState(() {
                              // 需要修改的部分
                              devicesToShow = [];
                              // print("here!!!" + all.length.toString());
                              for (int i = 0; i < devices.length; i++) {
                                Device d = devices[i];
                                // print(u.a + this.vagueName);
                                if (d.name.indexOf(this.vagueName) != -1) {
                                  devicesToShow.add(d);
                                }
                              }
                            });
                          },
                          child: Text('查询'),
                        ),
                        SizedBox(height: 6, width: 320,),
                        Text('查询类别：'),
                        InkWell(
                            onTap: () {
                              Pickers.showSinglePicker(context,
                                data: ['A', 'B', 'C'],
                                selectData: categorySelect,
                                onConfirm: (p, position) {
                                  setState(() {
                                    if (p != categorySelect) {
                                      categorySelect = p;
                                      devicesToShow = [];
                                      for (int i = 0; i < devices.length; i++) {
                                        Device d = devices[i];
                                        // print(u.a + this.vagueName);
                                        if (d.verificationCategory[0] == categorySelect) {
                                          devicesToShow.add(d);
                                        }
                                      }
                                    }                                    
                                  });
                                },
                              );
                            },
                            child: Text('$categorySelect')
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: HorizontalDataTable(
                      leftHandSideColumnWidth: 100,
                      rightHandSideColumnWidth: 880,  
                      isFixedHeader: true,
                      headerWidgets: _getTitleWidget(),
                      leftSideItemBuilder: _generateFirstColumnRow,
                      rightSideItemBuilder: _generateRightHandSideColumnRow,
                      itemCount: devicesToShow.length,
                      rowSeparatorWidget: const Divider(
                        color: Colors.black54,
                        height: 1.0,
                        thickness: 0.0,
                      ),
                      leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
                      rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
                      verticalScrollbarStyle: const ScrollbarStyle(
                        thumbColor: Colors.yellow,
                        isAlwaysShown: true,
                        thickness: 4.0,
                        radius: Radius.circular(5.0),
                      ),
                      horizontalScrollbarStyle: const ScrollbarStyle(
                        thumbColor: Colors.red,
                        isAlwaysShown: true,
                        thickness: 4.0,
                        radius: Radius.circular(5.0),
                      ),
                      enablePullToRefresh: true,
                      refreshIndicator: const WaterDropHeader(),
                      refreshIndicatorHeight: 60,
                      onRefresh: () async {
                        //Do sth
                        await Future.delayed(const Duration(milliseconds: 500));
                        _hdtRefreshController.refreshCompleted();
                      },
                      htdRefreshController: _hdtRefreshController,
                    ),
                    height: MediaQuery.of(context).size.height,
                  )
                ]
            ),
          )
      ),
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('计量器具名称', 100),
      _getTitleItemWidget('状态', 100),
      _getTitleItemWidget('生产厂家', 180),
      _getTitleItemWidget('安装位置', 100),
      _getTitleItemWidget('位置负责人', 100),
      _getTitleItemWidget('检定类别', 100),
      _getTitleItemWidget('有效日期', 100),
      _getTitleItemWidget('管理标签', 100),
      _getTitleItemWidget('检验标签', 100),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      child: Text(devicesToShow[index].name),
      width: 200,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return new Row(  // y用Row会导致超出屏幕范围出bug，百度用expand暂未成功
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Icon(
                  devicesToShow[index].status == "正常"
                      ? Icons.notifications_off
                      : Icons.notifications_active,
                  color:
                  devicesToShow[index].status == "正常" ? Colors.red : Colors.green),
              Text(devicesToShow[index].status == "正常" ? 'Disabled' : 'Active')
            ],
          ),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(devicesToShow[index].manufacturer),
          width: 180,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(devicesToShow[index].location),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(devicesToShow[index].principal),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(devicesToShow[index].verificationCategory),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(devicesToShow[index].effectiveDate),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: ElevatedButton(
            child: Text("管理标签"),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PDFScreen("/data/data/com.example.ship/files/2.pdf")),
            ),
          ),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: ElevatedButton(
            child: Text("检验标签"),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PDFScreen("/data/data/com.example.ship/files/2.pdf")),
            ),
          ),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ],
    )
    ;
  }
}

// ignore: must_be_immutable   PDF界面
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