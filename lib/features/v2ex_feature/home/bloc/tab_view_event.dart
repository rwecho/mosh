part of 'tab_view_bloc.dart';

abstract class TabViewEvent extends Equatable {
  const TabViewEvent();

  @override
  List<Object?> get props => [];
}

class TabViewSubscriptionRequested extends TabViewEvent {
  const TabViewSubscriptionRequested();
}
