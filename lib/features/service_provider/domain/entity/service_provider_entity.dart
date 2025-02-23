import 'package:equatable/equatable.dart';

class ServiceProviderEntity extends Equatable {
  final String? id;
  final String userId;
  final String name;
  final String email;
  final String phoneNumber;
  final String bio;
  final String? profileImage;
  final String location;
  final List<String> skills;

  const ServiceProviderEntity({
    this.id,
    required this.userId,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.bio,
    this.profileImage,
    required this.location,
    required this.skills,
  });

  factory ServiceProviderEntity.fromJson(Map<String, dynamic> json) {
    print("📌 Raw JSON Data: $json"); // ✅ Print API response for debugging

    return ServiceProviderEntity(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      name: json['name'] ?? 'Unknown',
      email: json['email'] ?? 'No Email',
      phoneNumber: json['phoneNumber'] ?? 'N/A',
      bio: json['bio'] ?? '',
      profileImage: json['profileImage']?.replaceAll('\\', '/'),
      location: json['location'] ?? '',
      skills: (json['skills'] as List<dynamic>?)
              ?.map((e) => e.toString()) // ✅ Convert all values to strings
              .toList() ??
          [],
    );
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        name,
        email,
        phoneNumber,
        bio,
        profileImage,
        location,
        skills,
      ];
}
