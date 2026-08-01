import 'package:cloutgrid_flutter/widgets/clout_header.dart';
import 'package:flutter/material.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CloutHeader(title: "Create"),
      body: SafeArea(child: const Center(child: Text('Create'))),
    );
  }
}
