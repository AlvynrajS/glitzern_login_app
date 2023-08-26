import 'dart:convert';

import 'package:glitzern_login_app/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreference {
  static Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user', jsonEncode(user.toJson()));
  }

  static Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    var userData = prefs.getString('user');
    if (userData != null) {
      try {
        final userMap = jsonDecode(userData);
        return User.fromJson(userMap);
      } catch (e) {
        print('Error parsing user data: $e');
        return null;
      }
    }
    return null;
  }

  Future<bool> checkCredentials(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUsername = prefs.getString('username');
    String? storedPassword = prefs.getString('password');
    return username == storedUsername && password == storedPassword;
  }
}
