import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:v2ex_api_abstractions/v2ex_api_abstractions.dart';

class TopicViewBloc extends Bloc<TopicViewEvent, TopicViewState> {
  TopicViewBloc({required Topic topic})
      : _topic = topic,
        super(TopicViewState(topic: topic, status: TopicViewStatus.inital)) {
    on<TopicViewSubscriptionRequested>(_onTopicViewSubscriptionRequested);
  }

  final Topic _topic;

  FutureOr<void> _onTopicViewSubscriptionRequested(
      event, Emitter<TopicViewState> emit) {
    emit(state.copyWith(status: () => TopicViewStatus.loading));
  }
}

enum TopicViewStatus { inital, loading }

class TopicViewState extends Equatable {
  final Topic topic;

  final TopicViewStatus status;

  const TopicViewState({required this.topic, required this.status});
  @override
  List<Object?> get props => [topic, status];

  TopicViewState copyWith({TopicViewStatus Function()? status}) {
    return TopicViewState(
        topic: topic, status: status == null ? this.status : status());
  }
}

abstract class TopicViewEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TopicViewSubscriptionRequested extends TopicViewEvent {}
