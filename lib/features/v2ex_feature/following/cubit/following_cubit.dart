import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class FollowingCubit extends Cubit<FollowingState> {
  FollowingCubit() : super(FollowingState());
}

class FollowingState extends Equatable {
  @override
  List<Object?> get props => [];
}
