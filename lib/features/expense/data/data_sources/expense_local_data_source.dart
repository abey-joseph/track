import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:track/core/database/database/app_database.dart';

@lazySingleton
class ExpenseLocalDataSource {
  final AppDatabase _db;
  ExpenseLocalDataSource(this._db);

  Database get db => _db.instance;
}


