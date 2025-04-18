import 'package:flutter/material.dart';
import 'package:track/core/use_cases/constants/strings.dart';

class DropdownForTargetType extends StatelessWidget {
  const DropdownForTargetType(
      {super.key, required this.targetType, required this.onChanged});
  final String? targetType;
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
          Expanded(child: Text(ConstStrings.hintTextForTargetTypeDropDown)),
          DropdownButton<String>(
            hint: Text(ConstStrings.hintTextForTargetTypeDropDown),
            value: targetType,
            items: const [
              DropdownMenuItem(
                  value: ConstStrings.targetTypeMaximum,
                  child: Text(ConstStrings.targetTypeMaximum)),
              DropdownMenuItem(
                  value: ConstStrings.targetTypeMinimum,
                  child: Text(ConstStrings.targetTypeMinimum)),
            ],
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
