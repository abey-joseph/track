import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:track/core/use_cases/widgets/titile_action_button.dart';
import 'package:track/features/auth/presentation/bloc/firebase_auth_bloc.dart';
import 'package:track/features/common/presentation/bloc/track_bloc/track_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          toolbarHeight: 70,
          title: Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 20),
            child: Text("Settings"),
          ),
          centerTitle: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 19.0, top: 15),
              child:
                  titleActionButton(icon: Icons.account_circle, onTap: () {}),
            )
          ],
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: BlocListener<TrackBloc, TrackState>(
                listener: (context, state) {
                  if (state is dataSeedingSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Sample data added')),
                    );
                  } else if (state is dataSeedingFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: ${state.message}')),
                    );
                  }
                },
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () {
                      // ignore: avoid_print
                      print('[SettingsPage] Insert sample data button tapped');
                      final authState = GetIt.I<FirebaseAuthBloc>().state;
                      if (authState is authAuthenticated) {
                        // ignore: avoid_print
                        print('[SettingsPage] dispatch insertSampleDataForUser uid=${authState.uid}');
                        context.read<TrackBloc>().add(
                            TrackEvent.insertSampleDataForUser(uid: authState.uid));
                      } else {
                        log('authState is not authenticated ${authState.toString()}');
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Please sign in first')));
                      }
                    },
                    icon: const Icon(Icons.bug_report),
                    label: const Text('Insert sample data (debug)'),
                  ),
                ),
              ),
            ),
          ]),
        )
      ],
    ));
  }
}
