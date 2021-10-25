import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  // Singleton Pattern
  static final UserPreferences _instance = UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }
  UserPreferences._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Getters and Setters

  int get gender {
    return _prefs.getInt('gender') ?? 1;
  }

  set gender(int val) {
    _prefs.setInt('gender', val);
  }

  bool get secondaryColor {
    return _prefs.getBool('secondaryColor') ?? false;
  }

  set secondaryColor(bool val) {
    _prefs.setBool('secondaryColor', val);
  }

  String get username {
    return _prefs.getString('username') ?? ' ';
  }

  set username(String val) {
    _prefs.setString('username', val);
  }

  String get lastPage {
    return _prefs.getString('lastPage') ?? 'home';
  }

  set lastPage(String val) {
    _prefs.setString('lastPage', val);
  }
}
