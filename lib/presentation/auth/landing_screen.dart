import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  final VoidCallback onNavigateToLogin;
  final VoidCallback onNavigateToRegister;

  const LandingScreen({
    super.key,
    required this.onNavigateToLogin,
    required this.onNavigateToRegister,
  });

  static const _features = [
    'Unlimited campaigns',
    'Instagram & YouTube analytics',
    'Safe escrow payments',
    'AI-powered creator search',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // vertical centering
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text.rich(
                      TextSpan(
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                          height: 1.15,
                        ),
                        children: [
                          TextSpan(
                            text: 'Clout',
                            style: TextStyle(color: theme.colorScheme.primary),
                          ),
                          TextSpan(
                            text: 'grid',
                            style: TextStyle(
                              color: theme.colorScheme.secondary,
                            ),
                          ),
                          const TextSpan(text: '\nWhere creators and brands\n'),
                          TextSpan(
                            text: "connect.",
                            style: TextStyle(
                              color: theme.colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: const Text("Join"),
                    ),

                    const SizedBox(height: 15),

                    OutlinedButton(
                      onPressed: onNavigateToLogin,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: const Text("Login"),
                    ),

                    const SizedBox(height: 25),

                    Text(
                      'What you will get',
                      style: theme.textTheme.titleLarge,
                    ),
                    const SizedBox(height: 5),
                    ..._features.map(
                      (f) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.check_circle_rounded,
                              size: 20,
                              color: theme.colorScheme.secondary,
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Text(f, style: theme.textTheme.bodyLarge),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
