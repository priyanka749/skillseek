import 'package:skillseek/features/auth/domain/entity/auth_entity.dart';

abstract interface class IAuthDataSource {
  Future<void> register(AuthEntity user);

  Future<String> userlogin(String username, String password);

  Future<AuthEntity> getCurrentUser();
}
