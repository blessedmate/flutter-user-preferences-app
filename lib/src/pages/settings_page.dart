import 'package:flutter/material.dart';
import 'package:user_preferences_app/src/shared_preferences/user_preferences.dart';
import 'package:user_preferences_app/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const String routeName = 'settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool? _secondaryColor;
  int? _gender;

  late TextEditingController _textController;

  final prefs = UserPreferences();

  @override
  void initState() {
    super.initState();
    _gender = prefs.gender;
    _secondaryColor = prefs.secondaryColor;
    _textController = TextEditingController(text: prefs.username);
    prefs.lastPage = SettingsPage.routeName;
  }

  _setSelectedRadio(int? value) {
    prefs.gender = value!;
    _gender = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Preferences'),
          centerTitle: true,
          backgroundColor: prefs.secondaryColor ? Colors.teal : Colors.blue,
        ),
        drawer: const Menu(),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              child: const Text(
                'Settings',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(),
            SwitchListTile(
              value: _secondaryColor!,
              title: const Text('Secondary color'),
              onChanged: (val) {
                setState(() {
                  _secondaryColor = val;
                  prefs.secondaryColor = val;
                });
              },
            ),
            RadioListTile(
              value: 1,
              groupValue: _gender,
              title: const Text('Male'),
              onChanged: _setSelectedRadio,
            ),
            RadioListTile(
              value: 2,
              groupValue: _gender,
              title: const Text('Female'),
              onChanged: _setSelectedRadio,
            ),
            const Divider(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  helperText: 'Name of phone user',
                ),
                onChanged: (val) {
                  prefs.username = val;
                },
              ),
            ),
          ],
        ));
  }
}
