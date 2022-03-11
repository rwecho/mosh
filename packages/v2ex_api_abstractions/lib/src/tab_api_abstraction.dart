import '../v2ex_api_abstractions.dart';

abstract class TabApiAbstraction {
  const TabApiAbstraction();
  List<Tab> getTabs();
}

abstract class TopicApiAbstraction {
  const TopicApiAbstraction();

  Future<List<Topic>> getTopics(Tab tab);

  Future<TopicDetail> getTopicDetail(Topic topic);

  Future<List<Comment>> getComments(Topic topic, int page);

  Future<void> addFavorites(Topic topic);

  Future<void> tweet(Topic topic);

  Future<void> share(Topic topic);

  Future<void> ignore(Topic topic);

  Future<void> thank(Topic topic);

  Future<void> thankComment(Comment comment);
  Future<void> quoteCommenter(Comment comment);
}

abstract class NodeApiAbstraction {}

abstract class UserApiAbstraction {}

abstract class NotificationApiAbstraction {}

abstract class SearchApiAbstraction {}

abstract class SettingsApiAbstraction {}
