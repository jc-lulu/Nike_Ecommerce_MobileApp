import 'package:shared_preferences/shared_preferences.dart';

class AccountPreferences {
  static const _keyIsLoggedIn = 'isLoggedIn';
  static const _keyEmail = 'email';

  Future<void> saveAccountData({required String email}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsLoggedIn, true);
    await prefs.setString(_keyEmail, email);
  }

  Future<Map<String, dynamic>> loadAccountData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool(_keyIsLoggedIn) ?? false;
    String email = prefs.getString(_keyEmail) ?? '';
    return {
      'isLoggedIn': isLoggedIn,
      'email': email,
    };
  }

  Future<void> clearAccountData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyIsLoggedIn);
    await prefs.remove(_keyEmail);
  }
}
