import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillseek/features/auth/presentation/view_model/signup/register_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final RegisterBloc _registerBloc;

  LoginBloc({
    required RegisterBloc registerBloc,
  })  : _registerBloc = registerBloc,
        super(LoginState.initial()) {
    on<NavigateRegisterScreenEvent>(_onNavigateRegisterScreenEvent);
    on<NavigateHomeScreenEvent>(_onNavigateHomeScreenEvent);
  }

  void _onNavigateRegisterScreenEvent(
      NavigateRegisterScreenEvent event, Emitter<LoginState> emit) {
    Navigator.push(
      event.context,
      MaterialPageRoute(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider.value(
                value: _registerBloc), // Provide existing RegisterBloc instance
          ],
          child: event.destination,
        ),
      ),
    );
  }

  void _onNavigateHomeScreenEvent(
      NavigateHomeScreenEvent event, Emitter<LoginState> emit) {
    Navigator.pushReplacement(
      event.context,
      MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: _registerBloc, // Ensure the same instance is used here
          child: event.destination,
        ),
      ),
    );
  }
}
