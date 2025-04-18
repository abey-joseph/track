import 'package:flutter/material.dart';
import 'package:track/core/use_cases/constants/strings.dart';

class SelectDaysWidget extends StatelessWidget {
  const SelectDaysWidget({
    super.key,
    required this.weekDays,
    required this.onSelected,
  });
  final List<bool> weekDays;
  final Function(bool, int) onSelected;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          spacing: 5,
          children: List.generate(7, (i) {
            //final days = ConstStrings.hintTextToChooseDays;
            return ChoiceChip(
              label: Text(ConstStrings.hintTextToChooseDays[i]),
              selected: weekDays[i],
              onSelected: (value) => onSelected.call(value, i),
            );
          }),
        ),
      ),
    );
  }
}
