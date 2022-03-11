import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mosh/features/v2ex_feature/home/view/tab_view.dart';

import 'package:v2ex_api_abstractions/v2ex_api_abstractions.dart' as models;
import 'package:faker/faker.dart';
import '../bloc/user_bloc.dart';
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
    "Tab 1",
    "Tab 2",
    "Tab 3",
  ];

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
        body: TabBarView(
          // These are the contents of the tab views, below the tabs.
          children: _tabs.map((String name) {
            //SafeArea 适配刘海屏的一个widget
            return SafeArea(
              top: false,
              bottom: false,
              child: Builder(
                builder: (BuildContext context) {
                  return CustomScrollView(
                    key: PageStorageKey<String>(name),
                    slivers: <Widget>[
                      SliverOverlapInjector(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.all(0.0),
                        sliver: SliverFixedExtentList(
                          itemExtent: 50.0, //item高度或宽度，取决于滑动方向
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return ListTile(
                                title: Text('Item $index'),
                              );
                            },
                            childCount: 30,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          }).toList(),
        ),
      ),
    ));
  }
}
