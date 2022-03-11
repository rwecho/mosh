import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:faker/faker.dart';
import 'package:mosh/widgets/avatar_button.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final faker = context.read<Faker>();
    final theme = Theme.of(context);
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AvatarButton(
            onTap: () {},
            avatarUrl: faker.image.image(random: true),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(faker.person.firstName()),
                Text(
                  "V2EX 第 ${faker.randomGenerator.integer(1000)} 号会员, 加入于 ${faker.date.dateTime()}",
                  style: theme.textTheme.caption,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
