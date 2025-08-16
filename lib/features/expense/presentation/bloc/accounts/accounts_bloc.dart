import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/services/logging_service.dart';
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
    
    logger.info('Loading accounts for user: ${event.uid}', tag: 'AccountsBloc');
    final stopwatch = Stopwatch()..start();
    
    final result = await _getAccounts.call(uid: event.uid);
    
    result.fold(
      (failure) {
        stopwatch.stop();
        emit(AccountsState.failure(failure.message));
        
        // Log the failure with detailed information
        logger.logFailure(
          failure,
          operation: 'loadAccounts',
          userId: event.uid,
          context: {'durationMs': stopwatch.elapsed.inMilliseconds},
        );
        
        // Log user action for analytics
        logger.logUserAction(
          'load_accounts_failed',
          userId: event.uid,
          screen: 'accounts_page',
          parameters: {'error': failure.message, 'errorCode': failure.code},
        );
      },
      (accounts) {
        stopwatch.stop();
        emit(AccountsState.loaded(accounts));
        
        // Log success
        logger.logSuccess(
          'Load accounts',
          userId: event.uid,
          context: {'accountCount': accounts.length, 'durationMs': stopwatch.elapsed.inMilliseconds},
        );
        
        // Log user action for analytics
        logger.logUserAction(
          'load_accounts_success',
          userId: event.uid,
          screen: 'accounts_page',
          parameters: {'accountCount': accounts.length},
        );
      },
    );
  }

  Future<void> _onAdd(_AccountsAdd event, Emitter<AccountsState> emit) async {
    logger.info('Adding account: ${event.account.name}', tag: 'AccountsBloc');
    final stopwatch = Stopwatch()..start();
    
    final result = await _addAccount.call(account: event.account);
    
    result.fold(
      (failure) {
        stopwatch.stop();
        emit(AccountsState.failure(failure.message));
        
        // Log the failure
        logger.logFailure(
          failure,
          operation: 'addAccount',
          userId: event.account.uid,
          context: {'accountName': event.account.name, 'durationMs': stopwatch.elapsed.inMilliseconds},
        );
        
        // Log user action for analytics
        logger.logUserAction(
          'add_account_failed',
          userId: event.account.uid,
          screen: 'accounts_page',
          parameters: {'error': failure.message, 'accountName': event.account.name},
        );
      },
      (_) {
        stopwatch.stop();
        
        // Log success
        logger.logSuccess(
          'Add account',
          userId: event.account.uid,
          context: {'accountName': event.account.name, 'durationMs': stopwatch.elapsed.inMilliseconds},
        );
        
        // Log user action for analytics
        logger.logUserAction(
          'add_account_success',
          userId: event.account.uid,
          screen: 'accounts_page',
          parameters: {'accountName': event.account.name},
        );
        
        // Success - reload the accounts
        add(AccountsEvent.reload(uid: event.account.uid));
      },
    );
  }

  Future<void> _onUpdate(_AccountsUpdate event, Emitter<AccountsState> emit) async {
    logger.info('Updating account: ${event.account.name}', tag: 'AccountsBloc');
    final stopwatch = Stopwatch()..start();
    
    final result = await _updateAccount.call(account: event.account);
    
    result.fold(
      (failure) {
        stopwatch.stop();
        emit(AccountsState.failure(failure.message));
        
        // Log the failure
        logger.logFailure(
          failure,
          operation: 'updateAccount',
          userId: event.account.uid,
          context: {'accountId': event.account.accountId, 'accountName': event.account.name, 'durationMs': stopwatch.elapsed.inMilliseconds},
        );
        
        // Log user action for analytics
        logger.logUserAction(
          'update_account_failed',
          userId: event.account.uid,
          screen: 'accounts_page',
          parameters: {'error': failure.message, 'accountId': event.account.accountId, 'accountName': event.account.name},
        );
      },
      (_) {
        stopwatch.stop();
        
        // Log success
        logger.logSuccess(
          'Update account',
          userId: event.account.uid,
          context: {'accountId': event.account.accountId, 'accountName': event.account.name, 'durationMs': stopwatch.elapsed.inMilliseconds},
        );
        
        // Log user action for analytics
        logger.logUserAction(
          'update_account_success',
          userId: event.account.uid,
          screen: 'accounts_page',
          parameters: {'accountId': event.account.accountId, 'accountName': event.account.name},
        );
        
        // Success - reload the accounts
        add(AccountsEvent.reload(uid: event.account.uid));
      },
    );
  }

  Future<void> _onDelete(_AccountsDelete event, Emitter<AccountsState> emit) async {
    logger.info('Deleting account: ${event.accountId}', tag: 'AccountsBloc');
    final stopwatch = Stopwatch()..start();
    
    final result = await _deleteAccount.call(accountId: event.accountId, uid: event.uid);
    
    result.fold(
      (failure) {
        stopwatch.stop();
        emit(AccountsState.failure(failure.message));
        
        // Log the failure
        logger.logFailure(
          failure,
          operation: 'deleteAccount',
          userId: event.uid,
          context: {'accountId': event.accountId, 'durationMs': stopwatch.elapsed.inMilliseconds},
        );
        
        // Log user action for analytics
        logger.logUserAction(
          'delete_account_failed',
          userId: event.uid,
          screen: 'accounts_page',
          parameters: {'error': failure.message, 'accountId': event.accountId},
        );
      },
      (_) {
        stopwatch.stop();
        
        // Log success
        logger.logSuccess(
          'Delete account',
          userId: event.uid,
          context: {'accountId': event.accountId, 'durationMs': stopwatch.elapsed.inMilliseconds},
        );
        
        // Log user action for analytics
        logger.logUserAction(
          'delete_account_success',
          userId: event.uid,
          screen: 'accounts_page',
          parameters: {'accountId': event.accountId},
        );
        
        // Success - reload the accounts
        add(AccountsEvent.reload(uid: event.uid));
      },
    );
  }

  Future<void> _onSetDefault(_AccountsSetDefault event, Emitter<AccountsState> emit) async {
    logger.info('Setting default account: ${event.accountId}', tag: 'AccountsBloc');
    final stopwatch = Stopwatch()..start();
    
    final result = await _setDefaultAccount.call(accountId: event.accountId, uid: event.uid);
    
    result.fold(
      (failure) {
        stopwatch.stop();
        emit(AccountsState.failure(failure.message));
        
        // Log the failure
        logger.logFailure(
          failure,
          operation: 'setDefaultAccount',
          userId: event.uid,
          context: {'accountId': event.accountId, 'durationMs': stopwatch.elapsed.inMilliseconds},
        );
        
        // Log user action for analytics
        logger.logUserAction(
          'set_default_account_failed',
          userId: event.uid,
          screen: 'accounts_page',
          parameters: {'error': failure.message, 'accountId': event.accountId},
        );
      },
      (_) {
        stopwatch.stop();
        
        // Log success
        logger.logSuccess(
          'Set default account',
          userId: event.uid,
          context: {'accountId': event.accountId, 'durationMs': stopwatch.elapsed.inMilliseconds},
        );
        
        // Log user action for analytics
        logger.logUserAction(
          'set_default_account_success',
          userId: event.uid,
          screen: 'accounts_page',
          parameters: {'accountId': event.accountId},
        );
        
        // Success - reload the accounts
        add(AccountsEvent.reload(uid: event.uid));
      },
    );
  }

  Future<void> _onReload(_AccountsReload event, Emitter<AccountsState> emit) async {
    logger.info('Reloading accounts for user: ${event.uid}', tag: 'AccountsBloc');
    final stopwatch = Stopwatch()..start();
    
    final result = await _getAccounts.call(uid: event.uid);
    
    result.fold(
      (failure) {
        stopwatch.stop();
        emit(AccountsState.failure(failure.message));
        
        // Log the failure
        logger.logFailure(
          failure,
          operation: 'reloadAccounts',
          userId: event.uid,
          context: {'durationMs': stopwatch.elapsed.inMilliseconds},
        );
      },
      (accounts) {
        stopwatch.stop();
        emit(AccountsState.loaded(accounts));
        
        // Log success
        logger.logSuccess(
          'Reload accounts',
          userId: event.uid,
          context: {'accountCount': accounts.length, 'durationMs': stopwatch.elapsed.inMilliseconds},
        );
      },
    );
  }

  Future<bool> isAccountInUse({required int accountId, required String uid}) async {
    logger.info('Checking if account is in use: $accountId', tag: 'AccountsBloc');
    final stopwatch = Stopwatch()..start();
    
    final result = await _isAccountInUse.call(accountId: accountId, uid: uid);
    
    return result.fold(
      (failure) {
        stopwatch.stop();
        
        // Log the failure
        logger.logFailure(
          failure,
          operation: 'isAccountInUse',
          userId: uid,
          context: {'accountId': accountId, 'durationMs': stopwatch.elapsed.inMilliseconds},
        );
        
        return false; // Default to false on failure
      },
      (isInUse) {
        stopwatch.stop();
        
        // Log success
        logger.logSuccess(
          'Check account in use',
          userId: uid,
          context: {'accountId': accountId, 'isInUse': isInUse, 'durationMs': stopwatch.elapsed.inMilliseconds},
        );
        
        return isInUse;
      },
    );
  }
}


