import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mosh/features/v2ex_feature/home/view/tab_view.dart';
import 'package:mosh/features/v2ex_feature/user/view/components/user_info.dart';
import 'package:v2ex_api_abstractions/v2ex_api_abstractions.dart' as models;

import '../bloc/user_bloc.dart';

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
  List<Widget> _sliverBuilder(BuildContext context, bool innerBoxIsScrolled) {
    final theme = Theme.of(context);
    return [
      SliverAppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        titleSpacing: 0,
        centerTitle: true,
        title: const Text("User"),
        // expandedHeight: 200.0, //todo expand content
        floating: true,
        pinned: false,
        snap: true,
      ),
      // SliverPersistentHeader(
      //   delegate: _SilverAppBarDelegate(),
      // ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: _sliverBuilder,
          body: SingleChildScrollView(
              child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: UserInfo(),
              ),
              Divider(),
              // TabBar(tabs: [
              //   Tab(
              //     text: "主题",
              //   )
              // ]),
              // TabBarView(children: [Text("主题")])
            ],
          )),
        ),
      ),
    );
  }
}
