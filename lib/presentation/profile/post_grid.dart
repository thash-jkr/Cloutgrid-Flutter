import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/home/home_models.dart';

class PostGrid extends StatelessWidget {
  final List<PostModel> posts;
  final ValueChanged<PostModel>? onPostTap;

  const PostGrid({super.key, required this.posts, this.onPostTap});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        childAspectRatio: 1,
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        final post = posts[index];
        return GestureDetector(
          onTap: onPostTap == null ? null : () => onPostTap!(post),
          child: CachedNetworkImage(
            imageUrl: post.image,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
            ),
            errorWidget: (context, url, error) => Container(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
            ),
          ),
        );
      }, childCount: posts.length),
    );
  }
}
