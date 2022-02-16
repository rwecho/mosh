import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mosh/features/v2ex_feature/home/widgets/home_bottom_tabs.dart';

import '../cubit/home_cubit.dart';
import 'package:v2ex_api_abstractions/v2ex_api_abstractions.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          HomeCubit(tabApi: context.read<TabApiAbstraction>())..initialize(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tabs = context.read<HomeCubit>().state.tabs;
    var selectedTab = context.select((HomeCubit cubit) => cubit.state.tab);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("v2ex"),
        ),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: tabs.length,
          itemBuilder: (context1, index) {
            var tab = tabs[index];
            return Text(tab.title);
          }),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            HomeBottomTabs(
              tabs: tabs,
              tab: selectedTab,
              onTabChanged: (tab) {
                context.read<HomeCubit>().setTab(tab);
              },
            ),
            TextButton(onPressed: () => {}, child: const Text("hello"))
          ],
        ),
      ),
    );
  }
}

class ChangeTab {}
