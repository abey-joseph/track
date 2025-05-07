import 'package:flutter/material.dart';

class HabitStatusTile extends StatefulWidget {
  const HabitStatusTile(
      {super.key,
      required this.isBinary,
      this.countType,
      required this.value,
      this.target,
      this.targetType,
      required this.habitId,
      required this.statusId});
  final bool isBinary;
  final dynamic value;
  final int habitId;
  final int statusId;
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
    if (widget.value != null) {
      value = widget.value;
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
