import 'dart:developer';

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
  int _currentPageNo = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      double pageNo = pageController.page ?? 0;
      int newPageNo = pageNo.round(); // Round to the nearest integer

      if (newPageNo != _currentPageNo) {
        //setState(() {
        _currentPageNo = newPageNo;
        //});
        getIt<TrackBloc>()
            .add(navBarClicked(value: _currentPageNo, isTriggerdByPage: true));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: (_currentPageNo == 1 || _currentPageNo == 2)
      //     ? FloatingActionButton(
      //         onPressed: () {},
      //         child: Icon(Icons.add),
      //       )
      //     : null,
      bottomNavigationBar: NaviBar(),
      body: BlocConsumer<TrackBloc, TrackState>(
        listener: (context, state) {
          if (state is navBarItemChanged) {
            if (!state.isTriggerdByPage) {
              pageController.jumpToPage(
                state.value,
              );
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
