import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:skillseek/app/usecase/usecase.dart';
import 'package:skillseek/core/error/failure.dart';
import 'package:skillseek/features/auth/domain/entity/auth_entity.dart';
import 'package:skillseek/features/auth/domain/repository/auth_repository.dart';

class RegisterUserParams extends Equatable {
  final String username;
  final String email;
  final String phoneNumber;
  final String? address;
  final String role;
  final String skill;
  final String password;
  final String confirmPassword;
  final String imageName;

  const RegisterUserParams({
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.role,
    required this.skill,
    required this.password,
    required this.confirmPassword,
    required this.imageName,
  });

  @override
  List<Object?> get props => [
        username,
        email,
        phoneNumber,
        address,
        role,
        skill,
        imageName,
        password,
        confirmPassword
      ];
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
      role: params.role,
      skill: params.skill,
      password: params.password,
      confirmPassword: params.password,
      imageName: params.imageName,
    );
    return repository.register(authEntity);
  }
}
