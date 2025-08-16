# Either<Failure, T> Implementation Summary

This document summarizes the complete implementation of the `Either<Failure, T>` pattern across all layers of your Flutter expense tracking application.

## 🎯 What Was Implemented

The `Either<Failure, T>` pattern has been successfully implemented across:
- ✅ **Repository Interfaces** - All methods now return `Either<Failure, T>`
- ✅ **Repository Implementations** - Proper error handling with specific failure types
- ✅ **Use Cases** - All use cases now return `Either<Failure, T>`
- ✅ **BLoCs** - Event handlers now properly handle Either results
- ✅ **Utility Classes** - Helper methods for working with Either

## 📦 Dependencies Added

```yaml
dependencies:
  dartz: ^0.10.1  # Provides Either type
```

## 🏗️ Architecture Changes

### 1. Repository Layer

#### Before (Old Pattern)
```dart
abstract class ExpenseRepository {
  Future<List<AccountEntity>> getAccounts({required String uid});
  Future<void> addAccount({required AccountEntity account});
}
```

#### After (New Pattern)
```dart
abstract class ExpenseRepository {
  Future<Either<Failure, List<AccountEntity>>> getAccounts({required String uid});
  Future<Either<Failure, void>> addAccount({required AccountEntity account});
}
```

### 2. Use Case Layer

#### Before
```dart
class GetAccounts {
  Future<List<AccountEntity>> call({required String uid}) => 
      _repo.getAccounts(uid: uid);
}
```

#### After
```dart
class GetAccounts {
  Future<Either<Failure, List<AccountEntity>>> call({required String uid}) => 
      _repo.getAccounts(uid: uid);
}
```

### 3. BLoC Layer

#### Before
```dart
Future<void> _onLoad(_AccountsLoad event, Emitter<AccountsState> emit) async {
  try {
    final items = await _getAccounts.call(uid: event.uid);
    emit(AccountsState.loaded(items));
  } catch (e) {
    emit(AccountsState.failure(e.toString()));
  }
}
```

#### After
```dart
Future<void> _onLoad(_AccountsLoad event, Emitter<AccountsState> emit) async {
  final result = await _getAccounts.call(uid: event.uid);
  
  result.fold(
    (failure) {
      emit(AccountsState.failure(failure.message));
      print('Accounts load failed: ${failure.message}, Code: ${failure.code}');
    },
    (accounts) {
      emit(AccountsState.loaded(accounts));
    },
  );
}
```

## 🔧 Utility Classes Created

### `EitherUtils` Class
```dart
class EitherUtils {
  static Either<Failure, T> left<T>(Failure failure) => Left(failure);
  static Either<Failure, T> right<T>(T data) => Right(data);
  static String getMessage(Either<Failure, dynamic> result);
  static T? getData<T>(Either<Failure, T> result);
  static bool isSuccess(Either<Failure, dynamic> result);
  static bool isFailure(Either<Failure, dynamic> result);
}
```

### Extension Methods
```dart
extension EitherFailureExtension<T> on Either<Failure, T> {
  String get message;
  String? get failureCode;
  T? get data;
  void onSuccess(void Function(T data) onData);
  void onFailure(void Function(Failure failure) onFailure);
}
```

## 🚨 Failure Types Available

### 1. **DatabaseFailure**
- Used for database operation failures
- Includes original exception and stack trace
- Code: `db/error`

### 2. **ValidationFailure**
- Used for input validation errors
- Includes field-specific error messages
- Code: `validation/error`

### 3. **NetworkFailure**
- Used for network/API failures
- Includes HTTP status codes
- Code: `network/error`

### 4. **AuthFailure**
- Used for authentication failures
- Code: `auth/error`

### 5. **NotFoundFailure**
- Used when resources are not found
- Code: `common/not_found`

### 6. **PermissionFailure**
- Used for permission/access control failures
- Code: `permission/error`

### 7. **UnknownFailure**
- Used for unexpected errors
- Includes original exception and stack trace
- Code: `unknown`

## 📁 Files Modified

### Repository Interfaces
- `lib/features/expense/domain/repo/expense_repository.dart`
- `lib/features/expense/domain/repo/accounts_repository.dart`
- `lib/features/expense/domain/repo/categories_repository.dart`

### Repository Implementations
- `lib/features/expense/data/repo/expense_repository_impl.dart`
- `lib/features/expense/data/repo/accounts_repository_impl.dart`
- `lib/features/expense/data/repo/categories_repository_impl.dart`

### Use Cases
- `lib/features/expense/domain/use_cases/get_transactions.dart`
- `lib/features/expense/domain/use_cases/get_accounts.dart`
- `lib/features/expense/domain/use_cases/get_categories.dart`
- `lib/features/expense/domain/use_cases/modify_account.dart`
- `lib/features/expense/domain/use_cases/modify_category.dart`
- `lib/features/expense/domain/use_cases/modify_transaction.dart`

### BLoCs
- `lib/features/expense/presentation/bloc/accounts/accounts_bloc.dart`
- `lib/features/expense/presentation/bloc/categories/categories_bloc.dart`
- `lib/features/expense/presentation/bloc/transactions/transactions_bloc.dart`

### Utility Classes
- `lib/core/utils/either_utils.dart`
- `lib/core/utils/either_test.dart`

## 🎯 Key Benefits

### 1. **Type Safety**
- Compile-time error handling
- No more runtime exceptions from unhandled errors

### 2. **Explicit Error Handling**
- Forces developers to handle both success and failure cases
- Clear separation of concerns

### 3. **Rich Error Information**
- Access to error codes, causes, and stack traces
- Better debugging and user experience

### 4. **Functional Programming**
- Clean, composable error handling
- Easy to chain operations

### 5. **Testing**
- Simple to test both success and failure scenarios
- Mock failures easily

## 🔄 Usage Patterns

### Basic Usage
```dart
final result = await repository.getData();
result.fold(
  (failure) {
    // Handle error
    print('Error: ${failure.message}');
    print('Code: ${failure.code}');
  },
  (data) {
    // Handle success
    print('Data: $data');
  },
);
```

### Using Extension Methods
```dart
if (result.isRight()) {
  final data = result.data;
  print('Success: $data');
} else {
  print('Error: ${result.message}');
  print('Code: ${result.failureCode}');
}
```

### Using Callbacks
```dart
result.onSuccess((data) {
  print('Success: $data');
});

result.onFailure((failure) {
  print('Error: ${failure.message}');
});
```

## 🧪 Testing

Run the test file to verify implementation:
```bash
dart run lib/core/utils/either_test.dart
```

Expected output shows all failure types working correctly with proper error codes and messages.

## 🚀 Next Steps

### 1. **Update Remaining BLoCs**
- Check if there are other BLoCs that need updating
- Ensure all event handlers use the Either pattern

### 2. **Add More Specific Failure Types**
- Create domain-specific failure types if needed
- Add more granular error codes

### 3. **UI Error Handling**
- Update UI components to handle failure states
- Show user-friendly error messages
- Add retry mechanisms

### 4. **Logging and Monitoring**
- Integrate with logging service
- Add analytics for failure tracking
- Monitor error patterns

## 📚 Best Practices

### 1. **Always Use Either for Repository Methods**
```dart
// ✅ Good
Future<Either<Failure, List<User>>> getUsers();

// ❌ Bad
Future<List<User>> getUsers();
```

### 2. **Handle Errors in Use Cases**
```dart
final result = await repository.getUsers();
return result.fold(
  (failure) => EitherUtils.left(failure),
  (users) => EitherUtils.right(users),
);
```

### 3. **Use Specific Failure Types**
```dart
if (email.isEmpty) {
  return EitherUtils.left(
    ValidationFailure('Email is required', fieldErrors: {'email': 'Required'})
  );
}
```

### 4. **Log Failure Details**
```dart
result.fold(
  (failure) {
    print('Operation failed: ${failure.message}');
    print('Code: ${failure.code}');
    if (failure.cause != null) {
      print('Cause: ${failure.cause}');
    }
  },
  (data) => print('Success: $data'),
);
```

## 🎉 Conclusion

The `Either<Failure, T>` pattern has been successfully implemented across your entire expense tracking application. This provides:

- **Robust error handling** throughout the application
- **Type-safe operations** with compile-time error checking
- **Rich error information** for debugging and user experience
- **Clean, maintainable code** following functional programming principles
- **Easy testing** of both success and failure scenarios

Your application now follows clean architecture principles with proper error handling at every layer!
