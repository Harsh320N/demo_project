import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  SharedPreferences? prefs;

  init() async {
    prefs = await SharedPreferences.getInstance();
  }

  put(String key, List<String> value) {
    prefs!.setStringList(key, value);
  }

  getList(String key) {
    prefs!.getStringList(key) ?? [];
  }
}

AppPreference appPreference = AppPreference();