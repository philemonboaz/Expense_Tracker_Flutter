import 'package:expense_tracker/core/storage/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsStorage implements LocalStorageService {
  @override
  Future<String?> getJwtToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('jwt_token');
    } catch (e) {}
    return null;
  }

  @override
  Future<void> setJwtToken(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('jwt_token', token);
    } catch (e) {}
  }

  @override
  Future<void> clearAll() {
    throw UnimplementedError();
  }
}
