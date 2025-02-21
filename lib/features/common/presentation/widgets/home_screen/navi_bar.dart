import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track/core/use_cases/constants/colors.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/features/common/presentation/bloc/track_bloc/track_bloc.dart';

Widget navigationBar() {
  int? value;
  return BlocConsumer<TrackBloc, TrackState>(
    buildWhen: (previous, current) {
      if (current is navBarItemChanged) {
        return true;
      }
      return false;
    },
    listener: (context, state) {
      if (state is navBarItemChanged) {
        value = state.value;
      }
    },
    builder: (context, state) {
      log('message');
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
