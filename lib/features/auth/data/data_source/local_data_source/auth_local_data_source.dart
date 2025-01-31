import 'dart:io';

import 'package:skillseek/core/network/hive_service.dart';
import 'package:skillseek/features/auth/data/data_source/auth_data_source.dart';
import 'package:skillseek/features/auth/data/model/auth_hive_model.dart';
import 'package:skillseek/features/auth/domain/entity/auth_entity.dart';

class AuthLocalDataSource implements IAuthDataSource {
  final HiveService _hiveService;
  AuthLocalDataSource(this._hiveService);

  @override
  Future<AuthEntity> getCurrentUser() async {
    // Simulated current user, replace with actual implementation.
    return const AuthEntity(
      userId: "1",
      username: "",
      email: "",
      phoneNumber: "",
      address: "",
      role: "",
      skill: "",
      password: "",
      confirmPassword: "",
      imageName: "",
    );
  }

  @override
  Future<void> register(AuthEntity user) async {
    try {
      final authHiveModel = AuthHiveModel.fromEntity(user);
      await _hiveService
          .register(authHiveModel); // Ensure this method exists in HiveService
    } catch (e) {
      throw Exception("Registration failed: $e");
    }
  }

  @override
  Future<String> userlogin(String username, String password) async {
    try {
      final user = await _hiveService.login(
          username, password); // Corrected "logi" to "login"
      return "login success";
    } catch (e) {
      return "login failed: $e";
    }
  }

  @override
  Future<String> uploadProfilePicture(File file) {
    throw UnimplementedError();
  }
}
