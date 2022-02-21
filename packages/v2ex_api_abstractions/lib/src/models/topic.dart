import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Topic extends Equatable {
  const Topic({
    required this.title,
    required this.node,
    required this.author,
    required this.authorAvatar,
    required this.latestReplyTime,
    required this.latestReplyUser,
    required this.replyCount,
    this.creationTime,
    this.visits,
  });

  final String title;
  final String node;
  final String author;
  final String latestReplyUser;
  final DateTime latestReplyTime;
  final String authorAvatar;
  final int replyCount;
  final int? visits;
  final DateTime? creationTime;

  @override
  List<Object?> get props => [];
}

class TopicDetail extends Equatable {
  const TopicDetail({
    required this.author,
    required this.authorAvatar,
    required this.node,
    required this.title,
    required this.creationTime,
    required this.visits,
    required this.content,
    required this.postscripts,
    required this.likes,
    required this.tags,
  });
  final String author;
  final String authorAvatar;
  final String node;
  final String title;
  final DateTime creationTime;
  final int visits;
  final String content;
  final List<String> postscripts;
  final int likes;
  final List<String> tags;

  @override
  List<Object?> get props => [
        author,
        authorAvatar,
        node,
        title,
        creationTime,
        visits,
        content,
        postscripts,
        likes,
        tags
      ];
}

class Comment extends Equatable {
  const Comment({
    required this.author,
    required this.authorAvatar,
    required this.replyTime,
    required this.isLike,
    required this.likes,
    required this.floors,
    required this.content,
  });
  final String author;
  final String authorAvatar;
  final DateTime replyTime;
  final bool isLike;
  final int likes;
  final int floors;
  final String content;

  @override
  List<Object?> get props =>
      [author, authorAvatar, replyTime, isLike, floors, content];
}
