import 'package:dynamic_treeview/dynamic_treeview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:horizontal_data_table/refresh/hdt_refresh_controller.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ship/db/ShipDatabase.dart';
import 'package:ship/model/Device.dart';
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
  bool isLoading = false;
  List<BaseData> treeListShow;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // 用于船的添加
  var shipId='c';
  var shipName;
  var menuID;
  var menulocation;


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

  //Devices
  List<Device> allDevices = [];

  @override
  void initState() {
    super.initState();
    // 这里的全部数据应该从数据库中获取
    user.initData(3);
    checkPermisson();
    getDevice();
    print("test:  "+this.treeListShow.length.toString());
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
  void checkPermisson() async {
    //当前权限
    Permission permission = Permission.storage;
    //权限的状态
    PermissionStatus status = await permission.status;


    if(status.isDenied){
      status = await permission.request();
    }else if(status.isPermanentlyDenied){
      status = await permission.request();
    }else{
      status = await permission.request();
    }
  }
  //_表格

  @override
  Widget build(BuildContext context) {
    final tableshow = DecoratedBox(
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

            // 以下为测试表格
            Container(
              child: HorizontalDataTable(
                leftHandSideColumnWidth: 100,
                rightHandSideColumnWidth: 700,  // 改成700防止溢出
                isFixedHeader: true,
                headerWidgets: _getTitleWidget(),
                leftSideItemBuilder: _generateFirstColumnRow,
                rightSideItemBuilder: _generateRightHandSideColumnRow,
                itemCount: allDevices.length,
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
              height: MediaQuery.of(context).size.height-80-50,
            )
          ]
      ),
    );
    return SafeArea(
      child: isLoading
          ? CircularProgressIndicator()
          :Scaffold(
          appBar: AppBar(
            title: Text("实地查询"),
            elevation: 10.0,
            centerTitle: true,
          ),
          body: Row(
            children: [Expanded(
                flex: 1,
                child:Column(
                  children: <Widget>[
                    Expanded(
                        child: DynamicTreeView(
                    data: treeListShow,

                    config: Config(
                        parentTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                        rootId: "1",
                        parentPaddingEdgeInsets: EdgeInsets.only(left: 0, top: 0, bottom: 0)
                    ),
                    onTap: (m) async {
                      print("onChildTap -> $m");
                      List<String> a = m.toString().split(",");
                      this.menuID=a[0].substring(5);
                      print(this.menuID.toString()+"sdf");
                      setState(() => isLoading = true);
                      this.menulocation=a[2].substring(7);
                      this.allDevices =  await ShipDatabase.instance.deviceQueryBymenuId(this.menuID);
                      setState(() => isLoading = false);


                      /*Navigator.push(
                          context,
                          MaterialPageRoute(

                              builder: (ctx) => ScreenTwo(
                                data: m,
                              )
                          )
                      );*/
                    },
                    width: 210.0,
                  ),
              ),
             ])),

              Expanded(
                flex: 5,
                child:Column(
                  children: <Widget>[
                Row(
                children: [
                    Text(this.menulocation==null ? "当前位置：--":"当前位置："+this.menulocation,  style: TextStyle(
                        color: Colors.black,
                        fontSize: 28.0,
                        height: 1.2,
                        fontFamily: "Courier",
                        decorationStyle: TextDecorationStyle.dashed
                    ),),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (ctx) => LedgerQuery(treeListShow: this.treeListShow, devices: allDevices,))
                      );
                    },
                    child: Text('台账查询'),
                  )
                   ]),

                   tableshow,
                  ]
                )
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

      _getTitleItemWidget('生产厂家', 100),
      _getTitleItemWidget('安装位置', 100),
      _getTitleItemWidget('位置负责人', 100),
      _getTitleItemWidget('检定类别', 100),
      _getTitleItemWidget('有效日期', 100),
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
      child: Text(allDevices[index].name),
      width: 100,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }
  bool warn(String date){
    return DateTime.parse(date).difference(DateTime.now()).inDays<30;


  }
  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return new Row(//y用Row会导致超出屏幕范围出bug，百度用expand暂未成功
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Icon(
                  allDevices[index].status!="正常"
                      ? Icons.notifications_off
                      : Icons.notifications_active,
                  color:
                  allDevices[index].status!="正常" ? Colors.red : Colors.green),
              Text(allDevices[index].status!="正常" ? 'Disabled' : 'Active')
            ],
          ),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(allDevices[index].manufacturer!=null ? allDevices[index].manufacturer:"——"),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(allDevices[index].location),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(allDevices[index].principal),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(allDevices[index].verificationCategory),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(allDevices[index].effectiveDate,
            style: TextStyle(
            color: warn(allDevices[index].effectiveDate)? Colors.red: Colors.black,
            )),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: ElevatedButton(
            child: Text("检验报告"),
            onPressed: () => Navigator.push(
              context,
             // MaterialPageRoute(builder: (context) => PDFScreen("/data/data/com.example.ship/files/2.pdf")),
              MaterialPageRoute(builder: (context) => PDFScreen("/data/user/0/com.example.ship/app_flutter/test2.pdf")),
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


  //Device
  Future getDevice() async
{
  //List<Devices> a=[];
  setState(() => isLoading = true);
  this.allDevices =  await ShipDatabase.instance.deviceQueryAll();
  setState(() => isLoading = false);
  // print("sss");
  // print(a.length);
  // print("sss");

}







}










/////////表格



// 以下定义User也是用于测试表格
User user = User();

class User {
  List<UserInfo> userInfo = [];

  void initData(int size) {

    //

    //
    userInfo.clear();
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