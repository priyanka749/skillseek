import 'package:equatable/equatable.dart';
import 'package:skillseek/features/service_provider/domain/entity/service_provider_entity.dart';

class ServiceProviderState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final List<ServiceProviderEntity> providers;
  final String errorMessage;

  const ServiceProviderState({
    required this.isLoading,
    required this.isSuccess,
    required this.providers,
    required this.errorMessage,
  });

  /// Initial state when BLoC is first created
  factory ServiceProviderState.initial() {
    return const ServiceProviderState(
      isLoading: false,
      isSuccess: false,
      providers: [],
      errorMessage: '',
    );
  }

  /// Used to create a new state by modifying existing state values
  ServiceProviderState copyWith({
    bool? isLoading,
    bool? isSuccess,
    List<ServiceProviderEntity>? providers,
    String? errorMessage,
  }) {
    return ServiceProviderState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      providers: providers ?? this.providers,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, isSuccess, providers, errorMessage];
}
