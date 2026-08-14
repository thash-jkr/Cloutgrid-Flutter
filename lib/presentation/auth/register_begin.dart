import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/auth/auth_notifier.dart';
import '../../../widgets/clout_header.dart';
import '../../../widgets/clout_toast.dart';

class BasicInfoScreen extends ConsumerStatefulWidget {
  final ValueChanged<String> onNavigateToMoreInfo;
  final VoidCallback onNavigateBack;

  const BasicInfoScreen({
    super.key,
    required this.onNavigateToMoreInfo,
    required this.onNavigateBack,
  });

  @override
  ConsumerState<BasicInfoScreen> createState() => _BasicInfoScreenState();
}

class _BasicInfoScreenState extends ConsumerState<BasicInfoScreen> {
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _otpController = TextEditingController();

  bool _isLoading = false;
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
    if (_emailVerified) {
      widget.onNavigateToMoreInfo;
      return;
    }

    final action = (_emailSent && !_emailVerified) ? 'verify' : 'send';

    final data = {
      'name': _nameController.text.trim(),
      'username': _usernameController.text.trim(),
      'email': _emailController.text.trim(),
      if (action == 'verify') 'otp': _otpController.text.trim(),
    };

    setState(() => _isLoading = true);
    try {
      await ref.read(authProvider.notifier).handleOTP(data, action);

      if (!mounted) return;
      if (action == 'send') {
        setState(() => _emailSent = true);
        showToast(context, message: 'OTP sent to your email');
      } else {
        setState(() => _emailVerified = true);
        showToast(context, message: 'Email verified');
        widget.onNavigateToMoreInfo;
      }
    } catch (e) {
      if (!mounted) return;
      showToast(context, message: e.toString(), isSuccess: false);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(
        title: 'Onboarding',
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _nameController,
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _usernameController,
                enabled: !_emailVerified,
                textCapitalization: TextCapitalization.none,
                autocorrect: false,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _emailController,
                enabled: !_emailVerified,
                textCapitalization: TextCapitalization.none,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              if (_emailSent && !_emailVerified) ...[
                const SizedBox(height: 10),
                TextField(
                  controller: _otpController,
                  decoration: const InputDecoration(
                    labelText: 'OTP',
                    hintText: 'Enter the OTP sent to your email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
              Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: _isLoading
                      ? const CircularProgressIndicator()
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
