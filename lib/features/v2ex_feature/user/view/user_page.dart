import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mosh/features/v2ex_feature/home/view/tab_view.dart';
import 'package:mosh/features/v2ex_feature/user/widgets/comment_tile.dart';

import 'package:v2ex_api_abstractions/v2ex_api_abstractions.dart' as models;
import 'package:faker/faker.dart';
import '../bloc/user_bloc.dart';
import '../widgets/topic_tile.dart';
import '../widgets/user_info.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  static Route<void> route({required models.User user}) {
    return MaterialPageRoute(
        fullscreenDialog: false,
        builder: (context) => BlocProvider(
            create: (context) => UserBloc(user: user),
            child: const UserPage()));
  }

  @override
  Widget build(BuildContext context) {
    return _UserView();
  }
}

class _UserView extends StatelessWidget {
  var _tabs = <String>[
    "主题",
    "回复",
  ];

  Widget _builderTopicListTabBarView() {
    return Text("");
  }

  Widget _BuilderCommentListTabBarView() {
    return Text("");
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body:

            /// 加TabBar
            DefaultTabController(
      length: _tabs.length, // This is the number of tabs.
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          // These are the slivers that show up in the "outer" scroll view.
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                leading: new IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {},
                ),
                title: const Text('标题'),
                centerTitle: false,
                pinned: true,
                floating: false,
                snap: false,
                primary: true,
                expandedHeight: 230.0,

                elevation: 10,
                //是否显示阴影，直接取值innerBoxIsScrolled，展开不显示阴影，合并后会显示
                forceElevated: innerBoxIsScrolled,

                actions: <Widget>[
                  new IconButton(
                    icon: Icon(Icons.more_horiz),
                    onPressed: () {
                      print("更多");
                    },
                  ),
                ],

                flexibleSpace: new FlexibleSpaceBar(background: UserInfo()),

                bottom: TabBar(
                  tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: 10000,
                itemBuilder: (context, index) {
                  return TopicTile();
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: 10000,
                itemBuilder: (context, index) {
                  return CommentTile();
                }),
          )
        ]),
      ),
    ));
  }
}
