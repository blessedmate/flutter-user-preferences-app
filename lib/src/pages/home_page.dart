import 'package:flutter/material.dart';
import 'package:user_preferences_app/src/shared_preferences/user_preferences.dart';
import 'package:user_preferences_app/src/widgets/menu_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final prefs = UserPreferences();

  @override
  Widget build(BuildContext context) {
    prefs.lastPage = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: const Text('User preferences'),
        centerTitle: true,
        backgroundColor: prefs.secondaryColor ? Colors.teal : Colors.blue,
      ),
      drawer: const Menu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Secondary color: ${prefs.secondaryColor}'),
          const Divider(),
          Text('Gender: ${prefs.gender}'),
          const Divider(),
          Text('Username:${prefs.username}'),
          const Divider(),
        ],
      ),
    );
  }
}
