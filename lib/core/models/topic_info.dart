class TopicInfo {
  final int id;
  final String title;
  final String ownerAvatar;
  final String ownerUserName;

  final String nodeTitle;
  final String nodeName;
  final String votes;
  final int replies;
  final String latestReplyUserName;
  final String latestReplyTime;

  const TopicInfo(
      this.id,
      this.title,
      this.ownerAvatar,
      this.ownerUserName,
      this.nodeTitle,
      this.nodeName,
      this.votes,
      this.replies,
      this.latestReplyUserName,
      this.latestReplyTime);
}
