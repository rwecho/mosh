import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v2ex_api_abstractions/v2ex_api_abstractions.dart' as models;

class HomeBottomTabs extends StatelessWidget {
  final List<models.Tab> tabs;

  final models.Tab? tab;

  final ValueChanged<models.Tab>? onTabChanged;

  const HomeBottomTabs(
      {Key? key, required this.tabs, required this.tab, this.onTabChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: 44,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: tabs.length,
            itemBuilder: (context1, index) {
              var tab = tabs[index];
              var isSelected = tab.title == this.tab?.title;
              return Ink(
                color: isSelected ? Colors.blue : Colors.transparent,
                child: TextButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(
                            isSelected ? Colors.white : Colors.blue)),
                    onPressed: () => {onTabChanged?.call(tab)},
                    child: Text(tab.title)),
              );
            }),
      ),
    );
  }
}
