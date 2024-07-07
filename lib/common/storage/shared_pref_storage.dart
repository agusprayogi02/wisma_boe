import 'package:native_storage/native_storage.dart';

abstract class SharedPrefStorageInterface {
  final Map<String, String> collections;

  const SharedPrefStorageInterface({
    this.collections = const <String, String>{},
  });

  bool hasData(String key);
  String? get(String key);
  void store(String key, String value);
  void remove(String key);
  void reset();
}

class SharedPreferenceStorage extends SharedPrefStorageInterface {
  late final NativeSecureStorage storage;

  SharedPreferenceStorage()
      : super(
          collections: <String, String>{},
        ) {
    storage = NativeStorage().secure;
  }

  @override
  String? get(String key) {
    try {
      return storage.read(key);
    } catch (e) {
      return collections[key];
    }
  }

  @override
  void remove(String key) {
    try {
      storage.delete(key);
      collections.remove(key);
    } catch (error) {
      rethrow;
    }
  }

  @override
  void reset() {
    try {
      storage.clear();
      collections.clear();
    } catch (error) {
      rethrow;
    }
  }

  @override
  void store(String key, String value) {
    try {
      storage.write(key, value);
      collections[key] = value;
    } catch (error) {
      rethrow;
    }
  }

  @override
  bool hasData(String key) {
    try {
      return storage.read(key) != null;
    } catch (e) {
      return collections.containsKey(key);
    }
  }
}
