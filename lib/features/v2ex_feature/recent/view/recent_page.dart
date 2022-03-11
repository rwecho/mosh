import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:faker/faker.dart';
import '../bloc/recent_bloc.dart';
import '../widgets/topic_tile.dart';

class RecentPage extends StatelessWidget {
  const RecentPage({Key? key}) : super(key: key);
  static Route<void> route() {
    return MaterialPageRoute(
        fullscreenDialog: false,
        builder: (context) => BlocProvider(
            create: (context) => RecentBloc(), child: const RecentPage()));
  }

  @override
  Widget build(BuildContext context) {
    return _RecentView();
  }
}

class _RecentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final faker = context.read<Faker>();
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text("Recent"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.clear)),
        ],
      ),
      body: ListView.builder(
          itemCount: faker.randomGenerator.integer(1000),
          itemBuilder: (context, index) {
            return Column(
              children: [TopicTile(), Divider()],
            );
          }),
    );
  }
}
