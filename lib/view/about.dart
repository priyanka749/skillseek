// import 'package:flutter/material.dart';
// import 'package:skillseek/features/dashboard/presentation/view/dashboard_view.dart';

// class AboutScreen extends StatefulWidget {
//   const AboutScreen({super.key});

//   @override
//   State<AboutScreen> createState() => _AboutScreenState();
// }

// class _AboutScreenState extends State<AboutScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF1F4A9B), // Themed background
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF1F4A9B),
//         elevation: 0,
//         title: const Text(
//           "About SkillSeek",
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             margin: const EdgeInsets.all(16),
//             padding: const EdgeInsets.all(24),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.1),
//                   blurRadius: 10,
//                   spreadRadius: 2,
//                 ),
//               ],
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // Top Image
//                 Image.asset(
//                   "assets/images/home-cleaning-services-500x500 1.png",
//                   height: 150,
//                 ),
//                 const SizedBox(height: 20),

//                 // About Title
//                 const Text(
//                   "About SkillSeek",
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF1F4A9B),
//                   ),
//                 ),
//                 const SizedBox(height: 8),

//                 // Description
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8),
//                   child: Text(
//                     "SkillSeek is a platform that connects skilled professionals with customers. "
//                     "Our goal is to make service-seeking easy and accessible for everyone.",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                   ),
//                 ),
//                 const SizedBox(height: 8),

//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8),
//                   child: Text(
//                     "From home services to professional consultations, SkillSeek brings experts closer to you. "
//                     "Join us and find the right service provider effortlessly!",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 14, color: Colors.black54),
//                   ),
//                 ),
//                 const SizedBox(height: 20),

//                 // Back Home Button
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const DashboardView(),
//                         ),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF1F4A9B),
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     child: const Text("Back to Home"),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:sensors_plus/sensors_plus.dart';
// import 'package:skillseek/features/dashboard/presentation/view/dashboard_view.dart';

// class AboutScreen extends StatefulWidget {
//   const AboutScreen({super.key});

//   @override
//   State<AboutScreen> createState() => _AboutScreenState();
// }

// class _AboutScreenState extends State<AboutScreen> {
//   double _magX = 0.0, _magY = 0.0, _magZ = 0.0;
//   StreamSubscription<MagnetometerEvent>? _magnetometerSubscription;

//   @override
//   void initState() {
//     super.initState();
//     _startListeningToMagnetometer();
//   }

//   /// ✅ Start listening to the Magnetometer Sensor (Used as a substitute for Proximity Sensor)
//   void _startListeningToMagnetometer() {
//     try {
//       _magnetometerSubscription = magnetometerEvents.listen((event) {
//         setState(() {
//           _magX = event.x;
//           _magY = event.y;
//           _magZ = event.z;
//         });
//       });
//     } catch (e) {
//       print("❌ Magnetometer Sensor not available: $e");
//     }
//   }

//   @override
//   void dispose() {
//     _magnetometerSubscription?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     bool isNear =
//         (_magX.abs() + _magY.abs() + _magZ.abs()) > 50; // Adjust sensitivity

//     return Scaffold(
//       backgroundColor: isNear
//           ? Colors.grey[300]
//           : Colors.white, // Refresh UI based on magnetometer readings
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF1F4A9B),
//         elevation: 0,
//         title: const Text(
//           "About SkillSeek",
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             margin: const EdgeInsets.all(16),
//             padding: const EdgeInsets.all(24),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.1),
//                   blurRadius: 10,
//                   spreadRadius: 2,
//                 ),
//               ],
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // Top Image
//                 Image.asset(
//                   "assets/images/home-cleaning-services-500x500 1.png",
//                   height: 150,
//                 ),
//                 const SizedBox(height: 20),

//                 // About Title
//                 const Text(
//                   "About SkillSeek",
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF1F4A9B),
//                   ),
//                 ),
//                 const SizedBox(height: 8),

//                 // Description
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8),
//                   child: Text(
//                     "SkillSeek is a platform that connects skilled professionals with customers. "
//                     "Our goal is to make service-seeking easy and accessible for everyone.",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                   ),
//                 ),
//                 const SizedBox(height: 8),

//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8),
//                   child: Text(
//                     "From home services to professional consultations, SkillSeek brings experts closer to you. "
//                     "Join us and find the right service provider effortlessly!",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 14, color: Colors.black54),
//                   ),
//                 ),
//                 const SizedBox(height: 20),

//                 // ✅ Display Magnetometer Readings (Used as a proximity alternative)

//                 const SizedBox(height: 20),

//                 // Back Home Button
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const DashboardView(),
//                         ),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF1F4A9B),
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     child: const Text("Back to Home"),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:skillseek/features/dashboard/presentation/view/dashboard_view.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  double _accX = 0.0, _accY = 0.0, _accZ = 0.0;
  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  bool _isLoading = false; // To manage the loading spinner

  @override
  void initState() {
    super.initState();
    _startListeningToAccelerometer();
  }

  /// ✅ Start listening to the Accelerometer Sensor
  void _startListeningToAccelerometer() {
    try {
      _accelerometerSubscription = accelerometerEvents.listen((event) {
        setState(() {
          _accX = event.x;
          _accY = event.y;
          _accZ = event.z;
        });

        // Check if the device was shaken
        if (_isDeviceShaken()) {
          _delayedRefresh();
        }
      });
    } catch (e) {
      print("❌ Accelerometer Sensor not available: $e");
    }
  }

  // Check if the device was shaken based on accelerometer values
  bool _isDeviceShaken() {
    return (_accX.abs() + _accY.abs() + _accZ.abs()) >
        20; // Adjust threshold if needed
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

    print("Screen refreshed due to shake!");
  }

  @override
  void dispose() {
    _accelerometerSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Detect if the phone is shaken (you can adjust the threshold)
    bool isShaken = _isDeviceShaken();

    return Scaffold(
      backgroundColor: isShaken
          ? Colors.grey[300] // Change the background based on shake
          : Colors.white,
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
                // Top Image
                Image.asset(
                  "assets/images/home-cleaning-services-500x500 1.png",
                  height: 150,
                ),
                const SizedBox(height: 20),

                // About Title
                const Text(
                  "About SkillSeek",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F4A9B),
                  ),
                ),
                const SizedBox(height: 8),

                // Description
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

                // Loading Indicator if in loading state
                if (_isLoading) const CircularProgressIndicator(),

                const SizedBox(height: 20),

                // Back Home Button
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
