import 'package:dio/dio.dart';
import 'package:skillseek/app/constants/api_endpoints.dart';
import 'package:skillseek/features/request/data/data_source/request_datasource.dart';
import 'package:skillseek/features/request/domain/entity/request_entity.dart';

class ServiceRequestRemoteDataSource
    implements IServiceRequestRemoteDataSource {
  final Dio _dio;

  ServiceRequestRemoteDataSource(this._dio);

  @override
  Future<ServiceRequestEntity> sendRequest(
      String providerUserId, String serviceTitle, String message) async {
    try {
      Response response = await _dio.post(
        ApiEndpoints.sendRequest,
        data: {
          "providerUserId": providerUserId,
          "serviceTitle": serviceTitle,
          "message": message,
        },
      );

      if (response.statusCode == 201) {
        final data = response.data;
        return ServiceRequestEntity(
          id: data["_id"],
          userId: data["userId"],
          providerUserId: data["providerUserId"],
          serviceDetails: data["serviceTitle"], // Matching schema
          message: data["message"],
          status: data["status"] ?? "Pending",
          createdAt: DateTime.parse(data["createdAt"]),
        );
      } else {
        throw Exception(response.data["message"] ?? "Failed to send request");
      }
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    } catch (e) {
      throw Exception("An unexpected error occurred: ${e.toString()}");
    }
  }

  String _handleDioError(DioException e) {
    if (e.response != null) {
      return e.response?.data["message"] ?? e.message ?? "Request failed";
    } else if (e.type == DioExceptionType.connectionTimeout) {
      return "Connection timed out. Please try again.";
    } else if (e.type == DioExceptionType.receiveTimeout) {
      return "Server took too long to respond.";
    } else if (e.type == DioExceptionType.badResponse) {
      return "Invalid response from server.";
    } else if (e.type == DioExceptionType.unknown) {
      return "Unknown network error. Please check your internet connection.";
    }
    return "An unexpected error occurred: ${e.message}";
  }
}
