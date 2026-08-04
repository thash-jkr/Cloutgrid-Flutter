import 'package:flutter/material.dart';

class InstagramConstants extends StatelessWidget {
  const InstagramConstants({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              'Connecting your Instagram unlocks analytics that help you '
              'stand out to businesses 🙋🏻‍♂️. This transparency builds trust, '
              'boosts your credibility, and increases your chances of '
              'securing collaborations 🤝.',
              style: TextStyle(
                fontSize: 13,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const _InfoSection(
            title: "What you'll get once connected:",
            bullets: [
              'Verified display of your follower count, followings, and media count.',
              'Insights into your reach, profile views, and audience engagement shown on your Cloutgrid profile.',
              'Access to detailed media insights (likes, comments, impressions, video views) that brands care about.',
              'A stronger, more credible profile that businesses can evaluate at a glance.',
            ],
          ),
          const SizedBox(height: 20),
          const _InfoSection(
            title: 'What you need before connecting:',
            bullets: [
              'Your Instagram must be a Creator or Business account (personal accounts cannot connect).',
              'Your Instagram account must be linked to a Facebook Page (Meta requires this link for insights).',
              "You'll log in with your Facebook credentials to complete the connection.",
            ],
          ),
          const SizedBox(height: 20),
          const _InfoSection(
            title: 'How to connect:',
            bullets: [
              'Make sure your Instagram is switched to a Creator or Business account (you can change this in Instagram Settings → Account).',
              'Ensure your Instagram is linked to a Facebook Page you manage.',
              'Click "Connect Instagram" above and log in with Facebook.',
              'Grant the requested permissions (needed to pull your analytics securely).',
            ],
          ),
        ],
      ),
    );
  }
}

class YoutubeConstants extends StatelessWidget {
  const YoutubeConstants({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              'Connecting your YouTube channel unlocks verified metrics '
              'that demonstrate your influence 🚀. Providing real-time data '
              'builds professional credibility and makes it easier for '
              'brands to partner with you 🤝.',
              style: TextStyle(
                fontSize: 13,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const _InfoSection(
            title: "What you'll get once connected:",
            bullets: [
              'Verified subscriber count and lifetime video views displayed on your profile.',
              'Real-time data on your average view duration, watch time, and click-through rates.',
              'Audience demographics including age, gender, and top geographic locations.',
              'Performance trends for your latest uploads and most popular content.',
            ],
          ),
          const SizedBox(height: 20),
          const _InfoSection(
            title: 'What you need before connecting:',
            bullets: [
              'A YouTube channel with active content (public or unlisted videos).',
              'The Google Account credentials associated with your YouTube channel.',
              "Approval for Cloutgrid to view your YouTube Analytics reports via Google's secure login.",
            ],
          ),
          const SizedBox(height: 20),
          const _InfoSection(
            title: 'How to connect:',
            bullets: [
              'Ensure you are logged into the Google Account that manages your YouTube channel.',
              'Click "Connect YouTube" above to open the secure Google Sign-In prompt.',
              'Select the specific channel you wish to link to Cloutgrid.',
              'Grant the requested permissions so we can securely display your analytics to potential partners.',
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoSection extends StatelessWidget {
  final String title;
  final List<String> bullets;

  const _InfoSection({required this.title, required this.bullets});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: bullets
                .map(
                  (text) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _BulletPoint(text: text),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _BulletPoint extends StatelessWidget {
  final String text;

  const _BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '•',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}
