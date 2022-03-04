import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:mosh/features/v2ex_feature/home/view/tab_view.dart';
import 'package:mosh/features/v2ex_feature/home/widgets/home_bottom_tabs.dart';
import 'package:mosh/features/v2ex_feature/search/search.dart';
import 'package:mosh/widgets/avatar_button.dart';
import 'package:mosh/widgets/lazy_indexed_stack.dart';

import '../cubit/home_cubit.dart';
import 'package:v2ex_api_abstractions/v2ex_api_abstractions.dart';

import '../widgets/home_modal_menu.dart';

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
    final _tabController = TabController(length: tabs.length, vsync: this);
    final TextTheme text = Theme.of(context).primaryTextTheme;

    var selectedTab = context.select((HomeCubit cubit) => cubit.state.tab);
    var index = tabs.indexOf(selectedTab!);

    final tabViews = tabs.map((tab) => TabView(tab: tab)).toList();

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                showCupertinoModalBottomSheet(
                  expand: false,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const ModalMenu(),
                );
              },
              icon: const Icon(Icons.menu)),
          titleSpacing: 0,
          title: Row(
            children: [
              const Spacer(),
              Text(
                "V2EX",
                style: text.titleLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(SearchPage.route());
                  },
                  icon: const Icon(Icons.search)),
            ],
          )),
      body: TabBarView(
        controller: _tabController,
        children: [],
      ),
      bottomNavigationBar: BottomAppBar(
        child:
            TabBar(controller: _tabController, isScrollable: true, tabs: tabs),
      ),
    );
  }
}

class ChangeTab {}
