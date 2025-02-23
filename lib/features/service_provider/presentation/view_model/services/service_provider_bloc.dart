import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillseek/features/service_provider/domain/usecase/service_provider_usecase.dart';
import 'package:skillseek/features/service_provider/presentation/view_model/services/service_provider_event.dart';
import 'package:skillseek/features/service_provider/presentation/view_model/services/service_provider_state.dart';

class ServiceProviderBloc
    extends Bloc<ServiceProviderEvent, ServiceProviderState> {
  final GetServiceProviders getServiceProviders;

  ServiceProviderBloc(this.getServiceProviders)
      : super(ServiceProviderState.initial()) {
    on<FetchServiceProviders>(_onFetchServiceProviders);
  }
  void _onFetchServiceProviders(
    FetchServiceProviders event,
    Emitter<ServiceProviderState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: ''));

    final result = await getServiceProviders(skill: event.skill);

    result.fold(
      (failure) {
        print("🚨 Bloc Error: ${failure.message}"); // ✅ Print failure message
        emit(state.copyWith(
            isLoading: false,
            errorMessage:
                failure.message ?? "Failed to load service providers"));
      },
      (providers) {
        print(
            "🌟 Providers received in Bloc: ${providers.length}"); // ✅ Print number of providers
        emit(state.copyWith(
          isLoading: false,
          isSuccess: true,
          providers: providers,
          errorMessage: '',
        ));
      },
    );
  }
}
