import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/features/expense/domain/entities/account_entity.dart';
import 'package:track/features/expense/domain/entities/category_entity.dart';
import 'package:track/features/expense/domain/entities/payee_entity.dart';
import 'package:track/features/expense/domain/entities/transaction_entity.dart';
import 'package:track/features/expense/domain/repo/expense_repository.dart';

enum TransactionFormMode { create, edit }

@immutable
class TransactionState {
  final TransactionFormMode mode;
  final bool isLoading;
  final bool isSubmitting;
  final String? errorMessage;
  final bool isSuccess;

  final String uid;
  final TransactionEntity? originalEntity;

  final TransactionType type;
  final String amountText;
  final String currency;
  final int? accountId;
  final int? categoryId;
  final int? payeeId;
  final String? note;
  final DateTime occurredOn;

  final List<AccountEntity> accounts;
  final List<CategoryEntity> categories;
  final List<PayeeEntity> payees;

  const TransactionState({
    required this.mode,
    required this.isLoading,
    required this.isSubmitting,
    required this.errorMessage,
    required this.isSuccess,
    required this.uid,
    required this.originalEntity,
    required this.type,
    required this.amountText,
    required this.currency,
    required this.accountId,
    required this.categoryId,
    required this.payeeId,
    required this.note,
    required this.occurredOn,
    required this.accounts,
    required this.categories,
    required this.payees,
  });

  factory TransactionState.initial(String uid) => TransactionState(
        mode: TransactionFormMode.create,
        isLoading: true,
        isSubmitting: false,
        errorMessage: null,
        isSuccess: false,
        uid: uid,
        originalEntity: null,
        type: TransactionType.expense,
        amountText: '',
        currency: 'USD',
        accountId: null,
        categoryId: null,
        payeeId: null,
        note: null,
        occurredOn: DateTime.now(),
        accounts: const [],
        categories: const [],
        payees: const [],
      );

  TransactionState copyWith({
    TransactionFormMode? mode,
    bool? isLoading,
    bool? isSubmitting,
    String? errorMessage,
    bool? clearError,
    bool? isSuccess,
    String? uid,
    TransactionEntity? originalEntity,
    bool? clearOriginal,
    TransactionType? type,
    String? amountText,
    String? currency,
    int? accountId,
    bool? clearAccount,
    int? categoryId,
    bool? clearCategory,
    int? payeeId,
    bool? clearPayee,
    String? note,
    bool? clearNote,
    DateTime? occurredOn,
    List<AccountEntity>? accounts,
    List<CategoryEntity>? categories,
    List<PayeeEntity>? payees,
  }) {
    return TransactionState(
      mode: mode ?? this.mode,
      isLoading: isLoading ?? this.isLoading,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: clearError == true ? null : (errorMessage ?? this.errorMessage),
      isSuccess: isSuccess ?? this.isSuccess,
      uid: uid ?? this.uid,
      originalEntity: clearOriginal == true ? null : (originalEntity ?? this.originalEntity),
      type: type ?? this.type,
      amountText: amountText ?? this.amountText,
      currency: currency ?? this.currency,
      accountId: clearAccount == true ? null : (accountId ?? this.accountId),
      categoryId: clearCategory == true ? null : (categoryId ?? this.categoryId),
      payeeId: clearPayee == true ? null : (payeeId ?? this.payeeId),
      note: clearNote == true ? null : (note ?? this.note),
      occurredOn: occurredOn ?? this.occurredOn,
      accounts: accounts ?? this.accounts,
      categories: categories ?? this.categories,
      payees: payees ?? this.payees,
    );
  }
}

abstract class TransactionEvent {}

class InitForCreate extends TransactionEvent {
  final String uid;
  InitForCreate(this.uid);
}

class InitForEdit extends TransactionEvent {
  final String uid;
  final TransactionEntity entity;
  InitForEdit({required this.uid, required this.entity});
}

class ChangeType extends TransactionEvent {
  final TransactionType type;
  ChangeType(this.type);
}

class ChangeAccount extends TransactionEvent {
  final int accountId;
  ChangeAccount(this.accountId);
}

class ChangeCategory extends TransactionEvent {
  final int? categoryId;
  ChangeCategory(this.categoryId);
}

class ChangePayee extends TransactionEvent {
  final int? payeeId;
  ChangePayee(this.payeeId);
}

class ChangeAmount extends TransactionEvent {
  final String amountText;
  ChangeAmount(this.amountText);
}

class ChangeNote extends TransactionEvent {
  final String? note;
  ChangeNote(this.note);
}

class ChangeDate extends TransactionEvent {
  final DateTime occurredOn;
  ChangeDate(this.occurredOn);
}

class SubmitTransaction extends TransactionEvent {}

class DeleteTransaction extends TransactionEvent {}

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final ExpenseRepository _repository;

  TransactionBloc(this._repository) : super(TransactionState.initial('')) {
    on<InitForCreate>(_onInitForCreate);
    on<InitForEdit>(_onInitForEdit);
    on<ChangeType>((e, emit) => emit(state.copyWith(type: e.type, categoryId: null)));
    on<ChangeAccount>(_onChangeAccount);
    on<ChangeCategory>((e, emit) => emit(state.copyWith(categoryId: e.categoryId)));
    on<ChangePayee>((e, emit) => emit(state.copyWith(payeeId: e.payeeId)));
    on<ChangeAmount>((e, emit) => emit(state.copyWith(amountText: e.amountText)));
    on<ChangeNote>((e, emit) => emit(state.copyWith(note: e.note)));
    on<ChangeDate>((e, emit) => emit(state.copyWith(occurredOn: e.occurredOn)));
    on<SubmitTransaction>(_onSubmit);
    on<DeleteTransaction>(_onDelete);
  }

  Future<void> _loadLookups(Emitter<TransactionState> emit, String uid) async {
    emit(state.copyWith(isLoading: true, clearError: true));

    final accountsEither = await _repository.getAccounts(uid);
    final categoriesEither = await _repository.getCategories(uid);
    final payeesEither = await _repository.getPayees(uid);

    List<AccountEntity> accounts = [];
    List<CategoryEntity> categories = [];
    List<PayeeEntity> payees = [];
    String? error;

    accountsEither.fold((l) => error = l.message, (r) => accounts = r);
    categoriesEither.fold((l) => error = l.message, (r) => categories = r);
    payeesEither.fold((l) => error = l.message, (r) => payees = r);

    // Default currency from first account if available
    final currency = state.currency.isNotEmpty
        ? state.currency
        : (accounts.isNotEmpty ? accounts.first.currency : 'USD');

    emit(state.copyWith(
      isLoading: false,
      errorMessage: error,
      accounts: accounts,
      categories: categories,
      payees: payees,
      currency: currency,
    ));
  }

  Future<void> _onInitForCreate(
    InitForCreate event,
    Emitter<TransactionState> emit,
  ) async {
    emit(TransactionState.initial(event.uid));
    await _loadLookups(emit, event.uid);
  }

  Future<void> _onInitForEdit(
    InitForEdit event,
    Emitter<TransactionState> emit,
  ) async {
    final entity = event.entity;
    emit(TransactionState.initial(event.uid).copyWith(
      mode: TransactionFormMode.edit,
      originalEntity: entity,
      type: entity.type,
      amountText: entity.amount.abs().toString(),
      currency: entity.currency,
      accountId: entity.accountId,
      categoryId: entity.categoryId,
      payeeId: entity.payeeId,
      note: entity.note,
      occurredOn: entity.occurredOn,
    ));
    await _loadLookups(emit, event.uid);
  }

  Future<void> _onChangeAccount(
    ChangeAccount event,
    Emitter<TransactionState> emit,
  ) async {
    final selected = state.accounts.firstWhere(
      (a) => a.accountId == event.accountId,
      orElse: () => state.accounts.isNotEmpty
          ? state.accounts.first
          : AccountEntity(
              accountId: null,
              uid: state.uid,
              name: 'Default',
              type: AccountType.other,
              currency: state.currency,
              createdAt: DateTime.now(),
            ),
    );
    emit(state.copyWith(accountId: event.accountId, currency: selected.currency));
  }

  Future<void> _onSubmit(
    SubmitTransaction event,
    Emitter<TransactionState> emit,
  ) async {
    emit(state.copyWith(isSubmitting: true, clearError: true, isSuccess: false));

    // Validate
    if (state.accountId == null || state.amountText.trim().isEmpty) {
      emit(state.copyWith(
        isSubmitting: false,
        errorMessage: 'Please select account and enter amount',
      ));
      return;
    }

    final parsedAmount = double.tryParse(state.amountText.replaceAll(',', ''));
    if (parsedAmount == null) {
      emit(state.copyWith(
        isSubmitting: false,
        errorMessage: 'Invalid amount',
      ));
      return;
    }

    double normalizedAmount = parsedAmount;
    if (state.type == TransactionType.expense && normalizedAmount > 0) {
      normalizedAmount = -normalizedAmount;
    }
    if (state.type == TransactionType.income && normalizedAmount < 0) {
      normalizedAmount = -normalizedAmount;
    }

    final isTransfer = state.type == TransactionType.transfer;
    final entity = TransactionEntity(
      transactionId: state.originalEntity?.transactionId,
      uid: state.uid,
      accountId: state.accountId!,
      type: state.type,
      amount: normalizedAmount,
      currency: state.currency,
      categoryId: isTransfer ? null : state.categoryId,
      payeeId: state.payeeId,
      note: state.note,
      occurredOn: state.occurredOn,
      occurredAt: DateTime.now(),
      transferGroupId: isTransfer ? (state.originalEntity?.transferGroupId) : null,
      hasSplit: state.originalEntity?.hasSplit ?? false,
      createdAt: state.originalEntity?.createdAt ?? DateTime.now(),
      updatedAt: state.mode == TransactionFormMode.edit ? DateTime.now() : null,
    );

    Either<Failure, TransactionEntity> result;
    if (state.mode == TransactionFormMode.create) {
      result = await _repository.createTransaction(entity);
    } else {
      result = await _repository.updateTransaction(entity);
    }

    result.fold(
      (l) => emit(state.copyWith(isSubmitting: false, errorMessage: l.message)),
      (r) => emit(state.copyWith(isSubmitting: false, isSuccess: true, originalEntity: r)),
    );
  }

  Future<void> _onDelete(
    DeleteTransaction event,
    Emitter<TransactionState> emit,
  ) async {
    if (state.mode != TransactionFormMode.edit || state.originalEntity?.transactionId == null) {
      return;
    }

    emit(state.copyWith(isSubmitting: true, clearError: true));
    final res = await _repository.deleteTransaction(state.originalEntity!.transactionId!);
    res.fold(
      (l) => emit(state.copyWith(isSubmitting: false, errorMessage: l.message)),
      (r) => emit(state.copyWith(isSubmitting: false, isSuccess: true, clearOriginal: true)),
    );
  }
}


