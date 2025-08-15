import 'package:sqflite/sqflite.dart';
import 'package:track/core/database/migrations/v1.dart';

typedef SqlList = List<String>;

/// Versioned migrations: add v2, v3… later without editing older ones.
final Map<int, SqlList> kMigrations = {
  1: migrationV1,
};

/// Runs migrations stepwise from `from` (exclusive) to `to` (inclusive).
Future<void> runMigrations(Database db, int from, int to) async {
  for (var v = from + 1; v <= to; v++) {
    final steps = kMigrations[v];
    if (steps == null) continue;
    for (final sql in steps) {
      await db.execute(sql);
    }
  }
}
