import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState());
}

class SettingsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SettingsState extends Equatable {
  @override
  List<Object?> get props => [];
}
