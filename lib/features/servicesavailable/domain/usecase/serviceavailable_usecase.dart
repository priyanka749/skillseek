import 'package:dartz/dartz.dart';
import 'package:skillseek/core/error/failure.dart';
import 'package:skillseek/features/servicesavailable/domain/entity/serviceavailable_entity.dart';
import 'package:skillseek/features/servicesavailable/domain/repository/serviceavailable_repsoitory.dart';

class GetServices {
  final IServiceRepository repository;

  GetServices(this.repository);

  Future<Either<Failure, List<ServiceEntity>>> call() {
    return repository.fetchAllServices();
  }
}
