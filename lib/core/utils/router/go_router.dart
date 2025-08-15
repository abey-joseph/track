import 'package:go_router/go_router.dart';
import 'package:track/features/auth/presentation/pages/login_screen.dart';
import 'package:track/features/common/presentation/pages/home_screen.dart';
import 'package:track/features/common/presentation/pages/splash_screen.dart';
import 'package:track/features/common/presentation/pages/welcome_screen.dart';
import 'package:track/features/common/presentation/pages/profile_page.dart';
import 'package:track/features/expense/presentation/pages/payee_page.dart';
import 'package:track/features/expense/presentation/pages/categories_page.dart';
import 'package:track/features/expense/presentation/pages/accounts_page.dart';
import 'package:track/features/expense/presentation/pages/budgets_page.dart';
import 'package:track/features/expense/presentation/pages/bookmarks_page.dart';
import 'package:track/features/expense/presentation/pages/tags_page.dart';
import 'package:track/features/expense/presentation/pages/recurring_page.dart';

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
      path: '/login',
      name: 'login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/profile',
      name: 'profile',
      builder: (context, state) => const ProfilePage(),
    ),
    // Expense Management Routes
    GoRoute(
      path: '/payees',
      name: 'payees',
      builder: (context, state) => const PayeePage(),
    ),
    GoRoute(
      path: '/categories',
      name: 'categories',
      builder: (context, state) => const CategoriesPage(),
    ),
    GoRoute(
      path: '/accounts',
      name: 'accounts',
      builder: (context, state) => const AccountsPage(),
    ),
    GoRoute(
      path: '/budgets',
      name: 'budgets',
      builder: (context, state) => const BudgetsPage(),
    ),
    GoRoute(
      path: '/bookmarks',
      name: 'bookmarks',
      builder: (context, state) => const BookmarksPage(),
    ),
    GoRoute(
      path: '/tags',
      name: 'tags',
      builder: (context, state) => const TagsPage(),
    ),
    GoRoute(
      path: '/recurring',
      name: 'recurring',
      builder: (context, state) => const RecurringPage(),
    ),
  ],
);
