import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillseek/features/service_provider/presentation/view_model/services/service_provider_bloc.dart';
import 'package:skillseek/features/service_provider/presentation/view_model/services/service_provider_event.dart';
import 'package:skillseek/features/service_provider/presentation/view_model/services/service_provider_state.dart';

class ServiceProviderScreen extends StatelessWidget {
  const ServiceProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Service Providers")),
      body: BlocProvider.value(
        value: context.read<ServiceProviderBloc>()
          ..add(FetchServiceProviders()), // ✅ Reuse existing Bloc
        child: const ServiceProviderList(),
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
          return const Center(child: CircularProgressIndicator());
        } else if (state.errorMessage.isNotEmpty) {
          return Center(
              child: Text(state.errorMessage,
                  style: const TextStyle(color: Colors.red)));
        } else if (state.providers.isEmpty) {
          return const Center(child: Text("No service providers available"));
        } else {
          return ListView.builder(
            itemCount: state.providers.length,
            itemBuilder: (context, index) {
              final provider = state.providers[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  leading: CircleAvatar(
                    backgroundImage: provider.profileImage != null &&
                            provider.profileImage!.isNotEmpty
                        ? NetworkImage(
                            "http://10.0.2.2:3000${provider.profileImage!}") // Ensure full URL
                        : const AssetImage("assets/default_profile.png")
                            as ImageProvider,
                  ),
                  title: Text(provider.name,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("📍 ${provider.location}"),
                      Text("📧 ${provider.email}"),
                      Text("📞 ${provider.phoneNumber}"),
                      Text("📝 ${provider.bio}"),
                      Text("🔧 Skills: ${provider.skills.join(", ")}"),
                    ],
                  ),
                  onTap: () {
                    // Handle onTap if needed
                  },
                ),
              );
            },
          );
        }
      },
    );
  }
}
