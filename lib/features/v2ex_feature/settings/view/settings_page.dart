import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_ui/settings_ui.dart';

import '../bloc/settings_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);
  static Route<void> route() {
    return MaterialPageRoute(
        fullscreenDialog: false,
        builder: (context) => BlocProvider(
            create: (context) => SettingsBloc(), child: const SettingsPage()));
  }

  @override
  Widget build(BuildContext context) {
    return _SettingsView();
  }
}

class _SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text("Settings"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('Section'),
            tiles: [
              SettingsTile(
                title: Text('Language'),
                value: Text('English'),
                trailing: Text('trailing'),
                leading: Icon(Icons.language),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile.switchTile(
                initialValue: true,
                title: Text('Use fingerprint'),
                leading: Icon(Icons.fingerprint),
                onToggle: (bool value) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
