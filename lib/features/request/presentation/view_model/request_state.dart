import 'package:equatable/equatable.dart';

class ServiceRequestState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  const ServiceRequestState({
    required this.isLoading,
    required this.isSuccess,
    this.errorMessage,
  });

  factory ServiceRequestState.initial() {
    return const ServiceRequestState(
      isLoading: false,
      isSuccess: false,
      errorMessage: null,
    );
  }

  ServiceRequestState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return ServiceRequestState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, isSuccess, errorMessage];
}
