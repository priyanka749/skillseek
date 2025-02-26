import 'package:equatable/equatable.dart';
import 'package:skillseek/features/servicesavailable/domain/entity/serviceavailable_entity.dart';

class ServiceState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final List<ServiceEntity> services;
  final String errorMessage;

  const ServiceState({
    required this.isLoading,
    required this.isSuccess,
    required this.services,
    required this.errorMessage,
  });

  /// ✅ Initial state
  factory ServiceState.initial() {
    return const ServiceState(
      isLoading: false,
      isSuccess: false,
      services: [],
      errorMessage: '',
    );
  }

  /// ✅ Copy method for updating state
  ServiceState copyWith({
    bool? isLoading,
    bool? isSuccess,
    List<ServiceEntity>? services,
    String? errorMessage,
  }) {
    return ServiceState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      services: services ?? this.services,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, isSuccess, services, errorMessage];
}
