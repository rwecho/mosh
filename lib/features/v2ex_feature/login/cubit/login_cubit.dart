import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());
}

class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}
