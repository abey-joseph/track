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
    final path = join(directory.path, 'track.db');

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
            //table for expenses
            await db.execute('''
            CREATE TABLE expenses(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              isExpense INTEGER,
              title TEXT,
              amount REAL,
              category TEXT,
              comment TEXT,
              date TEXT
            )
          ''');

            //tabele for habits

            await db.execute('''
              CREATE TABLE habits (
                habitId INTEGER PRIMARY KEY AUTOINCREMENT,
                habitName TEXT NOT NULL,
                description TEXT,
                isBinary INTEGER NOT NULL,
                frequency TEXT,
                countType TEXT,
                target REAL,
                targetType TEXT,
                selectedDays TEXT,
                inEveryXDays INTEGER,
                reminder INTEGER NOT NULL,
                createdAt TEXT,
                updatedAt TEXT
              )
            ''');

            await db.execute('''
              CREATE TABLE habit_status (
                statusId INTEGER PRIMARY KEY AUTOINCREMENT,
                habitId INTEGER NOT NULL,
                date TEXT NOT NULL,
                value REAL,
                note TEXT,
                updatedAt TEXT,
                FOREIGN KEY (habit_id) REFERENCES habits(habit_id) ON DELETE CASCADE
              )
            ''');

            await db.execute('''
              CREATE INDEX idx_habit_status_habit_date ON habit_status(habitId, date)
            ''');
          },
        );
      }
      return true;
    } catch (e) {
      log("Error opening database and create table, reason - ${e.toString()}");
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
