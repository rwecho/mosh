import 'package:faker/faker.dart';
import 'package:v2ex_api_abstractions/v2ex_api_abstractions.dart';

class TabApi extends TabApiAbstraction {
  TabApi() : _faker = Faker();
  final Faker _faker;

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
