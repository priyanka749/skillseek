import 'package:flutter/material.dart';
import 'package:skillseek/view/dashboard_view.dart';
import 'package:skillseek/view/signup_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 245, 250, 1),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 70,),
            Center(
              child: Image.asset(
                'assets/images/skillseeklogo.png',
                  height: screenHeight * 0.23, 
              ),
            ),
            SizedBox(height: screenHeight *0 ), // Reduced spacing here
            Text(
              'Log In With Your Account',
              style: TextStyle(
                fontSize: isSmallScreen ? 20 : 20,
                fontWeight: FontWeight.bold,
                height: 0.3,
                color: Color.fromARGB(255, 13, 13, 13),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.05),
            const CustomTextField(hintText: 'Username', icon: Icons.person),
            SizedBox(height: screenHeight * 0.02),
            const CustomTextField(
              hintText: 'Password',
              icon: Icons.lock,
              obscureText: true,
            ),
           
            SizedBox(height: screenHeight * 0.01),
    
            SizedBox(height: screenHeight * 0.03),
            Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const DashboardView()));
                    // Sign In logic here
                    // print('Sign In button clicked');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1F4A9B),
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 19 : 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 19 : 20,
                      color: const Color.fromARGB(255, 6, 6, 6), // Added color property
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ), // Replace 'SignUpPage' with your sign-up page widget
                      );

                      // Navigate to Sign Up page
                      print('Navigate to Sign Up page');
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 17 : 25,
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
          color: Color.fromARGB(255, 0, 0, 0),
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
