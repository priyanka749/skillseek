// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceRequestApiModel _$ServiceRequestApiModelFromJson(
        Map<String, dynamic> json) =>
    ServiceRequestApiModel(
      id: json['_id'] as String?,
      userId: json['userId'] as String,
      providerUserId: json['providerUserId'] as String,
      serviceDetails: json['serviceDetails'] as String,
      message: json['message'] as String,
      status: json['status'] as String? ?? "Pending",
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ServiceRequestApiModelToJson(
        ServiceRequestApiModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'providerUserId': instance.providerUserId,
      'serviceDetails': instance.serviceDetails,
      'message': instance.message,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
