import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Node extends Equatable {
  const Node({required this.title});
  final String title;

  @override
  List<Object?> get props => [title];
}
