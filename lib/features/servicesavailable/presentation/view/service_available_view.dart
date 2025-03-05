

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillseek/features/service_provider/presentation/view/services_provider.dart';
import 'package:skillseek/features/servicesavailable/presentation/view_more/service_available_bloc.dart';
import 'package:skillseek/features/servicesavailable/presentation/view_more/service_available_event.dart';
import 'package:skillseek/features/servicesavailable/presentation/view_more/service_available_state.dart';

class ServiceListScreen extends StatelessWidget {
  const ServiceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F4A9B), // Theme color
        title: const Text(
          "Available Services",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ), // Enhanced title text
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ServiceBloc, ServiceState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white, // Set loading icon to white
                strokeWidth: 3.0, // Slightly thicker for visibility
              ),
            );
          } else if (state.errorMessage.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.errorMessage,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth < 400 ? 14 : 16,
                      color: Colors.red[400],
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 0.5,
                    ), // Enhanced error text
                  ),
                ],
              ),
            );
          } else if (state.services.isEmpty) {
            return const Center(
              child: Text(
                "No services available",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  letterSpacing: 1.0,
                ), // Enhanced no-services text
              ),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<ServiceBloc>().add(FetchServices());
              },
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(state.services.length, (index) {
                    final service = state.services[index];

                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ServiceProviderScreen(
                                  // Pass selected service
                                  ),
                            ),
                          );
                        },
                        child: Container(
                          color: Colors.white, // Changed to white background
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    _getFullImageUrl(service.image),
                                    width: screenWidth *
                                        0.3, // Set dynamic width for images
                                    height: screenHeight *
                                        0.2, // Set dynamic height for images
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(Icons.broken_image,
                                                size: 60,
                                                color: Color.fromARGB(
                                                    255, 91, 120, 159)),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          service.title,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                                screenWidth < 400 ? 16 : 18,
                                            color: Colors.black87,
                                            letterSpacing: 0.5,
                                          ), // Enhanced title text
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          service.description,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize:
                                                screenWidth < 400 ? 12 : 14,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500,
                                            height: 1.2,
                                          ), // Enhanced description text
                                        ),
                                        const SizedBox(height: 10),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context
              .read<ServiceBloc>()
              .add(FetchServices()); // 🔄 Fetch services on button click
        },
        backgroundColor: const Color(0xFF1F4A9B), // Theme color for FAB
        child:
            const Icon(Icons.refresh, color: Colors.white), // White icon color
      ),
    );
  }

  String _getFullImageUrl(String imagePath) {
    String baseUrl =
        "http://10.0.2.2:3000"; // ✅ Ensure this is your backend URL

    if (imagePath.startsWith("http")) {
      return imagePath; // Already a full URL
    }
    return "$baseUrl$imagePath"; // ✅ Ensure correct API image path
  }
}
