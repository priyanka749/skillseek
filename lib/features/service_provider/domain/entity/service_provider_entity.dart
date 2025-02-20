import 'package:equatable/equatable.dart';

class ServiceProviderEntity extends Equatable {
  final String? id;
  final String userId;
  final String name;
  final String email;
  final String phoneNumber;
  final String bio;
  final String profileImage;
  final double rating;
  final String location;
  final List<String> skills;

  const ServiceProviderEntity({
    this.id,
    required this.userId,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.bio,
    required this.profileImage,
    required this.rating,
    required this.location,
    required this.skills,
  });

  const ServiceProviderEntity.empty()
      : id = null,
        userId = '',
        name = '',
        email = '',
        phoneNumber = '',
        bio = '',
        profileImage = '',
        rating = 0.0,
        location = '',
        skills = const [];

  @override
  List<Object?> get props => [
        id,
        userId,
        name,
        email,
        phoneNumber,
        bio,
        profileImage,
        rating,
        location,
        skills,
      ];
}
