import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mosh/features/v2ex_feature/about/about.dart';
import 'package:mosh/features/v2ex_feature/favourites/favourites.dart';
import 'package:mosh/features/v2ex_feature/following/following.dart';
import 'package:mosh/features/v2ex_feature/hottest/hottest.dart';
import 'package:mosh/features/v2ex_feature/new_topic/new_topic.dart';
import 'package:mosh/features/v2ex_feature/nodes/nodes.dart';
import 'package:mosh/features/v2ex_feature/notifications/notifications.dart';
import 'package:mosh/features/v2ex_feature/recent/recent.dart';
import 'package:mosh/features/v2ex_feature/search/search.dart';
import 'package:mosh/features/v2ex_feature/settings/settings.dart';

class ModalMenu extends StatelessWidget {
  const ModalMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      child: const Icon(Icons.person),
                      backgroundColor: Theme.of(context).colorScheme.surface,
                    ),
                    SizedBox(width: 16),
                    Text("rwecho"),
                    Spacer(),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.check_outlined))
                  ],
                ),
              ),
              Divider(),
              ListTile(
                title: const Text("Hosttest"),
                leading: Icon(Icons.hourglass_full_sharp),
                onTap: () {
                  Navigator.of(context).push(HottestPage.route());
                },
              ),
              ListTile(
                title: const Text("Recent"),
                leading: Icon(Icons.place_sharp),
                onTap: () {
                  Navigator.of(context).push(RecentPage.route());
                },
              ),
              ListTile(
                title: const Text("Nodes"),
                leading: Icon(Icons.place_sharp),
                onTap: () {
                  Navigator.of(context).push(NodesPage.route());
                },
              ),
              ListTile(
                title: const Text("Search"),
                leading: Icon(Icons.place_sharp),
                onTap: () {
                  Navigator.of(context).push(SearchPage.route());
                },
              ),
              Divider(),
              ListTile(
                title: const Text("Notifications"),
                leading: Icon(Icons.place_sharp),
                onTap: () {
                  Navigator.of(context).push(NotificationsPage.route());
                },
              ),
              ListTile(
                title: const Text("Favourites"),
                leading: Icon(Icons.place_sharp),
                onTap: () {
                  Navigator.of(context).push(FavouritesPage.route());
                },
              ),
              ListTile(
                title: const Text("Following"),
                leading: Icon(Icons.place_sharp),
                onTap: () {
                  Navigator.of(context).push(FollowingPage.route());
                },
              ),
              ListTile(
                title: const Text("New Topic"),
                leading: Icon(Icons.place_sharp),
                onTap: () {
                  Navigator.of(context).push(NewTopicPage.route());
                },
              ),
              Divider(),
              ListTile(
                title: const Text("Settings"),
                leading: Icon(Icons.place_sharp),
                onTap: () {
                  Navigator.of(context).push(SettingsPage.route());
                },
              ),
              ListTile(
                title: const Text("About"),
                leading: Icon(Icons.place_sharp),
                onTap: () {
                  Navigator.of(context).push(AboutPage.route());
                },
              ),
            ],
          )),
    );
  }
}
