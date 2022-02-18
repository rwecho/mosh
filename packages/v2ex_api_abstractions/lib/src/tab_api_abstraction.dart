import '../v2ex_api_abstractions.dart';

abstract class TabApiAbstraction {
  const TabApiAbstraction();

  List<Tab> getTabs();
}

abstract class TopicApiAbstraction {
  const TopicApiAbstraction();

  Future<List<Topic>> getTopics(Tab tab);
}
