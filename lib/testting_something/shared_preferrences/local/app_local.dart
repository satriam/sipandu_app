import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static late SharedPreferences dbApp;
  static init() async {
    dbApp = await SharedPreferences.getInstance();
  }

  static setGuidline(bool value) {
    dbApp.setBool('guidline', value);
  }

  static bool? getGuidline() {
    print("ger");
    print(dbApp.getBool('guidline'));
    return dbApp.getBool('guidline');
  }
}
