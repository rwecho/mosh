import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            Flexible(
              child: SizedBox(
                height: 44,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: tabs.length,
                    itemBuilder: (context1, index) {
                      var tab = tabs[index];
                      return TextButton(
                          onPressed: () => {}, child: Text(tab.title));
                    }),
              ),
            ),
            TextButton(onPressed: () => {}, child: const Text("hello"))
          ],
        ),
      ),
    );
  }
}
