import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class RecentBloc extends Bloc<RecentEvent, RecentState> {
  RecentBloc() : super(RecentState());
}

class RecentEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RecentState extends Equatable {
  @override
  List<Object?> get props => [];
}
