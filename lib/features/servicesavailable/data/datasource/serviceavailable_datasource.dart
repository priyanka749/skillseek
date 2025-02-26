import 'package:skillseek/features/servicesavailable/domain/entity/serviceavailable_entity.dart';

abstract interface class IServiceDataSource {
  Future<List<ServiceEntity>> getAllServices();
}
