import 'package:flutter/material.dart';
import 'package:mosh/features/v2ex_feature/topic/view/topic_page.dart';
import 'package:mosh/features/v2ex_feature/user/view/user_page.dart';
import 'package:mosh/utils/datetime_extensions.dart';
import 'package:mosh/widgets/avatar_button.dart';
import 'package:mosh/widgets/theme_card_widget.dart';
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
    final theme = Theme.of(context);

    return Column(
      children: [
        Row(
          children: [
            AvatarButton(
                avatarUrl: topic.authorAvatar,
                onTap: () => {
                      Navigator.of(context).push(
                          UserPage.route(user: models.User(name: topic.author)))
                    }),
            const SizedBox(width: 8),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          topic.latestReplyTime.humanReadable(),
                          style: theme.textTheme.caption,
                        ),
                        const SizedBox(width: 8),
                        const SizedBox(width: 8),
                        InkWell(
                          child: Text(
                            topic.latestReplyUser,
                            style: theme.textTheme.caption,
                          ),
                          onTap: () => {
                            Navigator.of(context).push(UserPage.route(
                                user: models.User(name: topic.author)))
                          },
                        ),
                      ],
                    ),
                  ],
                )),
            InkWell(
              child: ThemeCard(
                label: topic.node,
                color: theme.colorScheme.onPrimary,
                textColor: theme.colorScheme.primary,
              ),
              onTap: () => {
                Navigator.of(context)
                    .push(NodePage.route(node: models.Node(title: topic.node)))
              },
            )
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Flexible(
                child: InkWell(
              child: Text(topic.title),
              onTap: () =>
                  {Navigator.of(context).push(TopicPage.route(topic: topic))},
            ))
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              "comments ${topic.replyCount}",
              style: theme.textTheme.caption,
            ),
            const SizedBox(width: 8),
            Flexible(
                child: Text(
              " 最后回复来自 ${topic.latestReplyUser}",
              style: theme.textTheme.caption,
            ))
          ],
        )
      ],
    );
  }
}
