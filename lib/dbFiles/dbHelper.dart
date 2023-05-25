import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

import 'package:wiki_projet/Models/UserModel.dart';

class DbHelper {
  static const int _version = 1;
  static const String _dbName = "Wiki.db";

  static Future<Database> _getDb() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async => await db.execute(
            "CREATE TABLE User(id INTEGER PRIMARY KEY, mail TEXT NOT NULL, password TEXT NOT NULL);"),
        version: _version);
  }

  static Future<int> addUser(User user) async {
    final db = await _getDb();
    print('TableCreate');
    return await db.insert("User", user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateUser(User user) async {
    final db = await _getDb();
    return await db.update("User", user.toJson(),
        where: 'id = ?',
        whereArgs: [user.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteUser(User user) async {
    final db = await _getDb();
    return await db.delete("User",
        where: 'id = ?',
        whereArgs: [user.id],
        );
  }

  static Future<List<User>?> getAllUser() async {
    final db = await _getDb();
    final List<Map<String, dynamic>> maps = await db.query("User");
    print("YOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
    print(maps.length);
    if(maps.isEmpty) {
      print("nuls");
      return null;
    }
    return List.generate(maps.length, (index) => User.fromJson(maps[index]));
  }




}
