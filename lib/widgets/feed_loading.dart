import 'package:flutter/material.dart';

class FeedLoading extends StatelessWidget {
  const FeedLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 40),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
