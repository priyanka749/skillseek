import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skillseek/core/error/failure.dart';

class TokenSharedPrefs {
  final SharedPreferences _sharedPreferences;

  TokenSharedPrefs(this._sharedPreferences);

  /// ✅ Save Token
  Future<Either<Failure, void>> saveToken(String token) async {
    try {
      await _sharedPreferences.setString('token', token);
      return const Right(null);
    } catch (e) {
      return Left(SharedPrefsFailure(message: e.toString()));
    }
  }

  /// ✅ Retrieve Token
  Future<Either<Failure, String>> getToken() async {
    try {
      final token = _sharedPreferences.getString('token');
      return Right(token ?? '');
    } catch (e) {
      return Left(SharedPrefsFailure(message: e.toString()));
    }
  }

  /// ✅ Save Logged-in User ID
  Future<Either<Failure, void>> saveUserId(String userId) async {
    try {
      await _sharedPreferences.setString('userId', userId);
      return const Right(null);
    } catch (e) {
      return Left(SharedPrefsFailure(message: e.toString()));
    }
  }

  /// ✅ Retrieve Logged-in User ID
  String? getUserId() {
    try {
      return _sharedPreferences
          .getString('userId'); // ✅ Returns `null` if not found
    } catch (e) {
      return null; // ✅ Fallback for error cases
    }
  }

  /// ✅ Clear All Data (Logout)
  Future<Either<Failure, void>> clearUserData() async {
    try {
      await _sharedPreferences.remove('token');
      await _sharedPreferences.remove('userId');
      return const Right(null);
    } catch (e) {
      return Left(SharedPrefsFailure(message: e.toString()));
    }
  }
}
