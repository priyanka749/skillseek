import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? userId;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String? address;
  final String password;

  const AuthEntity({
    this.userId,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    this.address,
    required this.password,
  });

  @override
  List<Object?> get props =>
      [userId, fullName, email, phoneNumber, address, password];
}
