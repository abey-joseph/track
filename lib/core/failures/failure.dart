// A single, project-wide Failure hierarchy for clean architecture layers.
// Keeps UI-safe messages and machine-readable codes while preserving the root cause.

/// Base Failure used across layers.
///
/// [message]  – human-friendly explanation (safe to show in UI)
/// [code]     – short machine-readable code (e.g. 'network/timeout')
/// [cause]    – original exception/object (for logging only)
/// [stackTrace] – where it happened (for logging/analytics)
abstract class Failure {
  final String message;
  final String? code;
  final Object? cause;
  final StackTrace? stackTrace;

  const Failure(
    this.message, {
    this.code,
    this.cause,
    this.stackTrace,
  });
}

// --- Common, focused Failure types ---

class NetworkFailure extends Failure {
  final int? statusCode; // HTTP status or similar
  const NetworkFailure(
    String message, {
    this.statusCode,
    String? code,
    Object? cause,
    StackTrace? stackTrace,
  }) : super(
          message,
          code: code ?? 'network/error',
          cause: cause,
          stackTrace: stackTrace,
        );
}

class ValidationFailure extends Failure {
  final Map<String, String>? fieldErrors; // e.g. {'email': 'Invalid email'}
  const ValidationFailure(
    String message, {
    this.fieldErrors,
    String? code,
    Object? cause,
    StackTrace? stackTrace,
  }) : super(
          message,
          code: code ?? 'validation/error',
          cause: cause,
          stackTrace: stackTrace,
        );
}

class AuthFailure extends Failure {
  const AuthFailure(
    String message, {
    String? code,
    Object? cause,
    StackTrace? stackTrace,
  }) : super(
          message,
          code: code ?? 'auth/error',
          cause: cause,
          stackTrace: stackTrace,
        );
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(
    String message, {
    String? code,
    Object? cause,
    StackTrace? stackTrace,
  }) : super(
          message,
          code: code ?? 'db/error',
          cause: cause,
          stackTrace: stackTrace,
        );
}

class NotFoundFailure extends Failure {
  const NotFoundFailure(
    String message, {
    String? code,
    Object? cause,
    StackTrace? stackTrace,
  }) : super(
          message,
          code: code ?? 'common/not_found',
          cause: cause,
          stackTrace: stackTrace,
        );
}

class PermissionFailure extends Failure {
  const PermissionFailure(
    String message, {
    String? code,
    Object? cause,
    StackTrace? stackTrace,
  }) : super(
          message,
          code: code ?? 'permission/error',
          cause: cause,
          stackTrace: stackTrace,
        );
}

class UnknownFailure extends Failure {
  const UnknownFailure(
    String message, {
    String? code,
    Object? cause,
    StackTrace? stackTrace,
  }) : super(
          message,
          code: code ?? 'unknown',
          cause: cause,
          stackTrace: stackTrace,
        );
}
