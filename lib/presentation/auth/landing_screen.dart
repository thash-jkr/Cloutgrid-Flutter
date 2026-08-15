import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  final VoidCallback onNavigateToLogin;
  final VoidCallback onNavigateToRegister;

  const LandingScreen({
    super.key,
    required this.onNavigateToLogin,
    required this.onNavigateToRegister,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            15,
            MediaQuery.of(context).padding.top,
            15,
            0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Pinned to top
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
                      style: TextStyle(color: theme.colorScheme.secondary),
                    ),
                    const TextSpan(text: '\nWhere creators and brands\n'),
                    TextSpan(
                      text: 'connect.',
                      style: TextStyle(color: theme.colorScheme.secondary),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Center(
                  child: Image(
                    image: const AssetImage('assets/images/kid.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              FilledButton(
                onPressed: onNavigateToRegister,
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(text: 'Join the '),
                      TextSpan(
                        text: 'grid',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              OutlinedButton(
                onPressed: onNavigateToLogin,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text('Login'),
              ),

              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom,
                  top: 15,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _FeatureTile(
                            label: 'Unlimited campaigns',
                            color: theme.colorScheme.primary,
                            icon: CupertinoIcons.rocket,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: _FeatureTile(
                            label: 'Instagram & YouTube analytics',
                            color: theme.colorScheme.secondary,
                            icon: CupertinoIcons.chart_bar_alt_fill,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: _FeatureTile(
                            label: 'Safe escrow payments',
                            color: theme.colorScheme.secondary,
                            icon: CupertinoIcons.shield_lefthalf_fill,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: _FeatureTile(
                            label: 'AI-powered brand matching',
                            color: theme.colorScheme.primary,
                            icon: CupertinoIcons.sparkles,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureTile extends StatelessWidget {
  final String label;
  final Color color;
  final IconData icon;

  const _FeatureTile({
    required this.label,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(15),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white, size: 25),
              const SizedBox(height: 5),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
