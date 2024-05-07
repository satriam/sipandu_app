import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserLocalStorage {
  static late SharedPreferences dbUser;
  static init() async {
    dbUser = await SharedPreferences.getInstance();
  }

  static setIdUser(String value) {
    dbUser.setString('idUser', value);
  }

  static setUser(Map value) {
    dbUser.setString('user', jsonEncode(value));
  }

  static String? getIdUser() {
    return dbUser.getString('idUser');
  }

  static Map? getUser() {
    var jsonString = dbUser.getString('user');
    if (jsonString != null) {
      return jsonDecode(jsonString);
    }
    return null;
  }

  static String? getSupportText() {
    var jsonString = dbUser.getString('user');
    if (jsonString != null) {
      var json = jsonDecode(jsonString);
      return json['support']['text'];
    }
    return null;
  }

  static clearDbUser() async {
    await dbUser.remove('idUser');
    await dbUser.remove('user');
  }
}
