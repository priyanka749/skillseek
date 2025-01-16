import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? userId;
  final String username;
  final String email;
  final String phoneNumber;
  final String? address;
  final String password;
  final String confirmPassword;

  const AuthEntity({
    this.userId,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object?> get props => [
        userId,
        username,
        email,
        phoneNumber,
        address,
        password,
        confirmPassword
      ];
}
