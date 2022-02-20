import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v2ex_api_abstractions/v2ex_api_abstractions.dart';

import '../../node/bloc/node_bloc.dart';

class NodePage extends StatelessWidget {
  const NodePage({Key? key}) : super(key: key);

  static Route<void> route({required Node node}) {
    return MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => BlocProvider(
            create: (context) => NodeBloc(node: node),
            child: const NodePage()));
  }

  @override
  Widget build(BuildContext context) {
    return _NodeView();
  }
}

class _NodeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
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
        ),
        body: const Center(child: Text("node")));
  }
}
