import 'package:shared_preferences/shared_preferences.dart';

import '../Model/login_model/login_model.dart';

class UserSharedUtils {
  late final SharedPreferences _preferences;
  final String key = "user-key-broo";

  UserSharedUtils._();

  static final instance = UserSharedUtils._();

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setUser(dynamic value) async {
    final model = LoginModel.fromMap(value);
    await _preferences.setString(key, model.toJson());
  }

  bool check() => _preferences.containsKey(key);

  Future<LoginModel?> getUser() async {
    final shared = await SharedPreferences.getInstance();
    return check() ? LoginModel.fromJson(shared.getString(key)!) : null;
  }

  Future<void> remove() async {
    await _preferences.remove(key);
  }

  Future<void> clear() async {
    await _preferences.clear();
  }
}
