import 'package:flutter/material.dart';

class ReminderSwitch extends StatelessWidget {
  const ReminderSwitch(
      {super.key, required this.reminder, required this.onChanged});
  final bool reminder;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text('Enable Reminder'),
      value: reminder,
      onChanged: onChanged,
    );
  }
}
