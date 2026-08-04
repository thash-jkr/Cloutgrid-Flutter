import 'package:flutter/material.dart';

import '../../widgets/clout_header.dart';
import 'integration_constants.dart';

class Youtube extends StatelessWidget {
  const Youtube({super.key});

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(title: 'YouTube Analytics'),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: kToolbarHeight + topInset, bottom: 100),
        child: const _NotConnected(),
      ),
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
