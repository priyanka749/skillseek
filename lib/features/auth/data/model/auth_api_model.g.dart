// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthApiModel _$AuthApiModelFromJson(Map<String, dynamic> json) => AuthApiModel(
      id: json['_id'] as String?,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      location: json['location'] as String,
      skill: json['skill'] as String,
      name: json['name'] as String,
      password: json['password'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$AuthApiModelToJson(AuthApiModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'name': instance.name,
      'location': instance.location,
      'skill': instance.skill,
      'password': instance.password,
      'image': instance.image,
    };
