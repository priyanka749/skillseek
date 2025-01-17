import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:skillseek/core/common/snackbar/my_snackbar.dart';
import 'package:skillseek/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:skillseek/features/auth/presentation/view/login_view.dart';
import 'package:skillseek/features/auth/presentation/view_model/signup/register_event.dart';
import 'package:skillseek/features/auth/presentation/view_model/signup/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterBloc({required RegisterUseCase registerUseCase})
      : _registerUseCase = registerUseCase,
        super(RegisterState.initial()) {
    on<RegisterStudentEvent>(_onRegisterStudent);
  }

  Future<void> _onRegisterStudent(
    RegisterStudentEvent event,
    Emitter<RegisterState> emit,
  ) async {
    // Check if passwords match
    if (event.password != event.confirmPassword) {
      emit(state.copyWith(errorMessage: "Passwords do not match"));
      showMySnackBar(
        context: event.context,
        message: "Passwords do not match",
        color: Colors.red,
      );
      return;
    }

    // Start loading
    emit(state.copyWith(isLoading: true));

    // Perform registration using the provided use case
    final result = await _registerUseCase.call(
      RegisterUserParams(
        username: event.username,
        password: event.password,
        email: event.email,
        phoneNumber: event.phoneNumber,
        address: event.address,
        confirmPassword: event.confirmPassword,
      ),
    );

    // Handle the result (success or failure)
    result.fold(
      (failure) {
        emit(state.copyWith(
          isLoading: false,
          isSuccess: false,
          errorMessage: failure.message,
        ));
        showMySnackBar(
          context: event.context,
          message: failure.message ?? "Registration failed",
          color: Colors.red,
        );
      },
      (success) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
        showMySnackBar(
          context: event.context,
          message: "Registration successful!",
          color: Colors.green,
        );

        // Ensure that the context passed is valid when navigating
        Navigator.pushReplacement(
          event.context,
          MaterialPageRoute(
            builder: (context) => LoginView(),
          ),
        );
      },
    );
  }
}
