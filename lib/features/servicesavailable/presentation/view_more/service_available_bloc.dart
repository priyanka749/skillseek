import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillseek/core/error/failure.dart';
import 'package:skillseek/features/servicesavailable/domain/entity/serviceavailable_entity.dart';
import 'package:skillseek/features/servicesavailable/domain/usecase/serviceavailable_usecase.dart';
import 'package:skillseek/features/servicesavailable/presentation/view_more/service_available_event.dart';
import 'package:skillseek/features/servicesavailable/presentation/view_more/service_available_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final GetServices getServices;

  ServiceBloc(this.getServices) : super(ServiceState.initial()) {
    on<FetchServices>(_onFetchServices);
  }

  Future<void> _onFetchServices(
    FetchServices event,
    Emitter<ServiceState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: ''));

      // ✅ Call UseCase
      Either<Failure, List<ServiceEntity>> result = await getServices();

      result.fold(
        (failure) {
          print(
              "🚨 Bloc Error: ${failure.message}"); // ✅ Debugging error message
          emit(state.copyWith(
            isLoading: false,
            errorMessage: failure.message ?? "Failed to load services",
          ));
        },
        (services) {
          print(
              "🌟 Services received in Bloc: ${services.length}"); // ✅ Debugging response
          emit(state.copyWith(
            isLoading: false,
            isSuccess: true,
            services: services,
            errorMessage: '',
          ));
        },
      );
    } catch (e) {
      print("🚨 Unexpected Bloc Error: $e");
      emit(state.copyWith(
        isLoading: false,
        errorMessage: "An unexpected error occurred",
      ));
    }
  }
}
