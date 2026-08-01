import 'package:cloutgrid_flutter/widgets/clout_header.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CloutHeader(title: "Connect"),
      body: SafeArea(child: const Center(child: Text('Search'))),
    );
  }
}
