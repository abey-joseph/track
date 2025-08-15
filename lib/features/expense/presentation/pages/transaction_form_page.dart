import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/features/expense/domain/entities/transaction_entity.dart';
import 'package:track/features/expense/presentation/bloc/transaction/transaction_bloc.dart';
import 'package:track/features/expense/domain/repo/expense_repository.dart';
import 'package:track/core/auth/firebase_services.dart';

class TransactionFormPage extends StatelessWidget {
  final TransactionEntity? existing;
  const TransactionFormPage({super.key, this.existing});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TransactionBloc>(
          create: (_) {
            final uid = getIt<FirebaseAuthService>().currentUser?.uid ?? '';
            final bloc = TransactionBloc(getIt<ExpenseRepository>());
            if (existing == null) {
              bloc.add(InitForCreate(uid));
            } else {
              bloc.add(InitForEdit(uid: uid, entity: existing!));
            }
            return bloc;
          },
        ),
      ],
      child: const _TransactionFormView(),
    );
  }
}

class _TransactionFormView extends StatefulWidget {
  const _TransactionFormView();
  @override
  State<_TransactionFormView> createState() => _TransactionFormViewState();
}

class _TransactionFormViewState extends State<_TransactionFormView> {
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransactionBloc, TransactionState>(
      listenWhen: (p, c) => p.isSubmitting != c.isSubmitting || p.isSuccess != c.isSuccess || p.errorMessage != c.errorMessage,
      listener: (context, state) {
        if (!state.isSubmitting && state.isSuccess) {
          context.pop();
        }
        if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        }
      },
      buildWhen: (p, c) => p != c,
      builder: (context, state) {
        _amountController.value = TextEditingValue(text: state.amountText, selection: _amountController.selection);
        _noteController.value = TextEditingValue(text: state.note ?? '', selection: _noteController.selection);

        return Scaffold(
          appBar: AppBar(
            title: Text(state.mode == TransactionFormMode.create ? 'Add Transaction' : 'Edit Transaction'),
            actions: [
              if (state.mode == TransactionFormMode.edit)
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: state.isSubmitting
                      ? null
                      : () => context.read<TransactionBloc>().add(DeleteTransaction()),
                ),
            ],
          ),
          body: state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SegmentedButton<TransactionType>(
                        segments: const [
                          ButtonSegment(value: TransactionType.expense, label: Text('Expense'), icon: Icon(Icons.remove_circle_outline)),
                          ButtonSegment(value: TransactionType.income, label: Text('Income'), icon: Icon(Icons.add_circle_outline)),
                          ButtonSegment(value: TransactionType.transfer, label: Text('Transfer'), icon: Icon(Icons.swap_horiz)),
                        ],
                        selected: {state.type},
                        onSelectionChanged: (s) => context.read<TransactionBloc>().add(ChangeType(s.first)),
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<int>(
                        value: state.accountId,
                        items: state.accounts
                            .map((a) => DropdownMenuItem<int>(
                                  value: a.accountId,
                                  child: Text('${a.name} (${a.currency})'),
                                ))
                            .toList(),
                        decoration: const InputDecoration(labelText: 'Account'),
                        onChanged: (v) {
                          if (v != null) context.read<TransactionBloc>().add(ChangeAccount(v));
                        },
                      ),
                      const SizedBox(height: 12),
                      if (state.type != TransactionType.transfer)
                        DropdownButtonFormField<int?>(
                          value: state.categoryId,
                          items: [
                            const DropdownMenuItem<int?>(value: null, child: Text('Uncategorized')),
                            ...state.categories.map(
                              (c) => DropdownMenuItem<int?>(value: c.categoryId, child: Text(c.name)),
                            )
                          ],
                          decoration: const InputDecoration(labelText: 'Category'),
                          onChanged: (v) => context.read<TransactionBloc>().add(ChangeCategory(v)),
                        ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<int?>(
                        value: state.payeeId,
                        items: [
                          const DropdownMenuItem<int?>(value: null, child: Text('No payee')),
                          ...state.payees.map(
                            (p) => DropdownMenuItem<int?>(value: p.payeeId, child: Text(p.name)),
                          )
                        ],
                        decoration: const InputDecoration(labelText: 'Payee'),
                        onChanged: (v) => context.read<TransactionBloc>().add(ChangePayee(v)),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _amountController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                        decoration: InputDecoration(
                          labelText: 'Amount (${state.currency})',
                        ),
                        onChanged: (v) => context.read<TransactionBloc>().add(ChangeAmount(v)),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _noteController,
                        decoration: const InputDecoration(labelText: 'Note'),
                        onChanged: (v) => context.read<TransactionBloc>().add(ChangeNote(v.isEmpty ? null : v)),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: Text('Date: ${DateUtils.dateOnly(state.occurredOn).toLocal().toString().split(' ').first}'),
                          ),
                          TextButton.icon(
                            icon: const Icon(Icons.calendar_today),
                            label: const Text('Pick'),
                            onPressed: () async {
                              final picked = await showDatePicker(
                                context: context,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                                initialDate: state.occurredOn,
                              );
                              if (picked != null) {
                                // Preserve time portion as now
                                final result = DateTime(picked.year, picked.month, picked.day);
                                // ignore: use_build_context_synchronously
                                context.read<TransactionBloc>().add(ChangeDate(result));
                              }
                            },
                          )
                        ],
                      ),
                      const SizedBox(height: 24),
                      FilledButton.icon(
                        onPressed: state.isSubmitting
                            ? null
                            : () => context.read<TransactionBloc>().add(SubmitTransaction()),
                        icon: state.isSubmitting
                            ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                            : const Icon(Icons.check),
                        label: Text(state.mode == TransactionFormMode.create ? 'Save' : 'Update'),
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}


