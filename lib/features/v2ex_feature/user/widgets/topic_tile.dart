import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:faker/faker.dart';
import 'package:mosh/utils/datetime_extensions.dart';

class TopicTile extends StatelessWidget {
  const TopicTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final faker = context.read<Faker>();
    return ListTile(
      title: Text(faker.lorem.sentence()),
      subtitle: Row(
        children: [
          TextButton(onPressed: () {}, child: Text(faker.sport.name())),
          SizedBox(
            width: 8.0,
          ),
          TextButton(onPressed: () {}, child: Text(faker.person.firstName())),
          SizedBox(
            width: 8.0,
          ),
          TextButton(
              onPressed: () {},
              child: Text(faker.date.dateTime().humanReadable())),
        ],
      ),
    );
  }
}
