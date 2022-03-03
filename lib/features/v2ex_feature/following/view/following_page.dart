import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/following_cubit.dart';

class FollowingPage extends StatelessWidget {
  const FollowingPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
        fullscreenDialog: false,
        builder: (context) => BlocProvider(
            create: (context) => FollowingCubit(),
            child: const FollowingPage()));
  }

  @override
  Widget build(BuildContext context) {
    return _FollowingView();
  }
}

class _FollowingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: const Text("Following"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
        ),
        body: const Center(child: Text("following")));
  }
}
