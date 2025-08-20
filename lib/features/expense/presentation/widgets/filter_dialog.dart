import 'package:flutter/material.dart';

import 'package:track/features/expense/domain/entities/helper_classes/account_details_helpers.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  late DateRange _selectedDateRange;
  late TransactionFlow _selectedFlow;
  DateTime? _customStartDate;
  DateTime? _customEndDate;

  @override
  void initState() {
    super.initState();
    _selectedDateRange = DateRange.all;
    _selectedFlow = TransactionFlow.all;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return AlertDialog(
      title: Text('Filter Transactions', style: theme.textTheme.titleLarge),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date Range Section
            Text('Date Range', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: DateRange.values.map((range) {
                return FilterChip(
                  label: Text(_getDateRangeLabel(range)),
                  selected: _selectedDateRange == range,
                  onSelected: (selected) {
                    setState(() {
                      _selectedDateRange = range;
                      if (range != DateRange.custom) {
                        _customStartDate = null;
                        _customEndDate = null;
                      }
                    });
                  },
                );
              }).toList(),
            ),
            
            // Custom Date Range
            if (_selectedDateRange == DateRange.custom) ...[
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextButton.icon(
                      onPressed: () => _selectDate(context, true),
                      icon: const Icon(Icons.calendar_today),
                      label: Text(_customStartDate == null 
                        ? 'Start Date' 
                        : '${_customStartDate!.day}/${_customStartDate!.month}/${_customStartDate!.year}'),
                    ),
                  ),
                  const Text('to'),
                  Expanded(
                    child: TextButton.icon(
                      onPressed: () => _selectDate(context, false),
                      icon: const Icon(Icons.calendar_today),
                      label: Text(_customEndDate == null 
                        ? 'End Date' 
                        : '${_customEndDate!.day}/${_customEndDate!.month}/${_customEndDate!.year}'),
                    ),
                  ),
                ],
              ),
            ],
            
            const SizedBox(height: 24),
            
            // Flow Section
            Text('Flow', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: TransactionFlow.values.map((flow) {
                return FilterChip(
                  label: Text(_getFlowLabel(flow)),
                  selected: _selectedFlow == flow,
                  onSelected: (selected) {
                    setState(() {
                      _selectedFlow = flow;
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => _resetFilters(),
          child: const Text('Reset'),
        ),
        FilledButton(
          onPressed: () => _applyFilters(),
          child: const Text('Apply'),
        ),
      ],
    );
  }

  String _getDateRangeLabel(DateRange range) {
    switch (range) {
      case DateRange.all:
        return 'All Time';
      case DateRange.today:
        return 'Today';
      case DateRange.thisWeek:
        return 'This Week';
      case DateRange.thisMonth:
        return 'This Month';
      case DateRange.custom:
        return 'Custom';
    }
  }

  String _getFlowLabel(TransactionFlow flow) {
    switch (flow) {
      case TransactionFlow.all:
        return 'All';
      case TransactionFlow.incoming:
        return 'Incoming';
      case TransactionFlow.outgoing:
        return 'Outgoing';
    }
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final initialDate = isStartDate 
      ? (_customStartDate ?? DateTime.now().subtract(const Duration(days: 30)))
      : (_customEndDate ?? DateTime.now());
    
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    
    if (selectedDate != null) {
      setState(() {
        if (isStartDate) {
          _customStartDate = selectedDate;
          // Ensure end date is after start date
          if (_customEndDate != null && _customEndDate!.isBefore(selectedDate)) {
            _customEndDate = null;
          }
        } else {
          _customEndDate = selectedDate;
        }
      });
    }
  }

  void _resetFilters() {
    setState(() {
      _selectedDateRange = DateRange.all;
      _selectedFlow = TransactionFlow.all;
      _customStartDate = null;
      _customEndDate = null;
    });
  }

  void _applyFilters() {
    final filter = AccountFilter(
      dateRange: _selectedDateRange,
      flow: _selectedFlow,
      customStartDate: _customStartDate,
      customEndDate: _customEndDate,
    );
    
    Navigator.of(context).pop(filter);
  }
}
