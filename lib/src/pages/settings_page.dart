import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const String routeName = 'settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secondaryColor = true;
  int _gender = 1;
  String _name = 'John';

  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    loadPreferences();
    _textController = TextEditingController(text: _name);
  }

  loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _gender = prefs.getInt('gender')!;
    setState(() {});
  }

  _setSelectedRadio(int? value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt('gender', _gender);

    _gender = value ?? 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Preferences'),
        ),
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
              value: _secondaryColor,
              title: const Text('Secondary color'),
              onChanged: (val) {
                setState(() {
                  _secondaryColor = val;
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
                onChanged: (val) {},
              ),
            ),
          ],
        ));
  }
}
