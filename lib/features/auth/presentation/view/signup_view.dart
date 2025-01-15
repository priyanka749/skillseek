import 'package:flutter/material.dart';
import 'package:skillseek/features/auth/presentation/view/login_view.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 252, 255),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 80),
            Text(
              'Sign Up',
              style: TextStyle(
                fontSize: isSmallScreen ? 29 : 32,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1F4A9B),
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.03),
            Text(
              'Create Your Account',
              style: TextStyle(
                fontSize: isSmallScreen ? 18 : 22,
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(255, 8, 8, 8),
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.05),
            const CustomTextField(hintText: 'Full Name', icon: Icons.person),
            SizedBox(height: screenHeight * 0.02),
            const CustomTextField(hintText: 'Email', icon: Icons.email),
            SizedBox(height: screenHeight * 0.02),
            const CustomTextField(hintText: 'Phone Number', icon: Icons.phone),
            SizedBox(height: screenHeight * 0.02),
            const CustomTextField(hintText: 'Address', icon: Icons.location_on),
            SizedBox(height: screenHeight * 0.02),
            const CustomTextField(
                hintText: 'Password', icon: Icons.lock, obscureText: true),
            SizedBox(height: screenHeight * 0.02),
            const CustomTextField(
                hintText: 'Confirm Password',
                icon: Icons.lock,
                obscureText: true),
            SizedBox(height: screenHeight * 0.03),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginView(),
                      // Sign-up logic here
                    ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1F4A9B),
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: isSmallScreen ? 18 : 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 16 : 16,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to Sign In page
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginView()));
                    },
                    child: Text(
                      'LogIn',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 19 : 16,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1F4A9B),
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: const Color(0xFF1F4A9B)),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 47, 46, 46),
          fontFamily: 'Poppins',
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Color(0xFF1F4A9B),
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Color(0xFF1F4A9B),
            width: 2,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: screenWidth * 0.04,
        ),
      ),
    );
  }
}
