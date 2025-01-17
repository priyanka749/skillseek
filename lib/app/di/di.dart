import 'package:get_it/get_it.dart';
import 'package:skillseek/core/network/hive_service.dart';
import 'package:skillseek/features/auth/data/data_source/local_data_source/auth_local_data_source.dart';
import 'package:skillseek/features/auth/data/repository/auth_local_repository.dart';
import 'package:skillseek/features/auth/domain/use_case/login_usecase.dart';
import 'package:skillseek/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:skillseek/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:skillseek/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:skillseek/features/dashboard/presentation/view_model/home_cubit.dart';
import 'package:skillseek/features/landing/presentation/view_model/landing_cubit.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  await _initHiveService();

  await _initRegisterDependencies();
  await _initLoginDependencies();
  await _initHomeDependencies();

  await _initSplashScreenDependencies();
}

_initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

_initRegisterDependencies() {
  // init local data source
  getIt.registerLazySingleton(
    () => AuthLocalDataSource(getIt<HiveService>()),
  );

  // init local repository
  getIt.registerLazySingleton(
    () => AuthLocalRepository(getIt<AuthLocalDataSource>()),
  );

  // register use usecase
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(
      getIt<AuthLocalRepository>(),
    ),
  );
  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      registerUseCase: getIt(),
    ),
  );
}

// register use usecase
_initLoginDependencies() async {
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(
      getIt<AuthLocalRepository>(),
    ),
  );
  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      loginUseCase: getIt(),
      homeCubit: getIt<HomeCubit>(),
      registerBloc: getIt<RegisterBloc>(),
    ),
  );
}

_initSplashScreenDependencies() async {
  getIt.registerFactory<SplashCubit>(
    () => SplashCubit(getIt<LoginBloc>()),
  );
}

_initHomeDependencies() async {
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(),
  );
}
