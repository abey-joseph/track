import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:track/core/use_cases/widgets/titile_action_button.dart';
import 'package:track/features/habit/domain/entities/habit_display_entity.dart';
import 'package:track/features/habit/presentation/bloc/habit_bloc.dart';
import 'package:track/features/habit/presentation/widgets/misc/date_head.dart';
import 'package:track/features/habit/presentation/widgets/misc/habit_tile.dart';

class HabitPage extends StatefulWidget {
  const HabitPage({super.key});

  @override
  State<HabitPage> createState() => _HabitPageState();
}

class _HabitPageState extends State<HabitPage> {
  List<HabitDisplayEntity> habits = [];

  @override
  void initState() {
    super.initState();
    final currState = context.read<HabitBloc>().state;
    if (currState is! MainUpdateHabitState && currState is! LoadingHabitState) {
      context.read<HabitBloc>().add(FetchHabitsDataToUpdateMainUI());
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

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
        BlocConsumer<HabitBloc, HabitState>(
          listener: (context, state) {},
          buildWhen: (previous, current) => (current is MainUpdateHabitState),
          builder: (context, state) {
            if (state is MainUpdateHabitState) {
              habits.clear();
              habits.addAll(state.habitDiplayList);
            } else {
              habits = [];
            }
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: habits.length,
                (context, index) {
                  return HabitTile(habit: habits[index]);
                },
              ),
            );
          },
        ),
      ],
    ));
  }
}
