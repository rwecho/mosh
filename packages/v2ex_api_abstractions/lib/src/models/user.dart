import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class User extends Equatable {
  const User({
    required this.name,
  });

  final String name;

  @override
  List<Object?> get props => [name];
}
