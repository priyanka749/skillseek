import 'package:dartz/dartz.dart';
import 'package:skillseek/core/error/failure.dart';
import 'package:skillseek/features/service_provider/domain/entity/service_provider_entity.dart';
import 'package:skillseek/features/service_provider/domain/repository/service_provider_repository.dart';

class GetServiceProviders {
  final IServiceProviderRepository repository;

  GetServiceProviders(this.repository);

  Future<Either<Failure, List<ServiceProviderEntity>>> call({String? skill}) {
    return repository.fetchServiceProviders(skill: skill);
  }
}
