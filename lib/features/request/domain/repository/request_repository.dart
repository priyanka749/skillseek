import 'package:dartz/dartz.dart';
import 'package:skillseek/core/error/failure.dart';
import 'package:skillseek/features/request/domain/entity/request_entity.dart';

abstract interface class IServiceRequestRepository {
  /// ✅ Send a service request
  Future<Either<Failure, void>> sendRequest(ServiceRequestEntity request);
}
