import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

// Used for the Posts by the user
class LocalStore {
  static Future<void> writeValueString(
      {required String key, required String value}) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(key, value);
  }

  static Future<List<dynamic>?> getStringValue({required String key}) async {
    final prefs = await SharedPreferences.getInstance();

    final String? response = prefs.getString(key);

    if (response == null) return null;

    return json.decode(response);
  }
}
