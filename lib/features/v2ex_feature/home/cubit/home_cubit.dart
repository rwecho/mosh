import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v2ex_api_abstractions/v2ex_api_abstractions.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required TabApiAbstraction tabApi})
      : _tabApi = tabApi,
        super(HomeState());
  final TabApiAbstraction _tabApi;
  initialize() {
    emit(state.copyWith(tabs: _tabApi.getTabs()));
  }

  setTab(Tab tab) {
    emit(state.copyWith(tab: tab));
    debugPrint("tab changed $tab");
  }
}

class HomeState extends Equatable {
  final List<Tab> tabs;

  @override
  List<Object?> get props => [tabs, tab];

  HomeState({List<Tab> tabs = const [], Tab? tab})
      : tab = tab ?? (tabs.isNotEmpty ? tabs[0] : null),
        // todo: how to initialize parameters without twice.
        // ignore: prefer_initializing_formals
        tabs = tabs; // or something

  // HomeState({this.tabs = const [], this.tab}) : tab = tabs[0];
  final Tab? tab;

  HomeState copyWith({List<Tab>? tabs, Tab? tab}) {
    return HomeState(
      tabs: tabs ?? this.tabs,
      tab: tab ?? this.tab,
    );
  }
}
