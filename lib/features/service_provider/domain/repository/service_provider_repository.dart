import 'package:dartz/dartz.dart';
import 'package:skillseek/core/error/failure.dart';
import 'package:skillseek/features/service_provider/domain/entity/service_provider_entity.dart';

abstract class IServiceProviderRepository {
  Future<Either<Failure, List<ServiceProviderEntity>>> fetchServiceProviders(
      {String? skill});
}
