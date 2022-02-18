import 'package:flutter/material.dart';
import 'package:v2ex_api_abstractions/v2ex_api_abstractions.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TopicListTile extends StatelessWidget {
  const TopicListTile({Key? key, required this.topic, this.onTap})
      : super(key: key);

  final Topic topic;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: CachedNetworkImage(
              fit: BoxFit.cover,
              width: 48,
              height: 48,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageUrl: topic.authorAvatar),
        ),
        Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(topic.group),
                    const Text("  •  "),
                    Text(topic.author)
                  ],
                ),
                Row(
                  // use flexible to wrap line
                  children: [Flexible(child: Text(topic.title))],
                ),
                Row(
                  children: [
                    Text("${topic.latestReplyTime}"),
                    const Text("  •  "),
                    const Text("最后回复来自 "),
                    Text(topic.latestReplyUser),
                  ],
                )
              ],
            )),
        CircleAvatar(
          backgroundColor: Colors.grey,
          child: Center(child: Text("${topic.replyCount}")),
        )
      ],
    );
  }
}
