import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/features/common/presentation/bloc/track_bloc/track_bloc.dart';

class NaviBar extends StatefulWidget {
  const NaviBar({super.key});

  @override
  State<NaviBar> createState() => _NaviBarState();
}

class _NaviBarState extends State<NaviBar> {
  int? value;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrackBloc, TrackState>(
      listener: (context, state) {
        if (state is navBarItemChanged) {
          value = state.value;
        }
      },
      builder: (context, state) {
        return NavigationBar(
            indicatorColor: Colors.transparent,
            onDestinationSelected: (value) {
              getIt<TrackBloc>().add(navBarClicked(value: value));
            },
            selectedIndex: value ?? 0,
            elevation: 20,
            shadowColor: Colors.black,
            destinations: [
              NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home_outlined, color: Colors.blue),
                  label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.edit_calendar_outlined),
                  selectedIcon: Icon(
                    Icons.edit_calendar_outlined,
                    color: Colors.blue,
                  ),
                  label: 'Habit'),
              NavigationDestination(
                  icon: Icon(Icons.payment_outlined),
                  selectedIcon: Icon(
                    Icons.payment_outlined,
                    color: Colors.blue,
                  ),
                  label: 'Expense'),
              NavigationDestination(
                  icon: Icon(Icons.settings_outlined),
                  selectedIcon: Icon(
                    Icons.settings_outlined,
                    color: Colors.blue,
                  ),
                  label: 'Settings'),
            ]);
      },
    );
  }
}
