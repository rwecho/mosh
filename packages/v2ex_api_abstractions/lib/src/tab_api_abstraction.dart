import 'models/tab.dart';

abstract class TabApiAbstraction {
  const TabApiAbstraction();

  List<Tab> getTabs();
}
