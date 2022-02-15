part of 'todo_home_cubit.dart';

enum TodoHomeTab { todos, stats }

class TodoHomeState extends Equatable {
  const TodoHomeState({
    this.tab = TodoHomeTab.todos,
  });

  final TodoHomeTab tab;

  @override
  List<Object> get props => [tab];
}
