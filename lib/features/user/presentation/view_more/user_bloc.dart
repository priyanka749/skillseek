import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillseek/core/error/failure.dart';
import 'package:skillseek/features/user/domain/entity/user_entity.dart';
import 'package:skillseek/features/user/domain/usecase/user_usecase.dart';
import 'package:skillseek/features/user/presentation/view_more/user_event.dart';
import 'package:skillseek/features/user/presentation/view_more/user_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final CustomerUseCases customerUseCases;

  CustomerBloc(this.customerUseCases) : super(CustomerState.initial()) {
    on<FetchCustomersEvent>(_onFetchCustomers);
    on<FetchCustomerProfileEvent>(_onFetchCustomerProfile);
    on<UpdateCustomerProfileEvent>(_onUpdateCustomerProfile);
  }

  /// ✅ Fetch All Customers (Handles Null & Errors)
  Future<void> _onFetchCustomers(
    FetchCustomersEvent event,
    Emitter<CustomerState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: ''));

      Either<Failure, List<CustomerEntity>> result =
          await customerUseCases.getAllCustomers();

      result.fold(
        (failure) {
          print("🚨 Bloc Error (Fetch Customers): ${failure.message}");
          emit(state.copyWith(
            isLoading: false,
            errorMessage: failure.message ?? "Failed to load customers",
            customers: [],
          ));
        },
        (customers) {
          print("🌟 Customers received in Bloc: ${customers.length}");
          emit(state.copyWith(
            isLoading: false,
            isSuccess: true,
            customers: customers.isNotEmpty
                ? customers
                : [], // ✅ Ensure it's never null
            errorMessage: '',
          ));
        },
      );
    } catch (e) {
      print("🚨 Unexpected Bloc Error (Fetch Customers): $e");
      emit(state.copyWith(
        isLoading: false,
        errorMessage: "An unexpected error occurred",
        customers: [],
      ));
    }
  }

  /// ✅ Fetch Single Customer Profile (Handles Null & Errors)
  Future<void> _onFetchCustomerProfile(
    FetchCustomerProfileEvent event,
    Emitter<CustomerState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: ''));

      Either<Failure, CustomerEntity> result =
          await customerUseCases.getCustomerProfile(event.id);

      result.fold(
        (failure) {
          print("🚨 Bloc Error (Fetch Profile): ${failure.message}");
          emit(state.copyWith(
            isLoading: false,
            errorMessage: failure.message ?? "Failed to load profile",
            selectedCustomer: null, // ✅ Ensure it's null to prevent crashes
          ));
        },
        (customer) {
          print("🌟 Customer profile received: ${customer.name}");
          emit(state.copyWith(
            isLoading: false,
            isSuccess: true,
            selectedCustomer: customer,
            errorMessage: '',
          ));
        },
      );
    } catch (e) {
      print("🚨 Unexpected Bloc Error (Fetch Profile): $e");
      emit(state.copyWith(
        isLoading: false,
        errorMessage: "An unexpected error occurred",
        selectedCustomer: null, // ✅ Ensure it's null to prevent crashes
      ));
    }
  }

  /// ✅ Update Customer Profile (Handles Null & Success Message)
  Future<void> _onUpdateCustomerProfile(
    UpdateCustomerProfileEvent event,
    Emitter<CustomerState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: ''));

      Either<Failure, CustomerEntity> result =
          await customerUseCases.updateCustomerProfile(
        id: event.id,
        name: event.name,
        location: event.location,
        phoneNumber: event.phoneNumber,
        profileImagePath: event.profileImagePath,
      );

      result.fold(
        (failure) {
          print("🚨 Bloc Error (Update Profile): ${failure.message}");
          emit(state.copyWith(
            isLoading: false,
            errorMessage: failure.message ?? "Failed to update profile",
          ));
        },
        (updatedCustomer) {
          print("🌟 Customer profile updated: ${updatedCustomer.name}");
          emit(state.copyWith(
            isLoading: false,
            isSuccess: true,
            selectedCustomer: updatedCustomer,
            errorMessage: '',
          ));

          // ✅ Show Success Message
          Future.delayed(Duration.zero, () {
            emit(state.copyWith(
                successMessage: "Profile updated successfully!"));
          });
        },
      );
    } catch (e) {
      print("🚨 Unexpected Bloc Error (Update Profile): $e");
      emit(state.copyWith(
        isLoading: false,
        errorMessage: "An unexpected error occurred",
      ));
    }
  }
}
