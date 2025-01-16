part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class Register extends RegisterEvent {
  final BuildContext context;
  final String username;
  final String email;
  final String phoneNumber;
  final String? address;
  final String password;
  final String confirmPassword;

  Register({
    required this.context,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object?> get props => [
        context,
        username,
        email,
        phoneNumber,
        address,
        password,
        confirmPassword,
      ];
}
