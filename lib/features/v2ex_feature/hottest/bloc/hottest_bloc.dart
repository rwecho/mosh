import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class HottestBloc extends Bloc<HottestEvent, HottestState> {
  HottestBloc() : super(HottestState());
}

class HottestEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class HottestState extends Equatable {
  @override
  List<Object?> get props => [];
}
