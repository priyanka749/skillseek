import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:skillseek/core/common/snackbar/my_snackbar.dart';
import 'package:skillseek/features/auth/domain/use_case/register_user_usecase.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterBloc({
    required RegisterUseCase registerUseCase,
  })  : _registerUseCase = registerUseCase,
        super(RegisterState.initial()) {
    on<Register>(_onRegisterEvent);
  }

  Future<void> _onRegisterEvent(
    Register event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    // Call the use case with the required parameters
    final result = await _registerUseCase.call(RegisterUserParams(
      username: event.username,
      email: event.email,
      phoneNumber: event.phoneNumber,
      address: event.address,
      password: event.password,
      confirmPassword: event.confirmPassword,
    ));

    // Handle the result from the use case
    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, isSuccess: false));
        showMySnackBar(
          context: event.context,
          message: "Registration Failed: ${failure.message}",
        );
      },
      (_) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
        showMySnackBar(
          context: event.context,
          message: "Registration Successful",
        );
      },
    );
  }
}
