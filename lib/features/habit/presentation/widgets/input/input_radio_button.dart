import 'package:flutter/material.dart';

class InputRadioButton extends StatelessWidget {
  const InputRadioButton(
      {super.key,
      required this.isBinary,
      required this.onChanged,
      required this.title,
      required this.defaultValue});
  final bool isBinary;
  final ValueChanged<bool?> onChanged;
  final String title;
  final bool defaultValue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RadioListTile<bool>(
        title: Text(title),
        value: defaultValue,
        groupValue: isBinary,
        onChanged: onChanged,
      ),
    );
  }
}
