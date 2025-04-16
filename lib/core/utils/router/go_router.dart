import 'package:go_router/go_router.dart';
import 'package:track/features/common/presentation/pages/home_screen.dart';
import 'package:track/features/common/presentation/pages/splash_screen.dart';
import 'package:track/features/common/presentation/pages/welcome_screen.dart';
import 'package:track/features/expense/presentation/pages/add_expense_page.dart';
import 'package:track/features/expense/presentation/pages/all_expense_screen.dart';
import 'package:track/features/habit/presentation/pages/habit_add_page.dart';

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
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/all_expenses',
      name: 'all_expenses',
      builder: (context, state) => AllExpenseScreen(),
    ),
    GoRoute(
      path: '/add_habit',
      name: 'add_habit',
      builder: (context, state) => HabitAddPage(),
    ),
    GoRoute(
      path: '/add_expense',
      name: 'add_expense',
      builder: (context, state) => AddExpensePage(),
    ),
  ],
);
