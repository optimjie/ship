import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ship/model/tree.dart';

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

    await db.execute('''
      CREATE TABLE $tableTree ( 
        ${TreeFields.id} $idType, 
        ${TreeFields.parentId} $integerType,
        ${TreeFields.name} $textType,
        ${TreeFields.extras} $textType
        )
      ''');
  }

  Future<Tree> create(Tree note) async {
    final db = await instance.database;
    final id = await db.insert(tableTree, note.toJson());
    return note.copy(id: id);
  }

  Future<Tree> readNote(int id) async {
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

  Future<List<Tree>> readAllNotes() async {
    final db = await instance.database;

    final result = await db.query(tableTree);

    return result.map((json) => Tree.fromJson(json)).toList();
  }

  Future<int> update(Tree note) async {
    final db = await instance.database;

    return db.update(
      tableTree,
      note.toJson(),
      where: '${TreeFields.id} = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete(int id) async {
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
