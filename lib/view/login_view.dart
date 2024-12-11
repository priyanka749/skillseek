import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 231, 231, 233),
        toolbarHeight: 50.0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/Blue_Simple_Personal_Logo-removebg-preview.png',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.account_circle,
              color: Color(0xFF1F4A9B), // Changed to blue
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(  // Wrap everything inside SingleChildScrollView
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [ 
            const Text(
              'Sign Up', // Moved the Sign Up title here
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F4A9B),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            const Text(
              'Create Your Account',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F4A9B),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            const CustomTextField(hintText: 'Full Name', icon: Icons.person),
            const SizedBox(height: 16),
            const CustomTextField(hintText: 'Email', icon: Icons.email),
            const SizedBox(height: 16),
            const CustomTextField(hintText: 'Phone Number', icon: Icons.phone),
            const SizedBox(height: 16),
            const CustomTextField(hintText: 'Address', icon: Icons.location_on),
            const SizedBox(height: 16),
            const CustomTextField(
                hintText: 'Password', icon: Icons.lock, obscureText: true),
            const SizedBox(height: 16),
            const CustomTextField(
                hintText: 'Confirm Password',
                icon: Icons.lock,
                obscureText: true),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Sign-up logic here
                print('Sign-up button clicked');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1F4A9B),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
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
            const SizedBox(height: 16),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to Sign In page
                      print('Navigate to Sign In page');
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F4A9B),
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
            color: Color(0xFF1F4A9B), // Blue border
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: Color(0xFF1F4A9B), // Blue border when focused
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
      ),
    );
  }
}
