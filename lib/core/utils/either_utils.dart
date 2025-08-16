import 'package:dartz/dartz.dart';
import '../failures/failure.dart';

/// Utility class for working with Either and Failure
class EitherUtils {
  /// Creates a Left with a Failure
  static Either<Failure, T> left<T>(Failure failure) => Left(failure);
  
  /// Creates a Right with success data
  static Either<Failure, T> right<T>(T data) => Right(data);
  
  /// Handles Either result and returns appropriate UI message
  static String getMessage(Either<Failure, dynamic> result) {
    return result.fold(
      (failure) => failure.message,
      (success) => 'Success',
    );
  }
  
  /// Extracts data from Either, returns null if Left
  static T? getData<T>(Either<Failure, T> result) {
    return result.fold(
      (failure) => null,
      (data) => data,
    );
  }
  
  /// Checks if Either is a success (Right)
  static bool isSuccess(Either<Failure, dynamic> result) {
    return result.isRight();
  }
  
  /// Checks if Either is a failure (Left)
  static bool isFailure(Either<Failure, dynamic> result) {
    return result.isLeft();
  }
}

/// Extension methods for Either<Failure, T>
extension EitherFailureExtension<T> on Either<Failure, T> {
  /// Gets the failure message if Left, otherwise returns default message
  String get message => fold(
    (failure) => failure.message,
    (data) => 'Success',
  );
  
  /// Gets the failure code if Left, otherwise returns null
  String? get failureCode => fold(
    (failure) => failure.code,
    (data) => null,
  );
  
  /// Gets the data if Right, otherwise returns null
  T? get data => fold(
    (failure) => null,
    (data) => data,
  );
  
  /// Executes a function if Right, otherwise does nothing
  void onSuccess(void Function(T data) onData) {
    fold(
      (failure) => null,
      (data) => onData(data),
    );
  }
  
  /// Executes a function if Left, otherwise does nothing
  void onFailure(void Function(Failure failure) onFailure) {
    fold(
      (failure) => onFailure(failure),
      (data) => null,
    );
  }
}
