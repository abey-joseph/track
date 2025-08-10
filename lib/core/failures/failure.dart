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
    super.message, {
    this.statusCode,
    String? code,
    super.cause,
    super.stackTrace,
  }) : super(
          code: code ?? 'network/error',
        );
}

class ValidationFailure extends Failure {
  final Map<String, String>? fieldErrors; // e.g. {'email': 'Invalid email'}
  const ValidationFailure(
    super.message, {
    this.fieldErrors,
    String? code,
    super.cause,
    super.stackTrace,
  }) : super(
          code: code ?? 'validation/error',
        );
}

class AuthFailure extends Failure {
  const AuthFailure(
    super.message, {
    String? code,
    super.cause,
    super.stackTrace,
  }) : super(
          code: code ?? 'auth/error',
        );
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(
    super.message, {
    String? code,
    super.cause,
    super.stackTrace,
  }) : super(
          code: code ?? 'db/error',
        );
}

class NotFoundFailure extends Failure {
  const NotFoundFailure(
    super.message, {
    String? code,
    super.cause,
    super.stackTrace,
  }) : super(
          code: code ?? 'common/not_found',
        );
}

class PermissionFailure extends Failure {
  const PermissionFailure(
    super.message, {
    String? code,
    super.cause,
    super.stackTrace,
  }) : super(
          code: code ?? 'permission/error',
        );
}

class UnknownFailure extends Failure {
  const UnknownFailure(
    super.message, {
    String? code,
    super.cause,
    super.stackTrace,
  }) : super(
          code: code ?? 'unknown',
        );
}
