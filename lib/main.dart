import 'package:flutter/material.dart';
import 'package:user_preferences_app/src/pages/home_page.dart';
import 'package:user_preferences_app/src/pages/settings_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferences',
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (BuildContext context) => const HomePage(),
        SettingsPage.routeName: (BuildContext context) => const SettingsPage(),
      },
    );
  }
}
