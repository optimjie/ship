import 'package:dynamic_treeview/dynamic_treeview.dart';
import 'package:flutter/material.dart';
import 'package:ship/db/ShipDatabase.dart';
import 'package:ship/model/Tree.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

import '../DataModel.dart';
import '../ScreenTwo.dart';

class LedgerQuery extends StatefulWidget {
  final List<BaseData> treeListShow;
  const LedgerQuery({ Key? key, required this.treeListShow }) : super(key: key);

  @override
  _LedgerQueryState createState() => _LedgerQueryState();
}

class _LedgerQueryState extends State<LedgerQuery> {

  var name;  // 用于模糊查询
  String initData = 'A';

  // 用于测试表格
  HDTRefreshController _hdtRefreshController = HDTRefreshController();
  static const int sortName = 0;
  static const int sortStatus = 1;
  bool isAscending = true;
  int sortType = sortName;

  @override
  void initState() {
    user.initData(10);
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
        // body: TextFormField(
        //   decoration: const InputDecoration(
        //     hintText: '名称',
        //   ),
        //   validator: (String? value) {
        //     this.name = value;
        //   },
        // ),
        // body: ConstrainedBox(
        //   constraints: BoxConstraints(
        //     maxWidth: 200
        //   ),
        //   child: TextFormField(
        //     decoration: const InputDecoration(
        //       hintText: '名称',
        //     ),
        //     validator: (String? value) {
        //       this.name = value;
        //     },
        //   ),
        // )
        
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
                        decoration: const InputDecoration(
                          hintText: '名称',
                        ),
                        validator: (String? value) {
                          this.name = value;
                        },
                      )
                    ),
                    ElevatedButton(
                      onPressed: (){

                      },
                      child: Text('查询'),
                    ),
                    SizedBox(height: 6, width: 320,),
                    Text('查询类别：'),
                    InkWell(
                      onTap: () {
                        Pickers.showSinglePicker(context,
                          data: ['A', 'B', 'C'],
                          selectData: initData,
                          onConfirm: (p, position) {
                            setState(() {
                              initData = p;
                            });
                          }, 
                        );
                      },
                      child: Text('$initData')
                    ),
                  ], 
                ),
              ),
              
              // 以下为测试表格
              Container(
                child: HorizontalDataTable(
                  leftHandSideColumnWidth: 100,
                  rightHandSideColumnWidth: 600,
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
        )
      ),
    );
  }

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
    return Row(
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
      ],
    );
  }
}


// 以下定义User也是用于测试表格
User user = User();

class User {
  List<UserInfo> userInfo = [];

  void initData(int size) {
    for (int i = 0; i < size; i++) {
      userInfo.add(UserInfo(
          "器具_$i", i % 3 == 0, '压力表', 'Sinkow', '热水锅炉', 'A'));
    }
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