// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';

import '../models/models.dart';
import 'components.dart';

class FriendPostListView extends StatelessWidget {
  // Require a list of `Post`s
  final List<Post> friendPosts;

  const FriendPostListView({
    super.key,
    required this.friendPosts,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Social Chefs 🧑‍🍳',
                style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(height: 16),
            // Create `ListView.separated` with 2 `IndexWidgetBuilder` callbacks
            ListView.separated(
              // Since you're nesting 2 list views, it's a good idea to set `primary`
              // to false to let flutter know that this isn't the primary scroll view.
              primary: false,
              // `physics` controls how the scroll view responds to user input.
              physics: const NeverScrollableScrollPhysics(),
              // If this were false, you'd get an unbounded height error.
              // `shrinkWrap` controls the fixed sscroll area size.
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: friendPosts.length,
              itemBuilder: (context, index) {
                final post = friendPosts[index];
                return FriendPostTile(post: post);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 16);
              },
            ),
            // Leave some padding at the end of the list
            const SizedBox(height: 16),
          ],
        ));
  }
}
