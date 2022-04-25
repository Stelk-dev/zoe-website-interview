import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStore {
  static Future<void> writeValueString(
      {required String key, required String value}) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(key, value);
  }

  // Used for the Posts by the user
  static Future<List<dynamic>?> getStringValue({required String key}) async {
    final prefs = await SharedPreferences.getInstance();

    final String? response = prefs.getString(key);

    if (response == null) return null;

    return json.decode(response);
  }
}
