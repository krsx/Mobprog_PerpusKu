import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'model.dart';

class RangkumanDatabase {
  static final RangkumanDatabase instance = RangkumanDatabase._init();
  static Database? _database;
  static const _databaseVersion = 1;

  RangkumanDatabase._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase('rangkuman.db');
    return _database!;
  }

  Future<Database> _initDatabase(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    print("db location: ${path}");
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreateDB,
    );
  }

  Future _onCreateDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final boolType = 'BOOLEAN NOT NULL';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE ${Rangkuman.tblRangkuman} (
      ${Rangkuman.colId} $idType,
      ${Rangkuman.colFavorit} $boolType,
      ${Rangkuman.colJudul} $textType, 
      ${Rangkuman.colPenulis} $textType, 
      ${Rangkuman.colDeskripsi} $textType,
      ${Rangkuman.colMediaPath} $textType,
      ${Rangkuman.colHorror} $boolType,
      ${Rangkuman.colPetualangan} $boolType,
      ${Rangkuman.colPengembanganDiri} $boolType,
      ${Rangkuman.colKomedi} $boolType,
      ${Rangkuman.colRomansa} $boolType,
      ${Rangkuman.colFiksi} $boolType,
      ${Rangkuman.colThriller} $boolType,
      ${Rangkuman.colMisteri} $boolType
    )
  ''');
  }

  Future<Rangkuman> createRangkuman(Rangkuman rangkuman) async {
    final db = await instance.database;
    final id = await db.insert(Rangkuman.tblRangkuman, rangkuman.toJson());
    return rangkuman.copy(id: id);
  }

  Future<Rangkuman> readRangkuman(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      Rangkuman.tblRangkuman,
      columns: Rangkuman.values,
      where: '${Rangkuman.colId} =?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Rangkuman.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Rangkuman>> readAllRangkuman() async {
    final db = await instance.database;
    final result = await db.query(Rangkuman.tblRangkuman);
    return result.map((json) => Rangkuman.fromJson(json)).toList();
  }

  Future<int> updateRangkuman(Rangkuman rangkuman) async {
    final db = await instance.database;
    return db.update(Rangkuman.tblRangkuman, rangkuman.toJson(),
        where: '${Rangkuman.colId}=?', whereArgs: [rangkuman.id]);
  }

  Future<int> deleteRangkuman(int id) async {
    final db = await instance.database;
    return db.delete(Rangkuman.tblRangkuman,
        where: '${Rangkuman.colId}=?', whereArgs: [id]);
  }

  Future closeDatabase() async {
    final db = await instance.database;
    db.close();
  }
}
