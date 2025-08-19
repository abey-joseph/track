part of 'account_details_bloc.dart';

@freezed
class AccountDetailsEvent with _$AccountDetailsEvent {
  const factory AccountDetailsEvent.started({required int accountId}) = _AccountDetailsStarted;
  const factory AccountDetailsEvent.filterChanged({required AccountFilter filter}) = _AccountDetailsFilterChanged;
}
