import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v2ex_api_abstractions/v2ex_api_abstractions.dart';

import '../bloc/topic_bloc.dart';

class TopicPage extends StatelessWidget {
  const TopicPage({Key? key}) : super(key: key);

  static Route<void> route({required Topic topic}) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => BlocProvider(
        create: (context) => TopicBloc(
          topic: topic,
        ),
        child: const TopicPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TopicBloc, TopicState>(
      listenWhen: (previous, current) => false,
      listener: (context, state) => Navigator.of(context).pop(),
      child: _TopicView(),
    );
  }
}

class _TopicView extends StatelessWidget {
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
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black54,
            ),
          ),
        ),
        body: Center(child: const Text("topic")));
  }
}
