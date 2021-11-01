import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ship/model/Tree.dart';
import 'package:ship/model/User.dart';

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

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
