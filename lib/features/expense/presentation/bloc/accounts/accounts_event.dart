part of 'accounts_bloc.dart';

@freezed
class AccountsEvent with _$AccountsEvent {
  const factory AccountsEvent.load({required String uid}) = _AccountsLoad;
  const factory AccountsEvent.add({required AccountEntity account}) = _AccountsAdd;
  const factory AccountsEvent.update({required AccountEntity account}) = _AccountsUpdate;
  const factory AccountsEvent.delete({required int accountId, required String uid}) = _AccountsDelete;
  const factory AccountsEvent.setDefault({required int accountId, required String uid}) = _AccountsSetDefault;
  const factory AccountsEvent.reload({required String uid}) = _AccountsReload;
}


