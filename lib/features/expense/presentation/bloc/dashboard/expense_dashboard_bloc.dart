import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:track/core/services/logging_service.dart';

part 'expense_dashboard_event.dart';
part 'expense_dashboard_state.dart';
part 'expense_dashboard_bloc.freezed.dart';

class ExpenseDashboardBloc
    extends Bloc<ExpenseDashboardEvent, ExpenseDashboardState> {
  ExpenseDashboardBloc() : super(expenseDashboardInitialState()) {
    on<ExpenseDashboardEvent>((event, emit) {
      logger.info('ExpenseDashboardEvent received: ${event.runtimeType}', tag: 'ExpenseDashboardBloc');
      // No complex logic here yet, but you can add logging for specific event types
    });
  }
}
