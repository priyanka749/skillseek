import 'package:skillseek/features/auth/domain/entity/auth_entity.dart';

abstract interface class IAuthDataSource {
  Future<void> register(AuthEntity User);

  Future<String> userlogin(String Username, String password);

  Future<AuthEntity> getCurrentUser();
}
