import 'package:flutter/material.dart';
import 'package:mosh/core/models/topic_info.dart';
import 'package:mosh/core/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget buildTopicListView(BuildContext context, List<TopicInfo> topics) {
  return ListView.separated(
      itemBuilder: (context, index) {
        var topic = topics[index];
        return buildTopicTile(
            context,
            topic.title,
            topic.ownerUserName,
            topic.nodeTitle,
            topic.ownerAvatar,
            topic.replies,
            topic.latestReplyTime);
      },
      separatorBuilder: (contex, index) {
        return const SizedBox(
          height: 10,
        );
      },
      itemCount: topics.length);
}

Widget buildTopicTile(BuildContext context, String title, String username,
    String node, String avatar, int replies, DateTime latestReplyTime) {
  return Column(children: [
    Row(
      children: [
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: 150,
                  height: 50,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(
                        color: Colors.yellow,
                      ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  imageUrl: avatar),
            ),
          ],
        ),
        Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(children: [Text(username)]),
                    Row(
                      children: [
                        Text(readableTime(latestReplyTime)),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text("评论 $replies"),
                        ),
                      ],
                    )
                  ],
                ))),
        Column(
          children: [
            SizedBox(
                child: ElevatedButton(
              onPressed: () {},
              child: Text(node),
              style: ElevatedButton.styleFrom(
                primary: Colors.grey.shade400,
              ),
            ))
          ],
        )
      ],
    ),
    Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        )),
    const Divider(
      thickness: 1,
    )
  ]);
}
