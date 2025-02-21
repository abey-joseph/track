import 'package:go_router/go_router.dart';
import 'package:track/features/common/presentation/pages/splash_screen.dart';
import 'package:track/features/common/presentation/pages/welcome_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/welcome',
      name: 'welcome',
      builder: (context, state) => WelcomeScreen(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => WelcomeScreen(),
    )
  ],
);
