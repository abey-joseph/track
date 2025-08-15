import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:track/core/use_cases/constants/images.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/features/auth/presentation/bloc/firebase_auth_bloc.dart';
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
            // On first launch after install/reinstall, force sign out to avoid persisted Firebase session
            if (mounted) {
              context
                  .read<FirebaseAuthBloc>()
                  .add(const FirebaseAuthEvent.signOutRequested());
            }
            if (!mounted) return;
            context.pushReplacementNamed('login');
          } else {
            await Future.delayed(Duration(milliseconds: 2000));
            if (!context.mounted) return;
            context.pushReplacementNamed('login');
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
                        child:
                            (Theme.of(context).brightness == Brightness.light)
                                ? Image.asset(ProjectImages.logoDark)
                                : Image.asset(ProjectImages.logoWhite),
                      ),
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
