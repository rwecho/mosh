import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class FavouritesCubit extends Cubit<AboutState> {
  FavouritesCubit() : super(AboutState());
}

class AboutState extends Equatable {
  @override
  List<Object?> get props => [];
}
