import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:track/core/use_cases/widgets/titile_action_button.dart';
import 'package:track/features/habit/domain/entities/habit_entity.dart';
import 'package:track/features/habit/presentation/bloc/habit_bloc.dart';

class HabitDetailPage extends StatelessWidget {
  const HabitDetailPage({super.key, required this.habit});
  final HabitEntity habit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HabitBloc, HabitState>(
        listener: (context, state) {
          if (state is DeleteDoneHabitState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Habit Deleted")));
            context.pop();
          }
          if (state is DeleteFailedhabitState) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Delete Failed, Try again")));
            context.pop();
          }
        },
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 70,
                title: Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 20),
                  child: Text(habit.habitName),
                ),
                centerTitle: false,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 19, top: 15),
                    child: titleActionButton(
                        icon: Icons.delete,
                        onTap: () {
                          context
                              .read<HabitBloc>()
                              .add(DeleteHabitEvent(habitId: habit.habitId));
                        }),
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
