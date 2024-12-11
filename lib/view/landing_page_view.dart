import 'package:flutter/material.dart';
import 'package:skillseek/view/onboarding_page_view.dart';

class LandingpageView extends StatelessWidget {
  const LandingpageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
         gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1F4A9B), // Deep blue
              Color(0xFF4A90E2), // Lighter blue gradient
            ],
          ),
        ),
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
                      'assets/images/skillseek_white[1].png',
                      fit: BoxFit.contain,
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 0.7,
                    ),
                    const SizedBox(height: 20),
                    
                  ],
                ),
              ),
              // Get Started Button
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    const Spacer(),
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
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 60,
                        ),
                        elevation: 8,
                        shadowColor: Colors.black.withOpacity(0.2),
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F4A9B),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Your gateway to expert services',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 40),
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
