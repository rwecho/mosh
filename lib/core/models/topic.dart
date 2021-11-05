import 'package:mosh/core/models/my_node.dart';

import 'reply.dart';

class Topic {
  final int id;
  final String nodeName;
  final String nodeTitle;
  final String content;
  final List<String> subtles;
  final String title;
  final String userName;
  final String avatar;
  final String latestCreationTime;
  final int clicks;
  final PagedResult<Reply> replies;

  const Topic(
      this.id,
      this.nodeName,
      this.nodeTitle,
      this.content,
      this.subtles,
      this.title,
      this.userName,
      this.avatar,
      this.latestCreationTime,
      this.clicks,
      this.replies);
}
