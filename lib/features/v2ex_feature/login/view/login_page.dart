import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mosh/features/v2ex_feature/login/widgets/login_form.dart';

import '../cubit/login_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
        fullscreenDialog: false,
        builder: (context) => BlocProvider(
            create: (context) => LoginCubit(), child: const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return _LoginView();
  }
}

class _LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text("Login"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints.loose(Size.fromHeight(60.0)),
          child: Stack(
            fit: StackFit.loose,
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: const [
              Positioned(
                left: 16,
                right: 16,
                top: -250,
                child: Card(
                  child: LoginForm(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
