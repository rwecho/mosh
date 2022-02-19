import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v2ex_api_abstractions/v2ex_api_abstractions.dart';

class NodeBloc extends Bloc<NodeEvent, NodeState> {
  NodeBloc({required Node node}) : super(NodeState());
}

class NodeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class NodeState extends Equatable {
  @override
  List<Object?> get props => [];
}
