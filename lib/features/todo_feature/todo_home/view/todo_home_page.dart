import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mosh/features/todo_feature/todo_feature.dart';

class TodoHomePage extends StatelessWidget {
  const TodoHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoHomeCubit(),
      child: const TodoHomeView(),
    );
  }
}

class TodoHomeView extends StatelessWidget {
  const TodoHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // rerender with cubit.state.tab
    final selectedTab =
        context.select((TodoHomeCubit cubit) => cubit.state.tab);

    return Scaffold(
      body: IndexedStack(
        index: selectedTab.index,
        children: const [TodosOverviewPage(), StatsPage()],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        key: const Key('homeView_addTodo_floatingActionButton'),
        onPressed: () => Navigator.of(context).push(EditTodoPage.route()),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _HomeTabButton(
              groupValue: selectedTab,
              value: TodoHomeTab.todos,
              icon: const Icon(Icons.list_rounded),
            ),
            _HomeTabButton(
              groupValue: selectedTab,
              value: TodoHomeTab.stats,
              icon: const Icon(Icons.show_chart_rounded),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeTabButton extends StatelessWidget {
  const _HomeTabButton({
    Key? key,
    required this.groupValue,
    required this.value,
    required this.icon,
  }) : super(key: key);

  final TodoHomeTab groupValue;
  final TodoHomeTab value;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<TodoHomeCubit>().setTab(value),
      iconSize: 32,
      color:
          groupValue != value ? null : Theme.of(context).colorScheme.secondary,
      icon: icon,
    );
  }
}
