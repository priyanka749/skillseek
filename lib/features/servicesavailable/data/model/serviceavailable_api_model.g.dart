// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serviceavailable_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceApiModel _$ServiceApiModelFromJson(Map<String, dynamic> json) =>
    ServiceApiModel(
      id: json['_id'] as String,
      userId: json['userId'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      skills:
          (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
      image: json['image'] as String,
      createdAt: ServiceApiModel._fromJson(json['createdAt'] as String),
    );

Map<String, dynamic> _$ServiceApiModelToJson(ServiceApiModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'skills': instance.skills,
      'image': instance.image,
      'createdAt': ServiceApiModel._toJson(instance.createdAt),
    };
