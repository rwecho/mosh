import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mosh/widgets/comment_tile_widget.dart';
import 'package:v2ex_api_abstractions/v2ex_api_abstractions.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../bloc/topic_bloc.dart';

class TopicPage extends StatelessWidget {
  const TopicPage({Key? key}) : super(key: key);

  static Route<void> route({required Topic topic}) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => BlocProvider(
        create: (context) => TopicViewBloc(
          topic: topic,
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
                children: [
                  Text("19 likes"),
                  Flexible(
                    child: ElevatedButton(
                        onPressed: () {}, child: Text("Add to Favirities")),
                  ),
                  Flexible(
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text("Tweet"))),
                  Flexible(
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text("Share"))),
                  Flexible(
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text("Ignore"))),
                  Flexible(
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text("Thank"))),
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
                          ElevatedButton(
                              onPressed: () {}, child: Text("Fred's")),
                          ElevatedButton(onPressed: () {}, child: Text("Fred")),
                          ElevatedButton(
                              onPressed: () {}, child: Text("scripts")),
                          ElevatedButton(onPressed: () {}, child: Text("程序员")),
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
  }
}
