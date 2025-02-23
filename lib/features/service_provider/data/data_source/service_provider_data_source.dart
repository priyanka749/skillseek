import 'package:skillseek/features/service_provider/domain/entity/service_provider_entity.dart';

abstract interface class IServiceProviderDataSource {
  Future<List<ServiceProviderEntity>> getServiceProviders();
}
