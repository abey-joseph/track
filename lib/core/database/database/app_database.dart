import 'package:sqflite/sqflite.dart';

/// Thin wrapper around an already-opened sqflite [Database].
/// The Database is created & migrated in DI (DbModule) and injected here.
class AppDatabase {
  AppDatabase(this._db);

  final Database _db;

  Database get instance => _db;

  Future<void> close() async {
    await _db.close();
  }
}
