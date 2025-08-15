import 'dart:math';
import 'package:track/core/auth/firebase_services.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/firebase_auth_bloc.dart';
import 'package:track/features/common/presentation/bloc/track_bloc/track_bloc.dart';

/// Minimal, classy login page that respects the system theme.
/// Uses FirebaseAuthBloc + GetIt-backed FirebaseAuthService.
/// This page should be the entry point: it checks auth on load and
/// navigates away on success
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    context.read<FirebaseAuthBloc>().add(
          FirebaseAuthEvent.signInRequested(
            email: _emailCtrl.text.trim(),
            password: _passwordCtrl.text,
          ),
        );
  }

  Future<void> _promptForNameIfMissing(BuildContext context) async {
    final auth = GetIt.I<FirebaseAuthService>();
    if (auth.hasDisplayName) return;

    String suggested = _suggestRandomName();
    final controller = TextEditingController(text: suggested);

    final result = await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Choose your display name'),
          content: TextField(
            controller: controller,
            autofocus: true,
            decoration: const InputDecoration(
              labelText: 'Name',
              hintText: 'Enter your name',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(suggested),
              child: const Text('Use suggestion'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(ctx).pop(controller.text.trim()),
              child: const Text('Continue'),
            ),
          ],
        );
      },
    );

    final chosen = (result ?? '').trim();
    if (chosen.isNotEmpty) {
      await auth.updateDisplayName(chosen);
      if (!context.mounted) return;
      context
          .read<FirebaseAuthBloc>()
          .add(FirebaseAuthEvent.saveDisplayName(name: chosen));
    }
  }

  String _suggestRandomName() {
    const adjectives = [
      'Brisk',
      'Calm',
      'Swift',
      'Bright',
      'Clever',
      'Merry',
      'Nimble',
      'Zen'
    ];
    const nouns = [
      'Panda',
      'Falcon',
      'Otter',
      'Lion',
      'Koala',
      'Tiger',
      'Dolphin',
      'Eagle'
    ];
    final r = Random();
    final number = 100 + r.nextInt(900);
    return '${adjectives[r.nextInt(adjectives.length)]} ${nouns[r.nextInt(nouns.length)]} $number';
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FirebaseAuthBloc, FirebaseAuthState>(
      listenWhen: (p, c) => p != c,
      listener: (context, state) {
        if (state is authAuthenticated) {
          // Seed base data for the user if empty
          final uid = state.uid;
          // Debug log
          // ignore: avoid_print
          print('[LoginScreen] authAuthenticated -> ensureDefaultsForUser uid=$uid');
          context.read<TrackBloc>().add(TrackEvent.ensureDefaultsForUser(uid: uid));
          // If no display name yet, ask for one once after sign-in/sign-up.
          _promptForNameIfMissing(context).then((_) {
            if (!context.mounted) return;
            context.pushReplacementNamed('home');
          });
        }
      },
      builder: (context, state) {
        final theme = Theme.of(context);
        final isLoading = state is authLoading;

        return Scaffold(
          appBar: AppBar(title: const Text('Sign in')),
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 420),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Icon(Icons.track_changes,
                            size: 56, color: theme.colorScheme.primary),
                        const SizedBox(height: 16),
                        Text('Welcome back',
                            style: theme.textTheme.headlineSmall,
                            textAlign: TextAlign.center),
                        const SizedBox(height: 24),

                        // Email
                        TextFormField(
                          controller: _emailCtrl,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          autofillHints: const [
                            AutofillHints.username,
                            AutofillHints.email
                          ],
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            hintText: 'you@example.com',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                          ),
                          validator: (v) {
                            final value = v?.trim() ?? '';
                            if (value.isEmpty) return 'Email is required';
                            final emailRx =
                                RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                            if (!emailRx.hasMatch(value)) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),

                        // Password
                        TextFormField(
                          controller: _passwordCtrl,
                          obscureText: _obscure,
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (_) => _submit(context),
                          autofillHints: const [AutofillHints.password],
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            suffixIcon: IconButton(
                              tooltip:
                                  _obscure ? 'Show password' : 'Hide password',
                              onPressed: isLoading
                                  ? null
                                  : () => setState(() => _obscure = !_obscure),
                              icon: Icon(_obscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                          ),
                          validator: (v) {
                            final value = v ?? '';
                            if (value.isEmpty) return 'Password is required';
                            if (value.length < 6) return 'Minimum 6 characters';
                            return null;
                          },
                        ),
                        const SizedBox(height: 8),

                        // Sign in button
                        SizedBox(
                          height: 48,
                          child: FilledButton(
                            onPressed:
                                isLoading ? null : () => _submit(context),
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 250),
                              child: isLoading
                                  ? const SizedBox(
                                      key: ValueKey('loading'),
                                      height: 22,
                                      width: 22,
                                      child: CircularProgressIndicator(
                                          strokeWidth: 2),
                                    )
                                  : const Text('Sign in',
                                      key: ValueKey('text')),
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Register
                        OutlinedButton(
                          onPressed: isLoading
                              ? null
                              : () {
                                  if (!(_formKey.currentState?.validate() ??
                                      false)) {
                                    return;
                                  }
                                  context.read<FirebaseAuthBloc>().add(
                                        FirebaseAuthEvent.signUpRequested(
                                          email: _emailCtrl.text.trim(),
                                          password: _passwordCtrl.text,
                                        ),
                                      );
                                },
                          child: const Text('Create account'),
                        ),

                        const SizedBox(height: 8),

                        // Feedback area
                        _StatusMessage(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _StatusMessage extends StatelessWidget {
  const _StatusMessage();

  @override
  Widget build(BuildContext context) {
    //log("message");
    final theme = Theme.of(context);
    return BlocBuilder<FirebaseAuthBloc, FirebaseAuthState>(
      buildWhen: (previous, current) => current is authFailure,
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: switch (state) {
            authFailure(:final message) => Padding(
                key: const ValueKey('error'),
                padding: const EdgeInsets.only(top: 4),
                child: Text(message,
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: theme.colorScheme.error)),
              ),
            authUnauthenticated() =>
              const SizedBox.shrink(key: ValueKey('unauth')),
            authAuthenticated() => Padding(
                key: const ValueKey('ok'),
                padding: const EdgeInsets.only(top: 4),
                child: Text('Signed in', style: theme.textTheme.bodySmall),
              ),
            authLoading() =>
              const SizedBox.shrink(key: ValueKey('loading-msg')),
            authInitial() => const SizedBox.shrink(key: ValueKey('init')),
            FirebaseAuthState() => throw UnimplementedError(
                'emitted a state inside FirebaseAuthState that is not initialized in swith of login page'),
          },
        );
      },
    );
  }
}
