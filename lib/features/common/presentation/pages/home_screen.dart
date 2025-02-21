import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track/features/common/presentation/bloc/track_bloc/track_bloc.dart';
import 'package:track/features/common/presentation/pages/home_page.dart';
import 'package:track/features/common/presentation/pages/settings_page.dart';
import 'package:track/features/common/presentation/widgets/home_screen/navi_bar.dart';
import 'package:track/features/expense/presentation/pages/expense_page.dart';
import 'package:track/features/habit/presentation/pages/habit_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Track"),
      ),
      bottomNavigationBar: navigationBar(),
      body: BlocConsumer<TrackBloc, TrackState>(
        listener: (context, state) {
          if (state is navBarItemChanged) {
            pageController.animateToPage(state.value,
                duration: Duration(milliseconds: 200), curve: Curves.easeIn);
          }
        },
        builder: (context, state) {
          return PageView(
            controller: pageController,
            children: [
              HomePage(),
              HabitPage(),
              ExpensePage(),
              SettingsPage(),
            ],
          );
        },
      ),
    );
  }
}
