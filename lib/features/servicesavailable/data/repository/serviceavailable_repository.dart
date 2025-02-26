import 'package:dartz/dartz.dart';
import 'package:skillseek/core/error/failure.dart';
import 'package:skillseek/features/servicesavailable/data/datasource/serviceavailable_datasource.dart';
import 'package:skillseek/features/servicesavailable/domain/entity/serviceavailable_entity.dart';
import 'package:skillseek/features/servicesavailable/domain/repository/serviceavailable_repsoitory.dart';

class ServiceRemoteRepository implements IServiceRepository {
  final IServiceDataSource _serviceRemoteDataSource;

  ServiceRemoteRepository(this._serviceRemoteDataSource);

  @override
  Future<Either<Failure, List<ServiceEntity>>> fetchAllServices() async {
    try {
      final services = await _serviceRemoteDataSource.getAllServices();
      return Right(services);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ServiceEntity>>> getAllServices() async {
    try {
      final services = await _serviceRemoteDataSource.getAllServices();
      return Right(services);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
