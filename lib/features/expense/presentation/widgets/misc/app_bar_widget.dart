import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:track/features/expense/presentation/widgets/buttons/expense_app_bar_button.dart';
import 'package:track/features/expense/presentation/pages/accounts_page.dart';
import 'package:track/features/expense/presentation/pages/categories_page.dart';
import 'package:track/features/expense/presentation/bloc/dashboard/expense_dashboard_bloc.dart';

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
                      onTap: () async {
                        // need to await the new page and check mounted before refreshing the dashboard
                        _refresh(context); // refresh the dashboard to the recent updated data
                      },
                    ),
                    ExpenseAppBarButton(
                      icon: Icons.currency_exchange,
                      subText: 'Budget',
                      onTap: () async {
                        // need to await the new page and check mounted before refreshing the dashboard
                        _refresh(context); // refresh the dashboard to the recent updated data
                      },
                    ),
                    ExpenseAppBarButton(
                      icon: Icons.wallet,
                      subText: 'Accounts',
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const AccountsPage()),
                        );
                        if (!context.mounted) return;
                        _refresh(context); // refresh the dashboard to the recent updated data
                      },
                    ),
                    ExpenseAppBarButton(
                      icon: Icons.bookmark,
                      subText: 'Bookmarks',
                      onTap: () async {
                        // need to await the new page and check mounted before refreshing the dashboard
                        _refresh(context); // refresh the dashboard to the recent updated data
                      },
                    ),
                    ExpenseAppBarButton(
                      icon: Icons.category,
                      subText: 'Categories',
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const CategoriesPage()),
                        );
                        if (!context.mounted) return;
                        _refresh(context); // refresh the dashboard to the recent updated data
                      },
                    ),
                    ExpenseAppBarButton(
                      icon: Icons.person,
                      subText: 'Payee',
                      onTap: () async {
                        // need to await the new page and check mounted before refreshing the dashboard
                        _refresh(context); // refresh the dashboard to the recent updated data
                      },
                    ),
                    ExpenseAppBarButton(
                      icon: Icons.tag,
                      subText: 'Tag',
                      onTap: () async {
                        // need to await the new page and check mounted before refreshing the dashboard
                        _refresh(context); // refresh the dashboard to the recent updated data
                      },
                    ),
                    ExpenseAppBarButton(
                      icon: Icons.repeat,
                      subText: 'Recurring',
                      onTap: () async {
                        // need to await the new page and check mounted before refreshing the dashboard
                        _refresh(context); // refresh the dashboard to the recent updated data
                      },
                    ),
                    ExpenseAppBarButton(
                      icon: Icons.settings,
                      subText: 'Settings',
                      onTap: () async {
                        // need to await the new page and check mounted before refreshing the dashboard
                        _refresh(context); // refresh the dashboard to the recent updated data
                      },
                    ),
                    SizedBox(), // to add some sapce in beginning - empty space will be added due to the spaing given for row - so this is just a dummy widget to trigger that spaing
                  ],
                ),
              ),
            )),
      ),
    );


  }

  void _refresh(BuildContext context){
    context.read<ExpenseDashboardBloc>().add(const ExpenseDashboardEvent.fetchAllSummary());
  }
}
