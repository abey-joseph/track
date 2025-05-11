import 'package:flutter/material.dart';
import 'package:track/core/use_cases/constants/screen.dart';
import 'package:track/features/habit/domain/entities/habit_display_entity.dart';
import 'package:track/features/habit/domain/entities/habit_status_entity.dart';
import 'package:track/features/habit/presentation/widgets/misc/habit_status_tile.dart';

class HabitTile extends StatelessWidget {
  const HabitTile({super.key, required this.habit});
  final HabitDisplayEntity habit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
      child: Container(
          width: ScreenSize.width(context),
          height: 52,
          //color: Colors.red,
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withAlpha(20),
                    blurRadius: 5,
                    spreadRadius: -5,
                    offset: Offset(0, 10))
              ]),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(habit.habit.habitName,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              SizedBox(
                width: 240, // Fixed width for checkboxes
                child: Row(
                  children: List.generate(
                    5,
                    (_) => HabitStatusTile(
                      isBinary: habit.habit.isBinary,
                      // pass the data from the bloc below
                      status: HabitStatusEntity(
                          habitId: 1, date: DateTime.now(), value: true),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
