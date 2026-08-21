import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:cloutgrid_flutter/models/home/home_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/job/job_models.dart';
import '../../providers/auth/auth_notifier.dart';
import '../../providers/job/job_notifier.dart';
import '../../widgets/clout_empty.dart';
import '../../widgets/clout_header.dart';
import '../../widgets/clout_sheet.dart';
import '../../widgets/segmented_list.dart';
import 'job_detail.dart';

class JobScreen extends ConsumerStatefulWidget {
  final ValueChanged<int> onNavigateToQuestions;
  final void Function(UserContainer user) onNavigateToOtherProfile;

  const JobScreen({
    super.key,
    required this.onNavigateToQuestions,
    required this.onNavigateToOtherProfile,
  });

  @override
  ConsumerState<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends ConsumerState<JobScreen> {
  @override
  void initState() {
    super.initState();

    Future(() {
      final jobState = ref.read(jobProvider);
      final type = ref.read(authProvider).value?.user?.profile.userType;
      if (jobState.jobs.isEmpty) {
        if (type == 'creator') {
          ref.read(jobProvider.notifier).fetchJobs();
        } else {
          ref.read(jobProvider.notifier).fetchBusinessJobs();
        }
      }
    });
  }

  Future<void> _onRefresh() async {
    final type = ref.read(authProvider).value?.user?.profile.userType;
    if (type == 'creator') {
      await ref.read(jobProvider.notifier).fetchJobs();
    } else {
      await ref.read(jobProvider.notifier).fetchBusinessJobs();
    }
  }

  void _openJob(JobModel job, String? type) {
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

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;
    final jobState = ref.watch(jobProvider);
    final type = ref.watch(authProvider).value?.user?.profile.userType;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(title: 'Collaborate'),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: jobState.jobs.isEmpty
            ? SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: kToolbarHeight + topInset),
                child: CloutEmpty(
                  type: EmptyType.collab,
                  message: 'No new collaboration available',
                  isLoading: jobState.isLoading,
                ),
              )
            : ListView.separated(
                padding: EdgeInsets.fromLTRB(
                  15,
                  kToolbarHeight + topInset,
                  15,
                  150,
                ),
                itemCount: jobState.jobs.length,
                separatorBuilder: (context, index) => const SizedBox(height: 1),
                itemBuilder: (context, index) {
                  final job = jobState.jobs[index];
                  final photoUrl = job.postedBy.profile.profilePhoto;

                  return SegmentedListItem(
                    index: index,
                    count: jobState.jobs.length,
                    onTap: () => _openJob(job, type),
                    leading: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: photoUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Image(
                          image: AssetImage('assets/images/profile.png'),
                        ),
                        errorWidget: (context, url, error) => const Image(
                          image: AssetImage('assets/images/profile.png'),
                        ),
                      ),
                    ),
                    title: job.title,
                    subtitle: job.postedBy.profile.name,
                    overline: timeAgo(job.createdAt),
                  );
                },
              ),
      ),
    );
  }
}
