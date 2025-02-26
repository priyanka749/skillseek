import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillseek/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:skillseek/features/onboarding/presentation/view/onboarding_view.dart'; // Import SignUpPage
// Import OnboardingPage

class SplashCubit extends Cubit<void> {
  SplashCubit(this._loginBloc) : super(null);

  final LoginBloc _loginBloc;

  Future<void> init(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2), () async {
      // Navigate to Onboarding Page first, then to SignUpPage after onboarding
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: _loginBloc,
              child: const OnboardingPage(), // Navigate to OnboardingPage
            ),
          ),
        );
      }
    });
  }
}
