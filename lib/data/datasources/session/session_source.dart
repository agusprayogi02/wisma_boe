import 'dart:convert';

import 'package:next_starter/data/models/auth/session_model.dart';

import '../../../common/storage/shared_pref_storage.dart';

class SessionSource {
  final SharedPrefStorageInterface shared;
  static const String _key = 'token-8hfgae3';
  static const String _userKey = 'uskafmka9432e2';

  SessionSource({
    required this.shared,
  });

  Future<String?> get token async {
    return await shared.get(_key);
  }

  Future<void> setToken(String token) async {
    await shared.store(_key, token);
  }

  Future<SessionModel?> get user async {
    final u = await shared.get(_userKey);
    return u == null ? null : SessionModel.fromMap(jsonDecode(u));
  }

  Future<void> setUser(SessionModel user) async {
    await shared.store(_key, jsonEncode(user.toMap()));
  }

  Future<void> deleteToken() async {
    await shared.remove(_key);
  }

  Future<bool> get hasSession async => await shared.hasData(_key);
}
