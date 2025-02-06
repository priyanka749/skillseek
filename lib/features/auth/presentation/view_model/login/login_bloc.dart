import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillseek/app/di/di.dart';
import 'package:skillseek/core/common/snackbar/my_snackbar.dart';
import 'package:skillseek/features/auth/domain/use_case/login_usecase.dart';
import 'package:skillseek/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:skillseek/features/dashboard/presentation/view_model/home_cubit.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;
  final HomeCubit _HomeCubit;
  final RegisterBloc _registerBloc;

  LoginBloc(
      {required LoginUseCase loginUseCase,
      required HomeCubit homeCubit,
      required registerBloc})
      : _loginUseCase = loginUseCase,
        _HomeCubit = homeCubit,
        _registerBloc = registerBloc,
        super(LoginState.initial()) {
    // Handle Login Event
    on<LoginStudentEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      print('LoginStudentEvent');
      final result = await _loginUseCase(
        LoginParams(
          email: event.email,
          password: event.password,
        ),
      );

      result.fold(
        (failure) {
          emit(state.copyWith(isLoading: false, isSuccess: false));
          ScaffoldMessenger.of(event.context).showSnackBar(
            const SnackBar(
              content: Text('login unsucessfull'),
              backgroundColor: Color.fromARGB(255, 224, 19, 56),
            ),
          );
        },
        (token) {
          emit(state.copyWith(isLoading: false, isSuccess: true));
          showMySnackBar(
            context: event.context,
            message: "Login Successful",
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
