import 'package:go_router/go_router.dart';
import 'package:track/features/auth/presentation/pages/login_screen.dart';
import 'package:track/features/common/presentation/pages/home_screen.dart';
import 'package:track/features/common/presentation/pages/splash_screen.dart';
import 'package:track/features/common/presentation/pages/welcome_screen.dart';
import 'package:track/features/common/presentation/pages/profile_page.dart';
import 'package:track/features/expense/presentation/pages/accounts_page.dart';
import 'package:track/features/expense/presentation/pages/account_details_page.dart';
import 'package:track/features/expense/presentation/pages/categories_page.dart';
import 'package:track/features/expense/presentation/pages/transactions_page.dart';

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
      path: '/profile',
      name: 'profile',
      builder: (context, state) => ProfilePage(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/accounts',
      name: 'accounts',
      builder: (context, state) => const AccountsPage(),
    ),
    GoRoute(
      path: '/account/:id',
      name: 'account_details',
      builder: (context, state) {
        final accountId = int.parse(state.pathParameters['id']!);
        final accountName = state.uri.queryParameters['name'] ?? 'Account Details';
        return AccountDetailsPage(
          accountId: accountId,
          accountName: accountName,
        );
      },
    ),
    GoRoute(
      path: '/categories',
      name: 'categories',
      builder: (context, state) => const CategoriesPage(),
    ),
    GoRoute(
      path: '/transactions',
      name: 'transactions',
      builder: (context, state) => const TransactionsPage(),
    ),
  ],
);
