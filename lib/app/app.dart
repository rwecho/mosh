import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mosh/features/features.dart';
import 'package:mosh/l10n/l10n.dart';
import 'package:todos_repository/todos_repository.dart';
import 'package:v2ex_api_abstractions/v2ex_api_abstractions.dart';

class App extends StatelessWidget {
  const App(
      {Key? key,
      required this.todosRepository,
      required this.tabApi,
      required this.topicApi})
      : super(key: key);

  final TodosRepository todosRepository;
  final TabApiAbstraction tabApi;
  final TopicApiAbstraction topicApi;

  @override
  Widget build(BuildContext context) {
    // DI widget to provider a repository to subtrees.
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<TodosRepository>(
            create: (context) => todosRepository),
        RepositoryProvider<TabApiAbstraction>(create: (context) => tabApi),
        RepositoryProvider<TopicApiAbstraction>(create: (context) => topicApi),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // The Mandy red, light theme.
      theme: FlexThemeData.light(scheme: FlexScheme.mandyRed),
      // The Mandy red, dark theme.
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
      // Use dark or light theme based on system setting.
      themeMode: ThemeMode.system,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}
