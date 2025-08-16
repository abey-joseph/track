import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track/core/widgets/error_widgets.dart';
import 'package:track/core/services/logging_service.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/features/expense/presentation/bloc/accounts/accounts_bloc.dart';
import 'package:track/features/expense/domain/entities/account_entity.dart';
import 'package:track/features/expense/domain/use_cases/get_accounts.dart';
import 'package:track/features/expense/domain/use_cases/modify_account.dart';
import 'package:track/core/utils/injection/get_it.dart';

/// Example page showing how to properly handle failure states using the new widgets
class AccountsPageExample extends StatelessWidget {
  final String userId = "aVW0YijM7yg95EeHUM5jntt6mrx1";

  const AccountsPageExample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accounts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddAccountDialog(context),
          ),
        ],
      ),
      body: ErrorBoundary(
        child: BlocProvider(
          create: (context) => AccountsBloc(
            // Inject your use cases here
            getIt<GetAccounts>(),
            getIt<AddAccount>(),
            getIt<UpdateAccount>(),
            getIt<DeleteAccount>(),
            getIt<SetDefaultAccount>(),
            getIt<IsAccountInUse>(),
          )..add(AccountsEvent.load(uid: userId)),
          child: BlocConsumer<AccountsBloc, AccountsState>(
            listener: (context, state) {
              // Handle state changes and show appropriate feedback
              state.when(
                initial: () {},
                loading: () {},
                loaded: (accounts) {
                  // Log successful load
                  logger.logUserAction(
                    'accounts_page_loaded',
                    userId: userId,
                    screen: 'accounts_page',
                    parameters: {'accountCount': accounts.length},
                  );
                },
                failure: (message) {
                  // Show error snackbar
                  FailureSnackBar.show(
                    context,
                    UnknownFailure(message),
                    onRetry: () {
                      context.read<AccountsBloc>().add(AccountsEvent.load(uid: userId));
                    },
                  );
                },
              );
            },
            builder: (context, state) {
              return state.when(
                initial: () => const SizedBox.shrink(),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                loaded: (accounts) => _buildAccountsList(context, accounts),
                failure: (message) => _buildFailureState(context, message),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildAccountsList(BuildContext context, List<AccountEntity> accounts) {
    if (accounts.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_balance_wallet_outlined,
              size: 64,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              'No accounts yet',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Add your first account to get started',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade500,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => _showAddAccountDialog(context),
              icon: const Icon(Icons.add),
              label: const Text('Add Account'),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<AccountsBloc>().add(AccountsEvent.reload(uid: userId));
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: accounts.length,
        itemBuilder: (context, index) {
          final account = accounts[index];
          return _buildAccountTile(context, account);
        },
      ),
    );
  }

  Widget _buildAccountTile(BuildContext context, AccountEntity account) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getAccountTypeColor(account.type),
          child: Icon(
            _getAccountTypeIcon(account.type),
            color: Colors.white,
          ),
        ),
        title: Text(account.name),
        subtitle: Text('${account.type.name} • ${account.currency}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (account.isDefault)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Default',
                  style: TextStyle(
                    color: Colors.blue.shade700,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            PopupMenuButton<String>(
              onSelected: (value) => _handleAccountAction(context, account, value),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'edit',
                  child: Row(
                    children: [
                      Icon(Icons.edit),
                      SizedBox(width: 8),
                      Text('Edit'),
                    ],
                  ),
                ),
                if (!account.isDefault)
                  const PopupMenuItem(
                    value: 'set_default',
                    child: Row(
                      children: [
                        Icon(Icons.star),
                        SizedBox(width: 8),
                        Text('Set as Default'),
                      ],
                    ),
                  ),
                const PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    children: [
                      Icon(Icons.delete, color: Colors.red),
                      SizedBox(width: 8),
                      Text('Delete', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        onTap: () => _showAccountDetails(context, account),
      ),
    );
  }

  Widget _buildFailureState(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FailureWidget(
          failure: UnknownFailure(message),
          onRetry: () {
            context.read<AccountsBloc>().add(AccountsEvent.load(uid: userId));
          },
          showDetails: true,
        ),
      ),
    );
  }

  Color _getAccountTypeColor(AccountType type) {
    switch (type) {
      case AccountType.cash:
        return Colors.green;
      case AccountType.bank:
        return Colors.blue;
      case AccountType.card:
        return Colors.orange;
      case AccountType.ewallet:
        return Colors.purple;
      case AccountType.other:
        return Colors.grey;
    }
  }

  IconData _getAccountTypeIcon(AccountType type) {
    switch (type) {
      case AccountType.cash:
        return Icons.money;
      case AccountType.bank:
        return Icons.account_balance;
      case AccountType.card:
        return Icons.credit_card;
      case AccountType.ewallet:
        return Icons.account_balance_wallet;
      case AccountType.other:
        return Icons.account_balance;
    }
  }

  void _handleAccountAction(BuildContext context, AccountEntity account, String action) {
    switch (action) {
      case 'edit':
        _showEditAccountDialog(context, account);
        break;
      case 'set_default':
        context.read<AccountsBloc>().add(
          AccountsEvent.setDefault(accountId: account.accountId!, uid: account.uid),
        );
        break;
      case 'delete':
        _showDeleteConfirmation(context, account);
        break;
    }
  }

  void _showAddAccountDialog(BuildContext context) {
    // Log user action
    logger.logUserAction(
      'add_account_dialog_opened',
      userId: userId,
      screen: 'accounts_page',
    );

    // Show your add account dialog here
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Add Account'),
        content: Text('Add account form would go here'),
        actions: [
          TextButton(
            onPressed: null, // Close dialog
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: null, // Save account
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showEditAccountDialog(BuildContext context, AccountEntity account) {
    // Log user action
    logger.logUserAction(
      'edit_account_dialog_opened',
      userId: userId,
      screen: 'accounts_page',
      parameters: {'accountId': account.accountId, 'accountName': account.name},
    );

    // Show your edit account dialog here
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit ${account.name}'),
        content: Text('Edit account form would go here'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Update account logic
              Navigator.of(context).pop();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, AccountEntity account) {
    // Log user action
    logger.logUserAction(
      'delete_account_confirmation_opened',
      userId: userId,
      screen: 'accounts_page',
      parameters: {'accountId': account.accountId, 'accountName': account.name},
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Account'),
        content: Text(
          'Are you sure you want to delete "${account.name}"? '
          'This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<AccountsBloc>().add(
                AccountsEvent.delete(accountId: account.accountId!, uid: account.uid),
              );
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showAccountDetails(BuildContext context, AccountEntity account) {
    // Log user action
    logger.logUserAction(
      'account_details_opened',
      userId: userId,
      screen: 'accounts_page',
      parameters: {'accountId': account.accountId, 'accountName': account.name},
    );

    // Show account details page or dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(account.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Type: ${account.type.name}'),
            Text('Currency: ${account.currency}'),
            Text('Created: ${account.createdAt.toString().split(' ')[0]}'),
            if (account.isDefault) const Text('Default Account', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
