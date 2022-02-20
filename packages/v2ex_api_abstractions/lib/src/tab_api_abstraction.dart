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
}
