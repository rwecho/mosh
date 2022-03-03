import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/hottest_bloc.dart';

class HottestPage extends StatelessWidget {
  const HottestPage({Key? key}) : super(key: key);
  static Route<void> route() {
    return MaterialPageRoute(
        fullscreenDialog: false,
        builder: (context) => BlocProvider(
            create: (context) => HottestBloc(), child: const HottestPage()));
  }

  @override
  Widget build(BuildContext context) {
    return _HottestView();
  }
}

class _HottestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: const Text("Hottest"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
        ),
        body: const Center(child: Text("hottest")));
  }
}
