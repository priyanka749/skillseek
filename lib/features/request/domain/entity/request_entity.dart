import 'package:equatable/equatable.dart';

class ServiceRequestEntity extends Equatable {
  final String? id;
  final String userId;
  final String providerUserId;
  final String serviceDetails;
  final String message;
  final String status;
  final DateTime? createdAt;

  const ServiceRequestEntity({
    this.id,
    required this.userId,
    required this.providerUserId,
    required this.serviceDetails,
    required this.message,
    this.status = "Pending", // Default status is Pending
    this.createdAt,
  });

  const ServiceRequestEntity.empty()
      : id = null,
        userId = '',
        providerUserId = '',
        serviceDetails = '',
        message = '',
        status = 'Pending',
        createdAt = null;

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
