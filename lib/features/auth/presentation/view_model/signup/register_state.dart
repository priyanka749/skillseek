import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final bool isOtpVerified;
  final String errorMessage;
  final String? image;

  const RegisterState({
    required this.isLoading,
    required this.isSuccess,
    required this.isOtpVerified,
    required this.errorMessage,
    this.image,
  });

  factory RegisterState.initial() {
    return const RegisterState(
      isLoading: false,
      isSuccess: false,
      isOtpVerified: false,
      image: null,
      errorMessage: '',
    );
  }

  RegisterState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isOtpVerified,
    String? image,
    String? errorMessage,
  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isOtpVerified: isOtpVerified ?? this.isOtpVerified,
      image: image ?? this.image,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [isLoading, isSuccess, isOtpVerified, errorMessage, image];
}
