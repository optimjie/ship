final String tableTree = 'tree';

class TreeFields {
  // required this.id,
  // required this.parentId,
  // required this.name,
  // required this.extras

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

class Tree {
  final int? id;
  final String treeid;
  final String treepid;
  final String name;
  final String shipname;

  const Tree(
      {this.id,
      required this.treeid,
      required this.treepid,
      required this.name,
      required this.shipname});
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
          shipname: shipname ?? this.shipname);
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
  String getId() {
    return this.id.toString();
  }

  String getTreeid() {
    return this.treeid.toString();
  }

  String getTreepid() {
    return this.treepid.toString();
  }

  String getName() {
    return this.name;
  }

  String getShipname() {
    return this.shipname;
  }
}

// 测试数据
List<Tree> createTmpTreeModelData() {
  return [
    /**
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

    Tree(id: 1, treeid: "1", treepid: "-1", name: "root", shipname: "root"),
    Tree(id: 2, treeid: "01", treepid: "1", name: "胜利503船", shipname: "胜利503船"),
    Tree(id: 3, treeid: "011", treepid: "01", name: "机舱", shipname: "胜利503船"),
    Tree(id: 4, treeid: "012", treepid: "01", name: "甲板", shipname: "胜利503船"),
    Tree(
        id: 5,
        treeid: "0001",
        treepid: "011",
        name: "机舱气瓶本体",
        shipname: "胜利503船"),
    Tree(
        id: 6,
        treeid: "0002",
        treepid: "011",
        name: "机舱二号气瓶",
        shipname: "胜利503船"),
    Tree(
        id: 7,
        treeid: "0003",
        treepid: "011",
        name: "机舱杂用气瓶",
        shipname: "胜利503船"),
    Tree(
        id: 8,
        treeid: "0004",
        treepid: "011",
        name: "机舱一号气瓶",
        shipname: "胜利503船"),
    Tree(
        id: 9,
        treeid: "0005",
        treepid: "011",
        name: "机舱电汽热水柜",
        shipname: "胜利503船"),
    Tree(
        id: 10,
        treeid: "0006",
        treepid: "011",
        name: "机舱海水柜",
        shipname: "胜利503船"),
  ];
}
