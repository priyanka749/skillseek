class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  static const String baseUrl = "http://10.0.2.2:3000/api/";
  // For iPhone
  //static const String baseUrl = "http://localhost:3000/api/v1/";

  // ====================== Auth Routes ======================
  static const String login = "auth/login";
  static const String register = "auth/register";
  static const String verifyOtp = "auth/verify-otp";

  // static const String getServiceProviders ="provider/";
  static const String getServiceProviders = "provider/";
  static const String sendRequest = "requests/send";
  static const String getAllServices = "services/"; // ✅ Fetch all services
  static const String getProviderServices =
      "services/"; // ✅ Fetch services by provider (append userId)

  // static const String getAllUsers = "auth/getAlluser";
  // static const String getStudentsByBatch = "auth/getStudentsByBatch/";
  // static const String getStudentsByCourse = "auth/getStudentsByCourse/";
  // static const String updateUsers = "auth/updateuser/";
  // static const String deleteUsers = "auth/deleteuser/";
  // static const String imageUrl = "http://10.0.2.2:3000/uploads/";
  static const String uploadImage = "auth/uploadImage";
  static const String imageUrl =
      "http://10.0.2.2:3000/uploads/"; // ✅ Image base URL
}
