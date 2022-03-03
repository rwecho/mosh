import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class NodesBloc extends Bloc<NodesEvent, NodesState> {
  NodesBloc() : super(NodesState());
}

class NodesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class NodesState extends Equatable {
  @override
  List<Object?> get props => [];
}
