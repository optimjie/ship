import 'package:dynamic_treeview/dynamic_treeview.dart';

final String tableLedger = 'ledger';

class DevicesFields {

  static final List<String> values = [
    id,status ,name ,manufacturer ,location ,category ,model ,range ,accuracy ,serialNumber, principal ,activationDate,
    inspectionDate ,verificationCategory, certificateNumber ,verificationDate ,verificationPeriod, effectiveDate ,verifier, shipId ,glbq, jybq ,abc ,menuId

  ];

  static final String id = '_id';
  static final String status = 'status';
  static final String name = 'name';
  static final String manufacturer = 'manufacturer';
  static final String location = 'location';
  static final String category = 'category';
  static final String model = 'model';
  static final String range = 'range';
  static final String accuracy = 'accuracy';
  static final String serialNumber = 'serialNumber';
  static final String principal = 'principal';
  static final String activationDate = 'activationDate';
  static final String inspectionDate = 'inspectionDate';
  static final String verificationCategory = 'verificationCategory';
  static final String certificateNumber = 'certificateNumber';
  static final String verificationDate = 'verificationDate';
  static final String verificationPeriod = 'verificationPeriod';
  static final String effectiveDate = 'effectiveDate';
  static final String verifier = 'verifier';
  static final String shipId = 'shipId';
  static final String glbq = 'glbq';
  static final String jybq = 'jybq';
  static final String abc = 'abc';
  static final String menuId = 'menuId';
}

class Devices {
final int? id;
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
  final String abc;
  final String menuId;

Devices({
this.id,
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
    required this.abc,
    required this.menuId
  });
Devices copy({
int? id,
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
    String? abc,
    String? menuId,
  }) =>
    Devices(
        id: id ?? this.id,
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
        abc: abc ?? this.abc,
        menuId: jybq ?? this.menuId
      );
  static Devices fromJson(Map<String, Object?> json) => Devices(
    id: json[DevicesFields.id] as int?,
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
    abc: json[DevicesFields.abc] as String,
    menuId: json[DevicesFields.menuId] as String,
  );
  Map<String, Object?> toJson() => {
    DevicesFields.id: id,
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
    DevicesFields.abc: abc,
    DevicesFields.menuId: menuId,
  };
}
