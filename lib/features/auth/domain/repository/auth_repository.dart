import 'package:dartz/dartz.dart';
import 'package:skillseek/core/error/failure.dart';
import 'package:skillseek/features/auth/domain/entity/auth_entity.dart';

abstract interface class IAuthRepository {
  Future<Either<Failure, void>> register(AuthEntity user);

  Future<Either<Failure, String>> userlogin(String username, String password);

  Future<Either<Failure, AuthEntity>> getCurrentUser();
  // Future<Either<Failure, String>> uploadProfilePicture(File file);
}
