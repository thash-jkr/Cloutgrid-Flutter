import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloutgrid_flutter/widgets/clout_capsule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/network/api_config.dart';
import '../../models/auth/auth_models.dart';

class ProfileHeader extends StatelessWidget {
  final UserContainer user;

  const ProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: CachedNetworkImage(
                    imageUrl:
                        ApiConfig.current.baseUrl + user.profile.profilePhoto,
                    width: 75,
                    height: 75,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 14),

                Text(
                  user.profile.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  user.profile.bio ?? '',
                  style: TextStyle(fontSize: 14, color: colorScheme.onSurface),
                ),

                const SizedBox(height: 4),

                Row(
                  spacing: 10,
                  children: [
                    CloutCapsule(user.area ?? user.targetAudience ?? 'Creator'),

                    if (user.website != null && user.website!.isNotEmpty) ...[
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.public,
                              color: Colors.white,
                              size: 12,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              user.website!,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],

                    if (user.instagramConnected == true) ...[
                      SvgPicture.asset(
                        "assets/icons/instagram.svg",
                        width: 25,
                        height: 25,
                        colorFilter: ColorFilter.mode(
                          Colors.pink,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],

                    if (user.youtubeConnected == true) ...[
                      SvgPicture.asset(
                        "assets/icons/youtube.svg",
                        width: 25,
                        height: 25,
                        colorFilter: ColorFilter.mode(
                          Colors.red,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                _StatItem(
                  value: '${user.profile.followersCount}',
                  label: 'Followers',
                ),
                const SizedBox(width: 5),
                Text(
                  '•',
                  style: TextStyle(
                    fontSize: 12,
                    color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                  ),
                ),
                const SizedBox(width: 5),
                _StatItem(
                  value: '${user.profile.followingCount}',
                  label: 'Following',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 13, // Matches standard iOS .footnote metrics
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: colorScheme
                .onSurfaceVariant, // Matches iOS .secondary style token
          ),
        ),
      ],
    );
  }
}
