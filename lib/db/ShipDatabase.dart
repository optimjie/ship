import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ship/model/Tree.dart';
import 'package:ship/model/User.dart';
import 'package:ship/model/Ledger.dart';
import 'package:ship/model/Device.dart';

class ShipDatabase {
  static final ShipDatabase instance = ShipDatabase._init();

  static Database? _database;

  ShipDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('ship.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    // 创建设备表
    await db.execute('''
      CREATE TABLE '$tableDevice' ( 
        ${DevicesFields.id} $idType, 
        ${DevicesFields.myid} $integerType, 
        ${DevicesFields.status} $textType, 
        ${DevicesFields.name} $textType, 
        ${DevicesFields.manufacturer} $textType, 
        ${DevicesFields.location} $textType, 
        ${DevicesFields.category} $textType, 
        ${DevicesFields.model} $textType, 
        ${DevicesFields.range} $textType, 
        ${DevicesFields.accuracy} $textType, 
        ${DevicesFields.serialNumber} $textType, 
        ${DevicesFields.principal} $textType, 
        ${DevicesFields.activationDate} $textType, 
        ${DevicesFields.inspectionDate} $textType, 
        ${DevicesFields.verificationCategory} $textType, 
        ${DevicesFields.certificateNumber} $textType, 
        ${DevicesFields.verificationDate} $textType, 
        ${DevicesFields.verificationPeriod} $textType, 
        ${DevicesFields.effectiveDate} $textType, 
        ${DevicesFields.verifier} $textType, 
        ${DevicesFields.shipId} $textType, 
        ${DevicesFields.glbq} $textType, 
        ${DevicesFields.jybq} $textType, 
        ${DevicesFields.jybg} $textType, 
        ${DevicesFields.abc} $textType, 
        ${DevicesFields.menuId} $textType
      )
    ''');

    // 创建tree表
    await db.execute('''
      CREATE TABLE $tableTree ( 
        ${TreeFields.id} $idType, 
        ${TreeFields.treeid} $textType,
        ${TreeFields.treepid} $textType,
        ${TreeFields.name} $textType,
        ${TreeFields.shipname} $textType
      )
    ''');

    // 创建user表
    await db.execute('''
      CREATE TABLE $tableUser ( 
        ${UserFields.id} $idType, 
        ${UserFields.name} $textType,
        ${UserFields.password} $textType,
        ${UserFields.level} $textType
      )
    ''');

    // 创建台账表

    await db.execute('''
      CREATE TABLE $tableLedger ( 
        ${LedgerFields.id} $idType, 
        ${LedgerFields.name} $textType,
        ${LedgerFields.location} $textType,
        ${LedgerFields.category} $textType
      )
    ''');

    //创建设备表
    await db.execute('''
      CREATE TABLE $tableDevice ( 
        ${DevicesFields.id} $idType, 
        ${DevicesFields.status} $textType,
        ${DevicesFields.name} $textType,
        ${DevicesFields.manufacturer} $textType
        ${DevicesFields.location} $textType
        ${DevicesFields.category} $textType
        ${DevicesFields.model} $textType
        ${DevicesFields.range} $textType
        ${DevicesFields.accuracy} $textType
        ${DevicesFields.serialNumber} $textType
        ${DevicesFields.principal} $textType
        ${DevicesFields.activationDate} $textType
        ${DevicesFields.inspectionDate} $textType
        ${DevicesFields.verificationCategory} $textType
        ${DevicesFields.certificateNumber} $textType
        ${DevicesFields.verificationDate} $textType
        ${DevicesFields.verificationPeriod} $textType
        ${DevicesFields.effectiveDate} $textType
        ${DevicesFields.verifier} $textType
        ${DevicesFields.shipId} $textType
        ${DevicesFields.glbq} $textType
        ${DevicesFields.jybq} $textType
        ${DevicesFields.abc} $textType
        ${DevicesFields.menuId} $textType
      )
    ''');

  }

  // Device =========================

  Future<Device> deviceInsert(Device device) async {
    final db = await instance.database;
    final id = await db.insert(tableDevice, device.toJson());
    return device.copy(id: id);
  }

  Future<List<Device>> deviceQueryAll() async {
    final db = await instance.database;
    final result = await db.query(tableDevice);
    return result.map((json) => Device.fromJson(json)).toList();
  }

  Future<List<Device>> deviceQueryBymenuId(String menuId) async {
    final db = await instance.database;
    final result = await db.query(
      tableDevice,
      columns: DevicesFields.values,
      where: '${DevicesFields.menuId} = ?',
      whereArgs: [menuId],
    );
    return result.map((json) => Device.fromJson(json)).toList();
    /*if (result.isNotEmpty) {
      return result.map((json) => Devices.fromJson(json)).toList();
    } else {
      throw Exception('ID $menuId not found');
    }*/
  }

  // Ledger =========================

  Future<Ledger> ledgerInsert(Ledger ledger) async {
    final db = await instance.database;
    final id = await db.insert(tableLedger, ledger.toJson());
    return ledger.copy(id: id);
  }

  Future<List<Ledger>> ledegerQueryAll() async {
    final db = await instance.database;
    final result = await db.query(tableLedger);
    return result.map((json) => Ledger.fromJson(json)).toList();
  }



  // User =========================
  Future<User> userInsert(User user) async {
    final db = await instance.database;
    final id = await db.insert(tableUser, user.toJson());
    return user.copy(id: id);
  }

  Future<List<User>> userQueryAll() async {
    final db = await instance.database;
    final result = await db.query(tableUser);
    return result.map((json) => User.fromJson(json)).toList();
  }

  Future<int> userDelete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableUser,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<User> userQueryById(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableUser,
      columns: UserFields.values,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  // Tree =========================

  Future<List<Tree>> treeGetCnt(String treeid) async {
    final db = await instance.database;
    final result = await db.query(
      tableTree,
      columns: TreeFields.values,
      where: '${TreeFields.treeid} like ?',
      whereArgs: [treeid],
    );
    // print("In treeGetCnt --- getCnt:" + maps.length.toString());
    return result.map((json) => Tree.fromJson(json)).toList();
  }

  Future<Tree> treeInsert(Tree tree) async {
    final db = await instance.database;
    final id = await db.insert(tableTree, tree.toJson());
    return tree.copy(id: id);
  }

  Future<Tree> treeQueryById(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableTree,
      columns: TreeFields.values,
      where: '${TreeFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Tree.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Tree>> treeQueryAll() async {
    final db = await instance.database;
    final result = await db.query(tableTree);
    return result.map((json) => Tree.fromJson(json)).toList();
  }

  Future<int> treeUpdate(Tree note) async {
    final db = await instance.database;

    return db.update(
      tableTree,
      note.toJson(),
      where: '${TreeFields.id} = ?',
      whereArgs: [note.id],
    );
  }


  Future<int> treeDelete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableTree,
      where: '${TreeFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<int> treeDeleteByTreeId(String treeid) async {
    final db = await instance.database;

    return await db.delete(
      tableTree,
      where: '${TreeFields.treeid} = ?',
      whereArgs: [treeid],
    );
  }

  Future<Tree> treeQueryByTreeId(String treeid) async {
    final db = await instance.database;

    final maps = await db.query(
      tableTree,
      columns: TreeFields.values,
      where: '${TreeFields.treeid} = ?',
      whereArgs: [treeid],
    );

    if (maps.isNotEmpty) {
      return Tree.fromJson(maps.first);
    } else {
      throw Exception('ID $treeid not found');
    }
  }


  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
