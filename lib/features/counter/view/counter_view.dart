import 'dart:async';

import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mosh/features/counter/cubit/counter_cubit.dart';

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: Center(child: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return TestView(number: state);
        },
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
              key: const Key('counterView_incremenmt_floatingActionButton'),
              child: const Icon(Icons.add),
              onPressed: () => context.read<CounterCubit>().increment()),
          const SizedBox(
            height: 8,
          ),
          FloatingActionButton(
              key: const Key('counterView_decrement_floationtActionButton'),
              child: const Icon(Icons.remove),
              onPressed: () => context.read<CounterCubit>().decrement())
        ],
      ),
    );
  }
}

class TestViewBloc extends Bloc<TestViewEvent, TestViewState> {
  TestViewBloc() : super(TestViewState(0)) {
    on<ChangeNumberTestViewEvent>(_onChangeNumberTestViewEvent);
  }

  FutureOr<void> _onChangeNumberTestViewEvent(
      ChangeNumberTestViewEvent event, Emitter<TestViewState> emit) {
    emit(state.copyWith(number: event.payload));
  }
}

class TestViewEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeNumberTestViewEvent extends TestViewEvent {
  ChangeNumberTestViewEvent(this.payload);
  final int payload;

  @override
  List<Object?> get props => [payload];
}

class TestViewState extends Equatable {
  const TestViewState(this.number);
  @override
  List<Object?> get props => [number];

  final int number;

  TestViewState copyWith({int? number}) {
    return TestViewState(number ?? this.number);
  }
}

class TestView extends StatelessWidget {
  final int number;

  const TestView({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TestViewBloc()..add(ChangeNumberTestViewEvent(100)),
        child: _TestView());
  }
}

class _TestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestViewBloc, TestViewState>(builder: (context, state) {
      if (state.number > 0) {
        return Container(
          child: Text(" test ${state.number}"),
        );
      } else {
        return Column(
          children: [
            Text("wrong"),
            // ElevatedButton(onPressed: onPressed)
          ],
        );
      }
    });
  }
}
