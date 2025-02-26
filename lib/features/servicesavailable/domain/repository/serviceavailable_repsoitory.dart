import 'package:dartz/dartz.dart';
import 'package:skillseek/core/error/failure.dart';
import 'package:skillseek/features/servicesavailable/domain/entity/serviceavailable_entity.dart';

abstract interface class IServiceRepository {
  Future<Either<Failure, List<ServiceEntity>>> fetchAllServices();
  Future<Either<Failure, List<ServiceEntity>>> getAllServices();
}
