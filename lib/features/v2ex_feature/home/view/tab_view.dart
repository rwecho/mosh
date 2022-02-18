import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v2ex_api_abstractions/v2ex_api_abstractions.dart' as v2ex;
import 'package:mosh/l10n/l10n.dart';

import '../bloc/tab_view_bloc.dart';
import '../widgets/topic_list_tile.dart';

class TabView extends StatelessWidget {
  final v2ex.Tab tab;

  const TabView({Key? key, required this.tab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TabViewBloc(
          topicApi: context.read<v2ex.TopicApiAbstraction>(), tab: tab)
        ..add(const TabViewSubscriptionRequested()),
      child: _TabView(),
    );
  }
}

class _TabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return MultiBlocListener(
      listeners: [
        BlocListener<TabViewBloc, TabViewState>(
            listenWhen: (previous, current) =>
                previous.status != current.status,
            listener: (context, state) {
              if (state.status == TabViewStatus.failure) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      // todo replace error message.
                      content: Text(l10n.todosOverviewErrorSnackbarText),
                    ),
                  );
              }
            })
      ],
      child: BlocBuilder<TabViewBloc, TabViewState>(
        builder: (context, state) {
          if (state.topics.isEmpty) {
            if (state.status == TabViewStatus.loading) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (state.status != TabViewStatus.success) {
              return const Text("loading data failed.");
            } else {
              return Center(
                child: Text(
                  // todo replace with actual text.
                  l10n.todosOverviewEmptyText,
                  style: Theme.of(context).textTheme.caption,
                ),
              );
            }
          }

          return CupertinoScrollbar(
            child: Column(
              children: [
                Text(state.tab.title),
                Flexible(
                  child: ListView(
                    children: [
                      for (final topic in state.topics)
                        TopicListTile(topic: topic)
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
