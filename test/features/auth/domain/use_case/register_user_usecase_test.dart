import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skillseek/core/error/failure.dart';
import 'package:skillseek/features/auth/domain/entity/auth_entity.dart';
import 'package:skillseek/features/auth/domain/use_case/register_user_usecase.dart';

import 'auth_repository.mock.dart';

void main() {
  late AuthRepoMock repository;
  late RegisterUseCase registerUseCase;

  setUp(() {
    repository = AuthRepoMock();
    registerUseCase = RegisterUseCase(repository);
  });

  setUpAll(() {
    registerFallbackValue(const AuthEntity.empty()); // ✅ Register fallback once
  });

  const userParams = RegisterUserParams(
    name: "Priyanka Bhandari",
    email: "priyankabhandari749@gmail.com",
    phoneNumber: "9860452132",
    location: "Kathmandu",
    skill: "Flutter",
    password: "priyanka123",
    image: "profile.png",
  );

  group('RegisterUseCase Tests', () {
    test('should return Failure when email is already taken', () async {
      when(() => repository.register(any())).thenAnswer(
          (_) async => const Left(ApiFailure(message: "Email already taken")));

      final result = await registerUseCase(userParams);

      expect(result, const Left(ApiFailure(message: "Email already taken")));
      verify(() => repository.register(any())).called(1);
    });

    test('should return Failure when phone number is invalid', () async {
      // Arrange
      when(() => repository.register(any())).thenAnswer(
          (_) async => const Left(ApiFailure(message: "Invalid phone number")));

      // Act
      final invalidUserParams = RegisterUserParams(
        name: userParams.name,
        email: userParams.email,
        phoneNumber: "98604521", // Invalid phone number
        location: userParams.location,
        skill: userParams.skill,
        password: userParams.password,
        image: userParams.image,
      );
      final result = await registerUseCase(invalidUserParams);

      // Assert
      expect(result, const Left(ApiFailure(message: "Invalid phone number")));
      verify(() => repository.register(any())).called(1);
    });

    test('should return Failure when any of the required fields is empty',
        () async {
      // Arrange
      when(() => repository.register(any())).thenAnswer((_) async =>
          const Left(ApiFailure(message: "One or more credentials is empty")));

      // Act
      final emptyNameParams = RegisterUserParams(
        name: "", // Empty name field
        email: userParams.email,
        phoneNumber: userParams.phoneNumber,
        location: userParams.location,
        skill: userParams.skill,
        password: userParams.password,
        image: userParams.image,
      );
      final result = await registerUseCase(emptyNameParams);

      // Assert
      expect(result,
          const Left(ApiFailure(message: "One or more credentials is empty")));
      verify(() => repository.register(any())).called(1);
    });

    test('should return Failure when there is a server error', () async {
      // Arrange
      when(() => repository.register(any())).thenAnswer((_) async =>
          const Left(ApiFailure(message: "Internal Server Error")));

      // Act
      final result = await registerUseCase(userParams);

      // Assert
      expect(result, const Left(ApiFailure(message: "Internal Server Error")));
      verify(() => repository.register(any())).called(1);
    });

    test('should register user successfully and return Right(null)', () async {
      // Arrange
      when(() => repository.register(any()))
          .thenAnswer((_) async => const Right(null));

      // Act
      final result = await registerUseCase(userParams);

      // Assert
      expect(result, const Right(null));
      verify(() => repository.register(any())).called(1);
      verifyNoMoreInteractions(repository);
    });
  });
}
