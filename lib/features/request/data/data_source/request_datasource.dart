import 'package:skillseek/features/request/domain/entity/request_entity.dart';

abstract class IServiceRequestRemoteDataSource {
  Future<ServiceRequestEntity> sendRequest(
      String providerUserId, String serviceTitle, String message);
}
