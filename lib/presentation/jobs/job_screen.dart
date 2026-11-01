import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:cloutgrid_flutter/models/home/home_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../models/job/job_models.dart';
import '../../providers/auth/auth_notifier.dart';
import '../../providers/job/job_notifier.dart';
import '../../widgets/clout_empty.dart';
import '../../widgets/clout_header.dart';
import '../../widgets/clout_sheet.dart';
import 'job_detail.dart';

enum CampaignType {
  latest("Latest", HugeIcons.strokeRoundedNewJob),
  applied("Applied", HugeIcons.strokeRoundedWorkHistory);

  final String title;
  final dynamic icon;

  const CampaignType(this.title, this.icon);
}

class JobScreen extends ConsumerStatefulWidget {
  final ValueChanged<int> onNavigateToQuestions;
  final void Function(UserProfile user) onNavigateToOtherProfile;

  const JobScreen({
    super.key,
    required this.onNavigateToQuestions,
    required this.onNavigateToOtherProfile,
  });

  @override
  ConsumerState<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends ConsumerState<JobScreen> {
  CampaignType selectedType = .latest;

  @override
  void initState() {
    super.initState();

    Future(() {
      final jobState = ref.read(jobProvider);
      final type = ref.read(authProvider).value?.user?.type;
      if (jobState.jobs.isEmpty) {
        if (type == 'creator') {
          ref.read(jobProvider.notifier).fetchJobs();
        } else {
          ref.read(jobProvider.notifier).fetchBusinessJobs();
        }
      }
    });
  }

  void _openJob(JobModel job) {
    cloutSheet(
      context,
      content: (context, scrollController) => JobDetail(
        job: job,
        onNavigateToQuestions: widget.onNavigateToQuestions,
        onNavigateToOtherProfile: widget.onNavigateToOtherProfile,
        onClose: () => Navigator.pop(context),
        scrollController: scrollController,
      ),
    );
  }

  Future<void> _onRefresh() async {
    final type = ref.read(authProvider).value?.user?.type;
    if (type == 'creator') {
      await ref.read(jobProvider.notifier).fetchJobs();
    } else {
      await ref.read(jobProvider.notifier).fetchBusinessJobs();
    }
  }

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.paddingOf(context).top;
    final jobState = ref.watch(jobProvider);

    final jobs = jobState.jobs
        .where(
          (job) => selectedType == .latest ? !job.isApplied : job.isApplied,
        )
        .toList();

    // 1 for the selector, then either the jobs or a single empty-state item
    final itemCount = 1 + (jobs.isEmpty ? 1 : jobs.length);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(title: 'Campaigns'),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.fromLTRB(0, kToolbarHeight + topInset, 0, 150),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            if (index == 0) return _buildTypeSelector(context);

            if (jobs.isEmpty) {
              return CloutEmpty(
                type: EmptyType.collab,
                message: 'No new campaigns available',
                isLoading: jobState.isLoading,
              );
            }

            final job = jobs[index - 1];
            return ListTile(
              title: Text(job.title),
              subtitle: Text(timeAgo(job.createdAt)),
              onTap: () => _openJob(job),
              leading: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: job.postedBy.profilePhoto,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Image(
                    image: AssetImage('assets/images/profile.png'),
                  ),
                  errorWidget: (context, url, error) => const Image(
                    image: AssetImage('assets/images/profile.png'),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTypeSelector(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: SegmentedButton<CampaignType>(
        segments: CampaignType.values.map((campaign) {
          return ButtonSegment<CampaignType>(
            value: campaign,
            label: Text(campaign.title),
            icon: HugeIcon(icon: campaign.icon, size: 17),
          );
        }).toList(),
        selected: <CampaignType>{selectedType},
        onSelectionChanged: (newType) =>
            setState(() => selectedType = newType.first),
        style: SegmentedButton.styleFrom(
          selectedBackgroundColor: Theme.of(context).colorScheme.secondary,
          selectedForegroundColor: Colors.white,
        ),
      ),
    );
  }
}
