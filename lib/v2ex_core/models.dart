class Profile {
  final String userName;
  final String phone;
  final String email;
  final int number;
  final String? website;
  final String? company;
  final String? companyTitle;
  final String? location;
  final String? tagline;
  final String? bio;

  const Profile(this.userName, this.phone, this.email, this.number,
      {this.website,
      this.company,
      this.companyTitle,
      this.location,
      this.tagline,
      this.bio});
}

class MyOverview {
  final String userName;
  final String avatar;
  final bool isLight;
  final int balance;
  final int favNodes;
  final int favTopics;
  final int favMembers;

  const MyOverview(this.userName, this.avatar, this.isLight, this.balance,
      this.favNodes, this.favTopics, this.favMembers);
}

class NodeLink {
  final String name;
  final String link;
  const NodeLink(this.name, this.link);
}

class MyNode {
  final String name;
  final String avatar;
  final int topicTotalCount;

  const MyNode(this.name, this.avatar, this.topicTotalCount);
}

class Reply {
  final int thanks;
  final String content;
  final String userName;
  final DateTime replyTime;
  final int number;
  const Reply(
      this.thanks, this.content, this.userName, this.replyTime, this.number);
}

class SignIn {
  final String nameOfUserName;
  final String nameOfPassword;
  final String nameOfCaptcha;
  final String once;

  const SignIn(
      this.nameOfUserName, this.nameOfPassword, this.nameOfCaptcha, this.once);

  get captcha => "/_captcha?once=$once";
}

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
      this.clicks);
}

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

class TopicTab {
  final String name;
  final String title;

  const TopicTab(this.name, this.title);
}
