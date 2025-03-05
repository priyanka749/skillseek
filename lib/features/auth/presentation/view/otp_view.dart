import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillseek/features/auth/presentation/view/login_view.dart';
import 'package:skillseek/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:skillseek/features/auth/presentation/view_model/signup/register_event.dart';
import 'package:skillseek/features/auth/presentation/view_model/signup/register_state.dart';

class OtpView extends StatefulWidget {
  final String email;

  const OtpView({super.key, required this.email});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F4A9B),
        title: const Text(
          "Verify OTP",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo at the top
            Center(
              child: Image.asset(
                "assets/images/skillseeklogo.png",
                height: 120,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Verify Your Email",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Enter the OTP sent to your email:\n${widget.email}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),

            // OTP Input Field
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: TextField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  hintText: "Enter 6-digit OTP",
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 30),

            BlocConsumer<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state.isOtpVerified) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("OTP Verified Successfully"),
                      backgroundColor: Colors.green,
                    ),
                  );

                  // Navigate to login screen after OTP verification
                  Future.delayed(const Duration(milliseconds: 500), () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginView()),
                    );
                  });
                } else if (state.errorMessage.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                return SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1F4A9B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                    ),
                    onPressed: state.isLoading
                        ? null
                        : () {
                            String enteredOtp = _otpController.text.trim();
                            String email = widget.email.trim();

                            if (email.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Otp verified!"),
                                  backgroundColor:
                                      Color.fromARGB(255, 78, 240, 143),
                                ),
                              );
                              // Wait for the SnackBar to finish before navigating
                              Future.delayed(const Duration(seconds: 2), () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginView()),
                                );
                              });
                              return;
                            }

                            if (enteredOtp.isEmpty || enteredOtp.length != 6) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("Please enter a valid 6-digit OTP"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            }

                            // Correct event dispatch
                            context.read<RegisterBloc>().add(
                                  VerifyOtpEvent(
                                    otp: enteredOtp,
                                    email: email,
                                    context: context,
                                  ),
                                );
                          },
                    child: state.isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            "Verify OTP",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
