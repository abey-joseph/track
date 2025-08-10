import 'package:flutter/material.dart';
import 'package:track/core/use_cases/widgets/titile_action_button.dart';
import 'package:track/features/expense/presentation/widgets/skeletons/tile_skeleton.dart';
import 'package:track/features/expense/presentation/widgets/tiles/account_balence_tile.dart';
import 'package:track/features/expense/presentation/widgets/tiles/account_details_tile.dart';
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
          title: Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 20),
            child: Text("Expenses"),
          ),
          centerTitle: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 19.0, top: 15),
              child: titleActionButton(
                  icon: Icons.table_chart_outlined, onTap: () {}),
            )
          ],
        ),

        // Recent transaction tile
        SliverToBoxAdapter(
          child: TileSkeleton(child: RecentTransactionTile()),
        ),

        // account balence tile
        SliverToBoxAdapter(
          child: TileSkeleton(child: AccountDetailsTile()),
        ),
        // budget tile (implement later)
        SliverToBoxAdapter(
          child: TileSkeleton(child: AccountBalancesTileContent()),
        ),

        SliverToBoxAdapter(
          child: TileSkeleton(child: TodayTxnTile()),
        ),

        SliverToBoxAdapter(
          child: SizedBox(
            height: 75,
          ),
        )
      ],
    ));
  }
}
