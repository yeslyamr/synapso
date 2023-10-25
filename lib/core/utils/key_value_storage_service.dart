import 'key_value_storage_base.dart';

/// A service class for providing methods to store and retrieve key-value data
/// from common or secure storage.
class KeyValueStorageService {

  static const _accessTokenKey = 'accessToken';
  static const _refreshTokenKey = 'refreshToken';
  static const _authPasswordKey = 'authPasswordKey';

  final _keyValueStorage = KeyValueStorageBase();

 
  Future<String?> getAccessToken() async {
    return await _keyValueStorage.getEncrypted(_accessTokenKey);
  }

  Future<String?> getRefreshToken() async {
    return await _keyValueStorage.getEncrypted(_refreshTokenKey);
  }

  Future<String?> getAuthPassword() async {
    return await _keyValueStorage.getEncrypted(_authPasswordKey);
  }

  void setAccessToken(String token) {
    _keyValueStorage.setEncrypted(_accessTokenKey, token);
  }

  void setRefreshToken(String token) {
    _keyValueStorage.setEncrypted(_refreshTokenKey, token);
  }

  void setAuthPassword(String password) {
    _keyValueStorage.setEncrypted(_authPasswordKey, password);
  }

  /// Resets the authentication. Even though these methods are asynchronous, we
  /// don't care about their completion which is why we don't use `await` and
  /// let them execute in the background.
  void resetKeys() {
    _keyValueStorage
      ..clearCommon()
      ..clearEncrypted();
  }
}
