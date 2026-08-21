import 'package:cloutgrid_flutter/widgets/clout_empty.dart';
import 'package:cloutgrid_flutter/widgets/clout_header.dart';
import 'package:flutter/material.dart';

class OtherYoutube extends StatelessWidget {
  final String username;
  final ScrollController? scrollController;

  const OtherYoutube({
    super.key,
    required this.username,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(title: 'YouTube Analytics 📈'),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: kToolbarHeight),
        child: _NotConnected(username),
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
