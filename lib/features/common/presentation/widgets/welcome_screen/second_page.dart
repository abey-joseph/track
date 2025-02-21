import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:track/core/use_cases/constants/animations.dart';
import 'package:track/features/common/presentation/widgets/welcome_screen/sub_text.dart';
import 'package:track/features/common/presentation/widgets/welcome_screen/title.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        welcomeTitle(title: "Track, Analyze, and Grow"),
        SizedBox(height: 50),
        Center(
          child: SizedBox(
              height: 350,
              width: 400,
              child: Lottie.asset(ProjectAnimation.secondScene)),
        ),
        SizedBox(height: 30),
        welcomeSubText(
            text: "Effortlessly record expenses and monitor your spending"),
        SizedBox(height: 10),
        welcomeSubText(text: "Build better habits with personalized reminders"),
        SizedBox(height: 10),
        welcomeSubText(
            text: "Get insights with detailed reports and progress charts"),
      ],
    );
  }
}
