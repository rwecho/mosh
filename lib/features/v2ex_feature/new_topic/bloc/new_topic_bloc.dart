import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class NewTopicBloc extends Bloc<NewTopicEvent, NewTopicState> {
  NewTopicBloc() : super(NewTopicState());
}

class NewTopicEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewTopicState extends Equatable {
  @override
  List<Object?> get props => [];
}
