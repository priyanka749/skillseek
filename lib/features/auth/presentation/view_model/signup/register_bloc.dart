// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:skillseek/core/common/snackbar/my_snackbar.dart';
// import 'package:skillseek/features/auth/domain/use_case/register_user_usecase.dart';
// import 'package:skillseek/features/auth/domain/use_case/verify_otp_usecase.dart';
// import 'package:skillseek/features/auth/presentation/view/login_view.dart';
// import 'package:skillseek/features/auth/presentation/view/otp_view.dart';
// import 'package:skillseek/features/auth/presentation/view_model/signup/register_event.dart';
// import 'package:skillseek/features/auth/presentation/view_model/signup/register_state.dart';

// class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
//   final RegisterUseCase _registerUseCase;
//   final VerifyOtpUsecase _verifyOtpUsecase;

//   RegisterBloc({
//     required RegisterUseCase registerUseCase,
//     required VerifyOtpUsecase verifyOtpUsecase,
//   })  : _registerUseCase = registerUseCase,
//         _verifyOtpUsecase = verifyOtpUsecase,
//         super(RegisterState.initial()) {
//     on<RegisterStudentEvent>(_onRegisterStudent);
//      on<VerifyOtp>(_onVerifyOtp);
//   }

//   void _onRegisterStudent(
//     RegisterStudentEvent event,
//     Emitter<RegisterState> emit,
//   ) async {
//     // First, check if passwords match before proceeding
//     if (event.password != event.confirmPassword) {
//       emit(state.copyWith(errorMessage: "Passwords do not match"));
//       showMySnackBar(
//         context: event.context,
//         message: "Passwords do not match",
//         color: Colors.red,
//       );
//       return;
//     }

//     // Start the loading state
//     emit(state.copyWith(isLoading: true));

//     // Perform the registration use case
//     final result = await _registerUseCase.call(
//       RegisterUserParams(
//         name: event.name,
//         password: event.password,
//         email: event.email,
//         phoneNumber: event.phoneNumber,
//         location: event.location,
//         skill: event.skill,
//         image: state.image ?? '',
//       ),
//     );

//     // Process the response
//     result.fold(
//       (failure) {
//         emit(state.copyWith(
//           isLoading: false,
//           isSuccess: false,
//           errorMessage: failure.message,
//         ));

//         showMySnackBar(
//           context: event.context,
//           message: failure.message ?? "Registration failed",
//           color: Colors.red,
//         );
//       },
//       (success) {
//         emit(state.copyWith(isLoading: false, isSuccess: true));

//         showMySnackBar(
//           context: event.context,
//           message: "Registration successful!",
//           color: Colors.green,
//         );

//         // Navigate to the login screen after a slight delay to prevent context issues
//         Future.delayed(const Duration(milliseconds: 500), () {
//           if (Navigator.canPop(event.context)) {
//             Navigator.pushReplacement(
//               event.context,
//               MaterialPageRoute(
//                 builder: (context) => OtpView(email: event.email),
//                 // builder: (context) => LoginView(),
//               ),
//             );
//           }
//         });
//       },
//     );
//   }

//   void _onVerifyOtp(
//     VerifyOtp event,
//     Emitter<RegisterState> emit,
//   ) async {
//     emit(state.copyWith(isLoading: true));

//     final result = await _verifyOtpUsecase.call(
//       VerifyOtpParams(
//         email: event.email,
//         otp: event.otp,
//       ),
//     );

//     result.fold(
//       (l) {
//         emit(state.copyWith(isLoading: false, isOtpVerified: false));
//         showMySnackBar(
//             context: event.context, message: l.message, color: Colors.red);
//       },
//       (r) {
//         emit(state.copyWith(isLoading: false, isOtpVerified: true));
//         showMySnackBar(
//             context: event.context, message: "OTP Verified Successfully");

//         Navigator.pushReplacementNamed(event.context, '/login');
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillseek/core/common/snackbar/my_snackbar.dart';
import 'package:skillseek/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:skillseek/features/auth/domain/use_case/verify_otp_usecase.dart';
import 'package:skillseek/features/auth/presentation/view/otp_view.dart';
import 'package:skillseek/features/auth/presentation/view_model/signup/register_event.dart';
import 'package:skillseek/features/auth/presentation/view_model/signup/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase _registerUseCase;
  final VerifyOtpUsecase _verifyOtpUsecase;

  RegisterBloc({
    required RegisterUseCase registerUseCase,
    required VerifyOtpUsecase verifyOtpUsecase,
  })  : _registerUseCase = registerUseCase,
        _verifyOtpUsecase = verifyOtpUsecase,
        super(RegisterState.initial()) {
    on<RegisterStudentEvent>(_onRegisterStudent);
    on<VerifyOtp>(_onVerifyOtp);
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

        // Navigate to the OTP screen after a successful registration
        Navigator.pushReplacement(
          event.context,
          MaterialPageRoute(
            builder: (context) =>
                OtpView(email: event.email), // This is your OtpView
          ),
        );
      },
    );
  }

  void _onVerifyOtp(
    VerifyOtp event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await _verifyOtpUsecase.call(
      VerifyOtpParams(
        email: event.email,
        otp: event.otp,
      ),
    );

    result.fold(
      (l) {
        emit(state.copyWith(isLoading: false, isOtpVerified: false));
        showMySnackBar(
            context: event.context, message: l.message, color: Colors.red);
      },
      (r) {
        emit(state.copyWith(isLoading: false, isOtpVerified: true));
        showMySnackBar(
            context: event.context, message: "OTP Verified Successfully");

        Navigator.pushReplacementNamed(event.context, '/login');
      },
    );
  }
}
