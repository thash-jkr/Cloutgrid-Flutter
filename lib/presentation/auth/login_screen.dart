import 'package:cloutgrid_flutter/providers/auth/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/auth/auth_models.dart';
import '../../widgets/clout_header.dart';
import '../../widgets/clout_toast.dart';

class LoginScreen extends ConsumerStatefulWidget {
  final VoidCallback onNavigateBack;
  final VoidCallback onNavigateToResetPassword;

  const LoginScreen({
    super.key,
    required this.onNavigateBack,
    required this.onNavigateToResetPassword,
  });

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool _isLoading = false;
  bool showPassword = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      showToast(
        context,
        message: 'Please fill in all fields',
        isSuccess: false,
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      await ref.read(authProvider.notifier).login(email, password, "creator");
    } catch (e) {
      if (!mounted) return;
      showToast(context, message: "Login failed: $e", isSuccess: false);
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _openUrl(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (!context.mounted) return;
      showToast(context, message: "Failed to open $url", isSuccess: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: CloutHeader(
        title: "Creator Login",
        icon: HeaderAction(
          icon: Icons.arrow_back,
          contentDescription: 'Back',
          onClick: widget.onNavigateBack,
        ),
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 15),

                TextField(
                  controller: _emailController,
                  keyboardType: .emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: _passwordController,
                  obscureText: !showPassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    suffixIcon: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      child: Icon(
                        showPassword
                            ? Icons.visibility_rounded
                            : Icons.visibility_off_rounded,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  height: 48,
                  child: Center(
                    child: _isLoading
                        ? LoadingAnimationWidget.staggeredDotsWave(
                            color: theme.colorScheme.secondary,
                            size: 25,
                          )
                        : FilledButton(
                            onPressed: _handleSubmit,
                            style: FilledButton.styleFrom(
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: const Text('Submit'),
                          ),
                  ),
                ),

                const SizedBox(height: 25),

                _LoginFooter(
                  question: "Don't have an account?",
                  answer: 'Register',
                  onTap: widget.onNavigateBack,
                ),

                const SizedBox(height: 15),

                _LoginFooter(
                  question: 'Forgot Password?',
                  answer: 'Reset',
                  onTap: widget.onNavigateToResetPassword,
                ),

                const SizedBox(height: 15),

                _LoginFooter(
                  question: 'Are you a',
                  answer: 'Brand?',
                  onTap: () => _openUrl(context, 'https://cloutgrid.com'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginFooter extends StatelessWidget {
  final String question;
  final String answer;
  final VoidCallback onTap;

  const _LoginFooter({
    required this.question,
    required this.answer,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior
          .opaque, // matches indication = null: no ripple, still tappable everywhere
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            question,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
          const SizedBox(width: 5),
          Text(
            answer,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
