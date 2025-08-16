import 'package:injectable/injectable.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/features/expense/domain/entities/account_entity.dart';
import 'package:track/features/expense/domain/repo/accounts_repository.dart';

@lazySingleton
class GetAccounts {
  final AccountsRepository _repo = getIt<AccountsRepository>();
  Future<List<AccountEntity>> call({required String uid}) => _repo.getAccounts(uid: uid);
}


