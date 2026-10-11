import 'package:cloutgrid_flutter/widgets/clout_header.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

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

class _InsightInfo {
  final String title;
  final String description;
  final dynamic icon; // Hugeicons icon data, same pattern as HeaderAction

  const _InsightInfo({
    required this.title,
    required this.description,
    required this.icon,
  });
}

const _profileInsights = [
  _InsightInfo(
    title: 'Accounts engaged',
    description:
        'The number of unique accounts that interacted with your content. An account is counted once, even if it interacted several times.',
    icon: HugeIcons.strokeRoundedUserGroup,
  ),
  _InsightInfo(
    title: 'Likes',
    description: 'The total number of likes on your posts, reels and videos.',
    icon: HugeIcons.strokeRoundedFavourite,
  ),
  _InsightInfo(
    title: 'Content interactions',
    description:
        'The total number of actions people took on your content, such as likes, comments, shares, saves and replies. Unlike accounts engaged, one person can add several interactions.',
    icon: HugeIcons.strokeRoundedCursorPointer01,
  ),
  _InsightInfo(
    title: 'Views',
    description:
        'The number of times your content was played or displayed. Repeat views by the same account are counted.',
    icon: HugeIcons.strokeRoundedView,
  ),
];

const _reachInfo = [
  _InsightInfo(
    title: 'Reach',
    description:
        'The number of unique accounts that saw your content at least once. An account is counted once, no matter how many times it viewed your content.',
    icon: HugeIcons.strokeRoundedMegaphone01,
  ),
  _InsightInfo(
    title: 'Reading the chart',
    description:
        'Each point is the reach for one day. Peaks usually line up with days you posted or when a post took off, and dips show quieter days.',
    icon: HugeIcons.strokeRoundedTradeUp,
  ),
];

const _mediaInsightsInfo = [
  _InsightInfo(
    title: 'Views',
    description:
        'The average number of times each of your last 6 posts was played or displayed.',
    icon: HugeIcons.strokeRoundedView,
  ),
  _InsightInfo(
    title: 'Watch time',
    description:
        'The average total time people spent watching each of your last 6 videos and reels.',
    icon: HugeIcons.strokeRoundedClock01,
  ),
  _InsightInfo(
    title: 'Skip rate',
    description:
        'The average share of plays where the viewer skipped away within the first few seconds. Lower is better, so a drop in this number is a good sign.',
    icon: HugeIcons.strokeRoundedNext,
  ),
  _InsightInfo(
    title: 'Interactions',
    description:
        'The average number of actions, such as likes, comments, shares and saves, on each of your last 6 posts.',
    icon: HugeIcons.strokeRoundedCursorPointer01,
  ),
];

class ProfileInsightsInfo extends StatelessWidget {
  const ProfileInsightsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CloutHeader(title: "Profile Insights"),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        padding: .only(top: kToolbarHeight, bottom: 100),
        child: _InfoPanel(
          intro:
              'Each number is the total for the last 28 days. The percentage beside it compares that total with the 28 days before it. For example, +12% means 12% more than the previous 28-day window.',
          items: _profileInsights,
        ),
      ),
    );
  }
}

class ReachInfo extends StatelessWidget {
  const ReachInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CloutHeader(title: "Reach Insights"),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        padding: .only(top: kToolbarHeight, bottom: 100),
        child: _InfoPanel(
          intro:
              'Each point on the chart is the total reach for one day. Peaks usually line up with days you posted or when a post took off, and dips show quieter days.',
          items: _reachInfo,
        ),
      ),
    );
  }
}

class MediaInsightsInfo extends StatelessWidget {
  const MediaInsightsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CloutHeader(title: "Media Insights"),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        padding: .only(top: kToolbarHeight, bottom: 100),
        child: _InfoPanel(
          intro:
              'Each number is the average across your 6 most recent posts. The percentage beside it compares that average with the 6 posts before them. For example, +12% means 12% higher than the previous 6 posts.',
          items: _mediaInsightsInfo,
        ),
      ),
    );
  }
}

/// Shared layout for all three panels: intro paragraph, then the divided
/// list. React repeats this structure per component; one private widget
/// keeps the Flutter side from tripling it.
class _InfoPanel extends StatelessWidget {
  final String intro;
  final List<_InsightInfo> items;

  const _InfoPanel({required this.intro, required this.items});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 20,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              intro,
              style: TextStyle(
                fontSize: 14,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          _InsightList(items: items),
        ],
      ),
    );
  }
}

class _InsightList extends StatelessWidget {
  final List<_InsightInfo> items;

  const _InsightList({required this.items});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        for (int i = 0; i < items.length; i++) ...[
          if (i > 0)
            Divider(
              height: 1,
              thickness: 1,
              color: theme.colorScheme.outlineVariant,
            ),
          _InsightRow(info: items[i], isFirst: i == 0),
        ],
      ],
    );
  }
}

class _InsightRow extends StatelessWidget {
  final _InsightInfo info;
  final bool isFirst;

  const _InsightRow({required this.info, required this.isFirst});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      // p-3 with first:pt-0 — the first row has no top padding
      padding: EdgeInsets.fromLTRB(12, isFirst ? 0 : 12, 12, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.colorScheme.secondary.withValues(alpha: 0.1),
            ),
            child: Center(
              child: HugeIcon(
                icon: info.icon,
                size: 16,
                color: theme.colorScheme.secondary,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  info.title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  info.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
