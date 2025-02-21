import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:track/core/use_cases/constants/animations.dart';
import 'package:track/features/common/presentation/widgets/welcome_screen/sub_text.dart';
import 'package:track/features/common/presentation/widgets/welcome_screen/title.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        welcomeTitle(title: "Welcome to Your All-in-One Tracker!"),
        SizedBox(height: 50),
        Center(
          child: SizedBox(
              height: 350,
              width: 400,
              child: Lottie.asset(ProjectAnimation.firstScene)),
        ),
        SizedBox(height: 30),
        welcomeSubText(text: "Simply manage habits and expenses in one place"),
        SizedBox(height: 10),
        welcomeSubText(text: "Stay organized, stay motivated"),
        SizedBox(height: 10),
        welcomeSubText(text: "Take control of your goals"),
      ],
    );
  }
}
