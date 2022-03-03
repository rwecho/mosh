import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class AboutCubit extends Cubit<AboutState> {
  AboutCubit() : super(AboutState());
}

class AboutState extends Equatable {
  @override
  List<Object?> get props => [];
}
