import 'package:flutter/material.dart';
import 'package:track/core/use_cases/constants/strings.dart';

class DropdownForFrequencyType extends StatelessWidget {
  const DropdownForFrequencyType(
      {super.key, this.frquencyType, required this.onChanged});
  final String? frquencyType;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border.all(color: Colors.grey), // Border color
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withAlpha(20),
                blurRadius: 5,
                spreadRadius: -5,
                offset: Offset(0, 10))
          ]),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(ConstStrings.hintTextForFrequencyTypeDropDown)),
          DropdownButton<String>(
            hint: Text(ConstStrings.hintTextForFrequencyTypeDropDown),
            value: frquencyType,
            items: const [
              DropdownMenuItem(
                  value: ConstStrings.frquencyTypeEveryDay,
                  child: Text(ConstStrings.frquencyTypeEveryDay)),
              DropdownMenuItem(
                  value: ConstStrings.frquencyTypeChooseDays,
                  child: Text(ConstStrings.frquencyTypeChooseDays)),
              DropdownMenuItem(
                  value: ConstStrings.frquencyTypeEveryXDays,
                  child: Text(ConstStrings.frquencyTypeEveryXDays)),
              DropdownMenuItem(
                  value: ConstStrings.frquencyTypeOnceAWeek,
                  child: Text(ConstStrings.frquencyTypeOnceAWeek)),
            ],
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
