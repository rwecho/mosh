import 'package:equatable/equatable.dart';

class Tab extends Equatable {
  Tab({
    required this.title,
  });

  final String title;

  @override
  List<Object?> get props => [title];
}
