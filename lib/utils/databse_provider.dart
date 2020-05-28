import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:user_register_app/model/user_model.dart';
import 'package:user_register_app/model/users_model.dart';

class DatabaseProvider {
  DatabaseProvider._();

  static final DatabaseProvider db = DatabaseProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "UserReg.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE IF NOT EXISTS UserTable ("
          "id INTEGER PRIMARY KEY,"
          "userName TEXT,"
          "password TEXT"
          ")");

      await db.execute("CREATE TABLE IF NOT EXISTS UsersTable ("
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "lastName TEXT,"
          "mobile TEXT,"
          "nationalCode TEXT,"
          "birthDate TEXT"
          ")");
    });
  }

  // Future<void> saveUser(UserModle user) async {
  //   try {
  //     final db = await database;
  //     var res = await db.insert("UserTable", user.toJson());
  //     return res;
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future<void> saveUser<T>(T user) async {
    var tbName = "";
    var obj;
    if (user is UserModle) {
      tbName = "UserTable";
      obj = user;
    } else {
      tbName = "UsersTable";
      obj = user;
    }
    try {
      final db = await database;
      var res = await db.insert(tbName, obj.toJson());
      return res;
    } catch (e) {
      print(e);
    }
  }

  Future<int> getUser({username, password}) async {
    try {
      final db = await database;
      var count = Sqflite.firstIntValue(await db.rawQuery(
          'SELECT COUNT(*) FROM UserTable where userName = \'$username\' AND password = \'$password\''));
      return count;
    } catch (e) {
      print(e);
    }
    return 0;
  }

  Future<List<UsersModle>> getUserList(String nationalCode) async {
    try {
      final db = await database;
      var res = await db.rawQuery("SELECT * FROM UsersTable WHERE nationalCode LIKE '%$nationalCode%'");
      List<UsersModle> users = res.isNotEmpty
          ? res.map((user) => UsersModle.fromJson(user)).toList()
          : [];
      return users;
    } catch (e) {
      print('all users load  err ----> $e');
    }
    return [];
  }
}
