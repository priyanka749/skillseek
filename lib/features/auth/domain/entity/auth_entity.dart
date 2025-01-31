import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? userId;
  final String username;
  final String email;
  final String phoneNumber;
  final String? address;
  final String role;
  final String skill;
  final String imageName;

  final String password;
  final String confirmPassword;

  const AuthEntity({
    this.userId,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.role,
    required this.skill,
    required this.password,
    required this.confirmPassword,
    required this.imageName,
  });

  @override
  List<Object?> get props => [
        userId,
        username,
        email,
        phoneNumber,
        address,
        password,
        confirmPassword,
        imageName,
      ];
}
