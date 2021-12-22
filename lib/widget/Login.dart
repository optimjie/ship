import 'package:dynamic_treeview/dynamic_treeview.dart';
import 'package:flutter/material.dart';
import 'package:ship/model/Device.dart';

import 'Query.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey _key = GlobalKey<FormState>();
  TextEditingController _user = TextEditingController();
  TextEditingController _pass = TextEditingController();
  FocusNode _u = FocusNode();
  FocusNode _p = FocusNode();
  late FocusScopeNode _focusScopeNode;

  final List<BaseData> treeListShow = [];
  final List<Device> devices = [];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _user.dispose();
    _pass.dispose();
    _u.dispose();
    _p.dispose();
    if (_focusScopeNode != null) _focusScopeNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          TextFormField(
            autofocus: true,
            focusNode: _u,
            controller: _user,
            decoration: InputDecoration(
              labelText: "账号",
              hintText: "请输入账号",
            ),
            validator: (v) {
              if (v == null || v.isEmpty) {
                return "账号必须输入！";
              }
            },
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (v) {
              print("object");
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            focusNode: _p,
            controller: _pass,
            decoration: InputDecoration(
              labelText: "密码",
              hintText: "请输入密码",
            ),
            validator: (v) {
              if (v == null || v.length < 5) {
                return "密码必须输入且大于5";
              }
            },
            textInputAction: TextInputAction.send,
            obscureText: true,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => Query(treeListShow: this.treeListShow, devices: this.devices)));
            },
            child: Text("提交"),
          )
        ],
      ),
    );
  }
}
