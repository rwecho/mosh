import 'package:v2ex_api_abstractions/v2ex_api_abstractions.dart';
import 'package:faker/faker.dart';

class TabApi extends TabApiAbstraction {
  final Faker _faker;

  TabApi() : _faker = Faker() {}

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
