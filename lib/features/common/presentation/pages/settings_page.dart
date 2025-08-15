import 'package:flutter/material.dart';
import 'package:track/core/use_cases/widgets/titile_action_button.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/core/database/database/app_database.dart';
import 'package:track/features/auth/presentation/bloc/firebase_auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          toolbarHeight: 70,
          title: Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 20),
            child: Text("Settings"),
          ),
          centerTitle: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 19.0, top: 15),
              child:
                  titleActionButton(icon: Icons.account_circle, onTap: () {}),
            )
          ],
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Debug Options',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                BlocBuilder<FirebaseAuthBloc, FirebaseAuthState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      authenticated: (uid, email, displayName) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              try {
                                final appDatabase = getIt<AppDatabase>();
                                await appDatabase.addSampleDataForUser(uid);
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Sample data added successfully!'),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                }
                              } catch (e) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Failed to add sample data: $e'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              }
                            },
                            child: const Text('Add Sample Data (Debug)'),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () async {
                              try {
                                final appDatabase = getIt<AppDatabase>();
                                final version = await appDatabase.getDatabaseVersion();
                                final needsUpgrade = await appDatabase.needsUpgrade();
                                
                                if (context.mounted) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Database Info'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Current Version: ${version ?? "Unknown"}'),
                                          Text('Needs Upgrade: $needsUpgrade'),
                                          if (needsUpgrade)
                                            const Text('\nNote: Restart the app to trigger database upgrade'),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.of(context).pop(),
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              } catch (e) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Failed to check database: $e'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              }
                            },
                            child: const Text('Check Database Version'),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () async {
                              if (context.mounted) {
                                final confirmed = await showDialog<bool>(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Delete Database'),
                                    content: const Text(
                                      'This will delete all data and restart the app. Are you sure?',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.of(context).pop(false),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.of(context).pop(true),
                                        child: const Text('Delete'),
                                        style: TextButton.styleFrom(foregroundColor: Colors.red),
                                      ),
                                    ],
                                  ),
                                );
                                
                                if (confirmed == true) {
                                  try {
                                    final appDatabase = getIt<AppDatabase>();
                                    await appDatabase.deleteDatabase();
                                    
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('Database deleted. Please restart the app.'),
                                          backgroundColor: Colors.orange,
                                        ),
                                      );
                                    }
                                  } catch (e) {
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('Failed to delete database: $e'),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    }
                                  }
                                }
                              }
                            },
                            child: const Text('Delete Database (Debug)'),
                            style: ElevatedButton.styleFrom(foregroundColor: Colors.red),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () async {
                              try {
                                final appDatabase = getIt<AppDatabase>();
                                
                                // First cleanup existing data
                                await appDatabase.cleanupSampleData(uid);
                                
                                // Then add fresh sample data with correct dates
                                await appDatabase.addSampleDataForUser(uid);
                                
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Sample data refreshed with correct dates!'),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                }
                              } catch (e) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Failed to refresh sample data: $e'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              }
                            },
                            child: const Text('Refresh Sample Data'),
                            style: ElevatedButton.styleFrom(foregroundColor: Colors.green),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () async {
                              try {
                                final appDatabase = getIt<AppDatabase>();
                                await appDatabase.debugUserData(uid);
                                
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Check console for debug output'),
                                      backgroundColor: Colors.blue,
                                    ),
                                  );
                                }
                              } catch (e) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Debug failed: $e'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              }
                            },
                            child: const Text('Debug User Data'),
                            style: ElevatedButton.styleFrom(foregroundColor: Colors.blue),
                          ),
                        ],
                      ),
                      orElse: () => const Text('Please sign in to access debug options'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
