import 'package:track/features/expense/data/models/raw_models/account_model.dart';
import 'package:track/features/expense/domain/entities/raw_entities/account_entity.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AccountMappers {

  AccountModel accountEntityToModel(AccountEntity entity) {
    return AccountModel(
      accountId: entity.accountId,
      uid: entity.uid,
      name: entity.name,
      type: _mapAccountTypeToModel(entity.type),
      currency: entity.currency,
      isArchived: entity.isArchived,
      isDefault: entity.isDefault,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

   AccountEntity accountModelToEntity(AccountModel model) {
    return AccountEntity(
      accountId: model.accountId,
      uid: model.uid,
      name: model.name,
      type: _mapAccountTypeModelToEntity(model.type),
      currency: model.currency,
      isArchived: model.isArchived,
      isDefault: model.isDefault,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  static AccountTypeModel _mapAccountTypeToModel(AccountType type) {
    switch (type) {
      case AccountType.cash:
        return AccountTypeModel.cash;
      case AccountType.bank:
        return AccountTypeModel.bank;
      case AccountType.card:
        return AccountTypeModel.card;
      case AccountType.ewallet:
        return AccountTypeModel.ewallet;
      case AccountType.other:
        return AccountTypeModel.other;
    }
  }

  static AccountType _mapAccountTypeModelToEntity(AccountTypeModel typeModel) {
    switch (typeModel) {
      case AccountTypeModel.cash:
        return AccountType.cash;
      case AccountTypeModel.bank:
        return AccountType.bank;
      case AccountTypeModel.card:
        return AccountType.card;
      case AccountTypeModel.ewallet:
        return AccountType.ewallet;
      case AccountTypeModel.other:
        return AccountType.other;
    }
  }
}
