import 'package:flutter/material.dart';
import 'package:track/features/expense/presentation/widgets/buttons/expense_app_bar_button.dart';

class AppBarWidgetExpense extends StatelessWidget {
  const AppBarWidgetExpense({super.key});

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
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 25,
                  children: [
                    SizedBox(), // to add some sapce in beginning - empty space will be added due to the spaing given for row - so this is just a dummy widget to trigger that spaing
                    ExpenseAppBarButton(
                      icon: Icons.add,
                      subText: 'Add Expense',
                      onTap: () {},
                    ),
                    ExpenseAppBarButton(
                      icon: Icons.currency_exchange,
                      subText: 'Budget',
                      onTap: () {},
                    ),
                    ExpenseAppBarButton(
                      icon: Icons.wallet,
                      subText: 'Accounts',
                      onTap: () {},
                    ),
                    ExpenseAppBarButton(
                      icon: Icons.bookmark,
                      subText: 'Bookmarks',
                      onTap: () {},
                    ),
                    ExpenseAppBarButton(
                      icon: Icons.category,
                      subText: 'Categories',
                      onTap: () {},
                    ),
                    ExpenseAppBarButton(
                      icon: Icons.person,
                      subText: 'Payee',
                      onTap: () {},
                    ),
                    ExpenseAppBarButton(
                      icon: Icons.tag,
                      subText: 'Tag',
                      onTap: () {},
                    ),
                    ExpenseAppBarButton(
                      icon: Icons.repeat,
                      subText: 'Recurring',
                      onTap: () {},
                    ),
                    ExpenseAppBarButton(
                      icon: Icons.settings,
                      subText: 'Settings',
                      onTap: () {},
                    ),
                    SizedBox(), // to add some sapce in beginning - empty space will be added due to the spaing given for row - so this is just a dummy widget to trigger that spaing
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
