import 'package:shared_preferences/shared_preferences.dart';

import '../model/login_model/login_model.dart';

class UserSharedUtils {
  late final SharedPreferences _preferences;
  final String key = "user-key-broo";

  UserSharedUtils._();

  static final instance = UserSharedUtils._();

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setUser(Map<String, Object?> value) async {
    final model = LoginModel.fromMap(value);
    await _preferences.setString(key, model.toJson());
  }

  bool check() => _preferences.containsKey(key);

  LoginModel? getUser() {
    return check() ? LoginModel.fromJson(_preferences.getString(key)!) : null;
  }

  Future<void> remove() async {
    await _preferences.remove(key);
  }
}
