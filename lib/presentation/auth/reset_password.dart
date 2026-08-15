import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../providers/auth/auth_notifier.dart';
import '../../widgets/clout_header.dart';
import '../../widgets/clout_toast.dart';

class ResetPassword extends ConsumerStatefulWidget {
  final VoidCallback onNavigateBack;

  const ResetPassword({super.key, required this.onNavigateBack});

  @override
  ConsumerState<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends ConsumerState<ResetPassword> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    try {
      await ref
          .read(authProvider.notifier)
          .resetPassword(_emailController.text.trim());

      if (!mounted) return;
      showToast(context, message: 'Password reset email sent');
      widget.onNavigateBack();
    } catch (e) {
      if (!mounted) return;
      showToast(context, message: e.toString(), isSuccess: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final topInset = MediaQuery.of(context).padding.top;
    final isLoading = ref.watch(authProvider).value?.isLoading ?? false;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(
        title: 'Reset Password',
        icon: HeaderAction(
          icon: Icons.arrow_back,
          contentDescription: 'Back',
          onClick: widget.onNavigateBack,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: kToolbarHeight + topInset),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _emailController,
                textCapitalization: TextCapitalization.none,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Center(
                child: isLoading
                    ? LoadingAnimationWidget.staggeredDotsWave(
                        color: theme.colorScheme.secondary,
                        size: 25,
                      )
                    : FilledButton(
                        onPressed: _handleSubmit,
                        child: const Text('Submit'),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
