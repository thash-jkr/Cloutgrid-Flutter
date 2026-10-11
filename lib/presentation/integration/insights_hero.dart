import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

// Adjust these two imports to wherever your models and compactCount live.
import '../../models/integration/integration_models.dart';

// `new` is a reserved word in Dart, so the React 'new' trend becomes noComparison.
enum _Trend { up, down, flat, noComparison }

const _flatThreshold = 10;

String _normalize(String name) =>
    name.trim().toLowerCase().replaceAll(RegExp(r'[\s-]+'), '_');

// Accepts num? so a null/non-finite change falls into noComparison,
// matching React's !Number.isFinite(change) check.
_Trend _trendOf(num? change) {
  if (change == null || !change.isFinite) return _Trend.noComparison;
  if (change.abs() < _flatThreshold) return _Trend.flat;
  return change > 0 ? _Trend.up : _Trend.down;
}

dynamic _trendIcon(_Trend trend) => switch (trend) {
  _Trend.up || _Trend.noComparison => HugeIcons.strokeRoundedTradeUp,
  _Trend.down => HugeIcons.strokeRoundedTradeDown,
  _Trend.flat => HugeIcons.strokeRoundedMinusSign,
};

/// Order by priority; fall back to the given order if no names match.
List<T> _rank<T>(
  List<T> items,
  List<String> priority,
  String Function(T) nameOf,
) {
  final ranked = <T>[];
  for (final key in priority) {
    for (final item in items) {
      if (_normalize(nameOf(item)) == key) {
        ranked.add(item);
        break;
      }
    }
  }
  return ranked.isNotEmpty ? ranked : items;
}

/// 1. first metric with a meaningful change, 2. first with no comparison, 3. steady
T _pick<T>(List<T> active, num? Function(T) changeOf) {
  for (final item in active) {
    final trend = _trendOf(changeOf(item));
    if (trend == _Trend.up || trend == _Trend.down) return item;
  }
  for (final item in active) {
    if (_trendOf(changeOf(item)) == _Trend.noComparison) return item;
  }
  return active.first;
}

TextSpan _hl(String text, Color color) => TextSpan(
  text: text,
  style: TextStyle(fontWeight: FontWeight.w600, color: color),
);

class ProfileHero extends StatelessWidget {
  final List<ProfileInsightModel> insights;

  const ProfileHero({super.key, required this.insights});

  static const _priority = [
    'views',
    'accounts_engaged',
    'content_interactions',
    'likes',
  ];

  static const _nouns = {
    'views': 'views',
    'accounts_engaged': 'accounts engaged',
    'content_interactions': 'content interactions',
    'likes': 'likes',
  };

  @override
  Widget build(BuildContext context) {
    final accent = Theme.of(context).colorScheme.secondary;
    final candidates = _rank(insights, _priority, (i) => i.name);

    var headline = <InlineSpan>[
      const TextSpan(text: 'No activity in the last 28 days.'),
    ];
    dynamic icon = HugeIcons.strokeRoundedMinusSign;

    final active = candidates.where((i) => i.value > 0).toList();

    if (active.isNotEmpty) {
      final picked = _pick(active, (i) => i.change);
      final num? change = picked.change;
      final trend = _trendOf(change);
      final noun =
          _nouns[_normalize(picked.name)] ?? picked.title.toLowerCase();
      final count = _hl(compactCount(picked.value), accent);
      final percent = _hl('${(change ?? 0).abs().round()}%', accent);

      icon = _trendIcon(trend);
      headline = switch (trend) {
        _Trend.up => <InlineSpan>[
          count,
          TextSpan(text: ' $noun in the last 28 days, '),
          percent,
          const TextSpan(text: ' more than last month.'),
        ],
        _Trend.down => <InlineSpan>[
          count,
          TextSpan(text: ' $noun in the last 28 days, '),
          percent,
          const TextSpan(text: ' fewer than last month.'),
        ],
        _Trend.flat => <InlineSpan>[
          const TextSpan(text: 'Steady activity: '),
          count,
          TextSpan(text: ' $noun in the last 28 days, within '),
          _hl('$_flatThreshold%', accent),
          const TextSpan(text: ' of the previous period.'),
        ],
        _Trend.noComparison => <InlineSpan>[
          count,
          TextSpan(
            text:
                ' $noun in the last 28 days. Comparison will appear after another 28 days of data.',
          ),
        ],
      };
    }

    return _HeroCard(icon: icon, headline: headline);
  }
}

class MediaHero extends StatelessWidget {
  final List<MediaInsightModel>
  insights; // the ({name, change, average}) record

  const MediaHero({super.key, required this.insights});

  static const _priority = ['views', 'interactions', 'watch_time'];

  // Average watch time is assumed to arrive in seconds (same as the React code).
  String _formatDuration(double seconds) {
    final total = seconds.round();
    if (total < 60) return '${total}s';
    final m = total ~/ 60;
    final s = total % 60;
    return s == 0 ? '${m}m' : '${m}m ${s}s';
  }

  List<InlineSpan> _describe(MediaInsightModel item, Color accent) {
    switch (_normalize(item.name)) {
      case 'views':
        return [
          _hl(compactCount(item.average.round()), accent),
          const TextSpan(text: ' views on average'),
        ];
      case 'interactions':
        return [
          _hl(compactCount(item.average.round()), accent),
          const TextSpan(text: ' interactions on average'),
        ];
      case 'watch_time':
        return [
          _hl(_formatDuration(item.average), accent),
          const TextSpan(text: ' average watch time'),
        ];
      default:
        return [
          _hl(compactCount(item.average.round()), accent),
          TextSpan(text: ' ${item.name.toLowerCase()}'),
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final accent = Theme.of(context).colorScheme.secondary;
    final candidates = _rank(insights, _priority, (i) => i.name);
    final active = candidates.where((i) => i.average > 0).toList();

    var headline = <InlineSpan>[
      const TextSpan(text: 'No recent posts to show insights for yet.'),
    ];
    dynamic icon = HugeIcons.strokeRoundedMinusSign;

    if (active.isNotEmpty) {
      final picked = _pick(active, (i) => i.change);
      final num? change = picked.change;
      final trend = _trendOf(change);
      final phrase = _describe(picked, accent);
      final percent = _hl('${(change ?? 0).abs().round()}%', accent);

      icon = _trendIcon(trend);
      headline = switch (trend) {
        _Trend.up => <InlineSpan>[
          ...phrase,
          const TextSpan(text: ' across the last 6 posts, '),
          percent,
          const TextSpan(text: ' higher than the previous 6.'),
        ],
        _Trend.down => <InlineSpan>[
          ...phrase,
          const TextSpan(text: ' across the last 6 posts, '),
          percent,
          const TextSpan(text: ' lower than the previous 6.'),
        ],
        _Trend.flat => <InlineSpan>[
          const TextSpan(text: 'Steady performance: '),
          ...phrase,
          const TextSpan(text: ' across the last 6 posts, within '),
          _hl('$_flatThreshold%', accent),
          const TextSpan(text: ' of the previous 6.'),
        ],
        _Trend.noComparison => <InlineSpan>[
          ...phrase,
          const TextSpan(
            text:
                ' across the last 6 posts. Comparison will appear once there are 6 earlier posts.',
          ),
        ],
      };
    }

    return _HeroCard(icon: icon, headline: headline);
  }
}

class _HeroCard extends StatelessWidget {
  final dynamic icon;
  final List<InlineSpan> headline;

  const _HeroCard({required this.icon, required this.headline});

  @override
  Widget build(BuildContext context) {
    final accent = Theme.of(context).colorScheme.secondary;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 0,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        spacing: 16,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: accent.withValues(alpha: 0.1),
            ),
            child: Center(
              child: HugeIcon(icon: icon, size: 20, color: accent),
            ),
          ),
          Expanded(
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  height: 1.375, // leading-snug
                  color: Colors.black.withValues(alpha: 0.9),
                ),
                children: headline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
