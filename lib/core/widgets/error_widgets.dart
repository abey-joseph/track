import 'package:flutter/material.dart';
import '../failures/failure.dart';
import '../failures/expense_failures.dart';
import '../services/logging_service.dart';

/// Reusable error widget that displays different types of failures
class FailureWidget extends StatelessWidget {
  final Failure failure;
  final VoidCallback? onRetry;
  final VoidCallback? onDismiss;
  final String? retryText;
  final String? dismissText;
  final bool showDetails;

  const FailureWidget({
    super.key,
    required this.failure,
    this.onRetry,
    this.onDismiss,
    this.retryText,
    this.dismissText,
    this.showDetails = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _getErrorColor(failure),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildErrorIcon(failure),
            const SizedBox(height: 12),
            _buildErrorMessage(failure),
            if (showDetails) ...[
              const SizedBox(height: 8),
              _buildErrorDetails(failure),
            ],
            const SizedBox(height: 16),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Color _getErrorColor(Failure failure) {
    if (failure is ValidationFailure) {
      return Colors.orange.shade50;
    } else if (failure is NetworkFailure) {
      return Colors.blue.shade50;
    } else if (failure is DatabaseFailure) {
      return Colors.red.shade50;
    } else if (failure is AuthFailure) {
      return Colors.purple.shade50;
    } else if (failure is NotFoundFailure) {
      return Colors.grey.shade50;
    } else if (failure is PermissionFailure) {
      return Colors.deepOrange.shade50;
    }
    return Colors.red.shade50;
  }

  Widget _buildErrorIcon(Failure failure) {
    IconData iconData;
    Color iconColor;

    if (failure is ValidationFailure) {
      iconData = Icons.warning_amber_rounded;
      iconColor = Colors.orange;
    } else if (failure is NetworkFailure) {
      iconData = Icons.wifi_off_rounded;
      iconColor = Colors.blue;
    } else if (failure is DatabaseFailure) {
      iconData = Icons.storage_rounded;
      iconColor = Colors.red;
    } else if (failure is AuthFailure) {
      iconData = Icons.lock_rounded;
      iconColor = Colors.purple;
    } else if (failure is NotFoundFailure) {
      iconData = Icons.search_off_rounded;
      iconColor = Colors.grey;
    } else if (failure is PermissionFailure) {
      iconData = Icons.block_rounded;
      iconColor = Colors.deepOrange;
    } else {
      iconData = Icons.error_rounded;
      iconColor = Colors.red;
    }

    return Icon(
      iconData,
      size: 48,
      color: iconColor,
    );
  }

  Widget _buildErrorMessage(Failure failure) {
    String title;
    String message;

    if (failure is ValidationFailure) {
      title = 'Validation Error';
      message = failure.message;
    } else if (failure is NetworkFailure) {
      title = 'Network Error';
      message = failure.message;
    } else if (failure is DatabaseFailure) {
      title = 'Database Error';
      message = failure.message;
    } else if (failure is AuthFailure) {
      title = 'Authentication Error';
      message = failure.message;
    } else if (failure is NotFoundFailure) {
      title = 'Not Found';
      message = failure.message;
    } else if (failure is PermissionFailure) {
      title = 'Permission Denied';
      message = failure.message;
    } else if (failure is AccountFailure) {
      title = 'Account Error';
      message = failure.message;
    } else if (failure is CategoryFailure) {
      title = 'Category Error';
      message = failure.message;
    } else if (failure is TransactionFailure) {
      title = 'Transaction Error';
      message = failure.message;
    } else if (failure is BudgetFailure) {
      title = 'Budget Error';
      message = failure.message;
    } else {
      title = 'Error';
      message = failure.message;
    }

    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          message,
          style: const TextStyle(fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildErrorDetails(Failure failure) {
    final details = <Widget>[];

    // Add error code
    if (failure.code != null) {
      details.add(
        _buildDetailRow('Error Code', failure.code!),
      );
    }

    // Add specific failure details
    if (failure is ValidationFailure && failure.fieldErrors != null) {
      details.add(
        _buildDetailRow('Field Errors', ''),
      );
      for (final entry in failure.fieldErrors!.entries) {
        details.add(
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: _buildDetailRow(entry.key, entry.value),
          ),
        );
      }
    } else if (failure is NetworkFailure && failure.statusCode != null) {
      details.add(
        _buildDetailRow('Status Code', failure.statusCode.toString()),
      );
    } else if (failure is AccountFailure) {
      if (failure.accountId != null) {
        details.add(_buildDetailRow('Account ID', failure.accountId!));
      }
      if (failure.accountName != null) {
        details.add(_buildDetailRow('Account Name', failure.accountName!));
      }
    } else if (failure is CategoryFailure) {
      if (failure.categoryId != null) {
        details.add(_buildDetailRow('Category ID', failure.categoryId!));
      }
      if (failure.categoryName != null) {
        details.add(_buildDetailRow('Category Name', failure.categoryName!));
      }
      if (failure.categoryType != null) {
        details.add(_buildDetailRow('Category Type', failure.categoryType!));
      }
    } else if (failure is TransactionFailure) {
      if (failure.transactionId != null) {
        details.add(_buildDetailRow('Transaction ID', failure.transactionId!));
      }
      if (failure.amount != null) {
        details.add(_buildDetailRow('Amount', failure.amount.toString()));
      }
    } else if (failure is BudgetFailure) {
      if (failure.limit != null) {
        details.add(_buildDetailRow('Budget Limit', failure.limit.toString()));
      }
      if (failure.current != null) {
        details.add(_buildDetailRow('Current Spending', failure.current.toString()));
      }
      if (failure.exceeded != null) {
        details.add(_buildDetailRow('Exceeded By', failure.exceeded.toString()));
      }
    }

    if (details.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: details,
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    final buttons = <Widget>[];

    if (onRetry != null) {
      buttons.add(
        Expanded(
          child: ElevatedButton(
            onPressed: onRetry,
            style: ElevatedButton.styleFrom(
              backgroundColor: _getErrorColor(failure).withOpacity(0.8),
            ),
            child: Text(retryText ?? 'Retry'),
          ),
        ),
      );
    }

    if (onDismiss != null) {
      if (buttons.isNotEmpty) {
        buttons.add(const SizedBox(width: 12));
      }
      buttons.add(
        Expanded(
          child: OutlinedButton(
            onPressed: onDismiss,
            child: Text(dismissText ?? 'Dismiss'),
          ),
        ),
      );
    }

    if (buttons.isEmpty) {
      return const SizedBox.shrink();
    }

    return Row(
      children: buttons,
    );
  }
}

/// Snackbar widget for displaying failures
class FailureSnackBar {
  static void show(
    BuildContext context,
    Failure failure, {
    VoidCallback? onRetry,
    Duration duration = const Duration(seconds: 4),
  }) {
    // Log the failure
    logger.logFailure(failure);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              _getFailureIcon(failure),
              color: Colors.white,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(failure.message),
            ),
          ],
        ),
        backgroundColor: _getFailureColor(failure),
        duration: duration,
        action: onRetry != null
            ? SnackBarAction(
                label: 'Retry',
                textColor: Colors.white,
                onPressed: onRetry,
              )
            : null,
      ),
    );
  }

  static IconData _getFailureIcon(Failure failure) {
    if (failure is ValidationFailure) return Icons.warning;
    if (failure is NetworkFailure) return Icons.wifi_off;
    if (failure is DatabaseFailure) return Icons.storage;
    if (failure is AuthFailure) return Icons.lock;
    if (failure is NotFoundFailure) return Icons.search_off;
    if (failure is PermissionFailure) return Icons.block;
    return Icons.error;
  }

  static Color _getFailureColor(Failure failure) {
    if (failure is ValidationFailure) return Colors.orange;
    if (failure is NetworkFailure) return Colors.blue;
    if (failure is DatabaseFailure) return Colors.red;
    if (failure is AuthFailure) return Colors.purple;
    if (failure is NotFoundFailure) return Colors.grey;
    if (failure is PermissionFailure) return Colors.deepOrange;
    return Colors.red;
  }
}

/// Loading widget with error handling
class LoadingWithErrorWidget extends StatelessWidget {
  final bool isLoading;
  final Failure? failure;
  final Widget child;
  final VoidCallback? onRetry;
  final String? loadingText;
  final bool showErrorDetails;

  const LoadingWithErrorWidget({
    super.key,
    required this.isLoading,
    this.failure,
    required this.child,
    this.onRetry,
    this.loadingText,
    this.showErrorDetails = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            if (loadingText != null) ...[
              const SizedBox(height: 16),
              Text(loadingText!),
            ],
          ],
        ),
      );
    }

    if (failure != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FailureWidget(
            failure: failure!,
            onRetry: onRetry,
            showDetails: showErrorDetails,
          ),
        ),
      );
    }

    return child;
  }
}

/// Error boundary widget for catching unexpected errors
class ErrorBoundary extends StatefulWidget {
  final Widget child;
  final Widget Function(Object error, StackTrace stackTrace)? errorBuilder;

  const ErrorBoundary({
    super.key,
    required this.child,
    this.errorBuilder,
  });

  @override
  State<ErrorBoundary> createState() => _ErrorBoundaryState();
}

class _ErrorBoundaryState extends State<ErrorBoundary> {
  Object? _error;
  StackTrace? _stackTrace;

  @override
  void initState() {
    super.initState();
    // Set up error handling
    FlutterError.onError = (FlutterErrorDetails details) {
      setState(() {
        _error = details.exception;
        _stackTrace = details.stack;
      });
      
      // Log the error
      logger.error(
        'Unexpected error in ErrorBoundary',
        error: details.exception,
        stackTrace: details.stack,
        context: {'widget': widget.runtimeType.toString()},
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      if (widget.errorBuilder != null) {
        return widget.errorBuilder!(_error!, _stackTrace!);
      }
      
      return FailureWidget(
        failure: UnknownFailure(
          'An unexpected error occurred',
          cause: _error,
          stackTrace: _stackTrace,
        ),
        onRetry: () {
          setState(() {
            _error = null;
            _stackTrace = null;
          });
        },
        showDetails: true,
      );
    }

    return widget.child;
  }
}
