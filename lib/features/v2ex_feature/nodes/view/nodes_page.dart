import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:faker/faker.dart';
import '../bloc/nodes_bloc.dart';

class NodesPage extends StatelessWidget {
  const NodesPage({Key? key}) : super(key: key);
  static Route<void> route() {
    return MaterialPageRoute(
        fullscreenDialog: false,
        builder: (context) => BlocProvider(
            create: (context) => NodesBloc(), child: const NodesPage()));
  }

  @override
  Widget build(BuildContext context) {
    return _NodesView();
  }
}

class _NodesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final faker = context.read<Faker>();

    final widgets =
        Iterable<int>.generate(faker.randomGenerator.integer(20)).map((index) {
      var groupName = faker.food.restaurant();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(groupName),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children:
                  Iterable<int>.generate(faker.randomGenerator.integer(20))
                      .map((nodeIndex) {
                return OutlinedButton(
                    onPressed: () {}, child: Text(faker.food.dish()));
              }).toList(),
            ),
          ),
          const Divider()
        ],
      );
    });
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text("Nodes"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: widgets.toList(),
        ),
      ),
    );
  }
}
