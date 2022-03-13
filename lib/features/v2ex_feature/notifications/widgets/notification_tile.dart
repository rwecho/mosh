import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mosh/widgets/avatar_button.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final faker = context.read<Faker>();
    return ListTile(
      leading: AvatarButton(
        avatarUrl: faker.image.image(),
        onTap: () {},
      ),
      title: Text(
        faker.lorem.sentence(),
      ),
      subtitle: Column(
        children: [
          Text(
            faker.lorem.sentence(),
          ),
          Row(
            children: [
              Spacer(),
              Text("${faker.randomGenerator.integer(100)} days ago")
            ],
          )
        ],
      ),
    );
  }
}
