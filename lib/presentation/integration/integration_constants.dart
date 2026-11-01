import 'package:cloutgrid_flutter/widgets/clout_header.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class InstagramConstants extends StatelessWidget {
  const InstagramConstants({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Show brands your real numbers',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),

          // WHY: three scannable lines, one idea each
          const _IconLine(
            icon: HugeIcons.strokeRoundedCheckmarkBadge01,
            text: 'Verified followers and post counts',
          ),
          const _IconLine(
            icon: HugeIcons.strokeRoundedChart,
            text: 'Reach and engagement on your profile',
          ),
          const _IconLine(
            icon: HugeIcons.strokeRoundedPlay,
            text: 'Reel performance brands care about',
          ),

          const SizedBox(height: 20),

          // HOW: three short steps
          Text(
            'How it works',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          const _StepLine(number: 1, text: 'Tap Connect Instagram'),
          const _StepLine(
            number: 2,
            text: 'Log in with Instagram and tap Allow',
          ),
          const _StepLine(
            number: 3,
            text: "You're done. Your insights appear here",
          ),

          const SizedBox(height: 16),

          // The one requirement people can fail on, stated once
          _Callout(text: 'Requires a Creator or Business Instagram account.'),

          // Details only for people who want them
          Theme(
            data: theme.copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              tilePadding: EdgeInsets.zero,
              childrenPadding: const EdgeInsets.only(bottom: 8),
              title: Text(
                'Details and privacy',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              children: const [
                _SmallPrint(
                  'Cloutgrid can view your profile, posts and insights. '
                  'It cannot post, message or comment on your behalf.',
                ),
                _SmallPrint(
                  'Have a personal account? Switch to Creator or Business in '
                  'Instagram under Settings → Account type and tools. It is free.',
                ),
                _SmallPrint('You can disconnect at any time.'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _IconLine extends StatelessWidget {
  final dynamic icon;
  final String text;
  const _IconLine({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          HugeIcon(
            icon: icon,
            size: 20,
            color: theme.colorScheme.secondary,
            strokeWidth: 2,
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: theme.textTheme.bodyMedium)),
        ],
      ),
    );
  }
}

class _StepLine extends StatelessWidget {
  final int number;
  final String text;
  const _StepLine({required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 11,
            backgroundColor: theme.colorScheme.secondary,
            child: Text(
              '$number',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: theme.textTheme.bodyMedium)),
        ],
      ),
    );
  }
}

class _Callout extends StatelessWidget {
  final String text;
  const _Callout({required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            size: 18,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: theme.textTheme.bodySmall)),
        ],
      ),
    );
  }
}

class _SmallPrint extends StatelessWidget {
  final String text;
  const _SmallPrint(this.text);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
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
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Show brands your real numbers',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),

          // WHY
          const _IconLine(
            icon: HugeIcons.strokeRoundedCheckmarkBadge01,
            text: 'Verified subscribers and total views',
          ),
          const _IconLine(
            icon: HugeIcons.strokeRoundedTimeSchedule,
            text: 'Watch time and average view duration',
          ),
          const _IconLine(
            icon: HugeIcons.strokeRoundedGroup,
            text: 'Audience age, gender and top locations',
          ),

          const SizedBox(height: 20),

          // HOW
          Text(
            'How it works',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          const _StepLine(number: 1, text: 'Tap Connect YouTube'),
          const _StepLine(
            number: 2,
            text: 'Sign in with Google and pick your channel',
          ),
          const _StepLine(number: 3, text: "Tap Allow. You're done"),

          const SizedBox(height: 16),

          const _Callout(
            text: 'Your channel needs at least one public or unlisted video.',
          ),

          Theme(
            data: theme.copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              tilePadding: EdgeInsets.zero,
              childrenPadding: const EdgeInsets.only(bottom: 8),
              title: Text(
                'Details and privacy',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              children: const [
                _SmallPrint(
                  'Cloutgrid can view your channel and its analytics. '
                  'It cannot upload, edit or delete anything on your channel.',
                ),
                _SmallPrint(
                  'Manage more than one channel? Choose the one you want '
                  'brands to see when Google asks.',
                ),
                _SmallPrint(
                  'You can disconnect at any time from your profile.',
                ),
              ],
            ),
          ),
        ],
      ),
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
