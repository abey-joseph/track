import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:track/features/auth/presentation/bloc/firebase_auth_bloc.dart';
import 'package:track/features/expense/domain/entities/raw_entities/account_entity.dart';
import 'package:track/features/common/presentation/widgets/themed_card_tile.dart';
import 'package:track/features/common/presentation/widgets/info_chip.dart';
import 'package:track/features/expense/presentation/bloc/accounts/accounts_bloc.dart';
import 'package:track/core/utils/injection/get_it.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.read<FirebaseAuthBloc>().state;
    final uid = auth is authAuthenticated ? auth.uid : '';
          return BlocProvider<AccountsBloc>(
        create: (context) => getIt<AccountsBloc>()..add(AccountsEvent.load(uid: uid)),
      child: Builder(builder: (innerCtx) => Scaffold(
        appBar: AppBar(title: const Text('Accounts')),
        body: BlocBuilder<AccountsBloc, AccountsState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(child: CircularProgressIndicator()),
              failure: (m) => Center(child: Text(m)),
              loaded: (items) {
                final theme = Theme.of(innerCtx);
                return ListView.separated(
                  padding: const EdgeInsets.all(12),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final a = items[index];
                    return ThemedCardTile(
                      onTap: () => context.push('/account/${a.accountId}?name=${Uri.encodeComponent(a.name)}'),
                      leading: CircleAvatar(
                        radius: 22,
                        backgroundColor: theme.colorScheme.primaryContainer,
                        child: Icon(
                          Icons.account_balance_wallet,
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                      ),
                      title: Text(a.name, style: theme.textTheme.titleMedium, overflow: TextOverflow.ellipsis),
                      badges: [
                        InfoChip(label: a.currency),
                        InfoChip(label: a.type.name.toUpperCase()),
                        if (a.isDefault) const InfoChip(label: 'DEFAULT'),
                      ],
                      trailingActions: [
                        if (!a.isDefault)
                          IconButton(
                            tooltip: 'Set as Default',
                            icon: const Icon(Icons.star_outline),
                            onPressed: () => _setDefaultAccount(context, a.accountId!, a.uid),
                          ),
                        IconButton(
                          tooltip: 'Edit',
                          icon: const Icon(Icons.edit_rounded),
                          onPressed: () => _showAccountForm(context, accountsBloc: context.read<AccountsBloc>(), initial: a),
                        ),
                        IconButton(
                          tooltip: 'Delete',
                          icon: const Icon(Icons.delete_rounded),
                          onPressed: () => _showDeleteConfirmation(context, a),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAccountForm(innerCtx, accountsBloc: innerCtx.read<AccountsBloc>()),
          child: const Icon(Icons.add),
        ),
      ),),
    );
  }
}

Future<void> _showAccountForm(BuildContext context1, {AccountEntity? initial, required AccountsBloc accountsBloc}) async {
  final formKey = GlobalKey<FormState>();
  final nameCtrl = TextEditingController(text: initial?.name ?? '');
  String currency = initial?.currency ?? 'USD';
  AccountType type = initial?.type ?? AccountType.cash;
  bool isDefault = initial?.isDefault ?? false;
  final auth = context1.read<FirebaseAuthBloc>().state as authAuthenticated;
  final theme = Theme.of(context1);
  await showModalBottomSheet(
    context: context1,
    useRootNavigator: false,
    isScrollControlled: true,
    backgroundColor: theme.colorScheme.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (sheetContext) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(sheetContext).viewInsets.bottom + 16,
              top: 16,
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    initial == null ? 'Add account' : 'Edit account',
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: nameCtrl,
                    decoration: const InputDecoration(labelText: 'Name'),
                    validator: (v) => (v?.trim().isEmpty ?? true) ? 'Required' : null,
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    value: currency,
                    items: const [
                      DropdownMenuItem(value: 'USD', child: Text('USD')),
                      DropdownMenuItem(value: 'EUR', child: Text('EUR')),
                      DropdownMenuItem(value: 'INR', child: Text('INR')),
                    ],
                    onChanged: (v) => currency = v ?? 'USD',
                    decoration: const InputDecoration(labelText: 'Currency'),
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<AccountType>(
                    value: type,
                    items: AccountType.values
                        .map((t) => DropdownMenuItem(value: t, child: Text(t.name)))
                        .toList(),
                    onChanged: (v) => type = v ?? AccountType.cash,
                    decoration: const InputDecoration(labelText: 'Type'),
                  ),
                  const SizedBox(height: 12),
                  // Only show checkbox for non-default accounts
                  if (!(initial?.isDefault ?? false))
                    Row(
                      children: [
                        Checkbox(
                          value: isDefault,
                          onChanged: (value) {
                            setState(() {
                              isDefault = value ?? false;
                            });
                          },
                        ),
                        const Text('Set as default account'),
                      ],
                    ),
                  // Show info for default accounts
                  if (initial?.isDefault ?? false)
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: theme.colorScheme.primary,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'This is the default account. Create another account to change the default.',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(sheetContext),
                          child: const Text('Cancel'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: FilledButton(
                          onPressed: () async {
                            if (!formKey.currentState!.validate()) return;
                            
                            final entity = AccountEntity(
                              accountId: initial?.accountId,
                              uid: auth.uid,
                              name: nameCtrl.text.trim(),
                              type: type,
                              currency: currency,
                              isDefault: isDefault,
                              isArchived: initial?.isArchived ?? false,
                              createdAt: initial?.createdAt ?? DateTime.now(),
                              updatedAt: DateTime.now(),
                            );
                            
                            if (initial == null) {
                              // For new accounts, add directly (repository handles default logic)
                              accountsBloc.add(AccountsEvent.add(account: entity));
                            } else {
                              // For existing accounts, update directly (repository handles default logic)
                              accountsBloc.add(AccountsEvent.update(account: entity));
                            }
                            Navigator.pop(sheetContext);
                          },
                          child: const Text('Save'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

Future<void> _setDefaultAccount(BuildContext context, int accountId, String uid) async {
  final accountsBloc = context.read<AccountsBloc>();
  accountsBloc.add(AccountsEvent.setDefault(accountId: accountId, uid: uid));
}

Future<void> _showDeleteConfirmation(BuildContext context, AccountEntity account) async {
  final accountsBloc = context.read<AccountsBloc>();
  final uid = account.uid;
  
  // Prevent deletion of default accounts
  if (account.isDefault) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cannot Delete Default Account'),
        content: Text('The account "${account.name}" cannot be deleted because it is the default account. Please set another account as default first.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
    return;
  }
  
  // Check if account is in use
  final isInUse = await accountsBloc.isAccountInUse(accountId: account.accountId!, uid: uid);
  
  if (isInUse && context.mounted) {
    // Show error dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cannot Delete Account'),
        content: Text('The account "${account.name}" cannot be deleted because it has associated transactions. Please remove or reassign all transactions first.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
    return;
  }

  if (!context.mounted) return;

  // Show confirmation dialog
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Delete Account'),
      content: Text('Are you sure you want to delete "${account.name}"? This action cannot be undone.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          style: TextButton.styleFrom(foregroundColor: Colors.red),
          child: const Text('Delete'),
        ),
      ],
    ),
  );

  if (confirmed == true && context.mounted) {
    accountsBloc.add(AccountsEvent.delete(accountId: account.accountId!, uid: uid));
  }
}
