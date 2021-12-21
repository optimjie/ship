import 'package:dynamic_treeview/dynamic_treeview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:horizontal_data_table/refresh/hdt_refresh_controller.dart';
import 'package:ship/db/ShipDatabase.dart';
import 'package:ship/model/Tree.dart';

import '../DataModel.dart';
import '../ScreenTwo.dart';
import 'LedgerQuery.dart';
class FieldQueryTest extends StatefulWidget {

  final List<BaseData> treeListShow;
  FieldQueryTest({ Key? key, required this.treeListShow }) : super(key: key);
  @override
  _FieldQueryTestState createState() => _FieldQueryTestState(treeListShow);
}

class _FieldQueryTestState extends State<FieldQueryTest> {
  List<BaseData> treeListShow;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // 用于船的添加
  var shipId='c';
  var shipName;

  _FieldQueryTestState(this.treeListShow);
  //表格
  var vagueName = '1234';  // 用于模糊查询
  String categorySelect = 'A';

  HDTRefreshController _hdtRefreshController = HDTRefreshController();
  static const int sortName = 0;
  static const int sortStatus = 1;
  bool isAscending = true;
  int sortType = sortName;

  // 所有数据
  List<UserInfo> all = [];
  // late List<UserInfo> allFilterByCategory;

  @override
  void initState() {
    // 这里的全部数据应该从数据库中获取
    user.initData(3);
    all.clear();
    all = user.userInfo;
    // for (int i = 0; i < all.length; i++) {
    //   UserInfo u = all[i];
    //   if (u.d == 'A') {  // 因为默认是A
    //     allFilterByCategory.add(u);
    //   }
    // }
    super.initState();
  }

  //_表格

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
                        user.userInfo = [];
                        // print("here!!!" + all.length.toString());
                        for (int i = 0; i < all.length; i++) {
                          UserInfo u = all[i];
                          // print(u.a + this.vagueName);
                          if (u.a.indexOf(this.vagueName) != -1) {
                            user.userInfo.add(u);
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
                                user.userInfo = [];
                                for (int i = 0; i < all.length; i++) {
                                  UserInfo u = all[i];
                                  // print(u.a + this.vagueName);
                                  if (u.d == categorySelect) {
                                    user.userInfo.add(u);
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
            // 以下为测试表格
            Container(
              child: HorizontalDataTable(
                leftHandSideColumnWidth: 100,
                rightHandSideColumnWidth: 700,  // 改成700防止溢出
                isFixedHeader: true,
                headerWidgets: _getTitleWidget(),
                leftSideItemBuilder: _generateFirstColumnRow,
                rightSideItemBuilder: _generateRightHandSideColumnRow,
                itemCount: user.userInfo.length,
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
                      this.shipName = m;
                      /*Navigator.push(
                          context,
                          MaterialPageRoute(

                              builder: (ctx) => ScreenTwo(
                                data: m,
                              )
                          )
                      );*/
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


  ///////bioage

  List<Widget> _getTitleWidget() {
    return [
      TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: _getTitleItemWidget(
            '计量器名称' + (sortType == sortName ? (isAscending ? '↓' : '↑') : ''),
            100),
        onPressed: () {
          sortType = sortName;
          isAscending = !isAscending;
          user.sortName(isAscending);
          setState(() {});
        },
      ),
      TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: _getTitleItemWidget(
            '状态' +
                (sortType == sortStatus ? (isAscending ? '↓' : '↑') : ''),
            100),
        onPressed: () {
          sortType = sortStatus;
          isAscending = !isAscending;
          user.sortStatus(isAscending);
          setState(() {});
        },
      ),
      // _getTitleItemWidget('Phone', 200),
      // _getTitleItemWidget('Register', 100),
      // _getTitleItemWidget('Termination', 200),
      _getTitleItemWidget('计量器具名称', 200),
      _getTitleItemWidget('生产厂家', 100),
      _getTitleItemWidget('安装位置', 100),
      _getTitleItemWidget('检定类别', 100),
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
      child: Text(user.userInfo[index].name),
      width: 100,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return new Row(//y用Row会导致超出屏幕范围出bug，百度用expand暂未成功
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Icon(
                  user.userInfo[index].status
                      ? Icons.notifications_off
                      : Icons.notifications_active,
                  color:
                  user.userInfo[index].status ? Colors.red : Colors.green),
              Text(user.userInfo[index].status ? 'Disabled' : 'Active')
            ],
          ),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        // Container(
        //   child: Text(user.userInfo[index].phone),
        //   width: 200,
        //   height: 52,
        //   padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        //   alignment: Alignment.centerLeft,
        // ),
        // Container(
        //   child: Text(user.userInfo[index].registerDate),
        //   width: 100,
        //   height: 52,
        //   padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        //   alignment: Alignment.centerLeft,
        // ),
        // Container(
        //   child: Text(user.userInfo[index].terminationDate),
        //   width: 200,
        //   height: 52,
        //   padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        //   alignment: Alignment.centerLeft,
        // ),
        Container(
          child: Text(user.userInfo[index].a),
          width: 200,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(user.userInfo[index].b),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(user.userInfo[index].c),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(user.userInfo[index].d),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: ElevatedButton(
            child: Text("Open PDF"),
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










/////////表格



// 以下定义User也是用于测试表格
User user = User();

class User {
  List<UserInfo> userInfo = [];

  void initData(int size) {
    for (int i = 0; i < size; i++) {
      userInfo.add(UserInfo(
          "器具_$i", i % 3 == 0, '压力表', 'Sinkow', '热水锅炉', 'A'));
    }
    // 添加几个不是压力表不是A类的数据进行测试
    userInfo.add(UserInfo("test1", true, '111', '111', '111', 'B'));
    userInfo.add(UserInfo("test2", true, '112', '222', '222', 'B'));
    userInfo.add(UserInfo("test3", true, '223', '222', '222', 'C'));
  }

  ///
  /// Single sort, sort Name's id
  void sortName(bool isAscending) {
    userInfo.sort((a, b) {
      int aId = int.tryParse(a.name.replaceFirst('User_', '')) ?? 0;
      int bId = int.tryParse(b.name.replaceFirst('User_', '')) ?? 0;
      return (aId - bId) * (isAscending ? 1 : -1);
    });
  }

  ///
  /// sort with Status and Name as the 2nd Sort
  void sortStatus(bool isAscending) {
    userInfo.sort((a, b) {
      if (a.status == b.status) {
        int aId = int.tryParse(a.name.replaceFirst('User_', '')) ?? 0;
        int bId = int.tryParse(b.name.replaceFirst('User_', '')) ?? 0;
        return (aId - bId);
      } else if (a.status) {
        return isAscending ? 1 : -1;
      } else {
        return isAscending ? -1 : 1;
      }
    });
  }
}

class UserInfo {
  String name;
  bool status;
  // String phone;
  // String registerDate;
  // String terminationDate;

  String a;
  String b;
  String c;
  String d;

  UserInfo(this.name, this.status, this.a, this.b, this.c, this.d);

// UserInfo(this.name, this.status, this.phone, this.registerDate,
//     this.terminationDate);
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