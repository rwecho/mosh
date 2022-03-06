import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:mosh/utils/datetime_extensions.dart';

Widget buildCommentTileWidget(
    BuildContext context,
    String author,
    String authorAvatar,
    DateTime creationTime,
    String comment,
    int likes,
    bool isLike,
    int floors) {
  final theme = Theme.of(context);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: CachedNetworkImage(
                fit: BoxFit.cover,
                width: 32,
                height: 32,
                placeholder: (context, url) => const CircularProgressIndicator(
                      color: Colors.yellow,
                    ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                imageUrl: authorAvatar),
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(author),
              Text(
                creationTime.humanReadable(),
                style: theme.textTheme.caption,
              ),
            ],
          ),
          const Spacer(),
          if (isLike)
            IconButton(onPressed: () {}, icon: const Icon(Typicons.heart)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.reply)),
          OutlinedButton(
            onPressed: () {},
            child: Text("$floors"),
          )
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(comment),
      ),
      const Divider(),
    ],
  );
}
