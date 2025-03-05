import 'package:equatable/equatable.dart';
import 'package:skillseek/features/user/domain/entity/user_entity.dart';

class CustomerState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final List<CustomerEntity> customers;
  final CustomerEntity? selectedCustomer;
  final String errorMessage;
  final String successMessage; // ✅ Added successMessage

  const CustomerState({
    required this.isLoading,
    required this.isSuccess,
    required this.customers,
    this.selectedCustomer,
    required this.errorMessage,
    required this.successMessage, // ✅ Add to constructor
  });

  factory CustomerState.initial() {
    return const CustomerState(
      isLoading: false,
      isSuccess: false,
      customers: [],
      selectedCustomer: null,
      errorMessage: '',
      successMessage: '', // ✅ Ensure default empty value
    );
  }

  /// ✅ Updated `copyWith` Method to Include `successMessage`
  CustomerState copyWith({
    bool? isLoading,
    bool? isSuccess,
    List<CustomerEntity>? customers,
    CustomerEntity? selectedCustomer,
    String? errorMessage,
    String? successMessage, // ✅ Now optional
  }) {
    return CustomerState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      customers: customers ?? this.customers,
      selectedCustomer: selectedCustomer ?? this.selectedCustomer,
      errorMessage: errorMessage ?? this.errorMessage,
      successMessage:
          successMessage ?? this.successMessage, // ✅ Ensures it's always set
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        isSuccess,
        customers,
        selectedCustomer,
        errorMessage,
        successMessage, // ✅ Include in props
      ];
}
