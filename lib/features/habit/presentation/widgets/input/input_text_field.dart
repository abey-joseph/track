import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  const InputTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.isInputNumberOnly = false,
      this.maxLines});
  final TextEditingController controller;
  final String hintText;
  final int? maxLines;
  final bool isInputNumberOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withAlpha(20),
                blurRadius: 5,
                spreadRadius: -5,
                offset: Offset(0, 10))
          ]),
      child: TextField(
        controller: controller,
        keyboardType:
            isInputNumberOnly ? TextInputType.number : TextInputType.text,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: hintText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
