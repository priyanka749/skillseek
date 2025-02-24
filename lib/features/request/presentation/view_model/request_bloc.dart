import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillseek/core/common/snackbar/my_snackbar.dart';
import 'package:skillseek/features/request/domain/usecase/request_usecase.dart';
import 'package:skillseek/features/request/presentation/view_model/request_event.dart';
import 'package:skillseek/features/request/presentation/view_model/request_state.dart';

class ServiceRequestBloc extends Bloc<ServiceRequestEvent, ServiceRequestState> {
  final SendServiceRequestUseCase _sendServiceRequestUseCase;

  ServiceRequestBloc({required SendServiceRequestUseCase sendServiceRequestUseCase})
      : _sendServiceRequestUseCase = sendServiceRequestUseCase,
        super(ServiceRequestState.initial()) {
    on<SendServiceRequestEvent>(_onSendServiceRequest);
  }

  void _onSendServiceRequest(
    SendServiceRequestEvent event,
    Emitter<ServiceRequestState> emit,
  ) async {
    // Start loading state
    emit(state.copyWith(isLoading: true));

    // Execute use case
    final result = await _sendServiceRequestUseCase.call(
      SendServiceRequestParams(
        userId: event.userId,
        providerUserId: event.providerUserId,
        serviceDetails: event.serviceDetails,
        message: event.message,
      ),
    );

    // Process the response
    result.fold(
      (failure) {
        emit(state.copyWith(
          isLoading: false,
          isSuccess: false,
          errorMessage: failure.message,
        ));

        showMySnackBar(
          context: event.context,
          message: failure.message ?? "Failed to send request",
          color: Colors.red,
        );
      },
      (_) {
        emit(state.copyWith(isLoading: false, isSuccess: true));

        showMySnackBar(
          context: event.context,
          message: "Service request sent successfully!",
          color: Colors.green,
        );

        // Optionally navigate or refresh UI after sending request
      },
    );
  }
}
