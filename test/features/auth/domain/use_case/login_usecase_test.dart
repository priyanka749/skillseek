import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skillseek/core/error/failure.dart';
import 'package:skillseek/features/auth/domain/use_case/login_usecase.dart';
import 'package:test/test.dart';

import 'auth_repository.mock.dart';
import 'token.mock.dart';

void main() {
  late AuthRepoMock repository;
  late MockTokenSharedPrefs tokenSharedPrefs;
  late LoginUseCase useCase;

  setUp(() {
    repository = AuthRepoMock();
    tokenSharedPrefs = MockTokenSharedPrefs();
    useCase = LoginUseCase(repository, tokenSharedPrefs);

    registerFallbackValue(const LoginParams(email: '', password: ''));
  });

  group('LoginUseCase Tests', () {
    test('should call the [AuthRepo.login] with correct email and password',
        () async {
      when(() => repository.userlogin(any(), any()))
          .thenAnswer((invocation) async {
        final email = invocation.positionalArguments[0] as String;
        final password = invocation.positionalArguments[1] as String;

        if (email == '' && password == '') {
          return Future.value(const Right('token'));
        } else {
          return Future.value(
              const Left(ApiFailure(message: 'Invalid email or password')));
        }
      });

      when(() => tokenSharedPrefs.saveToken(any()))
          .thenAnswer((_) async => const Right(null));

      when(() => tokenSharedPrefs.getToken())
          .thenAnswer((_) async => const Right('token'));

      final result = await useCase(const LoginParams(
        email: '',
        password: '',
      ));

      expect(result, const Right('token'));

      verify(() => repository.userlogin('', '')).called(1);

      verify(() => tokenSharedPrefs.saveToken('token')).called(1);

      verify(() => tokenSharedPrefs.getToken()).called(1);
    });

    test('should return Failure when login fails', () async {
      when(() => repository.userlogin(any(), any())).thenAnswer((_) async =>
          const Left(ApiFailure(message: 'Invalid username or password')));

      final result = await useCase(const LoginParams(
          email: 'wrong@test.com', password: 'wrongpassword'));

      expect(result,
          const Left(ApiFailure(message: 'Invalid username or password')));
      verify(() => repository.userlogin('wrong@test.com', 'wrongpassword'))
          .called(1);
      verifyNoMoreInteractions(repository);
      verifyNoMoreInteractions(tokenSharedPrefs);
    });

    test('should save token after successful login', () async {
      when(() => repository.userlogin(any(), any()))
          .thenAnswer((_) async => const Right('token'));

      when(() => tokenSharedPrefs.saveToken(any()))
          .thenAnswer((_) async => const Right(null));

      when(() => tokenSharedPrefs.getToken())
          .thenAnswer((_) async => const Right('token'));

      final result = await useCase(
          const LoginParams(email: 'test@test.com', password: 'password'));

      expect(result, const Right('token'));
      verify(() => repository.userlogin('test@test.com', 'password')).called(1);
      verify(() => tokenSharedPrefs.saveToken('token')).called(1);
      verify(() => tokenSharedPrefs.getToken()).called(1);
    });

    test('should return Failure when email is empty', () async {
      when(() => repository.userlogin(any(), any())).thenAnswer(
          (_) async => const Left(ApiFailure(message: 'email not provoded')));

      final result =
          await useCase(const LoginParams(email: '', password: 'priyanka'));

      expect(result, const Left(ApiFailure(message: 'email not provoded')));

      verify(() => repository.userlogin(any(), any())).called(1);
      verifyNever(() => tokenSharedPrefs.saveToken(any()));
    });

    test('should return Failure when password is empty', () async {
      // When the password is empty, we expect the repository to return a failure
      when(() => repository.userlogin(any(), any())).thenAnswer((_) async =>
          const Left(ApiFailure(message: 'Invalid email or password')));

      final result = await useCase(
          const LoginParams(email: 'test@test.com', password: ''));

      // We expect a Failure result
      expect(
          result, const Left(ApiFailure(message: 'Invalid email or password')));

      verify(() => repository.userlogin(any(), any())).called(1);
      verifyNever(() => tokenSharedPrefs.saveToken(any()));
    });

    tearDown(() {
      reset(repository);
      reset(tokenSharedPrefs);
    });
  });
}
