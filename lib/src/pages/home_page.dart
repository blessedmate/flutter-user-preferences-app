import 'package:flutter/material.dart';
import 'package:user_preferences_app/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User preferences'),
      ),
      drawer: const Menu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Secondary color:'),
          Divider(),
          Text('Gender:'),
          Divider(),
          Text('Username:'),
          Divider(),
        ],
      ),
    );
  }
}
