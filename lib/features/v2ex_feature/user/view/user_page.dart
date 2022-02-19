import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v2ex_api_abstractions/v2ex_api_abstractions.dart';

import '../bloc/user_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  static Route<void> route({required User user}) {
    return MaterialPageRoute(
        fullscreenDialog: false,
        builder: (context) => BlocProvider(
            create: (context) => UserBloc(user: user),
            child: const UserPage()));
  }

  @override
  Widget build(BuildContext context) {
    return _UserView();
  }
}

class _UserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          titleSpacing: 10.0,
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black54,
            ),
          ),
        ),
        body: const Center(child: Text("user")));
  }
}
