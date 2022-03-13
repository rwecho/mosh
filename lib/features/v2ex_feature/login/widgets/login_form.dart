import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          "V2ex",
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          "Please login your account",
          style: theme.textTheme.caption,
        ),
        const SizedBox(
          height: 8.0,
        ),
        TextFormField(
          decoration: const InputDecoration(
            suffix: const Icon(FontAwesomeIcons.envelope),
            border: UnderlineInputBorder(),
            labelText: 'Enter your username',
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            suffix: IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.eyeSlash,
              ),
            ),
            labelText: 'Enter your username',
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {},
              child: Text("forget password?"),
            )
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        OutlinedButton(
          onPressed: () {},
          child: Text("Login"),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text("Or login with social media account"),
        const SizedBox(
          height: 8.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.google, color: Colors.blue),
            ),
          ],
        )
      ],
    );
  }
}
