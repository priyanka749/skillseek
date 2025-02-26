import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          style: TextStyle(color: Colors.white), // Set title text to white
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ServiceBloc, ServiceState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white, // Set loading icon to white
              ),
            );
          } else if (state.errorMessage.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 50, color: Colors.red),
                  const SizedBox(height: 10),
                  Text(state.errorMessage,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16, color: Colors.red)),
                ],
              ),
            );
          } else if (state.services.isEmpty) {
            return const Center(
              child: Text("No services available",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
                      child: Container(
                        color: const Color.fromARGB(
                            255, 216, 230, 250), // Set the container to white
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
                                  errorBuilder: (context, error, stackTrace) =>
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
                                          fontSize: screenWidth < 400 ? 14 : 16,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        service.description,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(fontSize: 14),
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
