import 'package:dartz/dartz.dart';
import 'package:skillseek/core/error/failure.dart';
import 'package:skillseek/features/auth/data/data_source/remote_data_source/auth_remote_datasource.dart';
import 'package:skillseek/features/auth/domain/entity/auth_entity.dart';
import 'package:skillseek/features/auth/domain/repository/auth_repository.dart';

class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRemoteRepository(this._authRemoteDataSource);

  @override
  Future<Either<Failure, void>> register(AuthEntity user) async {
    try {
      await _authRemoteDataSource.register(user);
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> userlogin(
      String username, String password) async {
    try {
      final token = await _authRemoteDataSource.userlogin(username, password);
      return Right(token);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  // @override
  // Future<Either<Failure, String>> uploadProfilePicture(File file) async {
  //   try {
  //     final imageName = await _authRemoteDataSource.uploadProfilePicture(file);
  //     return Right(imageName);
  //   } catch (e) {
  //     return Left(ApiFailure(message: e.toString()));
  //   }
  // }

  @override
  Future<Either<Failure, bool>> verifyOtp(String email, String otp) async {
    try {
      final result = await _authRemoteDataSource.verifyOtp(email, otp);
      return Right(result);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
