import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:cloutgrid_flutter/widgets/clout_alert.dart';
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
          spacing: 1,
          children: [
            // First group: Help, Privacy, EULA, Feedback
            SegmentedListItem(
              index: 0,
              count: 4,
              leading: const Icon(Icons.help_outline_rounded),
              onTap: () => CloutAlert.show(
                context,
                title: "Need Help?",
                body:
                    "If you are facing any issue, let us know and our team will reach out to you soon",
                onSubmit: (_) {},
                hasTextField: true,
              ),
              title: "Help",
            ),

            SegmentedListItem(
              index: 1,
              count: 4,
              leading: const Icon(Icons.privacy_tip_rounded),
              trailing: const Icon(Icons.open_in_new_rounded),
              onTap: () =>
                  _openUrl(context, 'https://cloutgrid.com/privacypolicy'),
              title: 'Privacy Policy',
            ),

            SegmentedListItem(
              index: 2,
              count: 4,
              leading: const Icon(Icons.gavel_rounded),
              trailing: const Icon(Icons.open_in_new_rounded),
              onTap: () => _openUrl(context, 'https://cloutgrid.com/eula'),
              title: "EULA",
            ),

            SegmentedListItem(
              index: 3,
              count: 4,
              leading: const Icon(Icons.feedback_rounded),
              onTap: () => CloutAlert.show(
                context,
                title: 'Feedback',
                body:
                    'If you have any suggestions or feedback, let us know and our team will improve our services',
                onSubmit: (_) {},
                hasTextField: true,
              ),
              title: "Feedback",
            ),

            const SizedBox(height: 15),

            SegmentedListItem(
              index: 0,
              count: 2,
              leading: const Icon(Icons.security_rounded),
              onTap: onNavigateToSecurity,
              title: "Security",
            ),

            SegmentedListItem(
              index: 1,
              count: 2,
              leading: const Icon(Icons.logout_rounded, color: Colors.red),
              onTap: () => CloutAlert.show(
                context,
                title: 'Logout',
                body: "Are you sure you want to logout?",
                onSubmit: (_) {
                  ref.read(authProvider.notifier).logout();
                },
              ),
              title: "Logout",
            ),
          ],
        ),
      ),
    );
  }
}
