import 'package:dartz/dartz.dart';
import 'package:skillseek/core/error/failure.dart';
import 'package:skillseek/features/user/domain/entity/user_entity.dart';
import 'package:skillseek/features/user/domain/repository/user_repository.dart';

class CustomerUseCases {
  final ICustomerRepository repository;

  CustomerUseCases(this.repository);

  /// ✅ Fetch all customers
  Future<Either<Failure, List<CustomerEntity>>> getAllCustomers() {
    return repository.fetchAllCustomers();
  }

  /// ✅ Fetch a single customer profile
  Future<Either<Failure, CustomerEntity>> getCustomerProfile(String id) {
    return repository.getCustomerProfile(id);
  }

  /// ✅ Update customer profile
  Future<Either<Failure, CustomerEntity>> updateCustomerProfile({
    required String id,
    String? name,
    String? location,
    String? phoneNumber,
    String? profileImagePath,
  }) {
    return repository.updateCustomerProfile(
      id: id,
      name: name,
      location: location,
      phoneNumber: phoneNumber,
      profileImagePath: profileImagePath,
    );
  }
}
