import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:v2ex_api_abstractions/v2ex_api_abstractions.dart';

class TopicBloc extends Bloc<TopicEvent, TopicState> {
  TopicBloc({required Topic topic}) : super(TopicState());
}

class TopicState extends Equatable {
  @override
  List<Object?> get props => [];
}

abstract class TopicEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
