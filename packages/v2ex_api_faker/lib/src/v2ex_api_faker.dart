import 'package:faker/faker.dart';
import 'package:v2ex_api_abstractions/v2ex_api_abstractions.dart';

class TabApi extends TabApiAbstraction with AbstractionBase {
  TabApi();

  @override
  List<Tab> getTabs() {
    final number = _faker.randomGenerator.integer(10, min: 5);
    final tabs = <Tab>[];
    for (var i = 0; i < number; i++) {
      tabs.add(Tab(title: _faker.food.restaurant()));
    }
    return tabs;
  }
}

class AbstractionBase {
  final Faker _faker = Faker();
}

class TopicApi extends TopicApiAbstraction with AbstractionBase {
  @override
  Future<List<Topic>> getTopics(Tab tab) async {
    final number = _faker.randomGenerator.integer(200, min: 10);

    await Future<void>.delayed(const Duration(seconds: 2));
    final topics = <Topic>[];
    for (var i = 0; i < number; i++) {
      topics.add(
        Topic(
          title: _faker.lorem.sentence(),
          group: _faker.sport.name(),
          author: _faker.person.name(),
          authorAvatar: _faker.image.image(random: true),
          latestReplyTime: _faker.date.dateTime(),
          latestReplyUser: _faker.person.name(),
          replyCount: _faker.randomGenerator.integer(200),
        ),
      );
    }

    return topics;
  }
}
