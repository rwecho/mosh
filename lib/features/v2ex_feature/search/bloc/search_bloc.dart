import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState());
}

class SearchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchState extends Equatable {
  @override
  List<Object?> get props => [];
}
