import 'package:radio_app/model/db_model.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;

abstract class DB {
  static Database _db;
  static int get _version => 1;
  Future<void> init() async {
    if (_db != null) {
      return;
    }
    try {
      var databasePath = await getDatabasesPath();
      String _path = p.join(databasePath, 'RadioApp.db');
      _db = await openDatabase(_path, version: 1, onCreate: onCreate);
    } catch (ex) {
      print(ex);
    }
  }

  Future<void> onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE radios (id  INTEGER PRIMARY KEY NOT NULL,radioName STRING,radioUrl STRING,radioDesc STRING,radioWebsite STRING ,radioPic string )');
    await db.execute(
        'CREATE TABLE radios_bookmarks(id INTEGER PRIMARY KEY NOT NULL ,inFavourite INTEGER');
  }

  static Future<List<Map<String, dynamic>>> query(String table) async =>
      _db.query(table);

  static Future<int> insert(String table, DBBaseModel model) async =>
      await _db.insert(table, model.toMap());
}
