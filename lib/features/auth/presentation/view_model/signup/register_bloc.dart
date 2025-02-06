import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillseek/core/common/snackbar/my_snackbar.dart';
import 'package:skillseek/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:skillseek/features/auth/presentation/view/login_view.dart';
import 'package:skillseek/features/auth/presentation/view_model/signup/register_event.dart';
import 'package:skillseek/features/auth/presentation/view_model/signup/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterBloc({
    required RegisterUseCase registerUseCase,
  })  : _registerUseCase = registerUseCase,
        super(RegisterState.initial()) {
    on<RegisterStudentEvent>(_onRegisterStudent);
  }

  void _onRegisterStudent(
    RegisterStudentEvent event,
    Emitter<RegisterState> emit,
  ) async {
    // First, check if passwords match before proceeding
    if (event.password != event.confirmPassword) {
      emit(state.copyWith(errorMessage: "Passwords do not match"));
      showMySnackBar(
        context: event.context,
        message: "Passwords do not match",
        color: Colors.red,
      );
      return;
    }

    // Start the loading state
    emit(state.copyWith(isLoading: true));

    // Perform the registration use case
    final result = await _registerUseCase.call(
      RegisterUserParams(
        name: event.name,
        password: event.password,
        email: event.email,
        phoneNumber: event.phoneNumber,
        location: event.location,
        skill: event.skill,
        image: state.image ?? '',
      ),
    );

    // Process the response
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

        // Navigate to the login screen after a slight delay to prevent context issues
        Future.delayed(const Duration(milliseconds: 500), () {
          if (Navigator.canPop(event.context)) {
            Navigator.pushReplacement(
              event.context,
              MaterialPageRoute(
                builder: (context) => LoginView(),
              ),
            );
          }
        });
      },
    );
  }
}
