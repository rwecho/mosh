import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mosh/features/v2ex_feature/node/widgets/node_info.dart';
import 'package:mosh/widgets/blur_image_container.dart';
import 'package:v2ex_api_abstractions/v2ex_api_abstractions.dart';
import 'package:faker/faker.dart';
import '../bloc/node_bloc.dart';
import '../widgets/topic_tile.dart';

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
    final faker = context.read<Faker>();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Add the app bar to the CustomScrollView.
          SliverAppBar(
            // Provide a standard title.
            title: Text("node"),
            // Allows the user to reveal the app bar if they begin scrolling
            // back up the list of items.
            floating: true,
            // Display a placeholder widget to visualize the shrinking size.
            flexibleSpace: BlurImageContainer(
              imageUrl: faker.image.image(),
              child: Text("center message"),
            ),
            // Make the initial height of the SliverAppBar larger than normal.
            expandedHeight: 200,
          ),
          // Next, create a SliverList
          SliverList(
            // Use a delegate to build items as they're scrolled on screen.
            delegate: SliverChildBuilderDelegate(
              // The builder function returns a ListTile with a title that
              // displays the index of the current item.
              (context, index) => TopicTile(),
              // Builds 1000 ListTiles
              childCount: 1000,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
