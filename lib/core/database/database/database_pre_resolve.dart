import 'dart:developer';
import 'dart:io';

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
    log("Database path: $path");

    // Check if database file exists and its size
    final dbFile = File(path);
    if (await dbFile.exists()) {
      final size = await dbFile.length();
      log("Database file exists with size: $size bytes");
    } else {
      log("Database file does not exist, will be created");
    }

    final db = await openDatabase(
      path,
      version: _dbVersion,
      onConfigure: (db) async {
        // Use rawQuery for PRAGMAs that return a row on iOS/macOS to avoid "not an error".
        await db.rawQuery('PRAGMA foreign_keys=ON');
        await db.rawQuery('PRAGMA journal_mode=WAL');
        log("Database configured with pragmas");
      },
      onCreate: (db, v) async {
        log("Creating new database with version: $v");
        await runMigrations(db, 0, v);
        log("Database creation and migrations completed");
      },
      onUpgrade: (db, oldV, newV) async {
        log("Upgrading database from version $oldV to $newV");
        await runMigrations(db, oldV, newV);
        log("Database upgrade completed");
      },
    );
    log("database opened");

    return db;
  }

  /// Provide the AppDatabase wrapper using the resolved raw Database.
  @lazySingleton
  AppDatabase appDatabase(Database db) => AppDatabase(db);
}
