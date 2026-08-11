import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloutgrid_flutter/core/network/api_config.dart';
import 'package:cloutgrid_flutter/models/home/home_models.dart';
import 'package:cloutgrid_flutter/widgets/clout_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/home/home_notifier.dart';
import '../../../widgets/clout_header.dart';

class Notifications extends ConsumerStatefulWidget {
  final ScrollController? scrollController;
  const Notifications({super.key, this.scrollController});

  @override
  ConsumerState<Notifications> createState() => _NotificationsState();
}

BorderRadius segmentRadius(int index, int count) {
  const radius = Radius.circular(12);
  final isFirst = index == 0;
  final isLast = index == count - 1;

  if (count == 1) return BorderRadius.all(radius);
  if (isFirst) return const BorderRadius.vertical(top: radius);
  if (isLast) return const BorderRadius.vertical(bottom: radius);
  return BorderRadius.zero;
}

class _NotificationsState extends ConsumerState<Notifications> {
  @override
  void initState() {
    super.initState();

    Future(() {
      ref.read(homeProvider.notifier).fetchNotifications();
    });
  }

  @override
  Widget build(BuildContext context) {
    final notifications = ref.watch(
      homeProvider.select((s) => s.notifications),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(title: 'Notifications'),
      body: notifications.isEmpty
          ? CloutEmpty(type: .general, message: "No new notifications")
          : ListView.separated(
              controller: widget.scrollController,
              padding: const EdgeInsets.fromLTRB(15, kToolbarHeight, 15, 100),
              itemCount: notifications.length,
              separatorBuilder: (context, index) => const SizedBox(height: 1),
              itemBuilder: (context, index) {
                final item = notifications[index];

                return Material(
                  elevation: 1,
                  borderRadius: segmentRadius(index, notifications.length),
                  child: ClipRRect(
                    borderRadius: segmentRadius(index, notifications.length),
                    child: Dismissible(
                      key: ValueKey(item.id),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        decoration: BoxDecoration(color: Colors.red),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.centerRight,
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (direction) {
                        ref
                            .read(homeProvider.notifier)
                            .readNotification(item.id);
                      },
                      child: Container(
                        width: double.infinity,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(color: Colors.white),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 5,
                        ),
                        child: ListTile(
                          title: Text(item.message),
                          subtitle: Text(timeAgo(item.createdAt)),
                          leading: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: ApiConfig.current.baseUrl + item.photo,
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  const CircleAvatar(radius: 20),
                              errorWidget: (context, url, error) =>
                                  const CircleAvatar(radius: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
