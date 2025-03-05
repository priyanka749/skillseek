import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:skillseek/features/user/domain/entity/user_entity.dart';

part 'user_api_model.g.dart';

@JsonSerializable()
class CustomerApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String id;

  final String? userId;
  final String name;
  final String? email; // ✅ Made nullable
  final String location;
  final String? phoneNumber; // ✅ Made nullable
  final String? profileImage; // ✅ Made nullable

  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  final DateTime? createdAt; // ✅ Made nullable

  const CustomerApiModel({
    required this.id,
    this.userId,
    required this.name,
    this.email,
    required this.location,
    this.phoneNumber,
    this.profileImage,
    this.createdAt,
  });

  /// ✅ Convert API Model to Domain Entity
  CustomerEntity toEntity() {
    const String baseUrl =
        "http://localhost:3000"; // ✅ Update with actual backend URL

    return CustomerEntity(
      id: id,
      userId: userId ?? "", // ✅ Ensure non-null value
      name: name,
      email: email != null && email!.isNotEmpty
          ? email!
          : "No Email Provided", // ✅ Default if null
      location: location,
      phoneNumber: phoneNumber != null && phoneNumber!.isNotEmpty
          ? phoneNumber!
          : "No Phone Number", // ✅ Default if null
      profileImage: profileImage != null && profileImage!.isNotEmpty
          ? (profileImage!.startsWith("http://10.0.2.2:3000")
              ? profileImage!
              : "$baseUrl$profileImage") // ✅ Fix relative URLs
          : "$baseUrl/default_profile.png", // ✅ Default image if null
      createdAt: createdAt ?? DateTime.now(), // ✅ Default timestamp
    );
  }

  /// ✅ Handle null `createdAt`
  static DateTime? _fromJson(String? date) =>
      date != null ? DateTime.parse(date) : null;
  static String? _toJson(DateTime? date) => date?.toIso8601String();

  factory CustomerApiModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerApiModelToJson(this);

  @override
  List<Object?> get props =>
      [id, userId, name, email, location, phoneNumber, profileImage, createdAt];
}
