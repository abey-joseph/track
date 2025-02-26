import 'dart:developer';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

@lazySingleton
class Db {
  static late final Directory directory;
  static late Database db;

  Future<bool> initDatabase() async {
    directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'expenses.db');

    try {
      // Check if the database already exists
      if (await databaseExists(path)) {
        log("Database already exists. Opening existing database.");
        db = await openDatabase(path);
      } else {
        log("Database does not exist. Creating new database.");
        db = await openDatabase(
          path,
          version: 1,
          onCreate: (db, version) async {
            await db.execute('''
            CREATE TABLE expenses(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              isExpense INTEGER,
              title TEXT,
              amount REAL,
              category TEXT,
              date TEXT
            )
          ''');
          },
        );
      }
      return true;
    } catch (e) {
      log("Error opening database reason - ${e.toString()}");
      return false;
    }
  }

  Future<bool> testInitDatabase() async {
    directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'expenses.db');

    try {
      // Check if the database already exists
      if (!await File(path).exists()) {
        // Copy from assets

        // ByteData data = await rootBundle.load('assets/db/expenses.db');
        // List<int> bytes = data.buffer.asUint8List();
        // await File(path).writeAsBytes(bytes);
      }
      db = await openDatabase(path);
      return true;
    } catch (e) {
      log("Error copying test database reason - ${e.toString()}");
      return false;
    }
  }
}
