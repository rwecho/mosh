import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v2ex_api_abstractions/v2ex_api_abstractions.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required TabApiAbstraction tabApi})
      : _tabApi = tabApi,
        super(const HomeState());
  final TabApiAbstraction _tabApi;
  initialize() {
    emit(state.copyWith(_tabApi.getTabs()));
  }
}

class HomeState extends Equatable {
  final List<Tab> tabs;

  @override
  List<Object?> get props => [tabs];

  const HomeState({this.tabs = const []});

  HomeState copyWith(List<Tab> tabs) {
    return HomeState(tabs: tabs);
  }
}
