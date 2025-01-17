import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillseek/app/di/di.dart';
import 'package:skillseek/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:skillseek/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:skillseek/features/dashboard/presentation/view_model/home_cubit.dart';
import 'package:skillseek/features/landing/presentation/view/landing_page_view.dart';
import 'package:skillseek/features/landing/presentation/view_model/landing_cubit.dart';

void main() {
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
      ],
      child: MaterialApp(
        title: 'SkillSeek',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) => SplashCubit(getIt<LoginBloc>()),
          child: const SplashView(),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
