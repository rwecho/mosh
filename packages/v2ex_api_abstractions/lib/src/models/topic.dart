import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Topic extends Equatable {
  const Topic(
      {required this.title,
      required this.node,
      required this.author,
      required this.authorAvatar,
      required this.latestReplyTime,
      required this.latestReplyUser,
      required this.replyCount});

  final String title;
  final String node;
  final String author;
  final String latestReplyUser;
  final DateTime latestReplyTime;
  final String authorAvatar;
  final int replyCount;

  @override
  List<Object?> get props => [];
}
