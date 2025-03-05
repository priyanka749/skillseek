import 'package:skillseek/features/user/data/model/user_api_model.dart';

class CustomerEntity {
  final String id;
  final String userId;
  final String name;
  final String email;
  final String location;
  final String phoneNumber;
  final String profileImage;
  final DateTime createdAt;

  CustomerEntity({
    required this.id,
    required this.userId,
    required this.name,
    required this.email,
    required this.location,
    required this.phoneNumber,
    required this.profileImage,
    required this.createdAt,
  });

  /// ✅ Ensure non-nullable fields always have values
  factory CustomerEntity.fromModel(CustomerApiModel model) {
    return CustomerEntity(
      id: model.id,
      userId: model.userId ?? "",
      name: model.name,
      email: model.email ?? "No Email Provided",
      location: model.location,
      phoneNumber: model.phoneNumber ?? "No Phone Number",
      profileImage:
          model.profileImage ?? "http://localhost:3000/default_profile.png",
      createdAt: model.createdAt ?? DateTime.now(),
    );
  }
}
