import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

// class UploadImage extends RegisterEvent {
//   final File file;

//   const UploadImage({
//     required this.file,
//   });
// }

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
}
