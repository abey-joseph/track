import 'package:flutter/material.dart';
import 'package:track/core/use_cases/widgets/titile_action_button.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/core/auth/firebase_services.dart';
import 'package:track/features/expense/domain/entities/payee_entity.dart';
import 'package:track/features/expense/domain/repo/expense_repository.dart';

class PayeePage extends StatefulWidget {
  const PayeePage({super.key});

  @override
  State<PayeePage> createState() => _PayeePageState();
}

class _PayeePageState extends State<PayeePage> {
  bool _loading = true;
  List<PayeeEntity> _payees = [];
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    final uid = getIt<FirebaseAuthService>().currentUser?.uid ?? '';
    final res = await getIt<ExpenseRepository>().getPayees(uid);
    res.fold(
      (l) => setState(() {
        _error = l.message;
        _payees = [];
        _loading = false;
      }),
      (r) => setState(() {
        _payees = r;
        _loading = false;
      }),
    );
  }

  Future<void> _openAddEdit({PayeeEntity? existing}) async {
    final uid = getIt<FirebaseAuthService>().currentUser?.uid ?? '';
    final nameCtrl = TextEditingController(text: existing?.name ?? '');

    final saved = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                existing == null ? 'Add Payee' : 'Edit Payee',
                style: Theme.of(ctx).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: () async {
                  if (nameCtrl.text.trim().isEmpty) {
                    ScaffoldMessenger.of(ctx).showSnackBar(
                      const SnackBar(content: Text('Please enter a name')),
                    );
                    return;
                  }
                  final repo = getIt<ExpenseRepository>();
                  final entity = PayeeEntity(
                    payeeId: existing?.payeeId,
                    uid: uid,
                    name: nameCtrl.text.trim(),
                    normalized: nameCtrl.text.trim().toLowerCase(),
                  );
                  final result = existing == null
                      ? await repo.createPayee(entity)
                      : await repo.updatePayee(entity);
                  result.fold(
                    (l) => ScaffoldMessenger.of(ctx)
                        .showSnackBar(SnackBar(content: Text(l.message))),
                    (r) => Navigator.of(ctx).pop(true),
                  );
                },
                icon: const Icon(Icons.check),
                label: Text(existing == null ? 'Save' : 'Update'),
              ),
              const SizedBox(height: 8),
              if (existing != null)
                TextButton.icon(
                  onPressed: () async {
                    final ok = await showDialog<bool>(
                      context: ctx,
                      builder: (dctx) => AlertDialog(
                        title: const Text('Delete payee?'),
                        content: const Text('This will remove the payee.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(dctx).pop(false),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(dctx).pop(true),
                            child: const Text('Delete'),
                          ),
                        ],
                      ),
                    );
                    if (ok == true && existing.payeeId != null) {
                      final repo = getIt<ExpenseRepository>();
                      final res = await repo.deletePayee(existing.payeeId!);
                      res.fold(
                        (l) => ScaffoldMessenger.of(ctx)
                            .showSnackBar(SnackBar(content: Text(l.message))),
                        (r) => Navigator.of(ctx).pop(true),
                      );
                    }
                  },
                  icon: const Icon(Icons.delete_outline),
                  label: const Text('Delete'),
                ),
            ],
          ),
        );
      },
    );

    if (saved == true) {
      await _load();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payees"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 19.0),
            child: titleActionButton(
              icon: Icons.add,
              onTap: () => _openAddEdit(),
            ),
          ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text(_error!))
              : _payees.isEmpty
                  ? ListView(
                      padding: const EdgeInsets.all(16.0),
                      children: [
                        _buildPlaceholderCard(
                          icon: Icons.person,
                          title: "No Payees Yet",
                          subtitle: "Add your first payee to get started",
                          actionText: "Add Payee",
                          onAction: () => _openAddEdit(),
                        ),
                      ],
                    )
                  : RefreshIndicator(
                      onRefresh: _load,
                      child: ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemCount: _payees.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (ctx, i) {
                          final p = _payees[i];
                          return ListTile(
                            leading: const Icon(Icons.person_outline),
                            title: Text(p.name),
                            subtitle: Text(p.normalized ?? ''),
                            trailing: IconButton(
                              icon: const Icon(Icons.edit_outlined),
                              onPressed: () => _openAddEdit(existing: p),
                            ),
                          );
                        },
                      ),
                    ),
    );
  }

  Widget _buildPlaceholderCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String actionText,
    required VoidCallback onAction,
  }) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Icon(
              icon,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: onAction,
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(actionText),
            ),
          ],
        ),
      ),
    );
  }
}
