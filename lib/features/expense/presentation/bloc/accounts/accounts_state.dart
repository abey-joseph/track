part of 'accounts_bloc.dart';

@freezed
class AccountsState with _$AccountsState {
  const factory AccountsState.initial() = _AccountsInitial;
  const factory AccountsState.loading() = _AccountsLoading;
  const factory AccountsState.loaded(List<AccountEntity> accounts) = _AccountsLoaded;
  const factory AccountsState.failure(String message) = _AccountsFailure;
}


