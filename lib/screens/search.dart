import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search>
    with AutomaticKeepAliveClientMixin<Search> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Center(child: Text('Search'));
  }

  @override
  bool get wantKeepAlive => true;
}
