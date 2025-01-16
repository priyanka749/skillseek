import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:skillseek/app/usecase/usecase.dart';
import 'package:skillseek/core/error/failure.dart';
import 'package:skillseek/features/auth/domain/entity/auth_entity.dart';
import 'package:skillseek/features/auth/domain/repository/auth_entity.dart';

class RegisterUserParams extends Equatable {
  final String username;
  final String email;
  final String phoneNumber;
  final String? address;
  final String password;
  final String confirmPassword;

  const RegisterUserParams({
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.password,
    required this.confirmPassword,
    required,
  });

  @override
  List<Object?> get props =>
      [username, email, phoneNumber, address, password, confirmPassword];
}

class RegisterUseCase implements UsecaseWithParams<void, RegisterUserParams> {
  final IAuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) {
    // Map RegisterUserParams to AuthEntity
    final authEntity = AuthEntity(
      username: params.username,
      email: params.email,
      phoneNumber: params.phoneNumber,
      address: params.address,
      password: params.password,
      confirmPassword: params.password,
    );
    return repository.register(authEntity);
  }
}
