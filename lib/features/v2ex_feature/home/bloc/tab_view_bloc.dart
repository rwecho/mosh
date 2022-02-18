import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:v2ex_api_abstractions/v2ex_api_abstractions.dart';

part 'tab_view_event.dart';
part 'tab_view_state.dart';

class TabViewBloc extends Bloc<TabViewEvent, TabViewState> {
  TabViewBloc({required Tab tab, required TopicApiAbstraction topicApi})
      : _topicApi = topicApi,
        _tab = tab,
        super(TabViewState(tab: tab)) {
    on<TabViewSubscriptionRequested>(_onSubscriptionRequested);
  }
  final TopicApiAbstraction _topicApi;
  final Tab _tab;

  FutureOr<void> _onSubscriptionRequested(
      TabViewSubscriptionRequested event, Emitter<TabViewState> emit) async {
    emit(state.copyWith(status: () => TabViewStatus.loading));

    await emit.forEach<List<Topic>>(
        Stream.fromFuture(_topicApi.getTopics(_tab)), onData: (topics) {
      debugPrint("topics ${topics.length} loaded");
      return state.copyWith(
          status: () => TabViewStatus.success, topics: () => topics);
    }, onError: (_, __) {
      debugPrint("topics loaded error.");
      return state.copyWith(status: () => TabViewStatus.failure);
    });
  }
}
