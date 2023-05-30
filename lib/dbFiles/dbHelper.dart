import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:wiki_projet/Models/CommentaryModel.dart';

import 'package:wiki_projet/Models/UserModel.dart';

class DbHelper {
  static const int _version = 1;
  static const String _dbName = "Wiki5.db";

  static Future<Database> _getDb() async {
    return openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE User(id INTEGER PRIMARY KEY, mail TEXT NOT NULL, password TEXT NOT NULL);",
        );

        await db.execute(
          "CREATE TABLE Commentary(id INTEGER PRIMARY KEY, content TEXT NOT NULL);",
        );

        // Ajoutez autant de tables que nécessaire en utilisant des appels à execute

      },
      version: _version + 1,
    );
  }

  static Future<int> addUser(User user) async {
    final db = await _getDb();
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
    if(maps.isEmpty) {
      print("nuls");
      return null;
    }
    return List.generate(maps.length, (index) => User.fromJson(maps[index]));
  }

  static Future<int> addCommentary(Commentary commentary) async {
    final db = await DbHelper._getDb();
    return await db.insert("Commentary", commentary.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateCommentary(Commentary commentary) async {
    final db = await DbHelper._getDb();
    return await db.update("Commentary", commentary.toJson(),
        where: 'id = ?', whereArgs: [commentary.id]);
  }

  static Future<int> deleteCommentary(Commentary commentary) async {
    final db = await DbHelper._getDb();
    return await db.delete("Commentary", where: 'id = ?', whereArgs: [commentary.id]);
  }

  static Future<List<Commentary>?> getAllCommentary() async {
    final db = await DbHelper._getDb();
    final List<Map<String, dynamic>> maps = await db.query("Commentary");
    if (maps.isEmpty) {
      return null;
    }
    return List.generate(maps.length, (index) => Commentary.fromJson(maps[index]));
  }


  static Future<User?> getUserByEmail(String email, String password) async {
    final db = await _getDb();
    final List<Map<String, dynamic>> maps = await db.query(
      "User",
      where: 'mail = ? AND password = ?',
      whereArgs: [email, password],
      limit: 1,
    );
    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    }
    return null;
  }






}
