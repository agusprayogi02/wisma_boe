import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserSharedUtils {
  late final SharedPreferences _preferences;
  final String key = "user-key-broo";

  UserSharedUtils() {
    _init();
  }

  _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setUser(dynamic value) async {
    await _preferences.setString(key, jsonEncode(value));
  }

  bool check() => _preferences.containsKey(key);

  Future<dynamic> getUser() async {
    final shared = await SharedPreferences.getInstance();
    return check() ? jsonDecode(shared.getString(key)!) : null;
  }

  Future<void> remove() async {
    await _preferences.remove(key);
  }

  Future<void> clear() async {
    await _preferences.clear();
  }
}
