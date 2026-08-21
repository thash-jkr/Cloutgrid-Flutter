import 'package:cloutgrid_flutter/presentation/integration/instagram.dart';
import 'package:cloutgrid_flutter/providers/integration/integration_notifier.dart';
import 'package:cloutgrid_flutter/widgets/clout_empty.dart';
import 'package:cloutgrid_flutter/widgets/clout_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtherInstagram extends ConsumerStatefulWidget {
  final String username;
  final bool isConnected;
  final ScrollController? scrollController;

  const OtherInstagram({
    super.key,
    required this.username,
    required this.isConnected,
    this.scrollController,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InstagramState();
}

class _InstagramState extends ConsumerState<OtherInstagram> {
  IntegrationState get integrationState => ref.read(integrationProvider);
  IntegrationNotifier get integrationNotifier =>
      ref.read(integrationProvider.notifier);

  void _loadData() {
    if (widget.isConnected && integrationState.otherInstagramPage == null) {
      integrationNotifier.readOtherInstagramProfile(widget.username);
      integrationNotifier.readOtherInstagramMedia(widget.username);
    }
  }

  @override
  Widget build(BuildContext context) {
    final integrationState = ref.watch(integrationProvider);

    if (widget.isConnected && integrationState.otherInstagramPage == null) {
      Future(_loadData);
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(title: "Instagram Insights 📊"),
      body: SingleChildScrollView(
        controller: widget.scrollController,
        padding: EdgeInsets.only(
          top: kToolbarHeight + MediaQuery.of(context).padding.top,
          bottom: 100,
        ),
        child: widget.isConnected
            ? Column(
                spacing: 15,
                crossAxisAlignment: .start,
                children: [
                  if ((integrationState.otherInstagramPage == null ||
                          integrationState.otherInstagramMedia.isEmpty) &&
                      integrationState.isLoading) ...[
                    const CloutEmpty(
                      type: EmptyType.instagram,
                      message: 'Loading...',
                      isLoading: true,
                    ),
                  ] else ...[
                    if (integrationState.otherInstagramPage != null) ...[
                      InstagramHeader(
                        page: integrationState.otherInstagramPage!,
                      ),

                      InstagramInsights(
                        insights: integrationState.otherInstagramPage!.insights,
                      ),
                    ],

                    InstagramMedia(
                      igMedia: integrationState.otherInstagramMedia,
                      type: 'IMAGE',
                    ),

                    InstagramMedia(
                      igMedia: integrationState.otherInstagramMedia,
                      type: 'VIDEO',
                    ),
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
        type: .instagram,
        message: "@$username hasn't connected their Instagram yet",
      ),
    );
  }
}
