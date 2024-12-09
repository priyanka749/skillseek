import 'package:flutter/material.dart';

class LandingpageView extends StatelessWidget {
  const LandingpageView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: const Color(0xFF1F4A9B), // Blue background color
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo and Title
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Updated image path with BoxFit to ensure scaling
                      Image.asset(
                        'assets/images/Blue_Simple_Personal_Logo_1_-removebg-preview.png',
                        fit: BoxFit.contain, // This will scale the image properly
                        height: MediaQuery.of(context).size.height * 0.5, // 50% of screen height
                        width: MediaQuery.of(context).size.width * 0.8,  // 80% of screen width
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
                // Pagination Indicators
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [],
                      ),
                      const SizedBox(height: 140),
                      // "Get Started" Button
                      ElevatedButton(
                        onPressed: () {
                          // Add navigation or functionality here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF1F4A9B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 50),
                        ),
                        child: const Text(
                          'Get Started',
                          style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 244, 244, 244)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  }


void main() {
  runApp(const LandingpageView());
}
