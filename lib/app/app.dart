// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:skillseek/app/di/di.dart';
// import 'package:skillseek/features/auth/presentation/view_model/login/login_bloc.dart';
// import 'package:skillseek/features/auth/presentation/view_model/signup/register_bloc.dart';
// import 'package:skillseek/features/dashboard/presentation/view_model/home_cubit.dart';
// import 'package:skillseek/features/landing/presentation/view/landing_page_view.dart';
// import 'package:skillseek/features/landing/presentation/view_model/landing_cubit.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<LoginBloc>(
//           create: (_) => getIt<LoginBloc>(),
//         ),
//         BlocProvider<RegisterBloc>(
//           create: (_) => getIt<RegisterBloc>(),
//         ),
//         BlocProvider<HomeCubit>(
//           create: (_) => getIt<HomeCubit>(),
//         ),
//       ],
//       child: MaterialApp(
//         title: 'SkillSeek',
//         theme: ThemeData(
//           primaryColor: Colors.blue,
//         ),
//         home: BlocProvider(
//           create: (context) => SplashCubit(getIt<LoginBloc>()),
//           child: const SplashView(),
//         ),
//         debugShowCheckedModeBanner: false,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillseek/app/di/di.dart';
import 'package:skillseek/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:skillseek/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:skillseek/features/dashboard/presentation/view_model/home_cubit.dart';
import 'package:skillseek/features/landing/presentation/view/landing_page_view.dart';
import 'package:skillseek/features/landing/presentation/view_model/landing_cubit.dart';
import 'package:skillseek/features/request/domain/usecase/request_usecase.dart';
import 'package:skillseek/features/request/presentation/view_model/request_bloc.dart';
import 'package:skillseek/features/service_provider/domain/usecase/service_provider_usecase.dart';
import 'package:skillseek/features/service_provider/presentation/view_model/services/service_provider_bloc.dart';
import 'package:skillseek/features/service_provider/presentation/view_model/services/service_provider_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ✅ Ensure Flutter is initialized
  await initDependencies(); // ✅ Initialize dependencies before runApp
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (_) => getIt<LoginBloc>(),
        ),
        BlocProvider<RegisterBloc>(
          create: (_) => getIt<RegisterBloc>(),
        ),
        BlocProvider<HomeCubit>(
          create: (_) => getIt<HomeCubit>(),
        ),
        BlocProvider<ServiceProviderBloc>(
          create: (_) => ServiceProviderBloc(getIt<GetServiceProviders>())
            ..add(FetchServiceProviders()), // ✅ Ensure event is dispatched
        ),
        // ✅ Ensure event is dispatched
        BlocProvider<ServiceRequestBloc>(
          create: (_) => ServiceRequestBloc(
            sendServiceRequestUseCase: getIt<SendServiceRequestUseCase>(),
          ),
        ),

        BlocProvider<SplashCubit>(
          create: (context) => SplashCubit(getIt<LoginBloc>()),
        ),
      ],
      child: MaterialApp(
        title: 'SkillSeek',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: const SplashView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
