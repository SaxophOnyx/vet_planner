import 'package:shared_preferences/shared_preferences.dart';

class LocalDataProvider {
  final SharedPreferences _sharedPreferences;

  LocalDataProvider._({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  static Future<LocalDataProvider> createInstance() async {
    return LocalDataProvider._(
      sharedPreferences: await SharedPreferences.getInstance(),
    );
  }

  Future<void> write({
    required String key,
    required String value,
  }) async {
    await _sharedPreferences.setString(key, value);
  }

  Future<String?> read(String key) async {
    return _sharedPreferences.getString(key);
  }

  Future<void> delete(String key) async {
    await _sharedPreferences.remove(key);
  }

  Future<void> deleteAll() async {
    await _sharedPreferences.clear();
  }

  Future<bool> contains(String key) async {
    return _sharedPreferences.containsKey(key);
  }
}
