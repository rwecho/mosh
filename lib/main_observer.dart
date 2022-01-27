import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';

class MainObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('${bloc.runtimeType} $change');
  }
}
