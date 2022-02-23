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
    on<AddToFavoritesRequested>(_onAddToFavoritesEvent);
    on<TweetRequested>(_onTweetRequested);
    on<ShareRequested>(_onShareRequested);
    on<IgnoreRequested>(_onIgnoreRequested);
    on<ThankRequested>(_onThankRequested);
  }
  final TopicApiAbstraction _topicApi;
  final Topic _topic;

  FutureOr<void> _onTopicViewSubscriptionRequested(
      TopicViewSubscriptionRequested event,
      Emitter<TopicViewState> emit) async {
    emit(state.copyWith(status: () => TopicViewStatus.loading));

    try {
      final topicDetail = await _topicApi.getTopicDetail(_topic);
      final comments = await _topicApi.getComments(_topic, 0);
      emit(state.copyWith(
        status: () => TopicViewStatus.success,
        topicDetail: topicDetail,
        comments: comments,
      ));
    } catch (_) {
      emit(state.copyWith(status: () => TopicViewStatus.failure));
    }
  }

  FutureOr<void> _onAddToFavoritesEvent(
      AddToFavoritesRequested event, Emitter<TopicViewState> emit) async {
    try {
      await _topicApi.addFavorites(_topic);
      //todo: abstract a button with handing indicator
    } catch (e) {}
  }

  FutureOr<void> _onTweetRequested(
      TweetRequested event, Emitter<TopicViewState> emit) {
    try {
      _topicApi.tweet(_topic);
    } catch (e) {}
  }

  FutureOr<void> _onShareRequested(
      ShareRequested event, Emitter<TopicViewState> emit) {
    try {
      _topicApi.share(_topic);
    } catch (e) {}
  }

  FutureOr<void> _onIgnoreRequested(
      IgnoreRequested event, Emitter<TopicViewState> emit) {
    try {
      _topicApi.ignore(_topic);
    } catch (e) {}
  }

  FutureOr<void> _onThankRequested(
      ThankRequested event, Emitter<TopicViewState> emit) {
    try {
      _topicApi.thank(_topic);
    } catch (e) {}
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

class AddToFavoritesRequested extends TopicViewEvent {}

class TweetRequested extends TopicViewEvent {}

class ShareRequested extends TopicViewEvent {}

class IgnoreRequested extends TopicViewEvent {}

class ThankRequested extends TopicViewEvent {}
