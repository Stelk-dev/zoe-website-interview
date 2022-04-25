import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStore {
  static Future<void> writeValueString(
      {required String key, required String value}) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(key, value);
  }

  static Future<void> writeValueBool(
      {required String key, required bool value}) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(key, value);
  }

  // Used for the Posts List<Map>
  static Future<String> getStringValue({required String key}) async {
    final prefs = await SharedPreferences.getInstance();

    final String? response = prefs.getString(key);

    if (response == null) return "";

    return jsonDecode(response);
  }

  // Used for the Dark Mode value
  static Future<bool?> getBoolValue({required String key}) async {
    final prefs = await SharedPreferences.getInstance();

    final bool? response = prefs.getBool(key);

    return response;
  }
}
