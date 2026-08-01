import 'package:cloutgrid_flutter/widgets/clout_header.dart';
import 'package:flutter/material.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CloutHeader(title: "Collaborate"),
      body: SafeArea(child: const Center(child: Text('Collaborate'))),
    );
  }
}
