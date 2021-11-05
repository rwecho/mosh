import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>
    with AutomaticKeepAliveClientMixin<Profile> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return const Center(
      child: Text("Profile"),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
