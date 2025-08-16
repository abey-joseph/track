import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:track/core/database/database/app_database.dart';

@lazySingleton
class CategoriesLocalDataSource {
  final AppDatabase _db;
  CategoriesLocalDataSource(this._db);

  Database get db => _db.instance;
}


