import 'package:dartz/dartz.dart';
import 'package:skillseek/core/error/failure.dart';
import 'package:skillseek/features/service_provider/data/data_source/service_provider_data_source.dart';
import 'package:skillseek/features/service_provider/domain/entity/service_provider_entity.dart';
import 'package:skillseek/features/service_provider/domain/repository/service_provider_repository.dart';

class ServiceProviderRemoteRepository implements IServiceProviderRepository {
  final IServiceProviderDataSource _serviceProviderRemoteDataSource;

  ServiceProviderRemoteRepository(this._serviceProviderRemoteDataSource);

  @override
  Future<Either<Failure, List<ServiceProviderEntity>>> fetchServiceProviders({String? skill}) async {
    try {
      final providers = await _serviceProviderRemoteDataSource.getServiceProviders();
      return Right(providers);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ServiceProviderEntity>>> getServiceProviders() async {
    try {
      final providers = await _serviceProviderRemoteDataSource.getServiceProviders();
      return Right(providers);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
