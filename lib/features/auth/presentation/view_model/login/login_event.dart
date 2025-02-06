// login_event.dart

part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginStudentEvent extends LoginEvent {
  final String email;
  final String password;

  final BuildContext context;

  const LoginStudentEvent({
    required this.email,
    required this.password,
    required this.context,
  });

  @override
  List<Object?> get props => [email, password, context];
}

class NavigateRegisterScreenEvent extends LoginEvent {
  final Widget destination;
  final BuildContext context;

  const NavigateRegisterScreenEvent({
    required this.destination,
    required this.context,
  });

  @override
  List<Object?> get props => [destination, context];
}
