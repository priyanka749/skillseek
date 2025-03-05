// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:skillseek/features/request/presentation/view_model/request_bloc.dart';
// import 'package:skillseek/features/service_provider/presentation/view_model/services/service_provider_bloc.dart';
// import 'package:skillseek/features/service_provider/presentation/view_model/services/service_provider_event.dart';
// import 'package:skillseek/features/service_provider/presentation/view_model/services/service_provider_state.dart';
// import 'package:skillseek/view/message.dart';

// class ServiceProviderScreen extends StatelessWidget {
//   const ServiceProviderScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<ServiceProviderBloc>(
//           create: (_) =>
//               context.read<ServiceProviderBloc>()..add(FetchServiceProviders()),
//         ),
//         BlocProvider<ServiceRequestBloc>(
//           create: (_) => context.read<ServiceRequestBloc>(),
//         ),
//       ],
//       child: Scaffold(
//         backgroundColor: const Color(0xFF1F4A9B),
//         appBar: AppBar(
//           title: const Text("Service Providers",
//               style: TextStyle(color: Colors.white)),
//           backgroundColor: const Color(0xFF1F4A9B),
//           iconTheme: const IconThemeData(color: Colors.white),
//         ),
//         body: const ServiceProviderList(),
//       ),
//     );
//   }
// }

// class ServiceProviderList extends StatelessWidget {
//   const ServiceProviderList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ServiceProviderBloc, ServiceProviderState>(
//       builder: (context, state) {
//         if (state.isLoading) {
//           return const Center(
//               child: CircularProgressIndicator(color: Colors.white));
//         } else if (state.errorMessage.isNotEmpty) {
//           return Center(
//               child: Text(state.errorMessage,
//                   style: const TextStyle(color: Colors.red, fontSize: 16)));
//         } else if (state.providers.isEmpty) {
//           return const Center(
//               child: Text("No service providers available",
//                   style: TextStyle(color: Colors.white, fontSize: 18)));
//         } else {
//           return Scrollbar(
//             thickness: 5,
//             radius: const Radius.circular(10),
//             child: ListView.builder(
//               padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//               itemCount: state.providers.length,
//               itemBuilder: (context, index) {
//                 final provider = state.providers[index];

//                 return Container(
//                   margin: const EdgeInsets.only(bottom: 12),
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.1),
//                         blurRadius: 5,
//                         spreadRadius: 2,
//                         offset: const Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           CircleAvatar(
//                             radius: 30,
//                             backgroundColor: Colors.grey[
//                                 300], // ✅ Background color for placeholder
//                             backgroundImage: provider.profileImage != null &&
//                                     provider.profileImage!.isNotEmpty
//                                 ? NetworkImage(
//                                     "http://10.0.2.2:3000${provider.profileImage!}")
//                                 : null, // ✅ If image fails, show icon instead
//                             child: (provider.profileImage == null ||
//                                     provider.profileImage!.isEmpty)
//                                 ? const Icon(Icons.person,
//                                     size: 30, color: Colors.black54)
//                                 : null, // ✅ Default icon when image is missing
//                           ),
//                           const SizedBox(width: 12),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(provider.name,
//                                   style: const TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black)),
//                               Text(provider.location,
//                                   style: const TextStyle(
//                                       fontSize: 14, color: Colors.black54)),
//                             ],
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                       Text("📧 ${provider.email}",
//                           style: const TextStyle(color: Colors.black87)),
//                       Text("📞 ${provider.phoneNumber}",
//                           style: const TextStyle(color: Colors.black87)),
//                       Text("📝 ${provider.bio}",
//                           style: const TextStyle(color: Colors.black87)),
//                       Text("🔧 Skills: ${provider.skills.join(", ")}",
//                           style: const TextStyle(color: Colors.black87)),
//                       const SizedBox(height: 12),

//                       // ✅ "Send Request" Button
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           ElevatedButton(
//                             onPressed: () {
//                               final serviceRequestBloc =
//                                   context.read<ServiceRequestBloc>();

//                               // Show success popup after a short delay
//                               Future.delayed(const Duration(seconds: 1), () {
//                                 // Navigate to the MessageBoxScreen
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) =>
//                                         const MessageBoxScreen(),
//                                   ),
//                                 );
//                               });
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.green, // Green button
//                               foregroundColor: Colors.white, // White text color
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 20, vertical: 12),
//                               textStyle: const TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.bold),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius:
//                                     BorderRadius.circular(8), // Rounded corners
//                               ),
//                             ),
//                             child: const Text('Send Request'),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           );
//         }
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillseek/features/request/presentation/view_model/request_bloc.dart';
import 'package:skillseek/features/service_provider/presentation/view_model/services/service_provider_bloc.dart';
import 'package:skillseek/features/service_provider/presentation/view_model/services/service_provider_event.dart';
import 'package:skillseek/features/service_provider/presentation/view_model/services/service_provider_state.dart';
import 'package:skillseek/view/message.dart';

class ServiceProviderScreen extends StatelessWidget {
  const ServiceProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ServiceProviderBloc>(
          create: (_) =>
              context.read<ServiceProviderBloc>()..add(FetchServiceProviders()),
        ),
        BlocProvider<ServiceRequestBloc>(
          create: (_) => context.read<ServiceRequestBloc>(),
        ),
      ],
      child: Scaffold(
        backgroundColor: const Color(0xFF1F4A9B),
        appBar: AppBar(
          title: const Text(
            "Service Providers",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          backgroundColor: const Color(0xFF1F4A9B),
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
        ),
        body: const ServiceProviderList(),
      ),
    );
  }
}

class ServiceProviderList extends StatelessWidget {
  const ServiceProviderList({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery for responsive design
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final isCompact = screenWidth < 600; // Mobile or compact view

    return BlocBuilder<ServiceProviderBloc, ServiceProviderState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 3.0,
            ),
          );
        } else if (state.errorMessage.isNotEmpty) {
          return Center(
            child: Text(
              state.errorMessage,
              style: TextStyle(
                color: Colors.red[400],
                fontSize: isCompact ? 14 : 16,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          );
        } else if (state.providers.isEmpty) {
          return Center(
            child: Text(
              "No service providers available",
              style: TextStyle(
                color: Colors.white,
                fontSize: isCompact ? 16 : 18,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                letterSpacing: 1.0,
              ),
              textAlign: TextAlign.center,
            ),
          );
        } else {
          return Scrollbar(
            thickness: 5,
            radius: const Radius.circular(10),
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                  vertical: 16.0, horizontal: isCompact ? 12.0 : 20.0),
              itemCount: state.providers.length,
              itemBuilder: (context, index) {
                final provider = state.providers[index];

                return Container(
                  margin: EdgeInsets.only(bottom: isCompact ? 10.0 : 16.0),
                  padding: EdgeInsets.all(isCompact ? 12.0 : 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: isCompact ? 28.0 : 30.0,
                            backgroundColor: Colors.grey[300],
                            backgroundImage: provider.profileImage != null &&
                                    provider.profileImage!.isNotEmpty
                                ? NetworkImage(
                                    "http://10.0.2.2:3000${provider.profileImage!}")
                                : null, // ✅ If image fails, show icon instead
                            child: (provider.profileImage == null ||
                                    provider.profileImage!.isEmpty)
                                ? const Icon(Icons.person,
                                    size: 30, color: Colors.black54)
                                : null, // ✅ Default icon when image is missing
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  provider.name,
                                  style: TextStyle(
                                    fontSize: isCompact ? 16 : 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  provider.location,
                                  style: TextStyle(
                                    fontSize: isCompact ? 12 : 14,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildInfoRow(
                          context, "📧 Email: ${provider.email}", isCompact),
                      const SizedBox(height: 8),
                      _buildInfoRow(context,
                          "📞 Phone: ${provider.phoneNumber}", isCompact),
                      const SizedBox(height: 8),
                      _buildInfoRow(
                          context, "📝 About: ${provider.bio}", isCompact),
                      const SizedBox(height: 8),
                      _buildInfoRow(
                          context,
                          "🔧 Skills: ${provider.skills.join(", ")}",
                          isCompact),
                      const SizedBox(height: 16),

                      // "Send Request" Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              final serviceRequestBloc =
                                  context.read<ServiceRequestBloc>();

                              // Show success popup after a short delay
                              Future.delayed(const Duration(seconds: 1), () {
                                // Navigate to the MessageBoxScreen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const MessageBoxScreen(),
                                  ),
                                );
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: isCompact ? 16.0 : 20.0,
                                  vertical: isCompact ? 10.0 : 12.0),
                              textStyle: TextStyle(
                                  fontSize: isCompact ? 14 : 16,
                                  fontWeight: FontWeight.bold),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(isCompact ? 8 : 10),
                              ),
                              elevation: 4,
                            ),
                            child: const Text('Send Request'),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }

  // Helper method to build info rows with responsive and improved text styling
  Widget _buildInfoRow(BuildContext context, String text, bool isCompact) {
    return Text(
      text,
      style: TextStyle(
        fontSize: isCompact ? 12 : 14,
        color: Colors.black87,
        fontWeight: FontWeight.w500,
        height: 1.2, // Line height for better readability
        letterSpacing: 0.3, // Slight letter spacing for clarity
      ),
    );
  }
}
