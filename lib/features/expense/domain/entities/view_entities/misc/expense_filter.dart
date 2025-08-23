import 'package:injectable/injectable.dart';

enum DateRange { all, today, thisWeek, thisMonth, custom }

enum TransactionFlow { all, incoming, outgoing }

@lazySingleton
class AccountFilter {
  DateRange _dateRange;
  TransactionFlow _flow;
  DateTime? _customStartDate;
  DateTime? _customEndDate;

  AccountFilter()
      : _dateRange = DateRange.all,
        _flow = TransactionFlow.all,
        _customStartDate = null,
        _customEndDate = null;

  DateRange get dateRange => _dateRange;
  TransactionFlow get flow => _flow;
  DateTime? get customStartDate => _customStartDate;
  DateTime? get customEndDate => _customEndDate;

  AccountFilter copyWith({
    DateRange? dateRange,
    TransactionFlow? flow,
    DateTime? customStartDate,
    DateTime? customEndDate,
  }) {
    return AccountFilter()
      .._dateRange = dateRange ?? this.dateRange
      .._flow = flow ?? this.flow
      .._customStartDate = customStartDate ?? this.customStartDate
      .._customEndDate = customEndDate ?? this.customEndDate;
  }

  void reset() {
    _dateRange = DateRange.all;
    _flow = TransactionFlow.all;
    _customStartDate = null;
    _customEndDate = null;
  }

  void update(AccountFilter filter) {
    _dateRange = filter.dateRange;
    _flow = filter.flow;
    _customStartDate = filter.customStartDate;
    _customEndDate = filter.customEndDate;
  }

  @override
  String toString() {
    return 'AccountFilter(dateRange: $dateRange, flow: $flow, customStartDate: $customStartDate, customEndDate: $customEndDate)';
  }
}
