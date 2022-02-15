import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_home_state.dart';

class TodoHomeCubit extends Cubit<TodoHomeState> {
  TodoHomeCubit() : super(const TodoHomeState());

  void setTab(TodoHomeTab tab) => emit(TodoHomeState(tab: tab));
}
