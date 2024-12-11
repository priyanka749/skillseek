import 'package:flutter/material.dart';
import 'package:skillseek/view/login_view.dart';
import 'package:skillseek/view/signup_view.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background color
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  'assets/images/Blue_Simple_Personal_Logo-removebg-preview.png', // Update with your logo path
                  height: 200, // Adjust height as needed
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20), // Padding for the top
                ),
                // App Name
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: SizedBox(), // Add your app name if necessary
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    '"SkillSeek: Your trusted platform for convenient, reliable, and hassle-free services with professionals!"',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 10, 10, 10),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 240), // Padding for the bottom space
                ),
                // Log In Button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0), // Padding for the button
                  child: ElevatedButton(
                    onPressed: () {  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginView()),
                        );
                    
                      
                      // TODO: Navigate to Login Page
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1F4A9B), // Custom blue color
                      padding: const EdgeInsets.symmetric(
                        horizontal: 80,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white, // White text color
                      ),
                    ),
                  ),
                ),
                // Sign Up Button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0), // Padding for the button
                  child: ElevatedButton(
                    onPressed: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUpPage()),
                        );
                      // TODO: Navigate to Sign Up Page
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1F4A9B), // Custom blue color
                      padding: const EdgeInsets.symmetric(
                        horizontal: 80,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white, // White text color
                      ),
                    ),
                  ),
                ),
                // Forgot Password Button
                Padding(
                  padding: const EdgeInsets.only(top: 8.0), // Padding for the forgot password button
                  child: TextButton(
                    onPressed: () {
                      
                      // TODO: Navigate to Forgot Password Page
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF1F4A9B), // Custom blue color
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

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: OnboardingPageView(),
  ));
}
