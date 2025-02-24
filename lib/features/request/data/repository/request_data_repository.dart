import 'package:dartz/dartz.dart';
import 'package:skillseek/core/error/failure.dart';
import 'package:skillseek/features/request/data/data_source/request_datasource.dart';

import 'package:skillseek/features/request/domain/entity/request_entity.dart';
import 'package:skillseek/features/request/domain/repository/request_repository.dart';

class ServiceRequestRemoteRepository implements IServiceRequestRepository {
  final IServiceRequestRemoteDataSource _serviceRequestRemoteDataSource;

  ServiceRequestRemoteRepository(this._serviceRequestRemoteDataSource);

  @override
  Future<Either<Failure, void>> sendRequest(ServiceRequestEntity request) async {
    try {
      await _serviceRequestRemoteDataSource.sendRequest(
        request.providerUserId,
        request.serviceDetails,
        request.message,
      );
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
