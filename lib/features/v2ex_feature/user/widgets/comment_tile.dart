import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:faker/faker.dart';

class CommentTile extends StatelessWidget {
  const CommentTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final faker = context.read<Faker>();
    return ListTile(
      title: Row(children: [
        Flexible(
            child: Text(
                "回复了 ${faker.person.firstName()} 创建的主题 › Apple › ${faker.lorem.sentence()}")),
        Text("${faker.randomGenerator.integer(100)}天前")
      ]),
      subtitle: Text(faker.lorem.sentence()),
    );
  }
}
