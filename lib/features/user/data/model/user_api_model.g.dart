// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerApiModel _$CustomerApiModelFromJson(Map<String, dynamic> json) =>
    CustomerApiModel(
      id: json['_id'] as String,
      userId: json['userId'] as String?,
      name: json['name'] as String,
      email: json['email'] as String?,
      location: json['location'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      profileImage: json['profileImage'] as String?,
      createdAt: CustomerApiModel._fromJson(json['createdAt'] as String?),
    );

Map<String, dynamic> _$CustomerApiModelToJson(CustomerApiModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'location': instance.location,
      'phoneNumber': instance.phoneNumber,
      'profileImage': instance.profileImage,
      'createdAt': CustomerApiModel._toJson(instance.createdAt),
    };
