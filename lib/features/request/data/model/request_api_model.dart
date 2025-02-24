import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:skillseek/features/request/domain/entity/request_entity.dart';

part 'request_api_model.g.dart';

@JsonSerializable()
class ServiceRequestApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String userId;
  final String providerUserId;
  final String serviceDetails;
  final String message;
  final String status;
  final DateTime? createdAt;

  const ServiceRequestApiModel({
    this.id,
    required this.userId,
    required this.providerUserId,
    required this.serviceDetails,
    required this.message,
    this.status = "Pending",
    this.createdAt,
  });

  /// ✅ Convert from JSON
  factory ServiceRequestApiModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestApiModelFromJson(json);

  /// ✅ Convert to JSON
  Map<String, dynamic> toJson() => _$ServiceRequestApiModelToJson(this);

  /// ✅ Convert to Entity
  ServiceRequestEntity toEntity() => ServiceRequestEntity(
        id: id,
        userId: userId,
        providerUserId: providerUserId,
        serviceDetails: serviceDetails,
        message: message,
        status: status,
        createdAt: createdAt,
      );

  /// ✅ Convert from Entity
  factory ServiceRequestApiModel.fromEntity(ServiceRequestEntity entity) =>
      ServiceRequestApiModel(
        id: entity.id,
        userId: entity.userId,
        providerUserId: entity.providerUserId,
        serviceDetails: entity.serviceDetails,
        message: entity.message,
        status: entity.status,
        createdAt: entity.createdAt,
      );

  @override
  List<Object?> get props => [
        id,
        userId,
        providerUserId,
        serviceDetails,
        message,
        status,
        createdAt,
      ];
}
