import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloutgrid_flutter/widgets/clout_capsule.dart';
import 'package:flutter/material.dart';

import '../../models/auth/auth_models.dart';

class ProfileHeader extends StatelessWidget {
  final UserProfile user;

  const ProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: CachedNetworkImage(
              imageUrl: user.profilePhoto,
              width: 75,
              height: 75,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const Image(image: AssetImage('assets/images/profile.png')),
              errorWidget: (context, url, error) =>
                  const Image(image: AssetImage('assets/images/profile.png')),
            ),
          ),

          Column(
            crossAxisAlignment: .start,
            spacing: 0,
            children: [
              Text(
                user.name,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                user.bio,
                style: TextStyle(fontSize: 14, color: colorScheme.onSurface),
              ),
            ],
          ),

          Row(
            spacing: 10,
            children: [
              CloutCapsule(user.category),

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
                      const Icon(Icons.public, color: Colors.white, size: 12),
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
            ],
          ),
        ],
      ),
    );
  }
}
