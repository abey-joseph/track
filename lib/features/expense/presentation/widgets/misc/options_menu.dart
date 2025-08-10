import 'package:flutter/material.dart';

// Actions for the overflow menu
enum _ExpenseMenuAction {
  addTransaction,
  manageAccounts,
  categories,
  export,
}

class OptionsMenu extends StatelessWidget {
  const OptionsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: FloatingActionButton(
        elevation: 2,
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)),
        child: PopupMenuButton<_ExpenseMenuAction>(
          icon: Icon(
            Icons.more_horiz,
            size: 36,
            color: Theme.of(context).floatingActionButtonTheme.foregroundColor,
          ),
          onSelected: (value) {
            switch (value) {
              case _ExpenseMenuAction.addTransaction:
                break;
              case _ExpenseMenuAction.manageAccounts:
                break;
              case _ExpenseMenuAction.categories:
                break;
              case _ExpenseMenuAction.export:
                break;
            }
          },
          itemBuilder: (context) => const [
            PopupMenuItem(
              value: _ExpenseMenuAction.addTransaction,
              child: Text('Add transaction'),
            ),
            PopupMenuItem(
              value: _ExpenseMenuAction.manageAccounts,
              child: Text('Manage accounts'),
            ),
            PopupMenuItem(
              value: _ExpenseMenuAction.categories,
              child: Text('Categories'),
            ),
            PopupMenuItem(
              value: _ExpenseMenuAction.export,
              child: Text('Export'),
            ),
          ],
        ),
      ),
    );
  }
}
