import 'package:dio/dio.dart';
import 'package:skillseek/app/constants/api_endpoints.dart';
import 'package:skillseek/features/auth/data/data_source/auth_data_source.dart';
import 'package:skillseek/features/auth/domain/entity/auth_entity.dart';

class AuthRemoteDataSource implements IAuthDataSource {
  final Dio _dio;

  AuthRemoteDataSource(this._dio);
//  TODO: implement getCurrentUser
  Future<AuthEntity> getCurrentUser() {
    throw UnimplementedError();
  }

  @override
  Future<String> userlogin(String email, String password) async {
    try {
      Response response = await _dio.post(
        ApiEndpoints.login,
        data: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        final str = response.data['token'];
        return str;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> register(AuthEntity user) async {
    try {
      Response response = await _dio.post(
        ApiEndpoints.register,
        data: {
          "email": user.email,
          "phone_number": user.phoneNumber,
          "location": user.location,
          "skill": user.skill,
          "password": user.password,
          "name": user.name,
          "images": user.image ?? "", // Ensuring null safety
          "role": "Customer"
        },
      );

      if (response.statusCode == 201) {
        return;
      } else {
        throw Exception(response.data["message"] ?? "Registration failed");
      }
    } on DioException catch (e) {
      String errorMessage = "Registration failed";
      if (e.response != null) {
        errorMessage = e.response?.data["message"] ?? e.message ?? errorMessage;
      } else if (e.type == DioExceptionType.receiveTimeout) {
        errorMessage =
            "Server took too long to respond. Please try again later.";
      } else if (e.type == DioExceptionType.badResponse) {
        errorMessage = "Invalid response from server.";
      } else if (e.type == DioExceptionType.unknown) {
        errorMessage = "An unknown error occurred.";
      }

      throw Exception(errorMessage);
    } catch (e) {
      throw Exception("An unexpected error occurred: ${e.toString()}");
    }
  }

  // @override
  // Future<String> uploadProfilePicture(File file) async {
  //   try {
  //     String fileName = file.path.split('/').last;
  //     FormData formData = FormData.fromMap(
  //       {
  //         'profilePicture': await MultipartFile.fromFile(
  //           file.path,
  //           filename: fileName,
  //         ),
  //       },
  //     );
  //     Response response = await _dio.post(
  //       ApiEndpoints.uploadImage,
  //       data: formData,
  //     );

  //     if (response.statusCode == 200) {
  //       return response.data['data'];
  //     } else {
  //       throw Exception(response.statusMessage);
  //     }
  //   } on DioException catch (e) {
  //     throw Exception(e);
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  @override
  Future<bool> verifyOtp(String email, String otp) async {
    try {
      Response response = await _dio.post(
        ApiEndpoints.verifyOtp,
        data: {
          "email": email,
          "otp": otp,
        },
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception(response.data['message'] ?? 'OTP verification failed');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? e.message);
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
