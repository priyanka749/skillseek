import 'package:equatable/equatable.dart';

abstract class CustomerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// ✅ Fetch All Customers
class FetchCustomersEvent extends CustomerEvent {}

/// ✅ Fetch Customer Profile
class FetchCustomerProfileEvent extends CustomerEvent {
  final String id; // ✅ Only fetch logged-in customer

  FetchCustomerProfileEvent(this.id);

  @override
  List<Object?> get props => [id];
}

/// ✅ Update Customer Profile
class UpdateCustomerProfileEvent extends CustomerEvent {
  final String id;
  final String? name;
  final String? location;
  final String? phoneNumber;
  final String? profileImagePath;

  UpdateCustomerProfileEvent({
    required this.id,
    this.name,
    this.location,
    this.phoneNumber,
    this.profileImagePath,
  });

  @override
  List<Object?> get props =>
      [id, name, location, phoneNumber, profileImagePath];
}
