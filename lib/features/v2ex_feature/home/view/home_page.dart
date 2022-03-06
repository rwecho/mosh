import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:mosh/features/v2ex_feature/home/view/tab_view.dart';
import 'package:mosh/features/v2ex_feature/search/search.dart';

import '../cubit/home_cubit.dart';
import 'package:v2ex_api_abstractions/v2ex_api_abstractions.dart' as api;

import '../widgets/home_modal_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(tabApi: context.read<api.TabApiAbstraction>())
        ..initialize(),
      child: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tabs = context.read<HomeCubit>().state.tabs;
    return _TabView(tabs: tabs);
  }
}

class _TabView extends StatefulWidget {
  const _TabView({Key? key, required this.tabs}) : super(key: key);
  final List<api.Tab> tabs;

  @override
  State<_TabView> createState() => _TabViewState();
}

class _TabViewState extends State<_TabView> with TickerProviderStateMixin {
  late TabController _tabController;
  late List<Widget> _tabViews;
  late List<Widget> Function(ThemeData themeData) _tabBarItemsBuilder;
  @override
  void initState() {
    _tabController = TabController(length: widget.tabs.length, vsync: this);
    _tabBarItemsBuilder = (theme) => widget.tabs
        .map((tab) => Tab(
              child: Text(tab.title, style: theme.textTheme.titleMedium),
            ))
        .toList();
    _tabViews = widget.tabs.map((tab) => TabView(tab: tab)).toList();
    super.initState();
  }

  List<Widget> _sliverBuilder(BuildContext context, bool innerBoxIsScrolled) {
    final theme = Theme.of(context);
    return [
      SliverAppBar(
        elevation: 0,
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
              style: theme.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onPrimary),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(SearchPage.route());
                },
                icon: const Icon(Icons.search)),
          ],
        ),
        centerTitle: true,
        // expandedHeight: 200.0, //todo expand content
        floating: true,
        pinned: false,
        snap: true,
      ),
      SliverPersistentHeader(
          delegate: _SilverAppBarDelegate(TabBar(
        isScrollable: true,
        labelPadding:
            const EdgeInsets.symmetric(horizontal: 30), // Space between tabs
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
              color: theme.primaryColor, width: 2), // Indicator height
          insets: const EdgeInsets.symmetric(horizontal: 48), // Indicator width
        ),
        controller: _tabController,
        tabs: _tabBarItemsBuilder(theme),
      ))),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: NestedScrollView(
        headerSliverBuilder: _sliverBuilder,
        body: TabBarView(
          controller: _tabController,
          children: _tabViews,
        ),
      )),
    );
  }
}

class _SilverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SilverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return _tabBar;
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
