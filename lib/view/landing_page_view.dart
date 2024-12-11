import 'package:flutter/material.dart';
import 'package:skillseek/view/onboarding_page_view.dart';

class LandingpageView extends StatelessWidget {
  const LandingpageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF1F4A9B), // Blue background color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo and Title
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Blue_Simple_Personal_Logo_1_-removebg-preview.png',
                      fit: BoxFit.contain, // Ensures the image scales properly
                      height: MediaQuery.of(context).size.height * 0.5, // 50% of screen height
                      width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
              // Pagination Indicators
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 160),
                    // "Get Started" Button
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to OnboardingPageView
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OnboardingPageView(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1F4A9B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 50,
                        ),
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 244, 244, 244),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
