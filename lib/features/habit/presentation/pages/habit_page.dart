import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:track/core/use_cases/widgets/titile_action_button.dart';
import 'package:track/features/habit/presentation/widgets/date_head.dart';
import 'package:track/features/habit/presentation/widgets/habit_tile.dart';

class HabitPage extends StatelessWidget {
  const HabitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          toolbarHeight: 70,
          title: Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 20),
            child: Text("habits"),
          ),
          centerTitle: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 19.0, top: 15),
              child: titleActionButton(
                  icon: Icons.analytics_outlined, onTap: () {}),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 19.0, top: 15),
              child: titleActionButton(
                  icon: Icons.add,
                  onTap: () {
                    context.pushNamed('add_habit');
                  }),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 30,
          ),
        ),
        SliverToBoxAdapter(
          child: DateHead(),
        ),
        SliverList(
            delegate:
                SliverChildBuilderDelegate(childCount: 5, (context, builder) {
          return HabitTile();
        }))
      ],
    ));
  }
}
