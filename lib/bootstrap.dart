import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:mosh/app/app.dart';
import 'package:mosh/app/app_bloc_observer.dart';
import 'package:todos_api/todos_api.dart';
import 'package:todos_repository/todos_repository.dart';
import 'package:v2ex_api_faker/v2ex_api_faker.dart';

void bootstrap({required TodosApi todosApi}) {
  // global error catcher
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final todosRepository = TodosRepository(todosApi: todosApi);
  final tabApi = TabApi();
  runZonedGuarded(
    () async {
      await BlocOverrides.runZoned(
        () async => runApp(
          App(todosRepository: todosRepository, tabApi: tabApi),
        ),
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
