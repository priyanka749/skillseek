import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:skillseek/core/error/failure.dart';
import 'package:skillseek/features/auth/data/data_source/local_data_source/auth_local_data_source.dart';
import 'package:skillseek/features/auth/domain/entity/auth_entity.dart';
import 'package:skillseek/features/auth/domain/repository/auth_repository.dart';

class AuthLocalRepository implements IAuthRepository {
  final AuthLocalDataSource _authLocalDataSource;

  AuthLocalRepository(this._authLocalDataSource);

  // @override
  // Future<Either<Failure, AuthEntity>> getCurrentUser() async {
  //   try {
  //     final currentUser = await _authLocalDataSource.getCurrentUser();
  //     return Right(currentUser);
  //   } catch (e) {
  //     return Left(LocalDatabaseFailure(message: e.toString()));
  //   }
  // }

  @override
  Future<Either<Failure, String>> userlogin(
    String email,
    String password,
  ) async {
    try {
      final token = await _authLocalDataSource.userlogin(email, password);
      return Right(token);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> register(AuthEntity user) async {
    try {
      return Right(_authLocalDataSource.register(user));
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) {
    // TODO: implement uploadProfilePicture
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AuthEntity>> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> verifyOtp(String email, String otp) {
    // TODO: implement verifyOtp
    throw UnimplementedError();
  }
}
