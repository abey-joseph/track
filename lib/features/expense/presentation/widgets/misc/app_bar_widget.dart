import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
                      onTap: () => context.push('/budgets'),
                    ),
                    ExpenseAppBarButton(
                      icon: Icons.wallet,
                      subText: 'Accounts',
                      onTap: () => context.push('/accounts'),
                    ),
                    ExpenseAppBarButton(
                      icon: Icons.bookmark,
                      subText: 'Bookmarks',
                      onTap: () => context.push('/bookmarks'),
                    ),
                    ExpenseAppBarButton(
                      icon: Icons.category,
                      subText: 'Categories',
                      onTap: () => context.push('/categories'),
                    ),
                    ExpenseAppBarButton(
                      icon: Icons.person,
                      subText: 'Payee',
                      onTap: () => context.push('/payees'),
                    ),
                    ExpenseAppBarButton(
                      icon: Icons.tag,
                      subText: 'Tag',
                      onTap: () => context.push('/tags'),
                    ),
                    ExpenseAppBarButton(
                      icon: Icons.repeat,
                      subText: 'Recurring',
                      onTap: () => context.push('/recurring'),
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
