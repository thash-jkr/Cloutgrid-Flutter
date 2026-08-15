import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../providers/auth/auth_notifier.dart';
import '../../../widgets/clout_header.dart';
import '../../../widgets/clout_toast.dart';

class RegisterBegin extends ConsumerStatefulWidget {
  final ValueChanged<Map<String, String>> onNavigateToMoreInfo;
  final VoidCallback onNavigateBack;

  const RegisterBegin({
    super.key,
    required this.onNavigateToMoreInfo,
    required this.onNavigateBack,
  });

  @override
  ConsumerState<RegisterBegin> createState() => _RegisterBeginState();
}

class _RegisterBeginState extends ConsumerState<RegisterBegin> {
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _otpController = TextEditingController();

  bool _emailSent = false;
  bool _emailVerified = false;

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    final name = _nameController.text.trim();
    final username = _usernameController.text.trim();
    final email = _emailController.text.trim();

    if (_emailVerified) {
      widget.onNavigateToMoreInfo({
        'user.name': name,
        'user.username': username,
        'user.email': email,
      });
      return;
    }

    if (name.isEmpty || email.isEmpty || username.isEmpty) {
      if (!mounted) return;
      showToast(context, message: "Fields cannot be empty", isSuccess: false);
      return;
    }

    final action = (_emailSent && !_emailVerified) ? 'verify' : 'send';

    if (action == "verify" && _otpController.text.isEmpty) {
      if (!mounted) return;
      showToast(context, message: "OTP cannot be empty", isSuccess: false);
      return;
    }

    final data = {
      'name': name,
      'username': username,
      'email': email,
      if (action == 'verify') 'otp': _otpController.text.trim(),
    };

    try {
      await ref
          .read(authProvider.notifier)
          .handleOTP(data, action == 'verify' ? 'verify' : 'send');

      if (!mounted) return;
      if (action == 'send') {
        setState(() => _emailSent = true);
        showToast(context, message: 'OTP sent to your email');
      } else {
        setState(() => _emailVerified = true);
        showToast(context, message: 'Email verified');
        widget.onNavigateToMoreInfo({
          'name': _nameController.text.trim(),
          'username': _usernameController.text.trim(),
          'email': _emailController.text.trim(),
        });
      }
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
        title: 'Creator Registration',
        icon: HeaderAction(
          icon: Icons.arrow_back,
          contentDescription: 'Back',
          onClick: widget.onNavigateBack,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: kToolbarHeight + topInset),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _nameController,
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),

              TextField(
                controller: _usernameController,
                enabled: !_emailVerified,
                textCapitalization: TextCapitalization.none,
                autocorrect: false,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),

              TextField(
                controller: _emailController,
                enabled: !_emailVerified,
                textCapitalization: TextCapitalization.none,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),

              if (_emailSent && !_emailVerified) ...[
                TextField(
                  controller: _otpController,
                  decoration: InputDecoration(
                    labelText: 'OTP',
                    hintText: 'Enter the OTP sent to your email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  keyboardType: .number,
                ),
              ],

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Center(
                  child: isLoading
                      ? LoadingAnimationWidget.staggeredDotsWave(
                          color: theme.colorScheme.secondary,
                          size: 25,
                        )
                      : FilledButton(
                          onPressed: _handleSubmit,
                          child: Text(_emailVerified ? 'Continue' : 'Submit'),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
