import 'package:dynamic_treeview/dynamic_treeview.dart';
import 'package:flutter/cupertino.dart';

class TreeModel extends BaseData {
  final String id;
  final String parentId;
  final String title;
  Map<String, dynamic> extras;

  TreeModel(
      {required this.id,
      required this.parentId,
      required this.title,
      required this.extras});

  @override
  Map<String, dynamic> getExtraData() {
    return this.extras;
  }

  @override
  String getId() {
    return this.id;
  }

  @override
  String getParentId() {
    return this.parentId;
  }

  @override
  String getTitle() {
    return this.title;
  }
}
