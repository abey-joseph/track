import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track/core/utils/injection/get_it.dart';
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
    int currentPageNo = 0;
    pageController.addListener(() {
      double pageNo = pageController.page ?? 0;
      int newPageNo = pageNo.round(); // Round to the nearest integer

      if (newPageNo != currentPageNo) {
        currentPageNo = newPageNo;
        getIt<TrackBloc>()
            .add(navBarClicked(value: currentPageNo, isTriggerdByPage: true));
      }
    });
    return Scaffold(
      bottomNavigationBar: navigationBar(),
      body: BlocConsumer<TrackBloc, TrackState>(
        listener: (context, state) {
          if (state is navBarItemChanged) {
            if (!state.isTriggerdByPage) {
              pageController.animateToPage(state.value,
                  duration: Duration(milliseconds: 200), curve: Curves.easeIn);
            }
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
