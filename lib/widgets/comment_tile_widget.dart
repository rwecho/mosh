import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';

Widget buildCommentTileWidget(
    BuildContext context,
    String author,
    String authorAvatar,
    String subtitle,
    String comment,
    int likes,
    bool isLike,
    int floors) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: 32,
                  height: 32,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(
                        color: Colors.yellow,
                      ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  imageUrl: authorAvatar),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(author),
                      Flexible(fit: FlexFit.tight, child: Text(subtitle)),
                      if (isLike)
                        IconButton(
                            onPressed: () {}, icon: const Icon(Typicons.heart)),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.reply)),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("1"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey.shade400,
                        ),
                      )
                    ],
                  ),
                  Text(comment)
                ],
              ),
            )
          ],
        )
      ],
    ),
  );
}
