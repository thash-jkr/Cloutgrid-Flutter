import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:cloutgrid_flutter/widgets/clout_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../providers/auth/auth_notifier.dart';
import '../../widgets/clout_header.dart';
import '../../widgets/segmented_list.dart';

class Security extends ConsumerWidget {
  final VoidCallback onNavigateBack;
  final VoidCallback onNavigateToChangePassword;

  const Security({
    super.key,
    required this.onNavigateBack,
    required this.onNavigateToChangePassword,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topInset = MediaQuery.of(context).padding.top;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(
        title: 'Security',
        icon: HeaderAction(
          icon: Icons.arrow_back,
          contentDescription: 'Back',
          onClick: onNavigateBack,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: kToolbarHeight + topInset + 16,
          left: 16,
          right: 16,
        ),
        child: Column(
          spacing: 1,
          children: [
            SegmentedListItem(
              index: 0,
              count: 1,
              leading: const HugeIcon(icon: HugeIcons.strokeRoundedLocked),
              onTap: () => onNavigateToChangePassword(),
              title: 'Change Password',
            ),

            const SizedBox(height: 25),

            SegmentedListItem(
              index: 0,
              count: 1,
              leading: const HugeIcon(
                icon: HugeIcons.strokeRoundedDelete02,
                color: Colors.red,
              ),
              onTap: () => CloutAlert.show(
                context,
                title: "Delete Account?",
                body:
                    'Are you sure you want to delete your account? '
                    "You will loss all your data! "
                    'This action cannot be undone.',
                onSubmit: (_) {
                  Navigator.pop(context);
                  ref.read(authProvider.notifier).deleteAccount('creator');
                },
                timed: true,
              ),
              title: 'Delete Account',
              danger: true,
            ),
          ],
        ),
      ),
    );
  }
}
