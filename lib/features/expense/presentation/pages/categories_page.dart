import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track/features/auth/presentation/bloc/firebase_auth_bloc.dart';
import 'package:track/features/expense/domain/entities/raw_entities/category_entity.dart';
import 'package:track/features/common/presentation/widgets/themed_card_tile.dart';
import 'package:track/features/common/presentation/widgets/info_chip.dart';
import 'package:track/features/expense/presentation/bloc/categories/categories_bloc.dart';
import 'package:track/core/utils/injection/get_it.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.read<FirebaseAuthBloc>().state;
    final uid = auth is authAuthenticated ? auth.uid : '';
    return BlocProvider<CategoriesBloc>(
      create: (context) => getIt<CategoriesBloc>()..add(CategoriesEvent.load(uid: uid)),
      child: Builder(builder: (innerCtx) => Scaffold(
        appBar: AppBar(title: const Text('Categories')),
        body: BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(child: CircularProgressIndicator()),
              failure: (m) => Center(child: Text(m)),
              loaded: (items) {
                final theme = Theme.of(context);
                return ListView.separated(
                  padding: const EdgeInsets.all(12),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final c = items[index];
                    return ThemedCardTile(
                      onTap: () => _showCategoryForm(innerCtx, categoriesBloc: innerCtx.read<CategoriesBloc>(), initial: c),
                      leading: CircleAvatar(
                        radius: 22,
                        backgroundColor: theme.colorScheme.secondaryContainer,
                        child: Icon(
                          Icons.category_rounded,
                          color: theme.colorScheme.onSecondaryContainer,
                        ),
                      ),
                      title: Text(c.name, style: theme.textTheme.titleMedium, overflow: TextOverflow.ellipsis),
                      badges: [
                        InfoChip(label: c.type.name.toUpperCase()),
                      ],
                      trailingActions: [
                        IconButton(
                          tooltip: 'Edit',
                          icon: const Icon(Icons.edit_rounded),
                          onPressed: () => _showCategoryForm(innerCtx, categoriesBloc: innerCtx.read<CategoriesBloc>(), initial: c),
                        ),
                        IconButton(
                          tooltip: 'Delete',
                          icon: const Icon(Icons.delete_rounded),
                          onPressed: () => _showDeleteConfirmation(innerCtx, c),
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
          onPressed: () => _showCategoryForm(innerCtx, categoriesBloc: innerCtx.read<CategoriesBloc>()),
          child: const Icon(Icons.add),
        ),
      ),),
    );
  }
}

Future<void> _showCategoryForm(BuildContext context, {required CategoriesBloc categoriesBloc, CategoryEntity? initial}) async {
  final formKey = GlobalKey<FormState>();
  final nameCtrl = TextEditingController(text: initial?.name ?? '');
  CategoryType type = initial?.type ?? CategoryType.expense;
  final auth = context.read<FirebaseAuthBloc>().state as authAuthenticated;
  final theme = Theme.of(context);
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: theme.colorScheme.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    useRootNavigator: false,
    builder: (sheetContext) {
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
                initial == null ? 'Add category' : 'Edit category',
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (v) => (v?.trim().isEmpty ?? true) ? 'Required' : null,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<CategoryType>(
                value: type,
                items: CategoryType.values
                    .map((t) => DropdownMenuItem(value: t, child: Text(t.name)))
                    .toList(),
                onChanged: (v) => type = v ?? CategoryType.expense,
                decoration: const InputDecoration(labelText: 'Type'),
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
                      onPressed: () {
                        if (!formKey.currentState!.validate()) return;
                        final entity = CategoryEntity(
                          categoryId: initial?.categoryId,
                          uid: auth.uid,
                          name: nameCtrl.text.trim(),
                          type: type,
                          parentId: initial?.parentId,
                          icon: initial?.icon,
                          sortOrder: initial?.sortOrder ?? 0,
                        );
                        if (initial == null) {
                          categoriesBloc.add(CategoriesEvent.add(category: entity));
                        } else {
                          categoriesBloc.add(CategoriesEvent.update(category: entity));
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
}

Future<void> _showDeleteConfirmation(BuildContext context, CategoryEntity category) async {
  final categoriesBloc = context.read<CategoriesBloc>();
  final uid = category.uid;
  
  // Check if category is in use
  final isInUse = await categoriesBloc.isCategoryInUse(categoryId: category.categoryId!, uid: uid);
  
  if (isInUse && context.mounted) {
    // Show error dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cannot Delete Category'),
        content: Text('The category "${category.name}" cannot be deleted because it has associated transactions. Please remove or reassign all transactions first.'),
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
      title: const Text('Delete Category'),
      content: Text('Are you sure you want to delete "${category.name}"? This action cannot be undone.'),
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
    categoriesBloc.add(CategoriesEvent.delete(categoryId: category.categoryId!, uid: uid));
  }
}

// removed private _InfoChip in favor of reusable InfoChip widget

