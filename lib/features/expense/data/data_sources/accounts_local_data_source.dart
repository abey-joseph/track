import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:track/core/database/database/app_database.dart';

@lazySingleton
class AccountsLocalDataSource {
  final AppDatabase _db;
  AccountsLocalDataSource(this._db);

  Database get db => _db.instance;
}


