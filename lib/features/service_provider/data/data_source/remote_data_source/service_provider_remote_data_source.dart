import 'package:dio/dio.dart';
import 'package:skillseek/app/constants/api_endpoints.dart';
import 'package:skillseek/features/service_provider/data/data_source/service_provider_data_source.dart';
import 'package:skillseek/features/service_provider/data/model/service_provider_api_model.dart';
import 'package:skillseek/features/service_provider/domain/entity/service_provider_entity.dart';

class ServiceProviderRemoteDataSource implements IServiceProviderDataSource {
  final Dio _dio;

  ServiceProviderRemoteDataSource(this._dio);

  @override
  Future<List<ServiceProviderEntity>> getServiceProviders() async {
    try {
      Response response = await _dio.get(ApiEndpoints.getServiceProviders);

      print("✅ API Response: ${response.data}"); // ✅ Debugging API Response

      if (response.statusCode == 200) {
        final List<dynamic> providerList = response.data['providers'] ?? [];

        return providerList.map((data) {
          try {
            return ServiceProviderApiModel.fromJson(data).toEntity(); // ✅ Use .toEntity()
          } catch (e) {
            print("🚨 Error Mapping Provider: $e for data: $data");
            return ServiceProviderEntity(
              id: '',
              userId: '',
              name: 'Error',
              email: 'Error',
              phoneNumber: '',
              bio: '',
              profileImage: '',
              location: '',
              skills: [],
            );
          }
        }).toList();
      } else {
        throw Exception(response.data["message"] ?? "Failed to fetch service providers");
      }
    } on DioException catch (e) {
      print("🚨 Dio Exception: ${e.response?.data ?? e.message}");
      throw Exception("Failed to fetch service providers: ${e.message}");
    }
  }
}
