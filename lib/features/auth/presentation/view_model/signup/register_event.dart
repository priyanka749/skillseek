import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class VerifyOtp extends RegisterEvent {
  final String otp;
  final BuildContext context;
  final String email;

  const VerifyOtp({
    required this.otp,
    required this.context,
    required this.email,
  });

  @override
  List<Object> get props => [otp, context, email];
}

class RegisterStudentEvent extends RegisterEvent {
  final BuildContext context;
  final String name;
  final String email;
  final String phoneNumber;
  final String skill;
  final String location;
  final String password;
  final String confirmPassword;
  final String? image;

  const RegisterStudentEvent({
    required this.context,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.location,
    required this.skill,
    required this.password,
    required this.confirmPassword,
    this.image,
  });

  @override
  List<Object> get props => [
        context,
        name,
        email,
        phoneNumber,
        location,
        skill,
        password,
        confirmPassword,
        image ?? '',
      ];
}

class VerifyOtpEvent extends RegisterEvent {
  final String email;
  final String otp;
  final BuildContext context;

  const VerifyOtpEvent({
    required this.email,
    required this.otp,
    required this.context,
  });

  @override
  List<Object> get props => [email, otp, context];
}
