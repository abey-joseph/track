import 'dart:developer' as developer;
import '../failures/failure.dart';
import '../failures/expense_failures.dart';

/// Logging levels for different types of messages
enum LogLevel {
  debug,
  info,
  warning,
  error,
  critical,
}

/// Comprehensive logging service for the expense tracking application
class LoggingService {
  static final LoggingService _instance = LoggingService._internal();
  factory LoggingService() => _instance;
  LoggingService._internal();

  /// Log a general message
  void log(
    String message, {
    LogLevel level = LogLevel.info,
    String? tag,
    Object? error,
    StackTrace? stackTrace,
    Map<String, dynamic>? context,
  }) {
    final timestamp = DateTime.now().toIso8601String();
    final levelString = level.name.toUpperCase();
    final tagString = tag != null ? '[$tag]' : '';
    
    final logMessage = '$timestamp $levelString $tagString $message';
    
    switch (level) {
      case LogLevel.debug:
        developer.log(logMessage, name: 'TrackApp', level: 500);
        break;
      case LogLevel.info:
        developer.log(logMessage, name: 'TrackApp', level: 800);
        break;
      case LogLevel.warning:
        developer.log(logMessage, name: 'TrackApp', level: 900);
        break;
      case LogLevel.error:
        developer.log(logMessage, name: 'TrackApp', level: 1000, error: error, stackTrace: stackTrace);
        break;
      case LogLevel.critical:
        developer.log(logMessage, name: 'TrackApp', level: 1200, error: error, stackTrace: stackTrace);
        break;
    }
    
    // Add context information if provided
    if (context != null && context.isNotEmpty) {
      developer.log('Context: $context', name: 'TrackApp');
    }
  }

  /// Log a debug message
  void debug(String message, {String? tag, Map<String, dynamic>? context}) {
    log(message, level: LogLevel.debug, tag: tag, context: context);
  }

  /// Log an info message
  void info(String message, {String? tag, Map<String, dynamic>? context}) {
    log(message, level: LogLevel.info, tag: tag, context: context);
  }

  /// Log a warning message
  void warning(String message, {String? tag, Object? error, Map<String, dynamic>? context}) {
    log(message, level: LogLevel.warning, tag: tag, error: error, context: context);
  }

  /// Log an error message
  void error(String message, {String? tag, Object? error, StackTrace? stackTrace, Map<String, dynamic>? context}) {
    log(message, level: LogLevel.error, tag: tag, error: error, stackTrace: stackTrace, context: context);
  }

  /// Log a critical message
  void critical(String message, {String? tag, Object? error, StackTrace? stackTrace, Map<String, dynamic>? context}) {
    log(message, level: LogLevel.critical, tag: tag, error: error, stackTrace: stackTrace, context: context);
  }

  /// Log a failure with detailed information
  void logFailure(
    Failure failure, {
    String? operation,
    String? userId,
    Map<String, dynamic>? context,
  }) {
    final failureContext = <String, dynamic>{
      'operation': operation,
      'userId': userId,
      'failureType': failure.runtimeType.toString(),
      'failureCode': failure.code,
      'failureMessage': failure.message,
      if (failure.cause != null) 'cause': failure.cause.toString(),
      if (failure.stackTrace != null) 'stackTrace': failure.stackTrace.toString(),
      ...?context,
    };

    // Add specific failure type information
    if (failure is AccountFailure) {
      failureContext['accountId'] = failure.accountId;
      failureContext['accountName'] = failure.accountName;
    } else if (failure is CategoryFailure) {
      failureContext['categoryId'] = failure.categoryId;
      failureContext['categoryName'] = failure.categoryName;
      failureContext['categoryType'] = failure.categoryType;
    } else if (failure is TransactionFailure) {
      failureContext['transactionId'] = failure.transactionId;
      failureContext['accountId'] = failure.accountId;
      failureContext['categoryId'] = failure.categoryId;
      failureContext['amount'] = failure.amount;
    } else if (failure is BudgetFailure) {
      failureContext['budgetId'] = failure.budgetId;
      failureContext['categoryId'] = failure.categoryId;
      failureContext['limit'] = failure.limit;
      failureContext['current'] = failure.current;
      failureContext['exceeded'] = failure.exceeded;
    } else if (failure is NetworkFailure) {
      failureContext['statusCode'] = failure.statusCode;
    } else if (failure is ValidationFailure) {
      failureContext['fieldErrors'] = failure.fieldErrors;
    }

    // Log the failure
    error(
      'Operation failed: ${failure.message}',
      tag: 'Failure',
      error: failure.cause,
      stackTrace: failure.stackTrace,
      context: failureContext,
    );
  }

  /// Log a successful operation
  void logSuccess(
    String operation, {
    String? userId,
    Map<String, dynamic>? context,
  }) {
    final successContext = <String, dynamic>{
      'operation': operation,
      'userId': userId,
      'status': 'success',
      'timestamp': DateTime.now().toIso8601String(),
      ...?context,
    };

    info(
      'Operation completed successfully: $operation',
      tag: 'Success',
      context: successContext,
    );
  }

  /// Log performance metrics
  void logPerformance(
    String operation, {
    required Duration duration,
    String? userId,
    Map<String, dynamic>? context,
  }) {
    final performanceContext = <String, dynamic>{
      'operation': operation,
      'userId': userId,
      'durationMs': duration.inMilliseconds,
      'durationMicros': duration.inMicroseconds,
      ...?context,
    };

    if (duration.inMilliseconds > 1000) {
      warning(
        'Slow operation detected: $operation took ${duration.inMilliseconds}ms',
        tag: 'Performance',
        context: performanceContext,
      );
    } else {
      debug(
        'Operation completed: $operation took ${duration.inMilliseconds}ms',
        tag: 'Performance',
        context: performanceContext,
      );
    }
  }

  /// Log user actions for analytics
  void logUserAction(
    String action, {
    String? userId,
    String? screen,
    Map<String, dynamic>? parameters,
  }) {
    final actionContext = <String, dynamic>{
      'action': action,
      'userId': userId,
      'screen': screen,
      'timestamp': DateTime.now().toIso8601String(),
      if (parameters != null) 'parameters': parameters,
    };

    info(
      'User action: $action',
      tag: 'UserAction',
      context: actionContext,
    );
  }

  /// Log database operations
  void logDatabaseOperation(
    String operation, {
    String? table,
    String? userId,
    Map<String, dynamic>? parameters,
    Duration? duration,
  }) {
    final dbContext = <String, dynamic>{
      'operation': operation,
      'table': table,
      'userId': userId,
      if (parameters != null) 'parameters': parameters,
      if (duration != null) 'durationMs': duration.inMilliseconds,
    };

    info(
      'Database operation: $operation${table != null ? ' on $table' : ''}',
      tag: 'Database',
      context: dbContext,
    );
  }

  /// Log network operations
  void logNetworkOperation(
    String operation, {
    String? endpoint,
    int? statusCode,
    Duration? duration,
    String? userId,
    Map<String, dynamic>? parameters,
  }) {
    final networkContext = <String, dynamic>{
      'operation': operation,
      'endpoint': endpoint,
      'statusCode': statusCode,
      'userId': userId,
      if (duration != null) 'durationMs': duration.inMilliseconds,
      if (parameters != null) 'parameters': parameters,
    };

    if (statusCode != null && statusCode >= 400) {
      warning(
        'Network operation failed: $operation - Status: $statusCode',
        tag: 'Network',
        context: networkContext,
      );
    } else {
      info(
        'Network operation: $operation${endpoint != null ? ' to $endpoint' : ''}',
        tag: 'Network',
        context: networkContext,
      );
    }
  }
}

/// Global instance of the logging service
final logger = LoggingService();
