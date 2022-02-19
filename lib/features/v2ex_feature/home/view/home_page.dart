import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mosh/features/v2ex_feature/home/view/tab_view.dart';
import 'package:mosh/features/v2ex_feature/home/widgets/home_bottom_tabs.dart';
import 'package:mosh/widgets/lazy_indexed_stack.dart';

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
    var index = tabs.indexOf(selectedTab!);

    debugPrint("tab index $index");

    final tabViews = tabs.map((tab) => TabView(tab: tab)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("v2ex"),
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('设置'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: LazyIndexedStack(
        index: index,
        children: tabViews,
      ),
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
