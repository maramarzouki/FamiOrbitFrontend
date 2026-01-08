import 'package:jwt_decode/jwt_decode.dart';
import 'package:fami_orbit/core/services/secure_storage.dart';

class AuthService {
  AuthService._();
  static final AuthService instance = AuthService._();

  final _storage = SecureStorage.instance;

  Future<void> saveToken(String token) => _storage.writeToken(token);

  Future<String?> get token => _storage.readToken();

  Future<void> clearToken() => _storage.deleteToken();

  /// decode and return the user‑id claim
  Future<String> get userId async {
    final t = await token;
    if (t == null) throw Exception("No valid token");
    final Map<String, dynamic> claims = Jwt.parseJwt(t);
    final idStr = claims['_id']?.toString();
    if (idStr == null || idStr.isEmpty) {
      throw Exception("No valid user ID in token");
    }
    return idStr;
  }

  /// decode and return the email claim
  Future<String?> get email async {
    final t = await token;
    if (t == null) return null;
    final Map<String, dynamic> claims = Jwt.parseJwt(t);
    return claims['email'] as String?;
  }

  /// whether we currently have a valid token
  Future<bool> get isLoggedIn async => (await token) != null;
}
