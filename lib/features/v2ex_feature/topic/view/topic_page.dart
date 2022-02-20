import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mosh/widgets/comment_tile_widget.dart';
import 'package:v2ex_api_abstractions/v2ex_api_abstractions.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:mosh/l10n/l10n.dart';

import '../bloc/topic_bloc.dart';

class TopicPage extends StatelessWidget {
  const TopicPage({Key? key}) : super(key: key);

  static Route<void> route({required Topic topic}) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => BlocProvider(
        create: (context) => TopicViewBloc(
          topic: topic,
          topicApi: context.read<TopicApiAbstraction>(),
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
    var topic = context.read<TopicViewBloc>().state.topic;
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }

    final smallButtonStyle = OutlinedButton.styleFrom(
        minimumSize: const Size(20, 24), padding: const EdgeInsets.all(4));
    final smallPillButtonStyle = OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        minimumSize: const Size(20, 24),
        padding: const EdgeInsets.all(4));
    final l10n = context.l10n;
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
      child:
          BlocBuilder<TopicViewBloc, TopicViewState>(builder: (context, state) {
        if (state.status == TopicViewStatus.loading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state.status != TopicViewStatus.success) {
          return const Text("loading data failed.");
        }
        return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              titleSpacing: 10.0,
              centerTitle: true,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black54,
                ),
              ),
              title: Row(
                children: const [
                  Text("node name"),
                ],
              ),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(topic.title),
                  Text(
                      "by ${topic.author} at ${topic.creationTime} • ${topic.visits} views"),
                  const Divider(),
                  // todo render markdown
                  Html(
                    data: "<div>hello world</div>",
                  ),
                  const Divider(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("19 likes"),
                      const SizedBox(
                        width: 4,
                      ),
                      OutlinedButton(
                          onPressed: () {},
                          style: smallButtonStyle,
                          child: const Text(
                            "Add to Favirities",
                            style: TextStyle(fontSize: 12),
                          )),
                      const SizedBox(
                        width: 4,
                      ),
                      Flexible(
                          child: ButtonTheme(
                        minWidth: 10,
                        child: OutlinedButton(
                            onPressed: () {},
                            style: smallButtonStyle,
                            child: const Text(
                              "Tweet",
                              style: TextStyle(fontSize: 12),
                            )),
                      )),
                      const SizedBox(
                        width: 4,
                      ),
                      Flexible(
                          child: OutlinedButton(
                              onPressed: () {},
                              style: smallButtonStyle,
                              child: const Text(
                                "Share",
                                style: TextStyle(fontSize: 12),
                              ))),
                      const SizedBox(
                        width: 4,
                      ),
                      Flexible(
                          child: OutlinedButton(
                              onPressed: () {},
                              style: smallButtonStyle,
                              child: const Text(
                                "Ignore",
                                style: TextStyle(fontSize: 12),
                              ))),
                      const SizedBox(
                        width: 4,
                      ),
                      Flexible(
                          fit: FlexFit.loose,
                          child: OutlinedButton(
                              onPressed: () {},
                              style: smallButtonStyle,
                              child: const Text(
                                "Thank",
                                style: TextStyle(fontSize: 12),
                              ))),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 10,
                          child: Row(
                            children: [
                              const Icon(Icons.tag),
                              OutlinedButton(
                                  style: smallPillButtonStyle,
                                  onPressed: () {},
                                  child: Text("Fred's")),
                              OutlinedButton(
                                  style: smallPillButtonStyle,
                                  onPressed: () {},
                                  child: Text("Fred")),
                              OutlinedButton(
                                  style: smallPillButtonStyle,
                                  onPressed: () {},
                                  child: Text("scripts")),
                              OutlinedButton(
                                  style: smallPillButtonStyle,
                                  onPressed: () {},
                                  child: Text("程序员")),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          child: Column(children: [
                            const Text("4 replies 2022-02-19 15:23:44 +08:00"),
                            ...<Widget>[
                              for (var i = 0; i < 10; i++)
                                buildCommentTileWidget(
                                    context,
                                    "test",
                                    "https://source.unsplash.com/640x480?random=4",
                                    "subtitle",
                                    "comment",
                                    0,
                                    false,
                                    1)
                            ]
                          ]),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ));
      }),
    );
  }
}
