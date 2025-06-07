abstract class LocalStorageService {
  Future<void> setJwtToken(String token);
  Future<String?> getJwtToken();
  Future<void> clearAll();
}
