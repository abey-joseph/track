import 'dart:developer' as dev;
import 'dart:math' as math;
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:track/core/database/database/app_database.dart';
import 'package:track/features/common/domain/repo/seed_repo.dart';

@LazySingleton(as: SeedRepo)
class SeedRepoImpl implements SeedRepo {
	final AppDatabase appDb;
	SeedRepoImpl(this.appDb);

	Database get _db => appDb.instance;

	@override
	Future<void> ensureDefaultsIfEmpty({required String uid}) async {
		dev.log('[SeedRepo] ensureDefaultsIfEmpty start uid=$uid');
		final countAccounts = Sqflite.firstIntValue(
			await _db.rawQuery('SELECT COUNT(*) FROM accounts WHERE uid = ?', [uid]),
		) ?? 0;
		final countCategories = Sqflite.firstIntValue(
			await _db.rawQuery('SELECT COUNT(*) FROM categories WHERE uid = ?', [uid]),
		) ?? 0;

		dev.log('[SeedRepo] existing: accounts=$countAccounts, categories=$countCategories');

		if (countAccounts == 0) {
			dev.log('[SeedRepo] inserting default accounts for uid=$uid');
			await _insertDefaultAccounts(uid);
		}
		if (countCategories == 0) {
			dev.log('[SeedRepo] inserting default categories for uid=$uid');
			await _insertDefaultCategories(uid);
		}
		dev.log('[SeedRepo] ensureDefaultsIfEmpty done uid=$uid');
	}

	Future<void> _insertDefaultAccounts(String uid) async {
		final batch = _db.batch();
		batch.insert('accounts', {
			'uid': uid,
			'name': 'Cash',
			'type': 'CASH',
			'currency': 'USD',
			'is_default': 1,
		});
		batch.insert('accounts', {
			'uid': uid,
			'name': 'Bank',
			'type': 'BANK',
			'currency': 'USD',
		});
		await batch.commit(noResult: true);
		dev.log('[SeedRepo] default accounts inserted for uid=$uid');
	}

	Future<void> _insertDefaultCategories(String uid) async {
		final batch = _db.batch();
		final expenseCats = ['Food', 'Transport', 'Groceries', 'Bills', 'Shopping'];
		final incomeCats = ['Salary', 'Gift'];
		for (final name in expenseCats) {
			batch.insert('categories', {
				'uid': uid,
				'name': name,
				'type': 'EXPENSE',
			});
		}
		for (final name in incomeCats) {
			batch.insert('categories', {
				'uid': uid,
				'name': name,
				'type': 'INCOME',
			});
		}
		await batch.commit(noResult: true);
		dev.log('[SeedRepo] default categories inserted for uid=$uid');
	}

	@override
	Future<void> insertSampleData({required String uid}) async {
		dev.log('[SeedRepo] insertSampleData start uid=$uid');
		// Make sure base records exist
		await ensureDefaultsIfEmpty(uid: uid);

		// Choose an account and categories
		final accountId = await _firstAccountId(uid);
		final categoryIdsExpense = await _categoryIds(uid, 'EXPENSE');
		final categoryIdsIncome = await _categoryIds(uid, 'INCOME');
		dev.log('[SeedRepo] using accountId=$accountId, expenseCats=${categoryIdsExpense.length}, incomeCats=${categoryIdsIncome.length}');
		final rnd = math.Random(42);

		// Dates: 1-8-2025 to 16-8-2025
		final dates = List.generate(16, (i) => DateTime(2025, 8, i + 1));

		final batch = _db.batch();
		int inserted = 0;
		for (final d in dates) {
			if (inserted >= 20) break;
			final isIncome = rnd.nextBool();
			final amount = (rnd.nextInt(900) + 100).toDouble();
			final signedAmount = isIncome ? amount : -amount;
			final type = isIncome ? 'INCOME' : 'EXPENSE';
			final catId = isIncome
				? (categoryIdsIncome.isNotEmpty ? categoryIdsIncome[rnd.nextInt(categoryIdsIncome.length)] : null)
				: (categoryIdsExpense.isNotEmpty ? categoryIdsExpense[rnd.nextInt(categoryIdsExpense.length)] : null);

			batch.insert('transactions', {
				'uid': uid,
				'account_id': accountId,
				'type': type,
				'amount': signedAmount,
				'currency': 'USD',
				'category_id': catId,
				'occurred_on': _fmtDate(d),
				'note': 'txn$inserted',
			});
			inserted++;
		}
		await batch.commit(noResult: true);
		dev.log('[SeedRepo] inserted $inserted sample transactions for uid=$uid');
	}

	Future<int> _firstAccountId(String uid) async {
		final rows = await _db.query('accounts', columns: ['account_id'], where: 'uid = ?', whereArgs: [uid], limit: 1);
		if (rows.isEmpty) {
			throw StateError('No account found for seeding');
		}
		final id = rows.first['account_id'] as int;
		dev.log('[SeedRepo] first account id=$id for uid=$uid');
		return id;
	}

	Future<List<int>> _categoryIds(String uid, String type) async {
		final rows = await _db.query('categories', columns: ['category_id'], where: 'uid = ? AND type = ?', whereArgs: [uid, type]);
		return rows.map((e) => e['category_id'] as int).toList();
	}

	String _fmtDate(DateTime d) {
		final mm = d.month.toString().padLeft(2, '0');
		final dd = d.day.toString().padLeft(2, '0');
		return '${d.year}-$mm-$dd';
	}
}
