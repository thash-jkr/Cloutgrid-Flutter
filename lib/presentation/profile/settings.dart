import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:cloutgrid_flutter/widgets/clout_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../providers/auth/auth_notifier.dart';
import '../../widgets/clout_header.dart';
import '../../widgets/segmented_list.dart';

class Settings extends ConsumerWidget {
  final VoidCallback onNavigateBack;
  final VoidCallback onNavigateToSecurity;

  const Settings({
    super.key,
    required this.onNavigateBack,
    required this.onNavigateToSecurity,
  });

  Future<void> _openUrl(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (!context.mounted) return;
      showToast(context, message: "Failed to open $url", isSuccess: false);
    }
  }

  void _showReportDialog(
    BuildContext context, {
    required String title,
    required String body,
  }) {
    final controller = TextEditingController();

    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(body),
            const SizedBox(height: 12),
            TextField(
              controller: controller,
              autofocus: true,
              decoration: const InputDecoration(hintText: 'Write here...'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, WidgetRef ref) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ref.read(authProvider.notifier).logout();
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topInset = MediaQuery.of(context).padding.top;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(
        title: 'Settings',
        icon: HeaderAction(
          icon: Icons.arrow_back,
          contentDescription: 'Back',
          onClick: onNavigateBack,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: kToolbarHeight + topInset + 15,
          left: 15,
          right: 15,
        ),
        child: Column(
          spacing: 3,
          children: [
            // First group: Help, Privacy, EULA, Feedback
            SegmentedListItem(
              index: 0,
              count: 4,
              leading: const Icon(Icons.help_outline_rounded),
              onTap: () => _showReportDialog(
                context,
                title: 'Need Help?',
                body:
                    'If you are facing any issue, let us know and our team will reach out to you soon',
              ),
              child: const Text('Help'),
            ),
            SegmentedListItem(
              index: 1,
              count: 4,
              leading: const Icon(Icons.privacy_tip_rounded),
              trailing: const Icon(Icons.open_in_new_rounded),
              onTap: () =>
                  _openUrl(context, 'https://cloutgrid.com/privacypolicy'),
              child: const Text('Privacy Policy'),
            ),
            SegmentedListItem(
              index: 2,
              count: 4,
              leading: const Icon(Icons.gavel_rounded),
              trailing: const Icon(Icons.open_in_new_rounded),
              onTap: () => _openUrl(context, 'https://cloutgrid.com/eula'),
              child: const Text('EULA'),
            ),
            SegmentedListItem(
              index: 3,
              count: 4,
              leading: const Icon(Icons.feedback_rounded),
              onTap: () => _showReportDialog(
                context,
                title: 'Feedback',
                body:
                    'If you have any suggestions or feedback, let us know and our team will improve our services',
              ),
              child: const Text('Feedback'),
            ),

            const SizedBox(height: 22),

            // Second group: Security, Logout
            SegmentedListItem(
              index: 0,
              count: 2,
              leading: const Icon(Icons.security_rounded),
              onTap: onNavigateToSecurity,
              child: const Text('Security'),
            ),
            SegmentedListItem(
              index: 1,
              count: 2,
              leading: const Icon(Icons.logout_rounded, color: Colors.red),
              onTap: () => _showLogoutDialog(context, ref),
              child: const Text('Logout', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}
