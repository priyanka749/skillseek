import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterStudentEvent extends RegisterEvent {
  final BuildContext context;
  final String username;
  final String email;
  final String phoneNumber;
  final String address;
  final String password;
  final String confirmPassword;

  const RegisterStudentEvent({
    required this.context,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object> get props => [
        email,
        password,
        confirmPassword,
        username,
        phoneNumber,
        address,
        context
      ];
}
