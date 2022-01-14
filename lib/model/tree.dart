import 'package:dynamic_treeview/dynamic_treeview.dart';

final String tableTree = 'tree';

class TreeFields {

  static final List<String> values = [
    /// Add all fields
    id, treeid, treepid, name, shipname
    //id, parentId, name, extras
  ];

  static final String id = '_id';
  static final String treeid = 'treeid';
  static final String treepid = 'treepid';
  static final String name = 'name';
  static final String shipname = 'shipname';
}

class Tree extends BaseData {
  final int? id;
  final String treeid;
  final String treepid;
  final String name;
  final String shipname;

  Tree({
    this.id,
    required this.treeid,
    required this.treepid,
    required this.name,
    required this.shipname
  });
  Tree copy({
    int? id,
    String? treeid,
    String? treepid,
    String? name,
    String? shipname,
  }) =>
    Tree(
      id: id ?? this.id,
      treeid: treeid ?? this.treeid,
      treepid: treepid ?? this.treeid,
      name: name ?? this.name,
      shipname: shipname ?? this.shipname
    );
  static Tree fromJson(Map<String, Object?> json) => Tree(
    id: json[TreeFields.id] as int?,
    treeid: json[TreeFields.treeid] as String,
    treepid: json[TreeFields.treepid] as String,
    name: json[TreeFields.name] as String,
    shipname: json[TreeFields.shipname] as String,
  );
  Map<String, Object?> toJson() => {
    TreeFields.id: id,
    TreeFields.treeid: treeid,
    TreeFields.treepid: treepid,
    TreeFields.name: name,
    TreeFields.shipname: shipname,
  };

  @override
  Map<String, dynamic> getExtraData() {
    return new Map<String, dynamic>();
  }

  @override
  String getId() {
    return treeid;
  }

  @override
  String getParentId() {
    return treepid;
  }

  @override
  String getTitle() {
    return name;
  }
}

// 测试数据
List<Tree> createTmpTreeData() {
  return [
    /*
      1, '01', '-1', '胜利503船', '胜利503船');
      2, '011', '01', '机舱', '胜利503船');
      3, '012', '01', '甲板', '胜利503船');
      4, '0001', '011', '机舱气瓶本体', '胜利503船');
      5, '0002', '011', '机舱二号气瓶', '胜利503船');
      6, '0003', '011', '机舱杂用气瓶', '胜利503船');
      7, '0004', '011', '机舱一号气瓶', '胜利503船');
      8, '0005', '011', '机舱电汽热水柜', '胜利503船');
      9, '0006', '011', '机舱海水柜', '胜利503船');
     */

    // Tree(id: 1, treeid: "1", treepid: "-1", name: "root", shipname: "root"),
    // Tree(id: 2, treeid: "2", treepid: "1", name: "胜利503船", shipname: "胜利503船"),
    // Tree(id: 3, treeid: "3", treepid: "2", name: "机舱", shipname: "胜利503船"),
    // Tree(id: 4, treeid: "4", treepid: "3", name: "甲板", shipname: "胜利503船"),
    // Tree(id: 1, treeid: "1", treepid: "-1", name: "root", shipname: "root"),
    // Tree(id: 2, treeid: "01", treepid: "1", name: "胜利503船", shipname: "胜利503船"),
    // Tree(id: 3, treeid: "011", treepid: "01", name: "机舱", shipname: "胜利503船"),
    // Tree(id: 4, treeid: "012", treepid: "01", name: "甲板", shipname: "胜利503船"),
    // Tree(id: 5, treeid: "0001", treepid: "011", name: "机舱气瓶本体", shipname: "胜利503船"),
    // Tree(id: 6, treeid: "0002", treepid: "011", name: "机舱二号气瓶", shipname: "胜利503船"),
    // Tree(id: 7, treeid: "0003", treepid: "011", name: "机舱杂用气瓶", shipname: "胜利503船"),
    // Tree(id: 8, treeid: "0004", treepid: "011", name: "机舱一号气瓶", shipname: "胜利503船"),
    // Tree(id: 9, treeid: "0005", treepid: "011", name: "机舱电汽热水柜", shipname: "胜利503船"),
    // Tree(id: 10, treeid: "0006", treepid: "011", name:  "机舱海水柜", shipname: "胜利503船"),

    // Tree(id: 1, treeid: "1", treepid: "-1", name: "root", shipname: "root"),
    // Tree(id: 2, treeid: "050300000", treepid: "1", name: "胜利503船", shipname: "胜利503船"),
    // Tree(id: 3, treeid: "050310000", treepid: "050300000", name: "机舱", shipname: "胜利503船"),
    // Tree(id: 4, treeid: "050310001", treepid: "050300000", name: "甲板", shipname: "胜利503船"),
    // Tree(id: 5, treeid: "050320000", treepid: "050310000", name: "机舱气瓶本体", shipname: "胜利503船"),
    // Tree(id: 6, treeid: "050320001", treepid: "050310000", name: "机舱二号气瓶", shipname: "胜利503船"),
    // Tree(id: 7, treeid: "050320002", treepid: "050310000", name: "机舱杂用气瓶", shipname: "胜利503船"),
    // Tree(id: 8, treeid: "050320003", treepid: "050310000", name: "机舱一号气瓶", shipname: "胜利503船"),
    // Tree(id: 9, treeid: "050320004", treepid: "050310000", name: "机舱电汽热水柜", shipname: "胜利503船"),
    // Tree(id: 10, treeid: "050320005", treepid: "050310000", name: "机舱海水柜", shipname: "胜利503船"),

    Tree(id: 1, treeid: "1", treepid: "-1", name: "root", shipname: "root"),
    Tree(id: 3, treeid: "050300000", treepid: "050300000", name: "胜利505", shipname: "胜利503船"),
    Tree(id: 4, treeid: "050310000", treepid: "050300000", name: "艏侧推舱", shipname: "胜利503船"),
    Tree(id: 8, treeid: "050310001", treepid: "050300000", name: "应急消防泵舱", shipname: "胜利503船"),
    Tree(id: 11, treeid: "050310002", treepid: "050300000", name: "集控室", shipname: "root"),
    Tree(id: 12, treeid: "050310003", treepid: "050300000", name: "主机舱", shipname: "胜利503船"),
    Tree(id: 13, treeid: "050310004", treepid: "050300000", name: "机修间旁", shipname: "胜利503船"),
    Tree(id: 14, treeid: "050310005", treepid: "050300000", name: "轴隧", shipname: "胜利503船"),
    Tree(id: 15, treeid: "050310006", treepid: "050310000", name: "艉侧推舱", shipname: "胜利503船"),
    Tree(id: 16, treeid: "050310007", treepid: "050310000", name: "舵机舱", shipname: "胜利503船"),
    Tree(id: 17, treeid: "050320000", treepid: "050310003", name: "左前", shipname: "胜利503船"),
    Tree(id: 18, treeid: "050320001", treepid: "050310003", name: "右前", shipname: "胜利503船"),
    Tree(id: 19, treeid: "050320002", treepid: "050310003", name: "前中", shipname: "胜利503船"),
    Tree(id: 20, treeid: "050320003", treepid: "050310003", name: "后中", shipname: "胜利503船"),
    Tree(id: 21, treeid: "050320004", treepid: "050310003", name: "左后", shipname: "root"),
    Tree(id: 22, treeid: "050320005", treepid: "050310003", name: "右后", shipname: "胜利503船"),
    Tree(id: 23, treeid: "050320006", treepid: "050310005", name: "左前", shipname: "胜利503船"),
    Tree(id: 24, treeid: "050320007", treepid: "050310005", name: "左后", shipname: "胜利503船"),
    Tree(id: 25, treeid: "050320008", treepid: "050310005", name: "右前", shipname: "胜利503船"),
    Tree(id: 26, treeid: "050320009", treepid: "050310005", name: "右后", shipname: "胜利503船"),
    Tree(id: 27, treeid: "050320010", treepid: "050310007", name: "入口", shipname: "胜利503船"),
    Tree(id: 28, treeid: "050320011", treepid: "050310007", name: "左舵机", shipname: "胜利503船"),
    Tree(id: 29, treeid: "050320012", treepid: "050310007", name: "右舵机", shipname: "胜利503船"),
    Tree(id: 30, treeid: "050320013", treepid: "050310003", name: "左辅机", shipname: "胜利503船"),
    Tree(id: 31, treeid: "050320014", treepid: "050310003", name: "右辅机", shipname: "胜利503船"),
    Tree(id: 32, treeid: "050320015", treepid: "050310003", name: "左主机", shipname: "胜利503船"),
    Tree(id: 33, treeid: "050320016", treepid: "050310003", name: "右主机", shipname: "胜利503船"),
   /* Tree( treeid: "1", treepid: "-1", name: "root", shipname: "root"),
    Tree( treeid: "050300000", treepid: "050300000", name: "胜利505", shipname: "胜利503船"),
    Tree(treeid: "050310000", treepid: "050300000", name: "艏侧推舱", shipname: "胜利503船"),
    Tree( treeid: "050310001", treepid: "050300000", name: "应急消防泵舱", shipname: "胜利503船"),
    Tree( treeid: "050310002", treepid: "050300000", name: "集控室", shipname: "root"),
    Tree( treeid: "050310003", treepid: "050300000", name: "主机舱", shipname: "胜利503船"),
    Tree( treeid: "050310004", treepid: "050300000", name: "机修间旁", shipname: "胜利503船"),
    Tree( treeid: "050310005", treepid: "050300000", name: "轴隧", shipname: "胜利503船"),
    Tree( treeid: "050310006", treepid: "050310000", name: "艉侧推舱", shipname: "胜利503船"),
    Tree( treeid: "050310007", treepid: "050310000", name: "舵机舱", shipname: "胜利503船"),
    Tree( treeid: "050320000", treepid: "050310003", name: "左前", shipname: "胜利503船"),
    Tree( treeid: "050320001", treepid: "050310003", name: "右前", shipname: "胜利503船"),
    Tree(treeid: "050320002", treepid: "050310003", name: "前中", shipname: "胜利503船"),
    Tree( treeid: "050320003", treepid: "050310003", name: "后中", shipname: "胜利503船"),
    Tree( treeid: "050320004", treepid: "050310003", name: "左后", shipname: "root"),
    Tree( treeid: "050320005", treepid: "050310003", name: "右后", shipname: "胜利503船"),
    Tree( treeid: "050320006", treepid: "050310005", name: "左前", shipname: "胜利503船"),
    Tree( treeid: "050320007", treepid: "050310005", name: "左后", shipname: "胜利503船"),
    Tree( treeid: "050320008", treepid: "050310005", name: "右前", shipname: "胜利503船"),
    Tree( treeid: "050320009", treepid: "050310005", name: "右后", shipname: "胜利503船"),
    Tree( treeid: "050320010", treepid: "050310007", name: "入口", shipname: "胜利503船"),
    Tree( treeid: "050320011", treepid: "050310007", name: "左舵机", shipname: "胜利503船"),
    Tree( treeid: "050320012", treepid: "050310007", name: "右舵机", shipname: "胜利503船"),
    Tree( treeid: "050320013", treepid: "050310003", name: "左辅机", shipname: "胜利503船"),
    Tree( treeid: "050320014", treepid: "050310003", name: "右辅机", shipname: "胜利503船"),
    Tree(treeid: "050320015", treepid: "050310003", name: "左主机", shipname: "胜利503船"),
    Tree( treeid: "050320016", treepid: "050310003", name: "右主机", shipname: "胜利503船"),
*/
    // INSERT INTO "tree" VALUES (1, 1, -1, 'root', 'shipname');
    // INSERT INTO "tree" VALUES (3, '050300000', 1, '胜利505', 'dddd');
    // INSERT INTO "tree" VALUES (4, '050310000', '050300000', '艏侧推舱', 'shipname');
    // INSERT INTO "tree" VALUES (8, '050310001', '050300000', '应急消防泵舱', 'shipname');
    // INSERT INTO "tree" VALUES (11, '050310002', '050300000', '集控室', 'shipname');
    // INSERT INTO "tree" VALUES (12, '050310003', '050300000', '主机舱', 'shipname');
    // INSERT INTO "tree" VALUES (13, '050310004', '050300000', '机修间旁', 'shipname');
    // INSERT INTO "tree" VALUES (14, '050310005', '050300000', '轴隧', 'shipname');
    // INSERT INTO "tree" VALUES (15, '050310006', '050300000', '艉侧推舱', 'shipname');
    // INSERT INTO "tree" VALUES (16, '050310007', '050300000', '舵机舱', 'shipname');
    // INSERT INTO "tree" VALUES (17, '050320000', '050310003', '左前', 'shipname');
    // INSERT INTO "tree" VALUES (18, '050320001', '050310003', '右前', 'shipname');
    // INSERT INTO "tree" VALUES (19, '050320002', '050310003', '前中', 'shipname');
    // INSERT INTO "tree" VALUES (20, '050320003', '050310003', '后中', 'shipname');
    // INSERT INTO "tree" VALUES (21, '050320004', '050310003', '左后', 'shipname');
    // INSERT INTO "tree" VALUES (22, '050320005', '050310003', '右后', 'shipname');
    // INSERT INTO "tree" VALUES (23, '050320006', '050310005', '左前', 'shipname');
    // INSERT INTO "tree" VALUES (24, '050320007', '050310005', '左后', 'shipname');
    // INSERT INTO "tree" VALUES (25, '050320008', '050310005', '右前', 'shipname');
    // INSERT INTO "tree" VALUES (26, '050320009', '050310005', '右后', 'shipname');
    // INSERT INTO "tree" VALUES (27, '050320010', '050310007', '入口', 'shipname');
    // INSERT INTO "tree" VALUES (28, '050320011', '050310007', '左舵机', 'shipname');
    // INSERT INTO "tree" VALUES (29, '050320012', '050310007', '右舵机', 'shipname');
    // INSERT INTO "tree" VALUES (30, '050320013', '050310003', '左辅机', 'shipname');
    // INSERT INTO "tree" VALUES (31, '050320014', '050310003', '右辅机', 'shipname');
    // INSERT INTO "tree" VALUES (32, '050320015', '050310003', '左主机', 'shipname');
    // INSERT INTO "tree" VALUES (33, '050320016', '050310003', '右主机', 'shipname');


    /*
      INSERT INTO Tree (_id, ID, PID, NAME, shipname) VALUES (54, '01', '-1', '船舶中心', '船舶中心');
      INSERT INTO Tree (_id, ID, PID, NAME, shipname) VALUES (55, '011', '01', '技术保障站', '船舶中心');
      INSERT INTO Tree (_id, ID, PID, NAME, shipname) VALUES (56, '012', '01', 'ACM-3LP喷砂机', '船舶中心');
      INSERT INTO Tree (_id, ID, PID, NAME, shipname) VALUES (57, '013', '01', '储气罐', '船舶中心');
      INSERT INTO Tree (_id, ID, PID, NAME, shipname) VALUES (58, '0111', '011', '千分尺', '船舶中心');
      INSERT INTO Tree (_id, ID, PID, NAME, shipname) VALUES (59, '0112', '011', '卡尺', '船舶中心');
      INSERT INTO Tree (_id, ID, PID, NAME, shipname) VALUES (60, '0113', '011', '数显卡尺', '船舶中心');
      INSERT INTO Tree (_id, ID, PID, NAME, shipname) VALUES (61, '0114', '011', '百分表', '船舶中心');
      INSERT INTO Tree (_id, ID, PID, NAME, shipname) VALUES (62, '0115', '011', '千分表', '船舶中心');
      INSERT INTO Tree (_id, ID, PID, NAME, shipname) VALUES (63, '0116', '011', '绝缘电阻表', '船舶中心');
      INSERT INTO Tree (_id, ID, PID, NAME, shipname) VALUES (64, '0117', '011', '可燃气体检测报警器', '船舶中心');
      INSERT INTO Tree (_id, ID, PID, NAME, shipname) VALUES (65, '0118', '011', '多气体报警器', '船舶中心');
      INSERT INTO Tree (_id, ID, PID, NAME, shipname) VALUES (66, '0121', '012', '耐震压力表', '船舶中心');
      INSERT INTO Tree (_id, ID, PID, NAME, shipname) VALUES (67, '0131', '013', '耐震压力表', '船舶中心');
      INSERT INTO Tree (_id, ID, PID, NAME, shipname) VALUES (68, '0132', '013', '压力表', '船舶中心');
     */
    // Tree(id: 11, treeid: "02", treepid: "1", name: "船舶中心", shipname: "船舶中心"),
    // Tree(id: 12, treeid: "021", treepid: "02", name: "技术保障站", shipname: "船舶中心"),
    // Tree(id: 13, treeid: "022", treepid: "02", name: "ACM-3LP喷砂机", shipname: "船舶中心"),
    // Tree(id: 14, treeid: "023", treepid: "02", name: "储气罐", shipname: "船舶中心"),
    // Tree(id: 15, treeid: "0101", treepid: "021", name: "千分尺", shipname: "船舶中心"),
    // Tree(id: 16, treeid: "0102", treepid: "021", name: "卡尺", shipname: "船舶中心"),
    // Tree(id: 17, treeid: "0103", treepid: "021", name: "数显卡尺", shipname: "船舶中心"),
    // Tree(id: 18, treeid: "0104", treepid: "021", name: "百分表", shipname: "船舶中心"),
    // Tree(id: 19, treeid: "0105", treepid: "021", name: "千分表", shipname: "船舶中心"),
    // Tree(id: 20, treeid: "0106", treepid: "021", name: "绝缘电阻表", shipname: "船舶中心"),
    // Tree(id: 21, treeid: "0107", treepid: "021", name: "可燃气体检测报警器", shipname: "船舶中心"),
    // Tree(id: 22, treeid: "0108", treepid: "021", name: "多气体报警器", shipname: "船舶中心"),
    // Tree(id: 23, treeid: "0109", treepid: "021", name: "耐震压力表", shipname: "船舶中心"),
    // Tree(id: 24, treeid: "0110", treepid: "021", name: "耐震压力表", shipname: "船舶中心"),
    // Tree(id: 25, treeid: "0111", treepid: "021", name: "压力表", shipname: "船舶中心"),
  ];
}
