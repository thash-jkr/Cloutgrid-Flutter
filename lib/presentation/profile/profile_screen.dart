import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:cloutgrid_flutter/widgets/clout_header.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CloutHeader(
        title: "@username",
        actions: [
          HeaderAction(
            icon: Icons.settings_rounded,
            contentDescription: "Settings",
          ),
        ],
      ),
      body: SafeArea(child: const Center(child: Text('Profile'))),
    );
  }
}
