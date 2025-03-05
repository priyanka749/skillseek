import 'dart:async';

import 'package:flutter/material.dart';
import 'package:proximity_sensor/proximity_sensor.dart';
import 'package:skillseek/features/dashboard/presentation/view/dashboard_view.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  StreamSubscription<int>? _proximitySubscription; // Subscription for proximity sensor
  bool _isLoading = false; // To manage the loading spinner
  bool _isProximityNear = false; // To track if proximity sensor is near

  @override
  void initState() {
    super.initState();
    _startListeningToProximity(); // Start listening to proximity sensor
  }

  /// Start listening to the Proximity Sensor
  void _startListeningToProximity() {
    try {
      _proximitySubscription = ProximitySensor.events.listen((event) {
        setState(() {
          _isProximityNear = event == 1; // Check if the sensor is near
        });
        print("Proximity Event: $event"); // Log the proximity event
      });
    } catch (e) {
      print("❌ Proximity Sensor not available: $e");
    }
  }

  // Delayed refresh with loading indicator
  void _delayedRefresh() async {
    // Start loading
    setState(() {
      _isLoading = true;
    });

    // Wait for 5 seconds before showing the loading spinner for 2 seconds
    await Future.delayed(const Duration(seconds: 5));

    // Show loading for 2 seconds
    await Future.delayed(const Duration(seconds: 2));

    // Refresh the screen after 2 seconds
    setState(() {
      _isLoading = false; // Hide the loading spinner
    });

    print("Screen refreshed due to proximity!");
  }

  @override
  void dispose() {
    _proximitySubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isProximityNear ? Colors.grey[300] : Colors.white, // Change the background based on proximity
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F4A9B),
        elevation: 0,
        title: const Text(
          "About SkillSeek",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/images/home-cleaning-services-500x500 1.png",
                  height: 150,
                ),
                const SizedBox(height: 20),

                const Text(
                  "About SkillSeek",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F4A9B),
                  ),
                ),
                const SizedBox(height: 8),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "SkillSeek is a platform that connects skilled professionals with customers. "
                    "Our goal is to make service-seeking easy and accessible for everyone.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 8),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "From home services to professional consultations, SkillSeek brings experts closer to you. "
                    "Join us and find the right service provider effortlessly!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 20),

                if (_isLoading) const CircularProgressIndicator(),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashboardView(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1F4A9B),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("Back to Home"),
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

class ProximityEvent {
}
