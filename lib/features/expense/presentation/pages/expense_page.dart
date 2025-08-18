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
import 'package:track/features/expense/domain/repo/dashboard_repository.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});

  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // Initial fetch when the page is first created
    _refresh();
  }

  @override
  void didUpdateWidget(covariant ExpensePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If this widget gets rebuilt by the parent (e.g., tab switch, setState upstream),
    // refresh the dashboard so the data stays current.
    _refresh();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Refresh when returning to the app (e.g., after backgrounding)
    if (state == AppLifecycleState.resumed) {
      _refresh();
    }
  }

  void _refresh() {
    // Safe to read in initState when BlocProvider is above this widget.
    context.read<ExpenseDashboardBloc>().add(
          const ExpenseDashboardEvent.fetchAllSummary(),
        );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            expandedHeight: 200,
            title: const Padding(
              padding: EdgeInsets.only(left: 12.0, top: 20),
              child: Text("Expenses"),
            ),
            centerTitle: false,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 19.0, top: 15),
                child: titleActionButton(
                  icon: Icons.table_chart_outlined,
                  onTap: () async {
                    await context.push('/transactions');
                    if (!mounted) return;
                    _refresh();
                  },
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 19.0, top: 15),
              //   child: OptionsMenu(),
              // )
            ],
            flexibleSpace: const AppBarWidgetExpense(),
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
                    return const LoadingTile();
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
                        current is expenseDashboardLoadingState || current is accountDetailsState),
                builder: (context, state) {
                  
                  AccountEntity account = (state is expenseDashboardLoadedState)
                      ? state.account
                      : (state is accountDetailsState)
                          ? state.account
                          : AccountEntity(
                          uid: '1',
                          name: 'Main Account',
                          type: AccountType.bank,
                          currency: '\$',
                          createdAt: DateTime.now(),
                        );
                  double accountBalance = (state is expenseDashboardLoadedState)
                      ? state.accountBalance
                      : (state is accountDetailsState)
                          ? state.accountBalance
                          : 0.0;
                  List<TransactionEntity> transactions =
                      (state is expenseDashboardLoadedState)
                          ? state.accountTransactions
                          : (state is accountDetailsState)
                              ? state.accountTransactions
                              : [];
                  if (state is expenseDashboardLoadingState) {
                    return const LoadingTile();
                  }

                  return AccountDetailsTile(
                    accountBalance: accountBalance,
                    account: account,
                    transactions: transactions, // Will be populated from bloc
                  );
                },
              ),
            ),
          ),

          //tile for account balance
          SliverToBoxAdapter(
            child: TileSkeleton(
              child: BlocBuilder<ExpenseDashboardBloc, ExpenseDashboardState>(
                buildWhen: (previous, current) =>
                    (current is expenseDashboardLoadedState ||
                        current is expenseDashboardLoadingState),
                builder: (context, state) {
                  if (state is expenseDashboardLoadingState) {
                    return const LoadingTile();
                  }
                  final items = (state is expenseDashboardLoadedState)
                      ? state.accountBalances
                      : const <AccountBalanceItem>[];
                  return AccountBalancesTileContent(items: items);
                },
              ),
            ),
          ),

          //today transactions
          SliverToBoxAdapter(
            child: TileSkeleton(
              child: BlocBuilder<ExpenseDashboardBloc, ExpenseDashboardState>(
                buildWhen: (previous, current) =>
                    (current is expenseDashboardLoadedState ||
                        current is expenseDashboardLoadingState),
                builder: (context, state) {
                  if (state is expenseDashboardLoadingState) {
                    return const LoadingTile();
                  }
                  final todayCount = (state is expenseDashboardLoadedState)
                      ? state.todayCount
                      : 0;
                  final todayTxns = (state is expenseDashboardLoadedState)
                      ? state.todayTransactions
                      : const <TransactionEntity>[];
                  return TodayTxnTile(
                    todayCount: todayCount,
                    transactions: todayTxns,
                  );
                },
              ),
            ),
          ),

          // budget tile (implement later)

          const SliverToBoxAdapter(
            child: SizedBox(
              height: 75,
            ),
          )
        ],
      ),
    );
  }
}