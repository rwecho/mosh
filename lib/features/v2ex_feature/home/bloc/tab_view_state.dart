part of 'tab_view_bloc.dart';

enum TabViewStatus { inital, loading, success, failure }

class TabViewState extends Equatable {
  const TabViewState(
      {required this.tab,
      this.status = TabViewStatus.inital,
      this.topics = const []});
  final TabViewStatus status;
  final List<Topic> topics;
  final Tab tab;
  @override
  List<Object?> get props => [status, topics];

  TabViewState copyWith(
      {TabViewStatus Function()? status, List<Topic> Function()? topics}) {
    return TabViewState(
        tab: tab,
        status: status != null ? status() : this.status,
        topics: topics != null ? topics() : this.topics);
  }
}
