import 'package:flutter/material.dart';
import 'package:track/core/use_cases/constants/screen.dart';

class HabitTile extends StatelessWidget {
  const HabitTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text('Habit Name', overflow: TextOverflow.ellipsis),
                ),
              ),
              SizedBox(
                width: 240, // Fixed width for checkboxes
                child: Row(
                  children: List.generate(
                    5,
                    (_) => Checkbox(value: false, onChanged: (value) {}),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
