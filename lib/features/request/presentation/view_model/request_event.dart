import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ServiceRequestEvent extends Equatable {
  const ServiceRequestEvent();

  @override
  List<Object?> get props => [];
}

/// ✅ Event for sending a service request
class SendServiceRequestEvent extends ServiceRequestEvent {
  final String userId;
  final String providerUserId;
  final String serviceDetails;
  final String message;
  final BuildContext context;

  const SendServiceRequestEvent({
    required this.userId,
    required this.providerUserId,
    required this.serviceDetails,
    required this.message,
    required this.context,
  });

  @override
  List<Object?> get props =>
      [userId, providerUserId, serviceDetails, message, context];
}
