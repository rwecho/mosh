import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc() : super(NotificationsState());
}

class NotificationsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class NotificationsState extends Equatable {
  @override
  List<Object?> get props => [];
}
