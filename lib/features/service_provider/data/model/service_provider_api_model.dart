import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:skillseek/features/service_provider/domain/entity/service_provider_entity.dart';

part 'service_provider_api_model.g.dart';

@JsonSerializable()
class ServiceProviderApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String bio;
  final String? profileImage;
  final String location;
  final List<String> skills;

  const ServiceProviderApiModel({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    required this.bio,
    this.profileImage,
    required this.location,
    required this.skills,
  });

  /// ✅ Convert API Model to Domain Entity
  ServiceProviderEntity toEntity() {
    return ServiceProviderEntity(
      id: id ?? '',
      userId: '',
      name: name ?? 'Unknown',
      email: email ?? 'No Email',
      phoneNumber: phoneNumber ?? 'N/A',
      bio: bio,
      profileImage: profileImage ?? '',
      location: location,
      skills: skills,
    );
  }

  factory ServiceProviderApiModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceProviderApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceProviderApiModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phoneNumber,
        bio,
        profileImage,
        location,
        skills,
      ];
}
