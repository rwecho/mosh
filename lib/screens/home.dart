import 'package:flutter/material.dart';
import 'package:mosh/core/models/my_node.dart';
import 'package:mosh/core/models/topic_info.dart';
import 'package:mosh/core/models/topic_tab.dart';
import 'package:mosh/core/services/topic_service.dart';
import 'package:mosh/core/services/topic_tab_service.dart';
import 'package:mosh/widgets/tab_widget.dart';
import 'package:mosh/widgets/topic_tile_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  late List<TopicTab> _topicTabs;
  late TopicService _topicService;

  @override
  void initState() {
    super.initState();
    _topicService = TopicService();
    _topicTabs = TopicTabService().getTopicTabs().toList();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        SizedBox(
          height: 30,
          child: NotificationListener(
            child: buildTab(context, _topicTabs),
            onNotification: (e) {
              return true;
            },
          ),
        ),
        Flexible(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: FutureBuilder<PagedResult<TopicInfo>>(
                  future: _topicService.getRecentTopics(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text(
                          "Failed to load data. Please check you wifi connection!",
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                    }
                    var topics = snapshot.data;
                    return buildTopicListView(context, topics!.items);
                  },
                )))
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
