// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:skillseek/app/shared_prefs/token_shared_prefs.dart';
// import 'package:skillseek/core/network/api_service.dart';
// import 'package:skillseek/core/network/hive_service.dart';
// import 'package:skillseek/features/auth/data/data_source/local_data_source/auth_local_data_source.dart';
// import 'package:skillseek/features/auth/data/data_source/remote_data_source/auth_remote_datasource.dart';
// import 'package:skillseek/features/auth/data/repository/auth_local_repository.dart';
// import 'package:skillseek/features/auth/data/repository/auth_remote_repository.dart';
// import 'package:skillseek/features/auth/domain/use_case/login_usecase.dart';
// import 'package:skillseek/features/auth/domain/use_case/register_user_usecase.dart';
// import 'package:skillseek/features/auth/domain/use_case/verify_otp_usecase.dart';
// import 'package:skillseek/features/auth/presentation/view_model/login/login_bloc.dart';
// import 'package:skillseek/features/auth/presentation/view_model/signup/register_bloc.dart';
// import 'package:skillseek/features/dashboard/presentation/view_model/home_cubit.dart';
// import 'package:skillseek/features/landing/presentation/view_model/landing_cubit.dart';

// final getIt = GetIt.instance;

// Future<void> initDependencies() async {
//   await _initHiveService();
//   await _initApiService();
//   await _initSharedPreferences();

//   // 🛠 Order Matters! Register `RegisterBloc` before `LoginBloc`
//   await _initRegisterDependencies();
//   await _initLoginDependencies();
//   await _initHomeDependencies();
//   await _initSplashScreenDependencies();
//   _initServiceProviderDependencies();
// }

// Future<void> _initSharedPreferences() async {
//   final sharedPreferences = await SharedPreferences.getInstance();
//   getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
// }

// _initHiveService() {
//   getIt.registerLazySingleton<HiveService>(() => HiveService());
// }

// _initApiService() {
//   getIt.registerLazySingleton<Dio>(
//     () => ApiService(Dio()).dio,
//   );
// }

// _initRegisterDependencies() async {
//   // Local Data Source
//   getIt.registerLazySingleton(
//     () => AuthLocalDataSource(getIt<HiveService>()),
//   );

//   // Local Repository
//   getIt.registerLazySingleton(
//     () => AuthLocalRepository(getIt<AuthLocalDataSource>()),
//   );

//   // Remote Data Source
//   getIt.registerLazySingleton<AuthRemoteDataSource>(
//     () => AuthRemoteDataSource(getIt<Dio>()),
//   );

//   // Remote Repository
//   getIt.registerLazySingleton<AuthRemoteRepository>(
//     () => AuthRemoteRepository(getIt<AuthRemoteDataSource>()),
//   );

//   // Register `RegisterUseCase`
//   getIt.registerLazySingleton<RegisterUseCase>(
//     () => RegisterUseCase(getIt<AuthRemoteRepository>()),
//   );

//   //auth opt
//   getIt.registerLazySingleton<VerifyOtpUsecase>(
//     () => VerifyOtpUsecase(authRepository: getIt<AuthRemoteRepository>()),
//   );

//   // ✅ **Fixed: Register `RegisterBloc` Before `LoginBloc`**
//   getIt.registerLazySingleton<RegisterBloc>(
//     () => RegisterBloc(
//       registerUseCase: getIt<RegisterUseCase>(),
//       verifyOtpUsecase: getIt<VerifyOtpUsecase>(),
//     ),
//   );
// }

// _initLoginDependencies() async {
//   getIt.registerLazySingleton<TokenSharedPrefs>(
//     () => TokenSharedPrefs(getIt<SharedPreferences>()),
//   );

//   getIt.registerLazySingleton<LoginUseCase>(
//     () => LoginUseCase(
//       getIt<AuthRemoteRepository>(),
//       getIt<TokenSharedPrefs>(),
//     ),
//   );

//   getIt.registerFactory<LoginBloc>(
//     () => LoginBloc(
//       loginUseCase: getIt(),
//       homeCubit: getIt<HomeCubit>(),
//       registerBloc: getIt<RegisterBloc>(), // ✅ Now properly registered
//     ),
//   );
// }

// _initSplashScreenDependencies() async {
//   getIt.registerFactory<SplashCubit>(
//     () => SplashCubit(getIt<LoginBloc>()),
//   );
// }

// _initHomeDependencies() async {
//   getIt.registerFactory<HomeCubit>(
//     () => HomeCubit(),
//   );
// }
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skillseek/app/shared_prefs/token_shared_prefs.dart';
import 'package:skillseek/core/network/api_service.dart';
import 'package:skillseek/core/network/hive_service.dart';
import 'package:skillseek/features/auth/data/data_source/local_data_source/auth_local_data_source.dart';
import 'package:skillseek/features/auth/data/data_source/remote_data_source/auth_remote_datasource.dart';
import 'package:skillseek/features/auth/data/repository/auth_local_repository.dart';
import 'package:skillseek/features/auth/data/repository/auth_remote_repository.dart';
import 'package:skillseek/features/auth/domain/use_case/login_usecase.dart';
import 'package:skillseek/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:skillseek/features/auth/domain/use_case/verify_otp_usecase.dart';
import 'package:skillseek/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:skillseek/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:skillseek/features/dashboard/presentation/view_model/home_cubit.dart';
import 'package:skillseek/features/landing/presentation/view_model/landing_cubit.dart';
import 'package:skillseek/features/request/data/data_source/remote_datasource/request_remote_datasource.dart';
import 'package:skillseek/features/request/data/data_source/request_datasource.dart';
import 'package:skillseek/features/request/data/repository/request_data_repository.dart';
import 'package:skillseek/features/request/domain/repository/request_repository.dart';
import 'package:skillseek/features/request/domain/usecase/request_usecase.dart'
    as usecase;
import 'package:skillseek/features/request/presentation/view_model/request_bloc.dart';
// ✅ Correct Service Provider Imports
import 'package:skillseek/features/service_provider/data/data_source/remote_data_source/service_provider_remote_data_source.dart';
import 'package:skillseek/features/service_provider/data/data_source/service_provider_data_source.dart';
import 'package:skillseek/features/service_provider/data/repository/service_provider_repository.dart';
import 'package:skillseek/features/service_provider/domain/repository/service_provider_repository.dart';
import 'package:skillseek/features/service_provider/domain/usecase/service_provider_usecase.dart';
import 'package:skillseek/features/service_provider/presentation/view_model/services/service_provider_bloc.dart';
import 'package:skillseek/features/servicesavailable/data/datasource/remotedatasource/serviceavailable_remote_datasource.dart';
import 'package:skillseek/features/servicesavailable/data/datasource/serviceavailable_datasource.dart';
import 'package:skillseek/features/servicesavailable/data/repository/serviceavailable_repository.dart';
import 'package:skillseek/features/servicesavailable/domain/repository/serviceavailable_repsoitory.dart';
import 'package:skillseek/features/servicesavailable/domain/usecase/serviceavailable_usecase.dart';
import 'package:skillseek/features/servicesavailable/presentation/view_more/service_available_bloc.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  await _initHiveService();
  await _initApiService();
  await _initSharedPreferences();

  // 🛠 Order Matters! Register `RegisterBloc` before `LoginBloc`
  await _initRegisterDependencies();
  await _initLoginDependencies();
  await _initHomeDependencies();
  await _initSplashScreenDependencies();
  _initServiceDependencies();

  // ✅ Register Service Provider Dependencies
  _initServiceProviderDependencies();
  _initServiceRequestDependencies();
}

Future<void> _initSharedPreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}

_initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

_initApiService() {
  getIt.registerLazySingleton<Dio>(
    () => ApiService(Dio()).dio,
  );
}

_initRegisterDependencies() async {
  // Local Data Source
  getIt.registerLazySingleton(
    () => AuthLocalDataSource(getIt<HiveService>()),
  );

  // Local Repository
  getIt.registerLazySingleton(
    () => AuthLocalRepository(getIt<AuthLocalDataSource>()),
  );

  // Remote Data Source
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(getIt<Dio>()),
  );

  // Remote Repository
  getIt.registerLazySingleton<AuthRemoteRepository>(
    () => AuthRemoteRepository(getIt<AuthRemoteDataSource>()),
  );

  // Register `RegisterUseCase`
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(getIt<AuthRemoteRepository>()),
  );

  //auth opt
  getIt.registerLazySingleton<VerifyOtpUsecase>(
    () => VerifyOtpUsecase(authRepository: getIt<AuthRemoteRepository>()),
  );

  // ✅ **Fixed: Register `RegisterBloc` Before `LoginBloc`**
  getIt.registerLazySingleton<RegisterBloc>(
    () => RegisterBloc(
      registerUseCase: getIt<RegisterUseCase>(),
      verifyOtpUsecase: getIt<VerifyOtpUsecase>(),
    ),
  );
}

_initLoginDependencies() async {
  getIt.registerLazySingleton<TokenSharedPrefs>(
    () => TokenSharedPrefs(getIt<SharedPreferences>()),
  );

  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(
      getIt<AuthRemoteRepository>(),
      getIt<TokenSharedPrefs>(),
    ),
  );

  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      loginUseCase: getIt(),
      homeCubit: getIt<HomeCubit>(),
      registerBloc: getIt<RegisterBloc>(), // ✅ Now properly registered
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

// ✅ New: Service Provider Dependencies
void _initServiceProviderDependencies() {
  getIt.registerLazySingleton<IServiceProviderDataSource>(
    () => ServiceProviderRemoteDataSource(getIt<Dio>()),
  );

  getIt.registerLazySingleton<IServiceProviderRepository>(
    () => ServiceProviderRemoteRepository(getIt<IServiceProviderDataSource>()),
  );

  getIt.registerLazySingleton<GetServiceProviders>(
    () => GetServiceProviders(getIt<IServiceProviderRepository>()),
  );

  getIt.registerFactory<ServiceProviderBloc>(
    () => ServiceProviderBloc(getIt<GetServiceProviders>()),
  );
}

void _initServiceRequestDependencies() {
  // Register Remote Data Source
  getIt.registerLazySingleton<IServiceRequestRemoteDataSource>(
    () => ServiceRequestRemoteDataSource(getIt<Dio>()),
  );

  // Register Repository
  getIt.registerLazySingleton<IServiceRequestRepository>(
    () => ServiceRequestRemoteRepository(
        getIt<IServiceRequestRemoteDataSource>()),
  );

  // ✅ Register Use Case Properly (Remove unnecessary parameters)
  getIt.registerLazySingleton<usecase.SendServiceRequestUseCase>(
    () => usecase.SendServiceRequestUseCase(getIt<IServiceRequestRepository>()),
  );

  // ✅ Register BLoC
  getIt.registerFactory<ServiceRequestBloc>(
    () => ServiceRequestBloc(
        sendServiceRequestUseCase: getIt<usecase.SendServiceRequestUseCase>()),
  );
}

void _initServiceDependencies() {
  getIt.registerLazySingleton<IServiceDataSource>(
    () => ServiceRemoteDataSource(getIt<Dio>()),
  );

  getIt.registerLazySingleton<IServiceRepository>(
    () => ServiceRemoteRepository(getIt<IServiceDataSource>()),
  );

  // ✅ Register GetServices UseCase
  getIt.registerLazySingleton<GetServices>(
    () =>
        GetServices(getIt<IServiceRepository>()), // 🚨 Ensure this line exists!
  );

  // ✅ Register ServiceBloc
  getIt.registerFactory<ServiceBloc>(
    () => ServiceBloc(
        getIt<GetServices>()), // 🚨 Ensure `GetServices` is injected correctly!
  );
}
