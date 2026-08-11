import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/job/job_models.dart';
import '../../providers/job/job_notifier.dart';
import '../../widgets/clout_alert.dart';
import '../../widgets/clout_header.dart';
import '../../widgets/clout_toast.dart';

class JobDetail extends ConsumerWidget {
  final JobModel job;
  final ValueChanged<int> onNavigateToQuestions;
  final void Function(String username, String type) onNavigateToOtherProfile;
  final VoidCallback onClose;

  const JobDetail({
    super.key,
    required this.job,
    required this.onNavigateToQuestions,
    required this.onNavigateToOtherProfile,
    required this.onClose,
  });

  void _showReportDialog(BuildContext context) {
    CloutAlert.show(
      context,
      title: 'Report Content',
      body:
          'If you think this collaboration posting violated our community guidelines, please report it. Our team will review it shortly',
      hasTextField: true,
      onSubmit: (_) {
        showToast(context, message: 'Reported');
      },
    );
  }

  Future<void> _handleApply(BuildContext context, WidgetRef ref) async {
    if (job.questions.isNotEmpty) {
      onClose();
      onNavigateToQuestions(job.id);
      return;
    }

    final success = await ref
        .read(jobProvider.notifier)
        .submitApplication(job.id, {});
    onClose();

    if (!context.mounted) return;
    if (success) {
      showToast(context, message: 'Application submitted');
    } else {
      final error = ref.read(jobProvider).errorMessage;
      showToast(context, message: error ?? 'Failed to apply', isSuccess: false);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final requirements = job.requirements
        .split(',')
        .map((r) => r.trim())
        .where((r) => r.isNotEmpty);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(
        actions: [
          HeaderAction(
            icon: Icons.info_outline,
            contentDescription: 'Report',
            onClick: () => _showReportDialog(context),
          ),
        ],
        isSheet: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsetsGeometry.only(
          top: kToolbarHeight,
          bottom: 100,
          left: 15,
          right: 15,
        ),
        child: Column(
          spacing: 10,
          children: [
            Text(
              job.title,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              job.postedBy.profile.name,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: .bold, color: Colors.grey),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilledButton(
                  onPressed: () => onNavigateToOtherProfile(
                    job.postedBy.profile.username,
                    "business",
                  ),
                  child: const Text('Business Profile'),
                ),
                FilledButton(
                  onPressed: job.isApplied
                      ? null
                      : () => _handleApply(context, ref),
                  child: Text(job.isApplied ? 'Applied' : 'Apply'),
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'About the role:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(job.description),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Requirements:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ...requirements.map(
                  (req) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('•  '),
                      Expanded(child: Text(req)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
