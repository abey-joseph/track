import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:track/features/common/presentation/widgets/welcome_screen/button.dart';
import 'package:track/features/common/presentation/widgets/welcome_screen/first_page.dart';
import 'package:track/features/common/presentation/widgets/welcome_screen/second_page.dart';
import 'package:track/features/common/presentation/widgets/welcome_screen/third_page.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(height: 50),
        Expanded(
          child: PageView(
            controller: pageController,
            children: [
              FirstPage(),
              SecondPage(),
              ThirdPage(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, bottom: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmoothPageIndicator(controller: pageController, count: 3),
              welcomeButton(() => context.pushReplacementNamed('login')),
            ],
          ),
        ),
      ],
    ));
  }
}
