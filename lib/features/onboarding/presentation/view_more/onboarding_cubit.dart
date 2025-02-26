import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillseek/features/auth/presentation/view/signup_view.dart';  // Import SignUpPage

class OnboardingCubit extends Cubit<void> {
  OnboardingCubit() : super(null);

  // Method to handle the onboarding flow after a delay
  Future<void> startOnboarding(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2), () {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SignUpPage(),  // Navigate to SignUpPage
          ),
        );
      }
    });
  }
}
