import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillseek/features/auth/presentation/view/login_view.dart';
import 'package:skillseek/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:skillseek/features/auth/presentation/view_model/signup/register_event.dart';
import 'package:skillseek/features/auth/presentation/view_model/signup/register_state.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 252, 255),
      body: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Registration Successful")),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginView()),
            );
          } else if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          }

          // TODO: implement listener
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(screenWidth * 0.08),
            child: Form(
              key: _key,
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
                  CustomTextField(
                    controller: _usernameController,
                    hintText: 'Username',
                    icon: Icons.person,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomTextField(
                    controller: _emailController,
                    hintText: 'Email',
                    icon: Icons.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomTextField(
                    controller: _phoneNumberController,
                    hintText: 'Phone Number',
                    icon: Icons.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomTextField(
                    controller: _addressController,
                    hintText: 'Address',
                    icon: Icons.location_on,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomTextField(
                    controller: _passwordController,
                    hintText: 'Password',
                    icon: Icons.lock,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomTextField(
                    controller: _confirmPasswordController,
                    hintText: 'Confirm Password',
                    icon: Icons.lock,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter confirm password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  ElevatedButton(
                    onPressed: () {
                      if (_key.currentState?.validate() ?? false) {
                        context.read<RegisterBloc>().add(
                              RegisterStudentEvent(
                                context: context,
                                username: _usernameController.text,
                                email: _emailController.text,
                                address: _addressController.text,
                                phoneNumber: _phoneNumberController.text,
                                password: _passwordController.text,
                                confirmPassword:
                                    _confirmPasswordController.text,
                              ),
                            );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginView(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1F4A9B),
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.02),
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
                        const Text(
                          "Already have an account? ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginView()),
                            );
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
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
        },
      ),
    );
  }
}
