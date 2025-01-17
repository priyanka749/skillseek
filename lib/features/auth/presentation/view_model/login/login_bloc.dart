import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillseek/app/di/di.dart';
import 'package:skillseek/features/auth/domain/use_case/login_usecase.dart';
import 'package:skillseek/features/dashboard/presentation/view/dashboard_view.dart';
import 'package:skillseek/features/dashboard/presentation/view_model/home_cubit.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  LoginBloc(
      {required LoginUseCase loginUseCase,
      required HomeCubit homeCubit,
      required registerBloc})
      : _loginUseCase = loginUseCase,
        super(LoginState.initial()) {
    // Handle Login Event
    on<LoginStudentEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      print('LoginStudentEvent');
      final result = await _loginUseCase(
        LoginParams(
          username: event.username,
          password: event.password,
        ),
      );

      result.fold(
        (failure) {
          emit(state.copyWith(isLoading: false, isSuccess: false));
          ScaffoldMessenger.of(event.context).showSnackBar(
            const SnackBar(
              content: Text('Invalid Credentials'),
              backgroundColor: Colors.red,
            ),
          );
        },
        (success) {
          emit(state.copyWith(isLoading: false, isSuccess: true));
          Navigator.pushReplacement(
            event.context,
            MaterialPageRoute(
              builder: (context) => const DashboardView(),
            ),
          );
        },
      );
    });

    // Handle Navigation to Register Screen
    on<NavigateRegisterScreenEvent>((event, emit) {
      Navigator.push(
        event.context,
        MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<HomeCubit>(),
            child: event.destination,
          ),
        ),
      );
    });
  }
}
