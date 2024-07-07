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

  String? get token {
    return shared.get(_key);
  }

  void setToken(String token) {
    shared.store(_key, token);
  }

  SessionModel? get user {
    final u = shared.get(_userKey);
    return u == null ? null : SessionModel.fromMap(jsonDecode(u));
  }

  void setUser(SessionModel user) {
    shared.store(_key, jsonEncode(user.toMap()));
  }

  void deleteToken() {
    shared.remove(_key);
  }

  bool get hasSession => shared.hasData(_key);
}
