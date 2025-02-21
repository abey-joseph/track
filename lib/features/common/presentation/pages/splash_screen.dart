import 'package:flutter/material.dart';
import 'package:track/core/use_cases/constants/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.asset(ProjectImages.logoDark)),
                  ),
                  Text(
                    "TRACK",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Text(
              "Track Your Life",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
