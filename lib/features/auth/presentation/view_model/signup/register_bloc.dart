import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillseek/core/common/snackbar/my_snackbar.dart';
import 'package:skillseek/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:skillseek/features/auth/domain/use_case/upload_image_usecase.dart';
import 'package:skillseek/features/auth/presentation/view/login_view.dart';
import 'package:skillseek/features/auth/presentation/view_model/signup/register_event.dart';
import 'package:skillseek/features/auth/presentation/view_model/signup/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase _registerUseCase;
  final UploadImageUsecase _uploadImageUseCase;

  RegisterBloc({
    required RegisterUseCase registerUseCase,
    required UploadImageUsecase uploadImageUseCase,
  })  : _registerUseCase = registerUseCase,
        _uploadImageUseCase = uploadImageUseCase,
        super(RegisterState.initial()) {
    on<RegisterStudentEvent>(_onRegisterStudent);
    on<UploadImage>(_onLoadImage);
  }

  void _onRegisterStudent(
    RegisterStudentEvent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(
      isLoading: true,
    ));
    final result = await _registerUseCase.call(
      RegisterUserParams(
        username: event.username,
        password: event.password,
        email: event.email,
        phoneNumber: event.phoneNumber,
        address: event.address,
        role: event.role,
        skill: event.skill,
        confirmPassword: event.confirmPassword,
        imageName: state.imageName ?? '',
      ),
    );
    if (event.password != event.confirmPassword) {
      emit(state.copyWith(
          errorMessage: "Passwords do not match", imageName: ''));
      showMySnackBar(
        // ignore: use_build_context_synchronously
        context: event.context,
        message: "Passwords do not match",
        color: Colors.red,
      );
      return;
    }

    emit(state.copyWith(isLoading: true, imageName: ''));

    result.fold(
      (failure) {
        emit(state.copyWith(
          isLoading: false,
          isSuccess: false,
          errorMessage: failure.message,
          imageName: '',
        ));
        showMySnackBar(
          context: event.context,
          message: failure.message ?? "Registration failed",
          color: Colors.red,
        );
      },
      (success) {
        emit(state.copyWith(isLoading: false, isSuccess: true, imageName: ''));
        showMySnackBar(
          context: event.context,
          message: "Registration successful!",
          color: Colors.green,
        );
        Navigator.pushReplacement(
          event.context,
          MaterialPageRoute(
            builder: (context) => LoginView(),
          ),
        );
      },
    );
  }

  void _onLoadImage(
    UploadImage event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, imageName: ''));
    final result = await _uploadImageUseCase.call(
      UploadImageParams(
        file: event.file,
      ),
    );

    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, isSuccess: false, imageName: ''));
      },
      (imageName) {
        emit(state.copyWith(
          isLoading: false,
          isSuccess: true,
          imageName: imageName,
        ));
      },
    );
  }
}
