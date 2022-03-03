import 'package:flutter/material.dart';
import 'package:mosh/features/v2ex_feature/topic/view/topic_page.dart';
import 'package:mosh/features/v2ex_feature/user/view/user_page.dart';
import 'package:mosh/utils/datetime_extensions.dart';
import 'package:mosh/widgets/avatar_button.dart';
import 'package:v2ex_api_abstractions/v2ex_api_abstractions.dart' as models;
import 'package:cached_network_image/cached_network_image.dart';

import '../../node/view/node_page.dart';

class TopicListTile extends StatelessWidget {
  const TopicListTile({Key? key, required this.topic, this.onTap})
      : super(key: key);

  final models.Topic topic;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AvatarButton(
            avatarUrl: topic.authorAvatar,
            onTap: () => {
                  Navigator.of(context).push(
                      UserPage.route(user: models.User(name: topic.author)))
                }),
        Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      child: Text(topic.node),
                      onTap: () => {
                        Navigator.of(context).push(NodePage.route(
                            node: models.Node(title: topic.node)))
                      },
                    ),
                    const Text("  •  "),
                    InkWell(
                      child: Text(topic.author),
                      onTap: () => {
                        Navigator.of(context).push(UserPage.route(
                            user: models.User(name: topic.author)))
                      },
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // use flexible to wrap line
                  children: [
                    Flexible(
                        child: InkWell(
                      child: Text(topic.title),
                      onTap: () => {
                        Navigator.of(context)
                            .push(TopicPage.route(topic: topic))
                      },
                    ))
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(topic.latestReplyTime.humanReadable()),
                    const Text("  • "),
                    const Flexible(child: Text(" 最后回复来自 ")),
                    InkWell(
                        onTap: () => {
                              Navigator.of(context).push(UserPage.route(
                                  user:
                                      models.User(name: topic.latestReplyUser)))
                            },
                        child: Text(topic.latestReplyUser)),
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
