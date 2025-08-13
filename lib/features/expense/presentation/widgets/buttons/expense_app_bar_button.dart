import 'package:flutter/material.dart';

class ExpenseAppBarButton extends StatelessWidget {
  const ExpenseAppBarButton(
      {super.key,
      required this.onTap,
      required this.subText,
      required this.icon});

  final VoidCallback onTap;
  final String subText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(0),
              iconSize: 30,
              minimumSize: Size(60, 60),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(90))),
            ),
            child: Icon(icon)),
        Text(subText),
      ],
    );
  }
}
