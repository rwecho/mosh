import 'dart:ui';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mosh/widgets/avatar_button.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final faker = context.read<Faker>();
    final theme = Theme.of(context);
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(faker.image.image(), fit: BoxFit.cover),
        ClipRRect(
          // Clip it cleanly.
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: theme.colorScheme.onPrimary.withOpacity(0.1),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AvatarButton(
                    onTap: () {},
                    avatarUrl: faker.image.image(random: true),
                  ),
                  Text(
                    faker.person.firstName(),
                    style: theme.textTheme.titleMedium,
                  ),
                  Text(
                    "V2EX 第 ${faker.randomGenerator.integer(1000)} 号会员, 加入于 ${faker.date.dateTime()}",
                    style: theme.textTheme.caption,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {}, child: Text("Following")),
                      SizedBox(
                        width: 8.0,
                      ),
                      ElevatedButton(onPressed: () {}, child: Text("Block")),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
