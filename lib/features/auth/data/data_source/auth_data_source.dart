import 'package:skillseek/features/auth/domain/entity/auth_entity.dart';

abstract interface class IAuthDataSource {
  Future<void> register(AuthEntity user);

  Future<String> userlogin(String email, String password);

  // Future<AuthEntity> getCurrentUser();

  // Future<String> uploadProfilePicture(File file);
}
