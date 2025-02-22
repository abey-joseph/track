import 'package:flutter/material.dart';
import 'package:track/core/use_cases/widgets/titile_action_button.dart';

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
        )
      ],
    ));
  }
}
