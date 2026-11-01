import 'package:cloutgrid_flutter/models/integration/integration_models.dart';
import 'package:cloutgrid_flutter/providers/profile/profile_notifier.dart';
import 'package:cloutgrid_flutter/widgets/clout_empty.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RateCard extends ConsumerWidget {
  final void Function(
    String title,
    Map<String, int?> rates,
    Future<void> Function(Map<String, int?> rates) onSave,
  )
  onNavigateToEditRates;

  const RateCard({super.key, required this.onNavigateToEditRates});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rates = ref.watch(ratesProvider);

    return Padding(
      padding: .symmetric(horizontal: 15),
      child: Column(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Rate Cards",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          rates.when(
            data: (rates) => GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 3 / 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                _Card(
                  title: "Instagram Rates",
                  icon: HugeIcons.strokeRoundedInstagram,
                  color: Colors.pink,
                  deliverables: rates.instagram.toJson().toDeliverables(),
                  onNavigateToEditRates: () => onNavigateToEditRates(
                    "Instagram Rates",
                    rates.instagram.toJson().toDeliverables(),
                    (newRates) async {
                      final lower = {
                        for (final e in newRates.entries)
                          e.key.toLowerCase(): e.value,
                      };
                      await ref
                          .read(ratesProvider.notifier)
                          .saveRates("instagram", lower);
                    },
                  ),
                ),
                _Card(
                  title: "YouTube Rates",
                  icon: HugeIcons.strokeRoundedYoutube,
                  color: Colors.red,
                  deliverables: rates.youtube.toJson().toDeliverables(),
                  onNavigateToEditRates: () => onNavigateToEditRates(
                    "YouTube Rates",
                    rates.youtube.toJson().toDeliverables(),
                    (newRates) async {
                      final lower = {
                        for (final e in newRates.entries)
                          e.key.toLowerCase(): e.value,
                      };
                      await ref
                          .read(ratesProvider.notifier)
                          .saveRates("youtube", lower);
                    },
                  ),
                ),
              ],
            ),
            error: (e, _) =>
                CloutEmpty(type: .general, message: "No rates to show: $e"),
            loading: () =>
                CloutEmpty(type: .general, message: "", isLoading: true),
          ),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final List<List<dynamic>> icon;
  final String title;
  final Color color;
  final Map<String, int?> deliverables;
  final void Function() onNavigateToEditRates;

  const _Card({
    required this.deliverables,
    required this.icon,
    required this.color,
    required this.title,
    required this.onNavigateToEditRates,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onNavigateToEditRates,
      child: Material(
        borderRadius: .circular(12),
        color: Colors.white,
        elevation: 1,
        child: Padding(
          padding: .all(5),
          child: Column(
            mainAxisSize: .max,
            crossAxisAlignment: .start,
            children: [
              Center(
                child: Padding(
                  padding: .symmetric(vertical: 5),
                  child: HugeIcon(icon: icon, color: color),
                ),
              ),
              ...deliverables.entries.map(
                (entry) => Row(
                  spacing: 5,
                  children: [
                    Expanded(
                      child: Text(
                        '${entry.key}: ',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      entry.value != null
                          ? "₹${compactCount(entry.value!)}"
                          : "-",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: HugeIcon(
                      icon: HugeIcons.strokeRoundedPen01,
                      size: 20,
                    ),
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
