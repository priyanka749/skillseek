import 'package:flutter/material.dart';
import 'package:skillseek/view/login_view.dart';
import 'package:skillseek/view/signup_view.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 252, 255),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  'assets/images/skillseeklogo.png',
                  height: height * 0.25,
                ),

                SizedBox(height: height * 0.02),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                  child: const Text(
                    '"SkillSeek: Redefining Service Excellence with Trusted Professionals at Your Fingertips."',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 19,
                      color: Color.fromARGB(255, 48, 61, 85),
                      fontWeight: FontWeight.w600,
                      height: 1.6,
                    ),
                  ),
                ),

                SizedBox(height: height * 0.3),

                // Log In Button
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.01),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginView(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1F4A9B),
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.2,
                        vertical: height * 0.015,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                // Sign Up Button
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.01),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1F4A9B),
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.2,
                        vertical: height * 0.015,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                // Forgot Password Button
                Padding(
                  padding: EdgeInsets.only(top: height * 0.01),
                  child: TextButton(
                    onPressed: () {
                      // TODO: Navigate to Forgot Password Page
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF1F4A9B),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
