import 'package:equatable/equatable.dart';

class ServiceEntity extends Equatable {
  final String id;
  final String userId;
  final String title;
  final String description;
  final List<String> skills;
  final String image;
  final DateTime createdAt;

  const ServiceEntity({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.skills,
    required this.image,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        title,
        description,
        skills,
        image,
        createdAt,
      ];
}
