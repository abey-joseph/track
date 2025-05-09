import 'package:flutter/material.dart';
import 'package:track/features/habit/domain/entities/habit_status_entity.dart';

class HabitStatusTile extends StatefulWidget {
  const HabitStatusTile({
    super.key,
    required this.isBinary,
    this.countType,
    required this.status,
    this.target,
    this.targetType,
  });
  final bool isBinary;
  final HabitStatusEntity status;
  final String? countType;
  final String? target;
  final String? targetType;

  @override
  State<HabitStatusTile> createState() => _HabitStatusTileState();
}

class _HabitStatusTileState extends State<HabitStatusTile> {
  late dynamic value;

  @override
  void initState() {
    super.initState();
    if (widget.status.value != null) {
      value = widget.status.value;
    } else {
      if (widget.isBinary) {
        value = false;
      } else {
        value = 0;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      child: Center(
        child: (widget.isBinary)
            ? Checkbox(
                value: value,
                onChanged: (newValue) {
                  setState(() {
                    value = !value;
                    //trigger update for database
                  });
                })
            : Text(value.toString()),
        //need to make this clickable
        // add edit feature
        // then trigger update for database
      ),
    );
  }
}
