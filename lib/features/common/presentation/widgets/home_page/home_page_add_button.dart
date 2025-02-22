import 'package:flutter/material.dart';

class HomePageAddButton extends StatelessWidget {
  const HomePageAddButton(
      {super.key, required this.onTap, required this.subText});

  final VoidCallback onTap;
  final String subText;

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
            child: Icon(Icons.add)),
        Text(subText),
      ],
    );
  }
}
