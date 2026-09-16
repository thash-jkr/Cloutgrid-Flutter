import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:cloutgrid_flutter/providers/auth/auth_notifier.dart';
import 'package:cloutgrid_flutter/widgets/clout_header.dart';
import 'package:cloutgrid_flutter/widgets/clout_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ChangePassword extends ConsumerStatefulWidget {
  final VoidCallback onNavigateBack;

  const ChangePassword({super.key, required this.onNavigateBack});
  @override
  ConsumerState<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends ConsumerState<ChangePassword> {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future<void> _handleSubmit() async {
    final currentPassword = _currentPasswordController.text.trim();
    final newPassword = _newPasswordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (currentPassword.isEmpty ||
        newPassword.isEmpty ||
        confirmPassword.isEmpty) {
      showToast(
        context,
        message: 'Please fill in all fields',
        isSuccess: false,
      );
      return;
    }

    if (newPassword != confirmPassword) {
      showToast(
        context,
        message: 'New password and confirm password do not match',
        isSuccess: false,
      );
      return;
    }

    try {
      await ref
          .read(authProvider.notifier)
          .changePassword(currentPassword, newPassword);
      if (!mounted) return;
      showToast(
        context,
        message: 'Password changed successfully',
        isSuccess: true,
      );
      widget.onNavigateBack();
    } catch (e) {
      if (!mounted) return;
      showToast(context, message: 'Error: $e', isSuccess: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final authState = ref.watch(authProvider);

    return Scaffold(
      appBar: CloutHeader(
        title: 'Change Password',
        icon: HeaderAction(
          icon: Icons.arrow_back,
          contentDescription: 'Back',
          onClick: widget.onNavigateBack,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          spacing: 15,
          children: [
            TextField(
              controller: _currentPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Current Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),

            TextField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'New Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),

            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),

            SizedBox(height: 5),

            SizedBox(
              height: 48,
              child: Center(
                child: authState.isLoading
                    ? LoadingAnimationWidget.staggeredDotsWave(
                        color: theme.colorScheme.secondary,
                        size: 25,
                      )
                    : FilledButton(
                        onPressed: () => _handleSubmit(),
                        style: FilledButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text('Submit'),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
