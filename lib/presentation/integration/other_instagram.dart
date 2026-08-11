import 'package:cloutgrid_flutter/widgets/clout_empty.dart';
import 'package:cloutgrid_flutter/widgets/clout_header.dart';
import 'package:flutter/material.dart';

class OtherInstagram extends StatelessWidget {
  final String username;

  const OtherInstagram({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(title: 'Instagram Insights 📊'),
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
        type: .instagram,
        message: "@$username hasn't connected their Instagram yet",
      ),
    );
  }
}
