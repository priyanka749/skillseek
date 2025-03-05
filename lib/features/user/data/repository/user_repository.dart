import 'package:dartz/dartz.dart';
import 'package:skillseek/core/error/failure.dart';
import 'package:skillseek/features/user/data/datasource/user_datasource.dart';

import 'package:skillseek/features/user/domain/entity/user_entity.dart';
import 'package:skillseek/features/user/domain/repository/user_repository.dart';

class CustomerRemoteRepository implements ICustomerRepository {
  final ICustomerDataSource _customerRemoteDataSource;

  CustomerRemoteRepository(this._customerRemoteDataSource);

  /// ✅ Fetch all customers
  @override
  Future<Either<Failure, List<CustomerEntity>>> fetchAllCustomers() async {
    try {
      final customers = await _customerRemoteDataSource.getAllCustomers();
      return Right(customers);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  /// ✅ Fetch a single customer profile by ID
  @override
  Future<Either<Failure, CustomerEntity>> getCustomerProfile(String id) async {
    try {
      final customer = await _customerRemoteDataSource.getCustomerProfile(id);
      return Right(customer);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  /// ✅ Update customer profile
  @override
  Future<Either<Failure, CustomerEntity>> updateCustomerProfile({
    required String id,
    String? name,
    String? location,
    String? phoneNumber,
    String? profileImagePath,
  }) async {
    try {
      final updatedCustomer = await _customerRemoteDataSource.updateCustomerProfile(
        id: id,
        name: name,
        location: location,
        phoneNumber: phoneNumber,
        profileImagePath: profileImagePath,
      );
      return Right(updatedCustomer);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
