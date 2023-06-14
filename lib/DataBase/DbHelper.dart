import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wiki_projet/Models/CommentaryModel.dart';
import 'package:wiki_projet/Models/ProjectModel.dart';
import 'package:wiki_projet/Models/UserModel.dart';
import 'package:wiki_projet/Models/InformationModel.dart';

class DbHelper {
  static const int _version = 1;
  static const String _dbName = "Wiki_22.db"; //Incrémenter le numéro de version "22" pour partir sur une bdd vide

  static Future<Database> _getDb() async {
    return openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE User(id INTEGER PRIMARY KEY, mail TEXT NOT NULL, password TEXT NOT NULL, picture TEXT);",
        );

        await db.execute(
          "CREATE TABLE Commentary(id INTEGER PRIMARY KEY, content TEXT NOT NULL, userId INTEGER NOT NULL, isSignaled INTEGER DEFAULT 0, date TEXT NOT NULL, userName TEXT NOT NULL, FOREIGN KEY (userId) REFERENCES User(id));",
        );

        await db.execute(
          "CREATE TABLE Project(id INTEGER PRIMARY KEY, title TEXT NOT NULL, description TEXT NOT NULL, resources TEXT NOT NULL, languages TEXT NOT NULL, time TEXT NOT NULL);",
        );

        await db.execute(
          "CREATE TABLE Informations(id INTEGER PRIMARY KEY, lienGithub TEXT NOT NULL, entreprise TEXT NOT NULL, langagePrefere TEXT NOT NULL, userId INTEGER NOT NULL, FOREIGN KEY (userId) REFERENCES User(id));",
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

  static Future<User?> getCurrentUser() async {
    final db = await _getDb();
    final List<Map<String, dynamic>> maps = await db.query(
      "User",
      limit: 1,
    );
    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    }
    return null;
  }

  static Future<String?> getUserPicture(int userId) async {
    final db = await _getDb();
    final List<Map<String, dynamic>> result = await db.query(
      "User",
      columns: ["picture"],
      where: "id = ?",
      whereArgs: [userId],
      limit: 1,
    );

    await db.close();

    if (result.isNotEmpty && result.first.containsKey("picture")) {
      return result.first["picture"] as String;
    }

    return null;
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

  static Future<int> addCommentary(Commentary commentary, int userId) async {
    final db = await _getDb();
    final Map<String, dynamic> data = {
      'content': commentary.content,
      'userId': userId,
      'isSignaled': 0,
      'date': commentary.date.toIso8601String(),
      'userName': commentary.userName,
    };
    return await db.insert("Commentary", data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateCommentary(Commentary commentary) async {
    final db = await _getDb();
    return await db.update("Commentary", commentary.toJson(),
        where: 'id = ?', whereArgs: [commentary.id]);
  }

  static Future<List<Commentary>?> getSignaledCommentaries(int userId) async {
    final db = await _getDb();
    final List<Map<String, dynamic>> maps = await db.query(
      "Commentary",
      where: 'userId = ? AND isSignaled = ?',
      whereArgs: [userId, 1],
    );
    if (maps.isEmpty) {
      return null;
    }
    return List.generate(maps.length, (index) => Commentary.fromJson(maps[index]));
  }

  static Future<int> deleteCommentary(Commentary commentary) async {
    final db = await _getDb();
    return await db.delete("Commentary", where: 'id = ?', whereArgs: [commentary.id]);
  }

  static Future<List<Commentary>?> getAllCommentary() async {
    final db = await _getDb();
    final List<Map<String, dynamic>> maps = await db.query("Commentary");
    if (maps.isEmpty) {
      return null;
    }
    return List.generate(maps.length, (index) => Commentary.fromJson(maps[index]));
  }

  static Future<bool> signalCommentary(int commentaryId) async {
    final db = await _getDb();
    final Map<String, dynamic> data = {
      'isSignaled': 1,
    };
    int rowsUpdated = await db.update("Commentary", data,
        where: 'id = ?', whereArgs: [commentaryId]);
    return rowsUpdated > 0;
  }

  static Future<User?> getUserVerifyMailPassword(String email, String password) async {
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

  static Future<int> addProject(Project project) async {
    final db = await _getDb();
    return await db.insert("Project", project.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteProject(Project project) async {
    final db = await _getDb();
    return await db.delete("Project", where: 'id = ?', whereArgs: [project.id]);
  }

  static Future<List<Project>?> getAllProjects() async {
    final db = await _getDb();
    final List<Map<String, dynamic>> maps = await db.query("Project");
    if (maps.isEmpty) {
      return null;
    }
    return List.generate(maps.length, (index) => Project.fromJson(maps[index]));
  }

  static Future<int> addUserPicture(int id, String picturePath) async {
    final db = await _getDb();
    return await db.update(
      'User',
      {'picture': picturePath},
      where: 'id = ?',
      whereArgs: [id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<int> addInformationPersonnel(Information information) async {
    final db = await _getDb();
    return await db.insert("Informations", information.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<Information?> getInformationByUserId(int userId) async {
    final db = await _getDb();
    final List<Map<String, dynamic>> maps = await db.query(
      "Informations",
      where: 'userId = ?',
      whereArgs: [userId],
      limit: 1,
    );
    if (maps.isNotEmpty) {
      return Information.fromJson(maps.first);
    }
    return null;
  }
}
