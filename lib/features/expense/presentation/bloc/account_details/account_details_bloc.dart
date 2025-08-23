import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/services/logging_service.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/features/expense/domain/entities/raw_entities/account_entity.dart';
import 'package:track/features/expense/domain/entities/raw_entities/transaction_entity.dart';
import 'package:track/features/expense/domain/use_cases/accounts_use_cases/get_account_details.dart';
import 'package:track/core/auth/firebase_services.dart';
import 'package:track/features/expense/domain/entities/helper_classes/account_details_helpers.dart';
import 'package:track/features/expense/domain/entities/view_entities/misc/expense_filter.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'dart:developer';

part 'account_details_event.dart';
part 'account_details_state.dart';
part 'account_details_bloc.freezed.dart';

@injectable
class AccountDetailsBloc
    extends Bloc<AccountDetailsEvent, AccountDetailsState> {
  final GetAccountDetailsSummary _getAccountDetailsSummary;
  final GetAccountTransactions _getAccountTransactions;
  final GetCurrentAccountBalance _getCurrentAccountBalance;
  final FirebaseAuthService _auth;

  AccountDetailsBloc(
    this._getAccountDetailsSummary,
    this._getAccountTransactions,
    this._getCurrentAccountBalance,
    this._auth,
  ) : super(const AccountDetailsState.initial()) {
    logger.info('AccountDetailsBloc initialized', tag: 'AccountDetailsBloc');
    on<AccountDetailsEvent>((event, emit) async {
      await event.when(
        started: (accountId) async => _onStarted(accountId, emit),
        filterChanged: (filter) async => _onFilterChanged(filter, emit),
      );
    });
  }

  Future<void> _onStarted(
      int accountId, Emitter<AccountDetailsState> emit) async {
    emit(const AccountDetailsState.loading());

    logger.info('Loading account details for account: $accountId',
        tag: 'AccountDetailsBloc');

    try {
      // Get account details from repository
      final uid = _auth.currentUser?.uid ?? '';
      final summaryResult = await _getAccountDetailsSummary.call(
        uid: uid,
        accountId: accountId,
      );

      final filter = getIt<AccountFilter>();
      // reset filter to default
      filter.reset();

      await summaryResult.fold(
        (failure) async {
          emit(AccountDetailsState.failure(failure.message));
          logger.logFailure(
            failure,
            operation: 'loadAccountDetails',
            userId: 'dummy_user',
            context: {'accountId': accountId},
          );
        },
        (summary) async {
          emit(AccountDetailsState.loaded(
            account: summary.account,
            filter: filter,
            totals: summary.totals,
            counts: summary.counts,
            donutData: summary.donutData,
            groupedTransactions: summary.groupedTransactions,
          ));

          logger.logSuccess(
            'Load account details',
            userId: summary.account.uid,
            context: {
              'accountId': accountId,
            },
          );
        },
      );
    } catch (e) {
      emit(AccountDetailsState.failure(e.toString()));
      logger.logFailure(
        UnknownFailure(e.toString()),
        operation: 'loadAccountDetails',
        userId: 'dummy_user',
        context: {'accountId': accountId},
      );
    }
  }

  Future<void> _onFilterChanged(
      AccountFilter filter, Emitter<AccountDetailsState> emit) async {
    final currentState = state;

    if (currentState is! _AccountDetailsLoaded) {
      log("current state is not loaded - so returning");
      return;
    }

    // update the filter in the get it instance
    getIt<AccountFilter>().update(filter);

    emit(const AccountDetailsState.loading());

    // filter is handled by the get it instance in the use case

    try {
      final uid = _auth.currentUser?.uid ?? '';
      final summaryResult = await _getAccountDetailsSummary.call(
        uid: uid,
        accountId: currentState.account.accountId!,
      );

      await summaryResult.fold(
        (failure) async {
          emit(AccountDetailsState.failure(failure.message));
        },
        (summary) async {
          emit(AccountDetailsState.loaded(
            account: summary.account,
            filter: filter,
            totals: summary.totals,
            counts: summary.counts,
            donutData: summary.donutData,
            groupedTransactions: summary.groupedTransactions,
          ));

          logger.logSuccess(
            'Filter changed',
            userId: summary.account.uid,
            context: {
              'accountId': currentState.account.accountId,
            },
          );
        },
      );
    } catch (e) {
      emit(AccountDetailsState.failure(e.toString()));
      logger.logFailure(
        UnknownFailure(e.toString()),
        operation: 'filterAccountDetails',
        userId: currentState.account.uid,
        context: {'accountId': currentState.account.accountId},
      );
    }
  }
}
