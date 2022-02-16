import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Tab extends Equatable {
  const Tab({
    required this.title,
  });

  final String title;

  @override
  List<Object?> get props => [title];
}
