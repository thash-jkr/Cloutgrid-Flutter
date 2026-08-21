import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../providers/auth/auth_notifier.dart';
import '../../../widgets/category_list.dart';
import '../../../widgets/category_sheet.dart';
import '../../../widgets/clout_header.dart';
import '../../../widgets/clout_sheet.dart';
import '../../../widgets/clout_toast.dart';

class RegisterEnd extends ConsumerStatefulWidget {
  final Map<String, String> basicInfo;
  final VoidCallback onNavigateBack;
  final VoidCallback onNavigateToLogin;

  const RegisterEnd({
    super.key,
    required this.basicInfo,
    required this.onNavigateBack,
    required this.onNavigateToLogin,
  });

  @override
  ConsumerState<RegisterEnd> createState() => _RegisterEndState();
}

class _RegisterEndState extends ConsumerState<RegisterEnd> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String _category = '';

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _openCategorySheet() {
    cloutSheet(
      context,
      content: (context, scrollController) => CategorySheet(
        categories: CategoryList.allOptions,
        selectedCategory: _category,
        onCategorySelected: (cat) {
          setState(() => _category = cat.value);
          Navigator.pop(context);
        },
        scrollController: scrollController,
      ),
    );
  }

  Future<void> _handleSubmit() async {
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (password.isEmpty || confirmPassword.isEmpty) {
      showToast(
        context,
        message: 'Password fields cannot be empty',
        isSuccess: false,
      );
      return;
    }

    if (password != confirmPassword) {
      showToast(context, message: 'Passwords do not match', isSuccess: false);
      return;
    }

    if (_category.isEmpty) {
      showToast(
        context,
        message: 'You have to select a category',
        isSuccess: false,
      );
      return;
    }

    final data = {
      ...widget.basicInfo,
      'user.password': _passwordController.text,
      'area': _category,
    };

    try {
      await ref.read(authProvider.notifier).register(data, 'creator');

      if (!mounted) return;

      showToast(context, message: 'Registration successful');
      widget.onNavigateToLogin();
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
                controller: _passwordController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),

              TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),

              GestureDetector(
                onTap: _openCategorySheet,
                child: AbsorbPointer(
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Category',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Text(
                      CategoryList.labelFor(_category),
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),
              ),
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
                          child: const Text('Submit'),
                        ),
                ),
              ),
              const _ConsentText(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ConsentText extends StatefulWidget {
  const _ConsentText();

  @override
  State<_ConsentText> createState() => _ConsentTextState();
}

class _ConsentTextState extends State<_ConsentText> {
  TapGestureRecognizer? _privacyRecognizer;
  TapGestureRecognizer? _eulaRecognizer;

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  void dispose() {
    _privacyRecognizer?.dispose();
    _eulaRecognizer?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final linkStyle = TextStyle(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.w600,
    );

    _privacyRecognizer = TapGestureRecognizer()
      ..onTap = () => _openUrl('https://cloutgrid.com/privacypolicy');
    _eulaRecognizer = TapGestureRecognizer()
      ..onTap = () => _openUrl('https://cloutgrid.com/eula');

    return Text.rich(
      TextSpan(
        style: theme.textTheme.bodySmall,
        children: [
          const TextSpan(text: 'By clicking submit, you agree to our \n'),
          TextSpan(
            text: 'Privacy Policy',
            style: linkStyle,
            recognizer: _privacyRecognizer,
          ),
          const TextSpan(text: ' and '),
          TextSpan(
            text: 'End User Licence Agreement (EULA)',
            style: linkStyle,
            recognizer: _eulaRecognizer,
          ),
          const TextSpan(text: '.'),
        ],
      ),
    );
  }
}
