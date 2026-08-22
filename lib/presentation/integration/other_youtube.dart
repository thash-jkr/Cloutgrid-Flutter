import 'package:cloutgrid_flutter/presentation/integration/youtube.dart';
import 'package:cloutgrid_flutter/providers/integration/integration_notifier.dart';
import 'package:cloutgrid_flutter/widgets/clout_empty.dart';
import 'package:cloutgrid_flutter/widgets/clout_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtherYoutube extends ConsumerStatefulWidget {
  final String username;
  final bool isConnected;
  final ScrollController? scrollController;

  const OtherYoutube({
    super.key,
    required this.username,
    required this.isConnected,
    this.scrollController,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _YouTubeState();
}

class _YouTubeState extends ConsumerState<OtherYoutube> {
  IntegrationState get integrationState => ref.read(integrationProvider);
  IntegrationNotifier get integrationNotifier =>
      ref.read(integrationProvider.notifier);

  void _loadData() {
    if (widget.isConnected && integrationState.otherYoutubeChannel == null) {
      integrationNotifier.readOtherYoutubeChannel(widget.username);
      integrationNotifier.readOtherYoutubeMedia(widget.username);
    }
  }

  @override
  Widget build(BuildContext context) {
    final integrationState = ref.watch(integrationProvider);

    if (widget.isConnected && integrationState.otherYoutubeChannel == null) {
      Future(_loadData);
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(title: 'YouTube Analytics 📈'),
      body: SingleChildScrollView(
        controller: widget.scrollController,
        padding: EdgeInsets.only(
          top: widget.isConnected ? 0 : kToolbarHeight,
          bottom: 100,
        ),
        child: widget.isConnected
            ? Column(
                spacing: 15,
                crossAxisAlignment: .start,
                children: [
                  if ((integrationState.otherYoutubeChannel == null ||
                          integrationState.otherYoutubeMedia.isEmpty) &&
                      integrationState.isLoading) ...[
                    const CloutEmpty(
                      type: .youtube,
                      message: "Loading...",
                      isLoading: true,
                    ),
                  ] else ...[
                    if (integrationState.otherYoutubeChannel != null)
                      ChannelDetail(
                        channel: integrationState.otherYoutubeChannel!,
                      ),
                    YoutubeMediaRow(media: integrationState.otherYoutubeMedia),
                  ],
                ],
              )
            : _NotConnected(widget.username),
      ),
    );
  }
}

class _NotConnected extends StatelessWidget {
  final String username;

  const _NotConnected(this.username);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CloutEmpty(
        type: .youtube,
        message: "@$username hasn't connected their YouTube yet",
      ),
    );
  }
}
