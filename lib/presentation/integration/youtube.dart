import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/network/api_config.dart';
import '../../models/integration/integration_models.dart';
import '../../providers/auth/auth_notifier.dart';
import '../../providers/integration/integration_notifier.dart';
import '../../widgets/clout_alert.dart';
import '../../widgets/clout_header.dart';
import '../../widgets/clout_toast.dart';
import 'integration_constants.dart';

class Youtube extends ConsumerStatefulWidget {
  const Youtube({super.key});

  @override
  ConsumerState<Youtube> createState() => _YoutubeState();
}

class _YoutubeState extends ConsumerState<Youtube> {
  bool _loadTriggered = false;

  void _loadOwnData(String username) {
    ref.read(integrationProvider.notifier).loadOwnYoutubeChannel(username);
    // NOTE: Swift's .task uses readYoutubeChannel/readYoutubeMedia (the
    // "other" read variants) even for the current user's own data — kept
    // as-is here for parity, though loadOwnYoutubeChannel/loadOwnYoutubeMedia
    // would be the more semantically correct call for "my own" data.
    ref.read(integrationProvider.notifier).loadOwnYoutubeMedia(username);
  }

  void _handleSync(String username) {
    final notifier = ref.read(integrationProvider.notifier);
    notifier.fetchYoutubeChannel();
    notifier.readOtherYoutubeChannel(username);
    notifier.fetchYoutubeMedia();
    notifier.readOtherYoutubeMedia(username);
  }

  void _showDisconnectAlert() {
    CloutAlert.show(
      context,
      title: 'Disconnect YouTube?',
      body:
          'Are you sure you want to disconnect your YouTube integration and purge all your data?',
      onSubmit: (_) async {
        try {
          // await ref.read(integrationProvider.notifier).disconnectYoutube();
        } catch (e) {
          if (!context.mounted) return;
          showToast(context, message: e.toString(), isSuccess: false);
        }
      },
    );
  }

  Future<void> _openConnectYoutube() async {
    final token = ref
        .read(authProvider)
        .value; // access token isn't on AuthState directly — see note below
    // NOTE: Swift reads `auth.access` directly. Our AuthState doesn't expose
    // the raw access token (it lives in SecureStorage) — you'll likely want
    // to read it via a small addition, e.g. exposing a getter through
    // AuthNotifier, or reading secureStorageProvider directly here instead.
    final accessToken = ''; // placeholder — wire to the real token source
    final url =
        '${ApiConfig.current.baseUrl}/auth/google/start?token=$accessToken&medium=app';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authProvider.select((s) => s.value?.user));
    final integrationState = ref.watch(integrationProvider);
    final isConnected = user?.youtubeConnected == true;

    if (isConnected && !_loadTriggered) {
      _loadTriggered = true;
      Future(() => _loadOwnData(user!.profile.username));
    } else if (!isConnected) {
      _loadTriggered = false;
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(
        title: 'YouTube Analytics',
        actions: [
          HeaderAction(
            icon: Icons.more_horiz,
            contentDescription: 'Menu',
            menuItems: [
              HeaderMenuItem(
                title: 'Sync Profile',
                icon: Icons.sync_rounded,
                onClick: () => _handleSync(user!.profile.username),
              ),
              HeaderMenuItem(
                title: 'Disconnect',
                icon: Icons.delete_outline,
                onClick: _showDisconnectAlert,
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 0, bottom: 100),
        child: isConnected
            ? Column(
                children: [
                  if (integrationState.youtubeChannel != null)
                    _ChannelDetail(channel: integrationState.youtubeChannel!),
                  const Divider(),
                  _YoutubeMediaRow(media: integrationState.youtubeMedia),
                ],
              )
            : const _NotConnected(),
      ),
    );
  }
}

class _ChannelDetail extends StatelessWidget {
  final YoutubeChannelModel channel;

  const _ChannelDetail({required this.channel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            CachedNetworkImage(
              imageUrl: channel.banner,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
              placeholder: (context, url) => const SizedBox(
                height: 200,
                child: Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) =>
                  Container(height: 150, color: Colors.grey.shade200),
            ),
            Positioned(
              bottom: -50,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: channel.profilePicture,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const CircleAvatar(radius: 50),
                  errorWidget: (context, url, error) =>
                      const CircleAvatar(radius: 50),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 55,
        ), // accounts for the profile picture overlapping below the banner
        Text(
          channel.title,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            channel.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _StatColumn(
                value: '${channel.subscriberCount}',
                label: 'Subscribers',
              ),
              _StatColumn(value: '${channel.viewCount}', label: 'Views'),
              _StatColumn(value: '${channel.videoCount}', label: 'Videos'),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatColumn extends StatelessWidget {
  final String value;
  final String label;

  const _StatColumn({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _YoutubeMediaRow extends StatelessWidget {
  final List<YoutubeMediaModel> media;

  const _YoutubeMediaRow({required this.media});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 15, bottom: 10),
          child: Text(
            'Recent Posts',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        SizedBox(
          height: 320,
          width: double.infinity,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            itemCount: media.length,
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemBuilder: (context, index) {
              final item = media[index];
              return Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomLeft,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: item.thumbnail,
                      width: 180,
                      height: 300,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        width: 180,
                        height: 300,
                        color: Colors.grey.shade200,
                      ),
                      errorWidget: (context, url, error) => Container(
                        width: 180,
                        height: 300,
                        color: Colors.grey.shade200,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -10,
                    left: 10,
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
                          const Icon(Icons.thumb_up_outlined, size: 16),
                          const SizedBox(width: 2),
                          Text(
                            '${item.likes}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.chat_bubble_outline, size: 16),
                          const SizedBox(width: 2),
                          Text(
                            '${item.comments}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.visibility_outlined, size: 16),
                          const SizedBox(width: 2),
                          Text(
                            '${item.views}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
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
      ],
    );
  }
}

class _NotConnected extends StatelessWidget {
  const _NotConnected();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            FilledButton(
              onPressed: () {},
              child: const Text('Connect YouTube'),
            ),
            const Text(
              'This feature is in development',
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const YoutubeConstants(),
      ],
    );
  }
}
