import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';
import 'package:track/core/database/migrations/migration.dart';
import 'app_database.dart';

const _dbFileName = 'track.db';
const _dbVersion = 1; // bump when adding migrations

@module
abstract class DbModule {
  /// Pre-resolve an OPENED sqflite Database with pragmas & migrations applied.
  @preResolve
  @lazySingleton
  Future<Database> get database async {
    final dir = await getDatabasesPath();
    log("directory for database set done");
    final path = p.join(dir, _dbFileName);

    final db = await openDatabase(
      path,
      version: _dbVersion,
      onConfigure: (db) async {
        // Use rawQuery for PRAGMAs that return a row on iOS/macOS to avoid "not an error".
        await db.rawQuery('PRAGMA foreign_keys=ON');
        await db.rawQuery('PRAGMA journal_mode=WAL');
      },
      onCreate: (db, v) async => runMigrations(db, 0, v),
      onUpgrade: (db, oldV, newV) async => runMigrations(db, oldV, newV),
    );
    log("database opened");

    return db;
  }

  /// Provide the AppDatabase wrapper using the resolved raw Database.
  @lazySingleton
  AppDatabase appDatabase(Database db) => AppDatabase(db);
}
