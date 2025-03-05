import 'package:skillseek/features/user/domain/entity/user_entity.dart';

abstract interface class ICustomerDataSource {
  /// ✅ Fetch all customers
  Future<List<CustomerEntity>> getAllCustomers();

  /// ✅ Fetch a single customer profile by ID
  Future<CustomerEntity> getCustomerProfile(String id);

  /// ✅ Update customer profile
  Future<CustomerEntity> updateCustomerProfile({
    required String id,
    String? name,
    String? location,
    String? phoneNumber,
    String? profileImagePath,
  });
}
