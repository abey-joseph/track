import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:track/core/use_cases/constants/images.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/features/common/presentation/bloc/track_bloc/track_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getIt<TrackBloc>().add(checkFirstTimeOpenOrNot());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TrackBloc, TrackState>(
      listener: (context, state) async {
        if (state is firstTimeOpen) {
          if (state.isFirstTime) {
            context.pushReplacementNamed('welcome');
          } else {
            await Future.delayed(Duration(milliseconds: 2000));
            if (!context.mounted) return;
            context.pushReplacementNamed('home');
          }
        }
      },
      child: Scaffold(
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
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
