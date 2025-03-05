import 'package:dio/dio.dart';
import 'package:skillseek/app/constants/api_endpoints.dart';
import 'package:skillseek/features/user/data/datasource/user_datasource.dart';
import 'package:skillseek/features/user/data/model/user_api_model.dart';
import 'package:skillseek/features/user/domain/entity/user_entity.dart';

class CustomerRemoteDataSource implements ICustomerDataSource {
  final Dio _dio;

  CustomerRemoteDataSource(this._dio);

  /// ✅ Fetch all customers
  @override
  Future<List<CustomerEntity>> getAllCustomers() async {
    try {
      Response response = await _dio.get(ApiEndpoints.getAllCustomers);

      print("✅ API Response: ${response.data}"); // ✅ Debugging API Response

      if (response.statusCode == 200) {
        final List<dynamic> customerList = response.data ?? [];

        return customerList.map((data) {
          try {
            return CustomerApiModel.fromJson(data)
                .toEntity(); // ✅ Convert API Model to Domain Entity
          } catch (e) {
            print("🚨 Error Mapping Customer: $e for data: $data");
            return CustomerEntity(
              id: '',
              userId: '',
              name: 'Error',
              email: 'Error',
              location: 'Error',
              phoneNumber: 'Error',
              profileImage: '',
              createdAt: DateTime.now(),
            );
          }
        }).toList();
      } else {
        throw Exception(response.data["message"] ?? "Failed to fetch customers");
      }
    } on DioException catch (e) {
      print("🚨 Dio Exception: ${e.response?.data ?? e.message}");
      throw Exception("Failed to fetch customers: ${e.message}");
    }
  }

  /// ✅ Fetch a single customer profile by ID
  @override
  Future<CustomerEntity> getCustomerProfile(String id) async {
    try {
      Response response = await _dio.get(ApiEndpoints.getCustomerProfile + id);

      print("✅ API Response: ${response.data}"); // ✅ Debugging API Response

      if (response.statusCode == 200) {
        return CustomerApiModel.fromJson(response.data).toEntity();
      } else {
        throw Exception(response.data["message"] ?? "Failed to fetch customer profile");
      }
    } on DioException catch (e) {
      print("🚨 Dio Exception: ${e.response?.data ?? e.message}");
      throw Exception("Failed to fetch customer profile: ${e.message}");
    }
  }

  /// ✅ Update customer profile (supports image upload)
  @override
  Future<CustomerEntity> updateCustomerProfile({
    required String id,
    String? name,
    String? location,
    String? phoneNumber,
    String? profileImagePath,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "name": name ?? "",
        "location": location ?? "",
        "phoneNumber": phoneNumber ?? "",
        if (profileImagePath != null)
          "profileImage":
              await MultipartFile.fromFile(profileImagePath, filename: "profile.jpg"),
      });

      Response response = await _dio.put(ApiEndpoints.updateCustomerProfile + id, data: formData);

      print("✅ API Response: ${response.data}"); // ✅ Debugging API Response

      if (response.statusCode == 200) {
        return CustomerApiModel.fromJson(response.data).toEntity();
      } else {
        throw Exception(response.data["message"] ?? "Failed to update customer profile");
      }
    } on DioException catch (e) {
      print("🚨 Dio Exception: ${e.response?.data ?? e.message}");
      throw Exception("Failed to update customer profile: ${e.message}");
    }
  }
}
