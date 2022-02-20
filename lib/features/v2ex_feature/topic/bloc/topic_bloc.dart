import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:v2ex_api_abstractions/v2ex_api_abstractions.dart';

class TopicViewBloc extends Bloc<TopicViewEvent, TopicViewState> {
  TopicViewBloc({required Topic topic, required TopicApiAbstraction topicApi})
      : _topic = topic,
        _topicApi = topicApi,
        super(TopicViewState(
          topic: topic,
          status: TopicViewStatus.inital,
          topicDetail: null,
        )) {
    on<TopicViewSubscriptionRequested>(_onTopicViewSubscriptionRequested);
  }
  final TopicApiAbstraction _topicApi;
  final Topic _topic;

  FutureOr<void> _onTopicViewSubscriptionRequested(
      event, Emitter<TopicViewState> emit) async {
    emit(state.copyWith(status: () => TopicViewStatus.loading));

    try {
      final topicDetail = await _topicApi.getTopicDetail(_topic);
      emit(state.copyWith(
          status: () => TopicViewStatus.success, topicDetail: topicDetail));
    } catch (_) {
      emit(state.copyWith(status: () => TopicViewStatus.failure));
    }

    try {
      final comments = await _topicApi.getComments(_topic, 0);
      emit(state.copyWith(
          status: () => TopicViewStatus.success, comments: comments));
    } catch (_) {
      emit(state.copyWith(status: () => TopicViewStatus.failure));
    }
  }
}

enum TopicViewStatus { inital, loading, success, failure }

class TopicViewState extends Equatable {
  final Topic topic;
  final TopicDetail? topicDetail;

  final TopicViewStatus status;

  final List<Comment> comments;

  const TopicViewState({
    required this.topic,
    required this.status,
    required this.topicDetail,
    this.comments = const [],
  });
  @override
  List<Object?> get props => [topic, status];

  TopicViewState copyWith({
    TopicViewStatus Function()? status,
    TopicDetail? topicDetail,
    List<Comment>? comments,
  }) {
    return TopicViewState(
      topic: topic,
      status: status == null ? this.status : status(),
      topicDetail: topicDetail ?? this.topicDetail,
      comments: comments ?? this.comments,
    );
  }
}

abstract class TopicViewEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TopicViewSubscriptionRequested extends TopicViewEvent {}
