// import 'package:flutter/material.dart';

// void main() {
//   runApp(const SkillSeekApp());
// }

// class SkillSeekApp extends StatelessWidget {
//   const SkillSeekApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: LandingPage(),
//     );
//   }
// }

// class LandingPage extends StatelessWidget {
//   const LandingPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[900], // Matches the blue background
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const Spacer(),
//           // Logo and text
//           const Center(
//             child: Column(
//               children: [
//                 SizedBox(height: 10),
//                 Text(
//                   'SKILL SEEK',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const Spacer(),
//           // Page indicator dots
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 height: 8,
//                 width: 8,
//                 margin: const EdgeInsets.symmetric(horizontal: 4),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//               Container(
//                 height: 8,
//                 width: 8,
//                 margin: const EdgeInsets.symmetric(horizontal: 4),
//                 decoration: const BoxDecoration(
//                   color: Colors.white38,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//               Container(
//                 height: 8,
//                 width: 8,
//                 margin: const EdgeInsets.symmetric(horizontal: 4),
//                 decoration: const BoxDecoration(
//                   color: Colors.white38,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),
//           // Get Started button
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 32.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 // Action for the button
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.white,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 12.0),
//                 child: Text(
//                   'Get Started',
//                   style: TextStyle(
//                     color: Colors.blue[900],
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 40),
//         ],
//       ),
//     );
//   }
// }
