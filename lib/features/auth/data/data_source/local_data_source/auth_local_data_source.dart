import 'dart:io';

import 'package:skillseek/core/network/hive_service.dart';
import 'package:skillseek/features/auth/data/data_source/auth_data_source.dart';
import 'package:skillseek/features/auth/data/model/auth_hive_model.dart';
import 'package:skillseek/features/auth/domain/entity/auth_entity.dart';

class AuthLocalDataSource implements IAuthDataSource {
  final HiveService _hiveService;

  AuthLocalDataSource(this._hiveService);

  // @override
  // Future<AuthEntity?> getCurrentUser() async {
  //   try {
  //     final AuthHiveModel? user = await _hiveService.getCurrentUser();
  //     if (user == null) {
  //       throw Exception("No user found");
  //     }
  //     return user.toEntity();
  //   } catch (e) {
  //     throw Exception("Failed to fetch current user: $e");
  //   }
  // }

  @override
  Future<void> register(AuthEntity user) async {
    try {
      final authHiveModel = AuthHiveModel.fromEntity(user);
      await _hiveService.register(authHiveModel);
    } catch (e) {
      throw Exception("Registration failed: ${e.toString()}");
    }
  }

  @override
  Future<String> userLogin(String username, String password) async {
    try {
      final user = await _hiveService.login(username, password);
      if (user != null) {
        return "Login successful";
      } else {
        return "Invalid credentials";
      }
    } catch (e) {
      return "Login failed: ${e.toString()}";
    }
  }

  @override
  Future<String> uploadProfilePicture(File file) async {
    // Placeholder: Implement file storage logic here
    return Future.value("Upload feature not implemented yet.");
  }
  
  @override
  Future<String> userlogin(String email, String password) {
    // TODO: implement userlogin
    throw UnimplementedError();
  }
}
