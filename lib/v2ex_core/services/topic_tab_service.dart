import '../models/topic_tab.dart';

class TopicTabService {
  Iterable<TopicTab> getTopicTabs() sync* {
    yield const TopicTab("tech", "技术");
    yield const TopicTab("creation", "创意");
    yield const TopicTab("play", "好玩");
    yield const TopicTab("apple", "Apple");
    yield const TopicTab("jobs", "酷工作");
    yield const TopicTab("deals", "交易");
    yield const TopicTab("city", "城市");
    yield const TopicTab("qna", "问与答");
    yield const TopicTab("hot", "最热");
    yield const TopicTab("all", "全部");
    yield const TopicTab("r2", "R2");
    yield const TopicTab("nodes", "节点");
    yield const TopicTab("members", "关注");
  }
}
