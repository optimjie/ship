import 'package:dynamic_treeview/dynamic_treeview.dart';

final String tableDevice = 'device';


class DevicesFields {

  static final List<String> values = [
    id, myid, status ,name ,manufacturer,location ,
    category ,model ,range ,accuracy ,serialNumber, 
    principal ,activationDate,
    inspectionDate ,verificationCategory, certificateNumber ,
    verificationDate ,verificationPeriod, effectiveDate ,verifier, 
    shipId ,glbq, jybq, jybg, abc ,menuId
  ];

  static final String id = '_id';
  static final String myid = 'myid';
  static final String status = 'status';  // 状态
  static final String name = 'name';  // 名称
  static final String manufacturer = 'manufacturer';  // 生产厂家
  static final String location = 'location';  // 安装位置
  static final String category = 'category';
  static final String model = 'model';
  static final String range = 'range';
  static final String accuracy = 'accuracy';
  static final String serialNumber = 'serialNumber';
  static final String principal = 'principal';  // 位置负责人
  static final String activationDate = 'activationDate';
  static final String inspectionDate = 'inspectionDate';
  static final String verificationCategory = 'verificationCategory';  // 检定类别
  static final String certificateNumber = 'certificateNumber';
  static final String verificationDate = 'verificationDate';
  static final String verificationPeriod = 'verificationPeriod';
  static final String effectiveDate = 'effectiveDate';  // 有效日期
  static final String verifier = 'verifier';
  static final String shipId = 'shipId';
  static final String glbq = 'glbq';  // 管理标签
  static final String jybq = 'jybq';  // 检验标签
  static final String jybg = 'jybg';
  static final String abc = 'abc';
  static final String menuId = 'menuId';
}

class Device {
  final int? id;
  final int myid;
  final String status;
  final String name;
  final String manufacturer;
  final String location;
  final String category;
  final String model;
  final String range;
  final String accuracy;
  final String serialNumber;
  final String principal;
  final String activationDate;
  final String inspectionDate;
  final String verificationCategory;
  final String certificateNumber;
  final String verificationDate;
  final String verificationPeriod;
  final String effectiveDate;
  final String verifier;
  final String shipId;
  final String glbq;
  final String jybq;
  final String jybg;
  final String abc;
  final String menuId;

  Device({
    this.id,
    required this.myid,
    required this.status,
    required this.name,
    required this.manufacturer,
    required this.location,
    required this.category,
    required this.model,
    required this.range,
    required this.accuracy,
    required this.serialNumber,
    required this.principal,
    required this.activationDate,
    required this.inspectionDate,
    required this.verificationCategory,
    required this.certificateNumber,
    required this.verificationDate,
    required this.verificationPeriod,
    required this.effectiveDate,
    required this.verifier,
    required this.shipId,
    required this.glbq,
    required this.jybq,
    required this.jybg,
    required this.abc,
    required this.menuId
  });


Device copy({
    int? id,
    int? myid,
    String? status,
    String? name,
    String? manufacturer,
    String? location,
    String? category,
    String? model,
    String? range,
    String? accuracy,
    String? serialNumber,
    String? principal,
    String? activationDate,
    String? inspectionDate,
    String? verificationCategory,
    String? certificateNumber,
    String? verificationDate,
    String? verificationPeriod,
    String? effectiveDate,
    String? verifier,
    String? shipId,
    String? glbq,
    String? jybq,
    String? jybg,
    String? abc,
    String? menuId,
  }) =>
    Device(
        id: id ?? this.id,
        myid: myid ?? this.myid,
        status: status ?? this.status,
        name: name ?? this.name,
        manufacturer: manufacturer ?? this.manufacturer,
        location: location ?? this.location,
        category: category ?? this.category,
        model: model ?? this.model,
        range: range ?? this.range,
        accuracy: accuracy ?? this.accuracy,
        serialNumber: serialNumber ?? this.serialNumber,
        principal: principal ?? this.principal,
        activationDate: activationDate ?? this.activationDate,
        inspectionDate: inspectionDate ?? this.inspectionDate,
        verificationCategory: verificationCategory ?? this.verificationCategory,
        certificateNumber: certificateNumber ?? this.certificateNumber,
        verificationDate: verificationDate ?? this.verificationDate,
        verificationPeriod: verificationPeriod ?? this.verificationPeriod,
        effectiveDate: effectiveDate ?? this.effectiveDate,
        verifier: verifier ?? this.verifier,
        shipId: shipId ?? this.shipId,
        glbq: glbq ?? this.glbq,
        jybq: jybq ?? this.jybq,
        jybg: jybg ?? this.jybg,
        abc: abc ?? this.abc,
        menuId: jybq ?? this.menuId
      );
  static Device fromJson(Map<String, Object?> json) => Device(
    id: json[DevicesFields.id] as int?,
    myid: json[DevicesFields.myid] as int,
    status: json[DevicesFields.status] as String,
    name: json[DevicesFields.name] as String,
    manufacturer: json[DevicesFields.manufacturer] as String,
    location: json[DevicesFields.location] as String,
    category: json[DevicesFields.category] as String,
    model: json[DevicesFields.model] as String,
    range: json[DevicesFields.range] as String,
    accuracy: json[DevicesFields.accuracy] as String,
    serialNumber: json[DevicesFields.serialNumber] as String,
    principal: json[DevicesFields.principal] as String,
    activationDate: json[DevicesFields.activationDate] as String,
    inspectionDate: json[DevicesFields.inspectionDate] as String,
    verificationCategory: json[DevicesFields.verificationCategory] as String,
    certificateNumber: json[DevicesFields.certificateNumber] as String,
    verificationDate: json[DevicesFields.verificationDate] as String,
    verificationPeriod: json[DevicesFields.verificationPeriod] as String,
    effectiveDate: json[DevicesFields.effectiveDate] as String,
    verifier: json[DevicesFields.verifier] as String,
    shipId: json[DevicesFields.shipId] as String,
    glbq: json[DevicesFields.glbq] as String,
    jybq: json[DevicesFields.jybq] as String,
    jybg: json[DevicesFields.jybg] as String,
    abc: json[DevicesFields.abc] as String,
    menuId: json[DevicesFields.menuId] as String,
  );
  Map<String, Object?> toJson() => {
    DevicesFields.id: id,
    DevicesFields.myid: myid,
    DevicesFields.status: status,
    DevicesFields.name: name,
    DevicesFields.manufacturer: manufacturer,
    DevicesFields.location: location,
    DevicesFields.category: category,
    DevicesFields.model: model,
    DevicesFields.range: range,
    DevicesFields.accuracy: accuracy,
    DevicesFields.serialNumber: serialNumber,
    DevicesFields.principal: principal,
    DevicesFields.activationDate: activationDate,
    DevicesFields.inspectionDate: inspectionDate,
    DevicesFields.verificationCategory: verificationCategory,
    DevicesFields.certificateNumber: certificateNumber,
    DevicesFields.verificationDate: verificationDate,
    DevicesFields.verificationPeriod: verificationPeriod,
    DevicesFields.effectiveDate: effectiveDate,
    DevicesFields.verifier: verifier,
    DevicesFields.shipId: shipId,
    DevicesFields.glbq: glbq,
    DevicesFields.jybq: jybq,
    DevicesFields.jybg: jybg,
    DevicesFields.abc: abc,
    DevicesFields.menuId: menuId,
  };
}

// 测试数据
List<Device> createTmpDeviceData() {
  return [
    Device(myid: 78, status: '正常', name: '点温枪', manufacturer: '', location: '集控室', category: '温度', model: '', range: '(-40~480)C°', accuracy: '', serialNumber: 'SL505-W001', principal: '大管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 79, status: '正常', name: '耐震压力真空表', manufacturer: '无锡凯丰压力表有限公司', location: '应急消防泵', category: '压力', model: 'YN-100', range: '（-0.1~0.15）Mpa', accuracy: '1.6', serialNumber: '16060974', principal: '三管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310001'),
    Device(myid: 80, status: '正常', name: '耐震压力真空表', manufacturer: '无锡凯丰压力表有限公司', location: '应急消防泵', category: '压力', model: 'YN-100', range: '（0~1）Mpa', accuracy: '1.6', serialNumber: '13.11.17872', principal: '三管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310001'),
    Device(myid: 81, status: '正常', name: '电表', manufacturer: '', location: '1#轴带发电机控制屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D007', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310001'),
    Device(myid: 82, status: '正常', name: '电表', manufacturer: '', location: '1#轴带发电机控制屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D008', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310001'),
    Device(myid: 83, status: '正常', name: '电表', manufacturer: '', location: '1#轴带发电机控制屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D009', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310001'),
    Device(myid: 84, status: '正常', name: '电表', manufacturer: '', location: '1#轴带发电机控制屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D010', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310000'),
    Device(myid: 85, status: '正常', name: '电表', manufacturer: '', location: '1#轴带发电机控制屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D011', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310000'),
    Device(myid: 86, status: '正常', name: '电表', manufacturer: '', location: '1#柴油发电机控制屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D012', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310000'),
    Device(myid: 87, status: '正常', name: '电表', manufacturer: '', location: '1#柴油发电机控制屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D013', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310000'),
    Device(myid: 88, status: '正常', name: '电表', manufacturer: '', location: '1#柴油发电机控制屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D014', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 89, status: '正常', name: '电表', manufacturer: '', location: '1#柴油发电机控制屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D015', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 90, status: '正常', name: '电表', manufacturer: '', location: '1#柴油发电机控制屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D016', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 91, status: '正常', name: '电表', manufacturer: '', location: '幷车控制屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D017', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 92, status: '正常', name: '电表', manufacturer: '', location: '幷车控制屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D018', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 93, status: '正常', name: '电表', manufacturer: '', location: '2#柴油发电机控制屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D019', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 94, status: '正常', name: '电表', manufacturer: '', location: '2#柴油发电机控制屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D020', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 95, status: '正常', name: '电表', manufacturer: '', location: '2#柴油发电机控制屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D021', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 96, status: '正常', name: '电表', manufacturer: '', location: '2#柴油发电机控制屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D022', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 97, status: '正常', name: '电表', manufacturer: '', location: '2#柴油发电机控制屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D023', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 98, status: '正常', name: '电表', manufacturer: '', location: '2#轴带发电机控制屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D024', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 99, status: '正常', name: '电表', manufacturer: '', location: '2#轴带发电机控制屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D025', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 100, status: '正常', name: '电表', manufacturer: '', location: '2#轴带发电机控制屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D026', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 101, status: '正常', name: '电表', manufacturer: '', location: '2#轴带发电机控制屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D027', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 102, status: '正常', name: '电表', manufacturer: '', location: '2#轴带发电机控制屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D028', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 103, status: '正常', name: '电表', manufacturer: '', location: '艉侧推控制屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D029', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 104, status: '正常', name: '电表', manufacturer: '', location: '艉侧推控制屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D030', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 105, status: '正常', name: '电表', manufacturer: '', location: '艉侧推控制屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D031', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 106, status: '正常', name: '电表', manufacturer: '', location: '2#AC400V负载屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D032', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 107, status: '正常', name: '电表', manufacturer: '', location: '2#AC400V负载屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D033', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 108, status: '正常', name: '电表', manufacturer: '', location: 'AC230V负载屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D034', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 109, status: '正常', name: '电表', manufacturer: '', location: 'AC230V负载屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D035', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 110, status: '正常', name: '电表', manufacturer: '', location: 'AC230V负载屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D036', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 111, status: '正常', name: '压力表', manufacturer: 'PARKER', location: '艏侧推', category: '压力', model: 'Y-20', range: '1.2bar=17psi', accuracy: '', serialNumber: 'SL505-YL001', principal: '大管', activationDate: '强', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 112, status: '正常', name: '耐震压力表', manufacturer: '', location: '艏侧推', category: '压力', model: 'YN-60', range: '（0~100）Mpa', accuracy: '', serialNumber: 'SL505-YL002', principal: '大管', activationDate: '强', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 113, status: '正常', name: '温度表', manufacturer: '江苏远望', location: '蒸汽锅炉', category: '温度', model: 'Y-100', range: '(0~400)C°', accuracy: '1.5', serialNumber: '160763', principal: '三管', activationDate: '强', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 114, status: '正常', name: '耐震压力表', manufacturer: 'PRESSVREGAGGE', location: '蒸汽锅炉', category: '压力', model: 'YN-100', range: '（0~1.6）Mpa', accuracy: '1.6', serialNumber: '14243191', principal: '三管', activationDate: '强', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 115, status: '正常', name: '温度表', manufacturer: '江苏远望', location: '热水锅炉', category: '温度', model: 'Y-100', range: '(0~400)C°', accuracy: '1.6', serialNumber: '161816', principal: '三管', activationDate: '强', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 116, status: '正常', name: '耐震压力表', manufacturer: 'PRESSVREGAGGE', location: '热水锅炉', category: '压力', model: 'YN-100', range: '（0~1）Mpa', accuracy: '1.6', serialNumber: '142314211', principal: '三管', activationDate: '强', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 117, status: '正常', name: '耐震压力真空表', manufacturer: '无锡凯丰压力表有限公司', location: '消防总用泵', category: '压力', model: 'YN-100', range: '（-0.1~0.15）Mpa', accuracy: '1.6', serialNumber: '16061010', principal: '三管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 118, status: '正常', name: '耐震压力表', manufacturer: '无锡凯丰压力表有限公司', location: '消防总用泵', category: '压力', model: 'YN-100', range: '（0~1）Mpa', accuracy: '1.6', serialNumber: '13.11.17953', principal: '三管', activationDate: '', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 119, status: '正常', name: '耐震压力表', manufacturer: '上海长城仪表厂', location: '空气瓶1', category: '压力', model: 'YN-60', range: '（0~6）Mpa', accuracy: '1.6', serialNumber: '51036130', principal: '二管', activationDate: '强', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 120, status: '正常', name: '耐震压力表', manufacturer: '上海长城仪表厂', location: '空气瓶2', category: '压力', model: 'YN-60', range: '（0~6）Mpa', accuracy: '1.6', serialNumber: '51036268', principal: '二管', activationDate: '强', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310000'),
    Device(myid: 121, status: '正常', name: '船用压力表', manufacturer: '中国扬州腾飞仪器仪表有限公司', location: '控制气瓶', category: '压力', model: 'Y-100', range: '（0~4）Mpa', accuracy: '1.6', serialNumber: '13A9592', principal: '二管', activationDate: '强', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310000'),
    Device(myid: 122, status: '正常', name: '船用压力表', manufacturer: '中国扬州腾飞仪器仪表有限公司', location: '汽笛杂用空气瓶', category: '压力', model: 'Y-100', range: '（0~4）Mpa', accuracy: '1.6', serialNumber: '13A9533', principal: '二管', activationDate: '强', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 123, status: '正常', name: '压力表', manufacturer: '中国黎明液压有限公司', location: '艉绞盘液压泵站', category: '压力', model: 'Y-20', range: '（0~0.4）Mpa', accuracy: '1.6', serialNumber: 'SL505-YL022', principal: '三管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 124, status: '正常', name: '耐震压力表', manufacturer: 'PRESSVREGAGGE', location: '艉绞盘液压泵站', category: '压力', model: 'YN-60', range: '（0~400）Mpa', accuracy: '1.6', serialNumber: 'SL505-YL023', principal: '三管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 125, status: '正常', name: '耐震压力表', manufacturer: 'PRESSVREGAGGE', location: '艉绞盘液压泵站', category: '压力', model: 'YN-60', range: '（0~400）Mpa', accuracy: '1.6', serialNumber: 'SL505-YL024', principal: '三管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050310002'),
    Device(myid: 126, status: '正常', name: '温度计', manufacturer: '迅联', location: '艉绞盘液压泵站', category: '温度', model: '', range: '(-20~100)C°', accuracy: '', serialNumber: 'SL505-W016', principal: '三管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320000'),
    Device(myid: 127, status: '正常', name: '耐震压力表', manufacturer: 'PARKER', location: '右舵机', category: '压力', model: 'YN-60', range: '（0~3500）PSI', accuracy: '1.6', serialNumber: 'SL505-YL025', principal: '大管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320000'),
    Device(myid: 128, status: '正常', name: '耐震压力表', manufacturer: 'PARKER', location: '右舵机', category: '压力', model: 'YN-60', range: '（0~3500）Mpa', accuracy: '1.6', serialNumber: 'SL505-YL026', principal: '大管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320001'),
    Device(myid: 129, status: '正常', name: '耐震压力表', manufacturer: 'Sinkow', location: '舵机舱水密门1号', category: '压力', model: 'YN-60', range: '（0~2300）Mpa', accuracy: '2.5', serialNumber: 'SL505-YL027', principal: '大管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320001'),
    Device(myid: 130, status: '正常', name: '耐震压力表', manufacturer: 'PARKER', location: '左舵机', category: '压力', model: 'YN-60', range: '（0~3500）Mpa', accuracy: '1.6', serialNumber: 'SL505-YL028', principal: '大管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320002'),
    Device(myid: 131, status: '正常', name: '耐震压力表', manufacturer: 'PARKER', location: '左舵机', category: '压力', model: 'YN-60', range: '（0~3500）Mpa', accuracy: '1.6', serialNumber: 'SL505-YL029', principal: '大管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320002'),
    Device(myid: 132, status: '正常', name: '耐震压力表', manufacturer: 'Sinkow', location: '舵机舱水密门1号', category: '压力', model: 'YN-60', range: '（0~2300）Mpa', accuracy: '2.5', serialNumber: 'SL505-YL030', principal: '大管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320016'),
    Device(myid: 133, status: '正常', name: '耐震压力表', manufacturer: 'Sinkow', location: '舵机舱水密门3号', category: '压力', model: 'YN-60', range: '（0~2300）Mpa', accuracy: '2.5', serialNumber: 'SL505-YL031', principal: '大管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320016'),
    Device(myid: 134, status: '正常', name: '耐震压力表', manufacturer: 'Sinkow', location: '舵机舱水密门3号', category: '压力', model: 'YN-60', range: '（0~2300）Mpa', accuracy: '2.5', serialNumber: 'SL505-YL032', principal: '大管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320016'),
    Device(myid: 135, status: '正常', name: '耐震压力表', manufacturer: 'Sinkow', location: '舵机舱水密门2号', category: '压力', model: 'YN-60', range: '（0~2300）Mpa', accuracy: '2.5', serialNumber: 'SL505-YL033', principal: '大管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320016'),
    Device(myid: 136, status: '正常', name: '耐震压力表', manufacturer: 'Sinkow', location: '舵机舱水密门2号', category: '压力', model: 'YN-60', range: '（0~2300）Mpa', accuracy: '2.5', serialNumber: 'SL505-YL034', principal: '大管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320016'),
    Device(myid: 137, status: '正常', name: '耐震压力表', manufacturer: 'Sinkow', location: '舵机舱水密门4号', category: '压力', model: 'YN-60', range: '（0~2300）Mpa', accuracy: '2.5', serialNumber: 'SL505-YL035', principal: '大管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320016'),
    Device(myid: 138, status: '正常', name: '耐震压力表', manufacturer: 'Sinkow', location: '舵机舱水密门4号', category: '压力', model: 'YN-60', range: '（0~2300）Mpa', accuracy: '2.5', serialNumber: 'SL505-YL036', principal: '大管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320016'),
    Device(myid: 139, status: '正常', name: '耐震压力表', manufacturer: 'Sinkow', location: '舵机舱水密门5号', category: '压力', model: 'YN-60', range: '（0~2300）Mpa', accuracy: '2.5', serialNumber: 'SL505-YL038', principal: '大管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320016'),
    Device(myid: 140, status: '正常', name: '耐震压力表', manufacturer: 'Sinkow', location: '舵机舱水密门5号', category: '压力', model: 'YN-60', range: '（0~2300）Mpa', accuracy: '2.5', serialNumber: 'SL505-YL039', principal: '大管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320016'),
    Device(myid: 141, status: '正常', name: '温度表', manufacturer: '中国雷尔仪表有限公司', location: '热水锅炉', category: '温度', model: 'Y-100', range: '(0~150)C°', accuracy: '', serialNumber: 'Y0N06128', principal: '三管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320016'),
    Device(myid: 142, status: '正常', name: '耐震压力表', manufacturer: 'PRESSVREGAGGE', location: '锚机液压泵站', category: '压力', model: 'YN-60', range: '（0~400）Mpa', accuracy: '1.6', serialNumber: 'SL505-YL040', principal: '三管', activationDate: '强', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320016'),
    Device(myid: 143, status: '正常', name: '耐震压力表', manufacturer: 'PRESSVREGAGGE', location: '锚机液压泵站', category: '压力', model: 'YN-60', range: '（0~400）Mpa', accuracy: '1.6', serialNumber: 'SL505-YL041', principal: '三管', activationDate: '强', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320016'),
    Device(myid: 144, status: '正常', name: '压力表', manufacturer: '中国黎明液压有限公司', location: '锚机液压泵站', category: '压力', model: 'Y-20', range: '（0~0.4）Mpa', accuracy: '1.6', serialNumber: 'SL505-YL042', principal: '三管', activationDate: '强', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320016'),
    Device(myid: 145, status: '正常', name: '耐震压力表', manufacturer: 'HAIDVENYEYP', location: '吊艇机', category: '压力', model: 'YN-60', range: '（0~40）Mpa', accuracy: '1.6', serialNumber: 'SL505-YL043', principal: '三管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320005'),
    Device(myid: 146, status: '正常', name: '耐震压力表', manufacturer: 'HAIDVENYEYP', location: '吊艇机', category: '压力', model: 'YN-60', range: '（0~40）Mpa', accuracy: '1.6', serialNumber: 'SL505-YL044', principal: '三管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320005'),
    Device(myid: 147, status: '正常', name: '电表', manufacturer: '', location: '应急发电机控制屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D073', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320016'),
    Device(myid: 148, status: '正常', name: '电表', manufacturer: '', location: '应急配电缆应急发电机控制屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D074', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320016'),
    Device(myid: 149, status: '正常', name: '电表', manufacturer: '', location: '应急配电缆应急发电机控制屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D075', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320014'),
    Device(myid: 150, status: '正常', name: '电表', manufacturer: '', location: '应急配电缆应急发电机控制屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D076', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320013'),
    Device(myid: 151, status: '正常', name: '电表', manufacturer: '', location: '应急配电缆应急发电机控制屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D077', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320015'),
    Device(myid: 152, status: '正常', name: '电表', manufacturer: '', location: '应急配电缆应急发电机负载屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D078', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320015'),
    Device(myid: 153, status: '正常', name: '电表', manufacturer: '', location: '应急配电缆应急发电机负载屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D079', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320015'),
    Device(myid: 154, status: '正常', name: '电表', manufacturer: '', location: '应急配电缆应急发电机负载屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D080', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320015'),
    Device(myid: 155, status: '正常', name: '电表', manufacturer: '', location: '应急配电缆应急发电机负载屏', category: '电表', model: '', range: '', accuracy: '', serialNumber: 'SL505-D081', principal: '二管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '12', effectiveDate: '2022-07-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320015'),
    Device(myid: 156, status: '正常', name: '耐震压力表', manufacturer: 'PRESSVREGAGGE', location: '液压泵站', category: '压力', model: 'YN-60', range: '（0~400）Mpa', accuracy: '1.6', serialNumber: 'SL505-YL045', principal: '三管', activationDate: '强', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320015'),
    Device(myid: 157, status: '正常', name: '耐震压力表', manufacturer: 'PRESSVREGAGGE', location: '液压泵站', category: '压力', model: 'YN-60', range: '（0~400）Mpa', accuracy: '1.6', serialNumber: 'SL505-YL046', principal: '三管', activationDate: '强', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320015'),
    Device(myid: 158, status: '正常', name: '压力表', manufacturer: '中国黎明液压有限公司', location: '液压泵站', category: '压力', model: 'Y-20', range: '（0~0.4）Mpa', accuracy: '1.6', serialNumber: 'SL505-YL047', principal: '三管', activationDate: '强', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320015'),
    Device(myid: 159, status: '正常', name: '耐震压力表', manufacturer: 'PARKER', location: '克令吊液压泵', category: '压力', model: 'YN-60', range: '（0~400）Mpa', accuracy: '1.6', serialNumber: 'SL505-YL048', principal: '三管', activationDate: '强', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320015'),
    Device(myid: 160, status: '正常', name: '耐震压力表', manufacturer: 'PARKER', location: '克令吊液压泵', category: '压力', model: 'YN-60', range: '（0~400）Mpa', accuracy: '1.6', serialNumber: 'SL505-YL049', principal: '三管', activationDate: '强', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320015'),
    Device(myid: 161, status: '正常', name: '船用压力表', manufacturer: '中国扬州腾飞仪器仪表有限公司', location: '淡水压力柜', category: '压力', model: 'Y-100', range: '（0~1）Mpa', accuracy: '1.6', serialNumber: 'A1610173', principal: '三管', activationDate: '强', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320015'),
    Device(myid: 162, status: '正常', name: '耐震压力表', manufacturer: 'MASS', location: '锚机', category: '压力', model: 'YN-60', range: '（0~40）Mpa', accuracy: '1.6', serialNumber: 'SL505-YL050', principal: '三管', activationDate: '强', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320015'),
    Device(myid: 163, status: '正常', name: '耐震压力表', manufacturer: 'MASS', location: '锚机', category: '压力', model: 'YN-60', range: '（0~40）Mpa', accuracy: '1.6', serialNumber: 'SL505-YL051', principal: '三管', activationDate: '强', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320015'),
    Device(myid: 164, status: '正常', name: '耐震压力表', manufacturer: 'MASS', location: '移动绞车右', category: '压力', model: 'YN-60', range: '（0~40）Mpa', accuracy: '1.6', serialNumber: 'SL505-YL052', principal: '三管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320015'),
    Device(myid: 165, status: '正常', name: '耐震压力表', manufacturer: 'MASS', location: '移货绞车左', category: '压力', model: 'YN-60', range: '（0~40）Mpa', accuracy: '1.6', serialNumber: 'SL505-YL053', principal: '三管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320015'),
    Device(myid: 166, status: '正常', name: '压力表', manufacturer: '上海天川仪表厂', location: '二氧化碳间', category: '压力', model: 'Y-100', range: '（0~25）Mpa', accuracy: '1.6', serialNumber: '1G0403071', principal: '三副', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: ''),
    Device(myid: 167, status: '正常', name: '压力表', manufacturer: '上海天川仪表厂', location: '二氧化碳间', category: '压力', model: 'Y-100', range: '（0~25）Mpa', accuracy: '1.6', serialNumber: '1G0403078', principal: '三副', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: ''),
    Device(myid: 168, status: '正常', name: '耐震压力表', manufacturer: 'MASS', location: '右尾绞盘', category: '压力', model: 'YN-60', range: '（0~40）Mpa', accuracy: '1.6', serialNumber: 'SL505-YL054', principal: '三管', activationDate: '非', inspectionDate: '', verificationCategory: 'A类', certificateNumber: '', verificationDate: '2021-07-08', verificationPeriod: '6', effectiveDate: '2022-01-07', verifier: '东营亿茂检测', shipId: '505', glbq: '', jybq: '', jybg: '', abc: '', menuId: '050320004'),
  ];
}
