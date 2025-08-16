import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:track/features/expense/domain/use_cases/get_accounts.dart';
import 'package:track/features/expense/domain/use_cases/modify_account.dart';
import 'package:track/features/expense/domain/entities/account_entity.dart';

part 'accounts_event.dart';
part 'accounts_state.dart';
part 'accounts_bloc.freezed.dart';

@injectable
class AccountsBloc extends Bloc<AccountsEvent, AccountsState> {
  final GetAccounts _getAccounts;
  final AddAccount _addAccount;
  final UpdateAccount _updateAccount;
  final DeleteAccount _deleteAccount;
  final SetDefaultAccount _setDefaultAccount;
  final IsAccountInUse _isAccountInUse;

  AccountsBloc(
    this._getAccounts,
    this._addAccount,
    this._updateAccount,
    this._deleteAccount,
    this._setDefaultAccount,
    this._isAccountInUse,
  ) : super(const AccountsState.initial()) {
    on<_AccountsLoad>(_onLoad);
    on<_AccountsAdd>(_onAdd);
    on<_AccountsUpdate>(_onUpdate);
    on<_AccountsDelete>(_onDelete);
    on<_AccountsSetDefault>(_onSetDefault);
    on<_AccountsReload>(_onReload);
  }

  Future<void> _onLoad(_AccountsLoad event, Emitter<AccountsState> emit) async {
    emit(const AccountsState.loading());
    try {
      final items = await _getAccounts.call(uid: event.uid);
      emit(AccountsState.loaded(items));
    } catch (e) {
      emit(AccountsState.failure(e.toString()));
    }
  }

  Future<void> _onAdd(_AccountsAdd event, Emitter<AccountsState> emit) async {
    try {
      await _addAccount.call(account: event.account);
      add(AccountsEvent.reload(uid: event.account.uid));
    } catch (e) {
      emit(AccountsState.failure(e.toString()));
    }
  }

  Future<void> _onUpdate(_AccountsUpdate event, Emitter<AccountsState> emit) async {
    try {
      await _updateAccount.call(account: event.account);
      add(AccountsEvent.reload(uid: event.account.uid));
    } catch (e) {
      emit(AccountsState.failure(e.toString()));
    }
  }

  Future<void> _onDelete(_AccountsDelete event, Emitter<AccountsState> emit) async {
    try {
      await _deleteAccount.call(accountId: event.accountId, uid: event.uid);
      add(AccountsEvent.reload(uid: event.uid));
    } catch (e) {
      emit(AccountsState.failure(e.toString()));
    }
  }

  Future<void> _onSetDefault(_AccountsSetDefault event, Emitter<AccountsState> emit) async {
    try {
      await _setDefaultAccount.call(accountId: event.accountId, uid: event.uid);
      add(AccountsEvent.reload(uid: event.uid));
    } catch (e) {
      emit(AccountsState.failure(e.toString()));
    }
  }

  Future<void> _onReload(_AccountsReload event, Emitter<AccountsState> emit) async {
    try {
      final items = await _getAccounts.call(uid: event.uid);
      emit(AccountsState.loaded(items));
    } catch (e) {
      emit(AccountsState.failure(e.toString()));
    }
  }

  Future<bool> isAccountInUse({required int accountId, required String uid}) async {
    return await _isAccountInUse.call(accountId: accountId, uid: uid);
  }
}


