import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:mosh/features/v2ex_feature/node/view/node_page.dart';
import 'package:mosh/widgets/avatar_button.dart';
import 'package:mosh/widgets/comment_tile_widget.dart';
import 'package:v2ex_api_abstractions/v2ex_api_abstractions.dart' as models;
import 'package:mosh/l10n/l10n.dart';

import '../bloc/topic_bloc.dart';

class TopicPage extends StatelessWidget {
  const TopicPage({Key? key}) : super(key: key);

  static Route<void> route({required models.Topic topic}) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => BlocProvider(
        create: (context) => TopicViewBloc(
          topic: topic,
          topicApi: context.read<models.TopicApiAbstraction>(),
        )..add(TopicViewSubscriptionRequested()),
        child: const TopicPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TopicViewBloc, TopicViewState>(
      listenWhen: (previous, current) => false,
      listener: (context, state) => Navigator.of(context).pop(),
      child: _TopicView(),
    );
  }
}

class _TopicView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    return MultiBlocListener(
      listeners: [
        BlocListener<TopicViewBloc, TopicViewState>(
            listenWhen: (previous, current) =>
                previous.status != current.status,
            listener: (context, state) {
              if (state.status == TopicViewStatus.failure) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      // todo replace error message.
                      content: Text(l10n.todosOverviewErrorSnackbarText),
                    ),
                  );
              }
            })
      ],
      child: BlocBuilder<TopicViewBloc, TopicViewState>(builder: (
        context,
        state,
      ) {
        if (state.status == TopicViewStatus.loading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state.status != TopicViewStatus.success) {
          return const Text("loading data failed.");
        }
        if (state.topicDetail == null) {
          return const Center(child: Text("loading topic detail failed."));
        }
        final topicDetail = state.topicDetail!;
        final comments = state.comments;
        return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              title: TextButton(
                  onPressed: () {
                    NodePage.route(node: models.Node(title: state.topic.node));
                  },
                  child: Text(
                    state.topic.node,
                    style: theme.textTheme.titleMedium!
                        .copyWith(color: theme.colorScheme.onPrimary),
                  )),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.circle)),
                PopupMenuButton<int>(
                    itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                          const PopupMenuItem<int>(
                              value: 1, child: Text('Thanks')),
                          const PopupMenuItem<int>(
                              value: 2, child: Text('Ignore')),
                          const PopupMenuItem<int>(
                              value: 3, child: Text('report')),
                          const PopupMenuItem<int>(
                              value: 4, child: Text('Share')),
                          const PopupMenuItem<int>(
                              value: 5, child: Text('sort')),
                          const PopupMenuItem<int>(
                              value: 6, child: Text('open in browser')),
                        ],
                    onSelected: (int value) {})
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                topicDetail.title,
                                style: theme.textTheme.titleMedium,
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            AvatarButton(
                                avatarUrl: topicDetail.authorAvatar,
                                onTap: () {})
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "by ${topicDetail.author} at ${topicDetail.creationTime} • ${topicDetail.visits} views",
                          style: theme.textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  // todo render markdown
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8.0),
                    child: Text(
                      topicDetail.content,
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(Icons.tag),
                              OutlinedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Fred's",
                                    style: theme.textTheme.caption,
                                  )),
                              OutlinedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Fred",
                                    style: theme.textTheme.caption,
                                  )),
                              OutlinedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "scripts",
                                    style: theme.textTheme.caption,
                                  )),
                              OutlinedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "程序员",
                                    style: theme.textTheme.caption,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Text("${comments.length} replies"),
                  ),
                  Column(children: [
                    const Divider(),
                    ...<Widget>[
                      for (var comment in comments)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: buildCommentTileWidget(
                              context,
                              comment.author,
                              comment.authorAvatar,
                              comment.replyTime,
                              comment.content,
                              comment.likes,
                              comment.isLike,
                              comment.floors),
                        )
                    ]
                  ])
                ],
              ),
            ));
      }),
    );
  }
}
