import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloutgrid_flutter/models/home/home_models.dart';
import 'package:cloutgrid_flutter/presentation/jobs/job_detail.dart';
import 'package:cloutgrid_flutter/providers/profile/profile_notifier.dart';
import 'package:cloutgrid_flutter/widgets/clout_empty.dart';
import 'package:cloutgrid_flutter/widgets/clout_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BrandCampaigns extends ConsumerWidget {
  final String username;
  final ValueChanged<int> onNavigateToQuestions;

  const BrandCampaigns({
    super.key,
    required this.username,
    required this.onNavigateToQuestions,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final campaigns = ref.watch(brandCampaignsProvider(username));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Center(
            child: Text(
              "Active Campaigns",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
        ),
        campaigns.when(
          loading: () => const CloutEmpty(
            type: .collab,
            message: "Loading...",
            isLoading: true,
          ),
          error: (e, _) =>
              CloutEmpty(type: .collab, message: "Couldn't load campaigns"),
          data: (jobs) => jobs.isEmpty
              ? const CloutEmpty(
                  type: .collab,
                  message: "Brand has no active campaigns",
                )
              : Column(
                  children: jobs
                      .map(
                        (job) => ListTile(
                          title: Text(job.title),
                          subtitle: Text(timeAgo(job.createdAt)),
                          onTap: () => cloutSheet(
                            context,
                            content: (context, scrollController) => JobDetail(
                              job: job,
                              onNavigateToQuestions: onNavigateToQuestions,
                              onNavigateToOtherProfile: (_) =>
                                  Navigator.pop(context),
                              onClose: () => Navigator.pop(context),
                              scrollController: scrollController,
                            ),
                          ),
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
                        ),
                      )
                      .toList(),
                ),
        ),
      ],
    );
  }
}
