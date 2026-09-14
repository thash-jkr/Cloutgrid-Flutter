import 'package:animated_emoji/emoji.dart';
import 'package:animated_emoji/emoji_data.dart';
import 'package:animated_emoji/emojis.g.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
                  child: Lottie.asset(
                    'assets/animations/hero.json',
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
                  spacing: 15,
                  children: [
                    _FeatureTile(
                      label: 'Unlimited campaigns',
                      icon: AnimatedEmojis.rocket,
                    ),
                    _FeatureTile(
                      label: 'Instagram & YouTube analytics',
                      icon: AnimatedEmojis.barChart,
                    ),
                    _FeatureTile(
                      label: 'Safe escrow payments',
                      icon: AnimatedEmojis.moneyWithWings,
                    ),
                    _FeatureTile(
                      label: 'AI-powered brand matching',
                      icon: AnimatedEmojis.sparkles,
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
  final AnimatedEmojiData icon;

  const _FeatureTile({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          AnimatedEmoji(icon, size: 30, repeat: true),
          const SizedBox(width: 10),
          Text(
            label,
            textAlign: TextAlign.left,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
