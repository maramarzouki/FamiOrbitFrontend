import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  SecureStorage._();
  static final SecureStorage instance = SecureStorage._();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const _keyToken = 'auth_token';
  /// persist the JWT
  Future<void> writeToken(String token) =>
      _storage.write(key: _keyToken, value: token);

  /// read the JWT (or null if none)
  Future<String?> readToken() => _storage.read(key: _keyToken);

  /// delete the JWT (e.g. on logout)
  Future<void> deleteToken() => _storage.delete(key: _keyToken);
}
