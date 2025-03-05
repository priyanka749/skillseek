import 'package:dartz/dartz.dart';
import 'package:skillseek/core/error/failure.dart';
import 'package:skillseek/features/user/domain/entity/user_entity.dart';

abstract interface class ICustomerRepository {
  /// ✅ Fetch all customers
  Future<Either<Failure, List<CustomerEntity>>> fetchAllCustomers();

  /// ✅ Fetch a single customer profile by ID
  Future<Either<Failure, CustomerEntity>> getCustomerProfile(String id);

  /// ✅ Update customer profile
  Future<Either<Failure, CustomerEntity>> updateCustomerProfile({
    required String id,
    String? name,
    String? location,
    String? phoneNumber,
    String? profileImagePath,
  });
}
