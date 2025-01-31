// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthApiModel _$AuthApiModelFromJson(Map<String, dynamic> json) => AuthApiModel(
      userId: json['userId'] as String?,
      username: json['username'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      address: json['address'] as String?,
      role: json['role'] as String,
      skill: json['skill'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
      imageName: json['imageName'] as String,
    );

Map<String, dynamic> _$AuthApiModelToJson(AuthApiModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'role': instance.role,
      'skill': instance.skill,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'imageName': instance.imageName,
    };
