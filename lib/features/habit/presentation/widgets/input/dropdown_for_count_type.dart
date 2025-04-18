import 'package:flutter/material.dart';
import 'package:track/core/use_cases/constants/strings.dart';

class DropdownForCountType extends StatelessWidget {
  const DropdownForCountType(
      {super.key, required this.countType, required this.onChanged});
  final String? countType;
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: Text(ConstStrings.hintTextForCountTypeDropDown)),
          DropdownButton<String>(
            hint: Text(ConstStrings.hintTextForCountTypeDropDown),
            value: countType,
            items: const [
              DropdownMenuItem(
                  value: ConstStrings.countTypeCount,
                  child: Text(ConstStrings.countTypeCount)),
              DropdownMenuItem(
                  value: ConstStrings.countTypePages,
                  child: Text(ConstStrings.countTypePages)),
              DropdownMenuItem(
                  value: ConstStrings.countTypeMoney,
                  child: Text(ConstStrings.countTypeMoney)),
              DropdownMenuItem(
                  value: ConstStrings.countTypeMinutes,
                  child: Text(ConstStrings.countTypeMinutes)),
            ],
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
