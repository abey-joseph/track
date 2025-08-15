import 'package:flutter/material.dart';
import 'package:track/features/expense/domain/entities/transaction_entity.dart';

class TransactionIconHelper {
  static IconData getIconForTransaction(TransactionEntity transaction, String? categoryIcon) {
    // If category has a specific icon, try to map it
    if (categoryIcon != null && categoryIcon.isNotEmpty) {
      return _mapStringToIcon(categoryIcon);
    }

    // Default icons based on transaction type
    switch (transaction.type) {
      case TransactionType.expense:
        return Icons.arrow_downward;
      case TransactionType.income:
        return Icons.arrow_upward;
      case TransactionType.transfer:
        return Icons.swap_horiz;
    }
  }

  static Color getColorForTransaction(TransactionEntity transaction, BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    switch (transaction.type) {
      case TransactionType.expense:
        return Colors.red;
      case TransactionType.income:
        return Colors.green;
      case TransactionType.transfer:
        return colorScheme.primary;
    }
  }

  static IconData _mapStringToIcon(String iconName) {
    switch (iconName.toLowerCase()) {
      case 'restaurant':
        return Icons.restaurant;
      case 'directions_car':
        return Icons.directions_car;
      case 'shopping_bag':
        return Icons.shopping_bag;
      case 'movie':
        return Icons.movie;
      case 'work':
        return Icons.work;
      case 'laptop':
        return Icons.laptop;
      case 'local_grocery_store':
        return Icons.local_grocery_store;
      case 'directions_bus':
        return Icons.directions_bus;
      case 'attach_money':
        return Icons.attach_money;
      default:
        return Icons.category;
    }
  }

  static String formatAmount(double amount, {bool showSign = true}) {
    final absAmount = amount.abs();
    final formatted = '\$${absAmount.toStringAsFixed(2)}';
    
    if (!showSign) return formatted;
    
    if (amount >= 0) {
      return '+$formatted';
    } else {
      return '-$formatted';
    }
  }

  static String formatDateTime(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final transactionDate = DateTime(dateTime.year, dateTime.month, dateTime.day);
    
    if (transactionDate == today) {
      return 'Today • ${_formatTime(dateTime)}';
    } else if (transactionDate == yesterday) {
      return 'Yesterday • ${_formatTime(dateTime)}';
    } else {
      return '${_formatDate(dateTime)} • ${_formatTime(dateTime)}';
    }
  }

  static String _formatTime(DateTime dateTime) {
    final hour = dateTime.hour;
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    
    return '$displayHour:$minute $period';
  }

  static String _formatDate(DateTime dateTime) {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    
    return '${months[dateTime.month - 1]} ${dateTime.day}';
  }
}
