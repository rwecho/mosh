import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mosh/widgets/avatar_button.dart';
import 'package:faker/faker.dart';

class TopicTile extends StatelessWidget {
  const TopicTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final faker = context.read<Faker>();
    return ListTile(
      leading: AvatarButton(
        avatarUrl: faker.image.image(),
        onTap: () {},
      ),
      title: Text(
        faker.lorem.sentence(),
      ),
      subtitle: Row(
        children: [
          Text(faker.person.firstName()),
          Text(faker.person.lastName()),
          Text("${faker.randomGenerator.integer(100)} views"),
        ],
      ),
      trailing: OutlinedButton(
        onPressed: () {},
        child: Text(
          faker.randomGenerator.integer(100).toString(),
        ),
      ),
    );
  }
}
