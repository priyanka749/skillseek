// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_provider_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceProviderApiModel _$ServiceProviderApiModelFromJson(
        Map<String, dynamic> json) =>
    ServiceProviderApiModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      bio: json['bio'] as String,
      profileImage: json['profileImage'] as String?,
      location: json['location'] as String,
      skills:
          (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ServiceProviderApiModelToJson(
        ServiceProviderApiModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'bio': instance.bio,
      'profileImage': instance.profileImage,
      'location': instance.location,
      'skills': instance.skills,
    };
