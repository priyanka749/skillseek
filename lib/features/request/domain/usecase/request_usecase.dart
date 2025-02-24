import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:skillseek/app/usecase/usecase.dart';
import 'package:skillseek/core/error/failure.dart';
import 'package:skillseek/features/request/domain/entity/request_entity.dart';
import 'package:skillseek/features/request/domain/repository/request_repository.dart';

/// ✅ Parameters for sending a service request
class SendServiceRequestParams extends Equatable {
  final String userId;
  final String providerUserId;
  final String serviceDetails;
  final String message;

  const SendServiceRequestParams({
    required this.userId,
    required this.providerUserId,
    required this.serviceDetails,
    required this.message,
  });

  @override
  List<Object?> get props => [
        userId,
        providerUserId,
        serviceDetails,
        message,
      ];
}

/// ✅ Use Case for sending a service request
class SendServiceRequestUseCase implements UsecaseWithParams<void, SendServiceRequestParams> {
  final IServiceRequestRepository repository;

  SendServiceRequestUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(SendServiceRequestParams params) {
    final requestEntity = ServiceRequestEntity(
      userId: params.userId,
      providerUserId: params.providerUserId,
      serviceDetails: params.serviceDetails,
      message: params.message,
    );

    return repository.sendRequest(requestEntity);
  }
}
