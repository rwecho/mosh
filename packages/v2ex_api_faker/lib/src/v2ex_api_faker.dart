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
          node: _faker.sport.name(),
          author: _faker.person.name(),
          authorAvatar: _faker.image.image(random: true),
          latestReplyTime: _faker.date.dateTime(minYear: 2014, maxYear: 2022),
          latestReplyUser: _faker.person.name(),
          replyCount: _faker.randomGenerator.integer(200),
        ),
      );
    }

    return topics;
  }

  @override
  Future<TopicDetail> getTopicDetail(Topic topic) async {
    return TopicDetail(
      author: topic.author,
      authorAvatar: topic.authorAvatar,
      node: topic.node,
      title: topic.title,
      creationTime: _faker.date.dateTime(minYear: 2014, maxYear: 2022),
      visits: _faker.randomGenerator.integer(200),
      content: _faker.lorem.sentences(5).join('\r\n'),
      postscripts: _faker.randomGenerator
          .integer(3)
          .fromZero()
          .map((e) => _faker.lorem.sentence())
          .toList(),
      likes: _faker.randomGenerator.integer(100),
      tags: _faker.randomGenerator
          .integer(5)
          .fromZero()
          .map((e) => _faker.sport.name())
          .toList(),
    );
  }

  @override
  Future<List<Comment>> getComments(Topic topic, int page) async {
    final number = _faker.randomGenerator.integer(20);
    final comments = <Comment>[];
    for (var i = 0; i < number; i++) {
      comments.add(
        Comment(
          author: _faker.person.firstName(),
          authorAvatar: _faker.image.image(random: true),
          replyTime: _faker.date.dateTime(minYear: 2014, maxYear: 2022),
          likes: _faker.randomGenerator.integer(100),
          isLike: _faker.randomGenerator.boolean(),
          floors: i,
          content: _faker.lorem.sentence(),
        ),
      );
    }
    return comments;
  }

  @override
  Future<void> addFavorites(Topic topic) {
    // TODO: implement addFavorites
    throw UnimplementedError();
  }

  @override
  Future<void> ignore(Topic topic) {
    // TODO: implement ignore
    throw UnimplementedError();
  }

  @override
  Future<void> share(Topic topic) {
    // TODO: implement share
    throw UnimplementedError();
  }

  @override
  Future<void> thank(Topic topic) {
    // TODO: implement thank
    throw UnimplementedError();
  }

  @override
  Future<void> tweet(Topic topic) {
    // TODO: implement tweet
    throw UnimplementedError();
  }
}
