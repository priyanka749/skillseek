import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillseek/core/common/snackbar/my_snackbar.dart';
import 'package:skillseek/features/request/presentation/view_model/request_bloc.dart';
import 'package:skillseek/features/service_provider/presentation/view_model/services/service_provider_bloc.dart';
import 'package:skillseek/features/service_provider/presentation/view_model/services/service_provider_event.dart';
import 'package:skillseek/features/service_provider/presentation/view_model/services/service_provider_state.dart';

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
          title: const Text("Service Providers",
              style: TextStyle(color: Colors.white)),
          backgroundColor: const Color(0xFF1F4A9B),
          iconTheme: const IconThemeData(color: Colors.white),
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
    return BlocBuilder<ServiceProviderBloc, ServiceProviderState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
              child: CircularProgressIndicator(color: Colors.white));
        } else if (state.errorMessage.isNotEmpty) {
          return Center(
              child: Text(state.errorMessage,
                  style: const TextStyle(color: Colors.red, fontSize: 16)));
        } else if (state.providers.isEmpty) {
          return const Center(
              child: Text("No service providers available",
                  style: TextStyle(color: Colors.white, fontSize: 18)));
        } else {
          return Scrollbar(
            thickness: 5,
            radius: const Radius.circular(10),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              itemCount: state.providers.length,
              itemBuilder: (context, index) {
                final provider = state.providers[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        spreadRadius: 2,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: provider.profileImage != null &&
                                    provider.profileImage!.isNotEmpty
                                ? NetworkImage(
                                    "http://10.0.2.2:3000${provider.profileImage!}")
                                : const AssetImage("assets/default_profile.png")
                                    as ImageProvider,
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(provider.name,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              Text(provider.location,
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.black54)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text("📧 ${provider.email}",
                          style: const TextStyle(color: Colors.black87)),
                      Text("📞 ${provider.phoneNumber}",
                          style: const TextStyle(color: Colors.black87)),
                      Text("📝 ${provider.bio}",
                          style: const TextStyle(color: Colors.black87)),
                      Text("🔧 Skills: ${provider.skills.join(", ")}",
                          style: const TextStyle(color: Colors.black87)),
                      const SizedBox(height: 12),

                      // ✅ "Send Request" Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              final serviceRequestBloc =
                                  context.read<ServiceRequestBloc>();

                              showMySnackBar(
                                context: context,
                                message:
                                    "RequestSent Successfully to ${provider.name}...",
                                color: const Color.fromARGB(255, 10, 203, 97),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text("Send Request"),
                          ),
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
}
