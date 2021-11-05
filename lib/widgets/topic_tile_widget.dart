import 'package:flutter/material.dart';
import 'package:mosh/core/models/topic_info.dart';
import 'package:mosh/core/utils.dart';

Widget buildTopicListView(BuildContext context, List<TopicInfo> topics) {
  return ListView.separated(
      itemBuilder: (context, index) {
        return const Text("hello");
      },
      separatorBuilder: (contex, index) {
        return const SizedBox(
          width: 10,
        );
      },
      itemCount: topics.length);
}

Widget buildTopicTile(BuildContext context, String title, String username,
    String node, String avatar, int comments, DateTime lastUpdateTime) {
  return Column(children: [
    Row(
      children: [
        Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.brown.shade800,
              child: const Text("AH"),
            )
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
                        Text(readableTime(lastUpdateTime)),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text("评论 $comments"),
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
    Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(title),
        )
      ],
    ),
    const Divider(
      thickness: 1,
    )
  ]);
}
