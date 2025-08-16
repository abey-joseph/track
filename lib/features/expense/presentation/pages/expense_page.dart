import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:track/core/use_cases/widgets/titile_action_button.dart';
import 'package:track/features/expense/domain/entities/account_entity.dart';
import 'package:track/features/expense/domain/entities/transaction_entity.dart';
import 'package:track/features/expense/presentation/bloc/dashboard/expense_dashboard_bloc.dart';
import 'package:track/features/expense/presentation/widgets/misc/app_bar_widget.dart';
import 'package:track/features/expense/presentation/widgets/skeletons/tile_skeleton.dart';
import 'package:track/features/expense/presentation/widgets/tiles/account_balence_tile.dart';
import 'package:track/features/expense/presentation/widgets/tiles/account_details_tile.dart';
import 'package:track/features/expense/presentation/widgets/tiles/loading_tile.dart';
import 'package:track/features/expense/presentation/widgets/tiles/recent_trx_tile.dart';
import 'package:track/features/expense/presentation/widgets/tiles/today_txn_tile.dart';

class ExpensePage extends StatelessWidget {
  const ExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          toolbarHeight: 70,
          expandedHeight: 200,
          title: Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 20),
            child: Text("Expenses"),
          ),
          centerTitle: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 19.0, top: 15),
              child: titleActionButton(
                  icon: Icons.table_chart_outlined,
                  onTap: () {
                    context.push('/transactions');
                  }),
            ),
            // Padding(
            //     padding: const EdgeInsets.only(right: 19.0, top: 15),
            //     child: OptionsMenu())
          ],
          flexibleSpace: AppBarWidgetExpense(),
        ),

        // Recent transaction tile
        SliverToBoxAdapter(
          child: TileSkeleton(
            child: BlocBuilder<ExpenseDashboardBloc, ExpenseDashboardState>(
              buildWhen: (previous, current) =>
                  (current is expenseDashboardLoadedState ||
                      current is recentTxnState ||
                      current is expenseDashboardLoadingState),
              builder: (context, state) {
                List<TransactionEntity> transactions =
                    (state is expenseDashboardLoadedState)
                        ? state.recentTransactions
                        : (state is recentTxnState)
                            ? state.recentTransactions
                            : [];
                int dayCount = (state is expenseDashboardLoadedState)
                    ? state.dayCount
                    : (state is recentTxnState)
                        ? state.dayCount
                        : 0;
                int txnCount = (state is expenseDashboardLoadedState)
                    ? state.txnCount
                    : (state is recentTxnState)
                        ? state.txnCount
                        : 0;
                if (state is expenseDashboardLoadingState) {
                  return LoadingTile();
                }

                return RecentTransactionTile(
                  transactions: transactions, // Will be populated from bloc
                  dayCount: dayCount,
                  txnCount: txnCount,
                );
              },
            ),
          ),
        ),

        // account details tile
        SliverToBoxAdapter(
          child: TileSkeleton(
            child: BlocBuilder<ExpenseDashboardBloc, ExpenseDashboardState>(
              buildWhen: (previous, current) =>
                  (current is expenseDashboardLoadedState ||
                      current is expenseDashboardLoadingState),
              builder: (context, state) {
                AccountEntity account =
                    (state is expenseDashboardLoadedState)
                        ? state.account
                        : AccountEntity(
                            uid: '1',
                            name: 'Main Account',
                            type: AccountType.bank,
                            currency: '\$',
                            createdAt: DateTime.now(),
                          );
                List<TransactionEntity> transactions =
                    (state is expenseDashboardLoadedState)
                        ? state.accountTransactions
                        : [];
                if (state is expenseDashboardLoadingState) {
                  return LoadingTile();
                }

                return AccountDetailsTile(
                  account: account,
                  transactions: transactions, // Will be populated from bloc
                );
              },
            ),
          ),
        ),

        //tile for account balence
        SliverToBoxAdapter(
          child: TileSkeleton(child: AccountBalancesTileContent()),
        ),

        //today transaxctions
        SliverToBoxAdapter(
          child: TileSkeleton(child: TodayTxnTile()),
        ),

        // budget tile (implement later)

        SliverToBoxAdapter(
          child: SizedBox(
            height: 75,
          ),
        )
      ],
    ));
  }
}
