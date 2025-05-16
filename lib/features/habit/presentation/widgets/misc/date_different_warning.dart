import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:track/features/habit/presentation/bloc/habit_bloc.dart';

Future<void> showDateConflictDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // User must tap a button
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Date Conflict'),
        content: Text(
          'Latest Entry Date found older than the Current date.\nDo you wish to continue with the new dates?',
        ),
        actions: <Widget>[
          ElevatedButton(
            child: Text('Yes'),
            onPressed: () {
              context.read<HabitBloc>().add(DeleteStatusDueToDateDifference());
              context.pop();
            },
          ),
        ],
      );
    },
  );
}
