import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:skillseek/app/usecase/usecase.dart';
import 'package:skillseek/core/error/failure.dart';
import 'package:skillseek/features/auth/domain/entity/auth_entity.dart';
import 'package:skillseek/features/auth/domain/repository/auth_repository.dart';

class RegisterUserParams extends Equatable {
  final String name;
  final String email;
  final String phoneNumber;
  final String location;
  final String skill;
  final String password;
  final String image;

  const RegisterUserParams({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.location,
    required this.skill,
    required this.password,
    required this.image,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        phoneNumber,
        location,
        skill,
        image,
        password,
      ];
}

class RegisterUseCase implements UsecaseWithParams<void, RegisterUserParams> {
  final IAuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) {
    // Map RegisterUserParams to AuthEntity
    final authEntity = AuthEntity(
      name: params.name,
      email: params.email,
      phoneNumber: params.phoneNumber,
      location: params.location,
      skill: params.skill,
      password: params.password,
      image: params.image,
    );
    return repository.register(authEntity);
  }
}
