import 'package:flutter/material.dart';
import 'package:mosh/core/models/topic_tab.dart';

Widget buildTab(BuildContext context, List<TopicTab> topicTabs) {
  return ListView.separated(
    scrollDirection: Axis.horizontal,
    itemCount: topicTabs.length,
    separatorBuilder: (context, index) {
      return const SizedBox(
        width: 10,
      );
    },
    itemBuilder: (context, index) {
      return OutlinedButton(
        onPressed: () {},
        child: Text(topicTabs[index].title),
      );
    },
  );
}
