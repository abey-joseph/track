import 'package:flutter/material.dart';
import 'package:track/features/common/presentation/widgets/home_page/home_page_add_button.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Padding(
        padding: const EdgeInsets.only(top: 140),
        child: SizedBox(
            // color: Colors.red,
            height: 320,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomePageAddButton(
                    subText: 'Add Habit',
                    onTap: () {},
                  ),
                  HomePageAddButton(
                    subText: 'Add Expense',
                    onTap: () {},
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
