import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloutgrid_flutter/app/network/api_config.dart';
import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:cloutgrid_flutter/models/home/home_models.dart';
import 'package:cloutgrid_flutter/providers/integration/integration_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/integration/integration_models.dart';
import '../../providers/auth/auth_notifier.dart';
import '../../widgets/clout_alert.dart';
import '../../widgets/clout_empty.dart';
import '../../widgets/clout_header.dart';
import '../../widgets/clout_toast.dart';
import 'integration_constants.dart';

class Instagram extends ConsumerStatefulWidget {
  final VoidCallback onNavigateBack;

  const Instagram({super.key, required this.onNavigateBack});

  @override
  ConsumerState<Instagram> createState() => _InstagramState();
}

class _InstagramState extends ConsumerState<Instagram> {
  bool _loadTriggered = false;

  IntegrationState get integrationState => ref.read(integrationProvider);
  UserProfile? get user => ref.read(authProvider).value?.user;
  IntegrationNotifier get integrationNotifier =>
      ref.read(integrationProvider.notifier);

  void _loadOwnData() {
    if (user?.instagramConnected == true &&
        integrationState.instagramPage == null) {
      final username = user!.username;
      integrationNotifier.loadOwnInstagramProfile(username);
      integrationNotifier.loadOwnInstagramMedia(username);
    }
  }

  Future<void> _handleSync() async {
    if (user == null) return;
    final username = user!.username;

    await showAsyncToast(
      context,
      loadingMessage: 'Syncing Instagram...',
      successMessage: 'Instagram synced',
      task: () async {
        await Future.wait([
          integrationNotifier.fetchInstagramProfile(),
          integrationNotifier.fetchInstagramMedia(),
        ]);
        await Future.wait([
          integrationNotifier.loadOwnInstagramProfile(username),
          integrationNotifier.loadOwnInstagramMedia(username),
        ]);
      },
    );
  }

  void _showDisconnectAlert() {
    CloutAlert.show(
      context,
      title: 'Disconnect Instagram?',
      body: 'Are you sure you want to disconnect Instagram?',
      onSubmit: (_) async {
        try {
          await ref.read(integrationProvider.notifier).disconnectInstagram();
        } catch (e) {
          if (!mounted) return;
          showToast(context, message: e.toString(), isSuccess: false);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;

    final integrationState = ref.watch(integrationProvider);
    final isConnected = user?.instagramConnected == true;

    if (isConnected && !_loadTriggered) {
      _loadTriggered = true;
      Future(_loadOwnData);
    } else if (!isConnected) {
      _loadTriggered = false;
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(
        title: 'Instagram Insights 📊',
        icon: HeaderAction(
          icon: Icons.arrow_back,
          contentDescription: "Back",
          onClick: widget.onNavigateBack,
        ),
        actions: user?.instagramConnected == true
            ? [
                HeaderAction(
                  icon: Icons.menu_rounded,
                  contentDescription: 'Menu',
                  menuItems: [
                    HeaderMenuItem(
                      title: 'Sync profile',
                      icon: Icons.sync_rounded,
                      onClick: _handleSync,
                    ),
                    HeaderMenuItem(
                      title: 'Disconnect Instagram',
                      icon: Icons.block_rounded,
                      onClick: _showDisconnectAlert,
                    ),
                  ],
                ),
              ]
            : [],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: kToolbarHeight + topInset + 15,
          bottom: 100,
        ),
        child: user?.instagramConnected == true
            ? Column(
                spacing: 15,
                crossAxisAlignment: .start,
                children: [
                  if ((integrationState.instagramPage == null ||
                          integrationState.instagramMedia.isEmpty) &&
                      integrationState.isLoading) ...[
                    const CloutEmpty(
                      type: EmptyType.instagram,
                      message: 'Loading...',
                      isLoading: true,
                    ),
                  ] else ...[
                    if (integrationState.instagramPage != null) ...[
                      InstagramHeader(page: integrationState.instagramPage!),

                      InstagramInsights(
                        insights: integrationState.instagramPage!.insights,
                      ),
                    ],

                    InstagramMedia(
                      igMedia: integrationState.instagramMedia,
                      isReel: true,
                    ),

                    InstagramMedia(
                      igMedia: integrationState.instagramMedia,
                      isReel: false,
                    ),
                  ],
                ],
              )
            : const _NotConnected(),
      ),
    );
  }
}

class InstagramHeader extends StatelessWidget {
  final InstagramPageModel page;

  const InstagramHeader({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        spacing: 15,
        children: [
          Column(
            children: [
              ClipOval(
                child: CachedNetworkImage(
                  imageUrl: page.profilePicture,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Image(
                    image: AssetImage("assets/images/profile.png"),
                  ),
                  errorWidget: (context, url, error) => const Image(
                    image: AssetImage("assets/images/profile.png"),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {},
                child: Row(
                  mainAxisSize: .min,
                  spacing: 5,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/instagram.svg",
                      width: 20,
                      height: 20,
                      colorFilter: ColorFilter.mode(
                        Colors.pink,
                        BlendMode.srcIn,
                      ),
                    ),
                    Text('@${page.username}'),
                  ],
                ),
              ),
              Text(
                "Updated ${timeAgo(page.lastSync)}",
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ],
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: .spaceAround,
            children: [
              _StatItem(
                value: compactCount(page.followers),
                label: 'Followers',
              ),
              _StatItem(
                value: compactCount(page.followings),
                label: 'Followings',
              ),
              _StatItem(value: compactCount(page.mediaCount), label: 'Posts'),
            ],
          ),
        ],
      ),
    );
  }
}

class InstagramInsights extends StatelessWidget {
  final List<ProfileInsightModel> insights;

  const InstagramInsights({super.key, required this.insights});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            'Profile Insights',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          itemCount: insights.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 1.8,
          ),
          itemBuilder: (context, index) {
            final metric = insights[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 0,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 5,
                    children: [
                      Text(
                        compactCount(metric.value),
                        style: const TextStyle(
                          fontSize: 20,
                          height: 0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${metric.change >= 0 ? "+" : "-"}${metric.change}%",
                        style: TextStyle(
                          color: metric.change >= 0 ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  ),
                  Text(metric.title, style: theme.textTheme.labelSmall),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class InstagramMedia extends StatelessWidget {
  final List<InstagramMediaModel> igMedia;
  final bool isReel;

  const InstagramMedia({
    super.key,
    required this.igMedia,
    required this.isReel,
  });

  @override
  Widget build(BuildContext context) {
    final mediaList = igMedia
        .where((m) => isReel ? m.mediaType == "VIDEO" : m.mediaType != "VIDEO")
        .toList();
    final label = isReel ? 'Recent Reels' : 'Recent Posts';
    final emptyLabel = isReel ? 'reels' : 'posts';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, bottom: 5),
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        if (mediaList.isEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'No $emptyLabel found',
              style: const TextStyle(color: Colors.grey),
            ),
          )
        else
          SizedBox(
            height: 300,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              itemCount: mediaList.length,
              separatorBuilder: (context, index) => const SizedBox(width: 15),
              itemBuilder: (context, index) {
                final media = mediaList[index];
                return Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Material(
                      borderRadius: .circular(20),
                      elevation: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          imageUrl: media.mediaType == 'VIDEO'
                              ? media.thumbnailUrl
                              : media.mediaUrl,
                          width: 200,
                          height: 300,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            width: 200,
                            height: 300,
                            color: Colors.grey.shade200,
                          ),
                          errorWidget: (context, url, error) => const Image(
                            image: AssetImage("assets/images/image_error.jpg"),
                            fit: .cover,
                          ),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(10, -10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 16,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              compactCount(media.likeCount),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ...media.insights.expand(
                              (insight) => [
                                Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: Icon(
                                    _iconForMetric(insight.name),
                                    size: 16,
                                  ),
                                ),
                                ...insight.values.map(
                                  (v) => Padding(
                                    padding: const EdgeInsets.only(left: 2),
                                    child: Text(
                                      compactCount(v.value),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        const SizedBox(height: 20),
      ],
    );
  }

  IconData _iconForMetric(String metricName) {
    switch (metricName.toLowerCase()) {
      case 'engagement':
      case 'reach':
        return Icons.trending_up_rounded;
      case 'impressions':
      case 'views':
        return Icons.visibility_rounded;
      case 'saves':
        return Icons.bookmark_border_rounded;
      default:
        return Icons.bar_chart_rounded;
    }
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          label,
          style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
        ),
      ],
    );
  }
}

class _NotConnected extends ConsumerWidget {
  const _NotConnected();

  Future<void> _openUrl(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (!context.mounted) return;
      showToast(context, message: "Failed to open $url", isSuccess: false);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider).value;
    final access = authState?.access;

    return Column(
      spacing: 15,
      children: [
        FilledButton(
          onPressed: () => _openUrl(
            context,
            "${ApiConfig.current.baseUrl}/auth/instagram/start?token=$access&medium=app",
          ),
          child: const Text('Connect Instagram'),
        ),

        const InstagramConstants(),
      ],
    );
  }
}
