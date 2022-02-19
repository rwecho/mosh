import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v2ex_api_abstractions/v2ex_api_abstractions.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required User user}) : super(UserState());
}

class UserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserState extends Equatable {
  @override
  List<Object?> get props => [];
}
