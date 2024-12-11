import 'package:flutter/material.dart';
import 'package:skillseek/view/login_view.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.08),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           const SizedBox(height: 80,),
            Text(
              'Sign Up',
              style: TextStyle(
                fontSize: isSmallScreen ? 24 : 30,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1F4A9B),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.03),
            Text(
              'Create Your Account',
              style: TextStyle(
                fontSize: isSmallScreen ? 16 : 20,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1F4A9B),
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
                // Sign-up logic here
                print('Sign-up button clicked');
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
                  fontSize: isSmallScreen ? 16 : 18,
                  color: Colors.white,
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
                    style: TextStyle(fontSize: isSmallScreen ? 14 : 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to Sign In page
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginView()));
                    },
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 14 : 16,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1F4A9B),
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
    Key? key,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
  }) : super(key: key);

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
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: Color(0xFF1F4A9B),
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: Color(0xFF1F4A9B),
            width: 2,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: screenWidth * 0.03,
        ),
      ),
    );
  }
}
