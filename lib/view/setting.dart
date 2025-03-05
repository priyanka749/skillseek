// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:sensors_plus/sensors_plus.dart'; // Ensure this package is included in pubspec.yaml
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:skillseek/features/auth/presentation/view/login_view.dart';

// class Setting extends StatefulWidget {
//   const Setting({super.key});

//   @override
//   State<Setting> createState() => _SettingState();
// }

// class _SettingState extends State<Setting> {
//   // Declare variables
//   StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
//   final double _shakeThreshold = 15.0; // Adjust shake sensitivity
//   int _shakeCount = 0;
//   final int _shakeCountThreshold = 3;
//   double _previousX = 0, _previousY = 0, _previousZ = 0;

//   @override
//   void initState() {
//     super.initState();
//     _startShakeDetection();
//   }

//   /// ✅ Shake Detection for Logout
//   void _startShakeDetection() {
//     // Listen to the accelerometer events (shake detection)
//     _accelerometerSubscription =
//         accelerometerEvents.listen((AccelerometerEvent event) {
//       // Calculate the differences in the X, Y, and Z axes
//       double deltaX = (_previousX - event.x).abs();
//       double deltaY = (_previousY - event.y).abs();
//       double deltaZ = (_previousZ - event.z).abs();

//       // Update previous values
//       _previousX = event.x;
//       _previousY = event.y;
//       _previousZ = event.z;

//       // Check if any of the axis differences exceeds the shake threshold
//       if ((deltaX > _shakeThreshold ||
//           deltaY > _shakeThreshold ||
//           deltaZ > _shakeThreshold)) {
//         _shakeCount++;
//         print("Shake Count: $_shakeCount");

//         // If the shake count exceeds the threshold, log the user out
//         if (_shakeCount >= _shakeCountThreshold) {
//           print("🚀 Shake detected! Logging out...");
//           _logoutUser();
//           _shakeCount = 0; // Reset shake count after logging out
//         }
//       }
//     });
//   }

//   // Function to handle the logout process
//   Future<void> _logoutUser() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove('token'); // Remove the token from SharedPreferences
//     print("✅ Token removed. Redirecting to login...");

//     if (mounted) {
//       // Navigate to the Login screen after logging out
//       Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(builder: (context) => LoginView()),
//         (route) => false, // Remove all previous routes
//       );
//     }
//   }

//   @override
//   void dispose() {
//     // Cancel accelerometer subscription when the screen is disposed
//     _accelerometerSubscription?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Settings')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Shake your phone to logout',
//               style: TextStyle(fontSize: 18),
//             ),
//             const SizedBox(height: 20),
//             SizedBox(
//               width: double.infinity, // Button takes full width
//               child: ElevatedButton(
//                 onPressed: _logoutUser, // Manual Logout
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.red, // Red logout button
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
//                 ),
//                 child: const Text(
//                   'Logout',
//                   style: TextStyle(color: Colors.white, fontSize: 18),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skillseek/features/auth/presentation/view/login_view.dart';
import 'package:skillseek/features/dashboard/presentation/view/dashboard_view.dart';
import 'package:skillseek/features/user/presentation/view/user_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Color(0xFF1F4A9B),
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      home: const Setting(),
    );
  }
}

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  final double _shakeThreshold = 15.0;
  int _shakeCount = 0;
  final int _shakeCountThreshold = 1;
  double _previousX = 0, _previousY = 0, _previousZ = 0;

  @override
  void initState() {
    super.initState();
    _startShakeDetection();
  }

  void _startShakeDetection() {
    _accelerometerSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) {
      double deltaX = (_previousX - event.x).abs();
      double deltaY = (_previousY - event.y).abs();
      double deltaZ = (_previousZ - event.z).abs();

      _previousX = event.x;
      _previousY = event.y;
      _previousZ = event.z;

      if ((deltaX > _shakeThreshold ||
          deltaY > _shakeThreshold ||
          deltaZ > _shakeThreshold)) {
        _shakeCount++;
        print("Shake Count: $_shakeCount");

        if (_shakeCount >= _shakeCountThreshold) {
          print("🚀 Shake detected! Logging out...");
          _logoutUser();
          _shakeCount = 0;
        }
      }
    });
  }

  Future<void> _logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    print("✅ Token removed. Redirecting to login...");

    if (mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginView()),
        (route) => false,
      );
    }
  }

  @override
  void dispose() {
    _accelerometerSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: const Color(0xFF1F4A9B),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Header Container with Buttons
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFF1F4A9B),
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1A1F4A9B),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 70.0,
                    backgroundImage: AssetImage('assets/images/person.png'),
                  ),
                  const SizedBox(height: 10),

                  // Buttons inside the profile container
                  _buildButton(
                    context: context,
                    text: 'Profile',
                    icon: Icons.person,
                    color: const Color(0xFF1F4A9B),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CustomerScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  _buildButton(
                    context: context,
                    text: 'Home',
                    icon: Icons.home,
                    color: const Color(0xFF1F4A9B),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashboardView(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  _buildButton(
                    context: context,
                    text: 'Help',
                    icon: Icons.help,
                    color: const Color(0xFF1F4A9B),
                    onPressed: () {
                      print("Help button pressed");
                    },
                  ),

                  const SizedBox(height: 10),
                  _buildButton(
                    context: context,
                    text: 'Logout',
                    icon: Icons.logout,
                    color: const Color(0xFF1F4A9B),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginView(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Shake instruction card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone_android, color: Color(0xFF1F4A9B)),
                    SizedBox(width: 10),
                    Text(
                      'Shake your phone to logout',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1F4A9B),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required String text,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white),
        label: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
