import 'package:dio/dio.dart';
import 'package:skillseek/app/constants/api_endpoints.dart';
import 'package:skillseek/features/servicesavailable/data/datasource/serviceavailable_datasource.dart';
import 'package:skillseek/features/servicesavailable/data/model/serviceavailable_api_model.dart';
import 'package:skillseek/features/servicesavailable/domain/entity/serviceavailable_entity.dart';

class ServiceRemoteDataSource implements IServiceDataSource {
  final Dio _dio;

  ServiceRemoteDataSource(this._dio);

  @override
  Future<List<ServiceEntity>> getAllServices() async {
    try {
      Response response = await _dio.get(ApiEndpoints.getAllServices);

      print("✅ API Response: ${response.data}"); // ✅ Debugging API Response

      if (response.statusCode == 200) {
        final List<dynamic> serviceList = response.data ?? [];

        return serviceList.map((data) {
          try {
            return ServiceApiModel.fromJson(data)
                .toEntity(); // ✅ Convert API Model to Domain Entity
          } catch (e) {
            print("🚨 Error Mapping Service: $e for data: $data");
            return ServiceEntity(
              id: '',
              userId: '',
              title: 'Error',
              description: 'Error',
              skills: const [],
              image: '',
              createdAt: DateTime.now(),
            );
          }
        }).toList();
      } else {
        throw Exception(response.data["message"] ?? "Failed to fetch services");
      }
    } on DioException catch (e) {
      print("🚨 Dio Exception: ${e.response?.data ?? e.message}");
      throw Exception("Failed to fetch services: ${e.message}");
    }
  }
}
