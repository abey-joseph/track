
import 'package:track/features/expense/domain/entities/account_entity.dart';


abstract class AccountsRepository {
  Future<List<AccountEntity>> getAccounts({required String uid});
  Future<void> addAccount({required AccountEntity account});
  Future<void> updateAccount({required AccountEntity account});
  Future<void> deleteAccount({required int accountId, required String uid});
  Future<void> setDefaultAccount({required int accountId, required String uid});
  Future<bool> isAccountInUse({required int accountId, required String uid});
}


