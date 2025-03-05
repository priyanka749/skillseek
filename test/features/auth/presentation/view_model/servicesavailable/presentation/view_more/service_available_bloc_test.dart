import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skillseek/core/error/failure.dart';
import 'package:skillseek/features/servicesavailable/domain/entity/serviceavailable_entity.dart';
import 'package:skillseek/features/servicesavailable/domain/usecase/serviceavailable_usecase.dart';
import 'package:skillseek/features/servicesavailable/presentation/view_more/service_available_bloc.dart';
import 'package:skillseek/features/servicesavailable/presentation/view_more/service_available_event.dart';
import 'package:skillseek/features/servicesavailable/presentation/view_more/service_available_state.dart';

// Mock the GetServices use case
class MockGetServices extends Mock implements GetServices {}

void main() {
  late MockGetServices mockGetServices;
  late ServiceBloc serviceBloc;

  setUp(() {
    mockGetServices = MockGetServices();
    serviceBloc = ServiceBloc(mockGetServices);
  });

  group('ServiceBloc', () {
    // Create a mock ServiceEntity with all required arguments
    final serviceEntity = ServiceEntity(
      userId: '', // Adding missing 'userId'
      title: 'Service 1', // Adding missing 'title'
      image: 'https://example.com/image.jpg', // Adding missing 'image'
      createdAt: DateTime.now(),
      id: '', // Adding missing 'id'
      description: '', // Adding missing 'description'
      skills: const [], // Adding missing 'skills'
    );
    final serviceList = [serviceEntity];

    test('initial state is correct', () {
      expect(serviceBloc.state, ServiceState.initial());
    });

    group('FetchServices Event', () {
      blocTest<ServiceBloc, ServiceState>(
        'emits [isLoading, isSuccess] when FetchServices is added and services are loaded successfully',
        build: () {
          when(() => mockGetServices()).thenAnswer(
            (_) async => Right(serviceList), // Mock successful service fetch
          );
          return serviceBloc;
        },
        act: (bloc) => bloc.add(FetchServices()),
        expect: () => [
          ServiceState.initial()
              .copyWith(isLoading: true), // Expect loading state
          ServiceState.initial().copyWith(
            // Expect success state with data
            isLoading: false,
            isSuccess: true,
            services: serviceList,
            errorMessage: '',
          ),
        ],
        verify: (_) {
          verify(() => mockGetServices())
              .called(1); // Ensure the use case was called
        },
      );

      blocTest<ServiceBloc, ServiceState>(
        'emits [isLoading, errorMessage] when FetchServices fails',
        build: () {
          when(() => mockGetServices()).thenAnswer(
            (_) async => const Left(
                ApiFailure(message: 'Failed to load services')), // Mock failure
          );
          return serviceBloc;
        },
        act: (bloc) => bloc.add(FetchServices()),
        expect: () => [
          ServiceState.initial()
              .copyWith(isLoading: true), // Expect loading state
          ServiceState.initial().copyWith(
            // Expect failure state with error message
            isLoading: false,
            isSuccess: false,
            errorMessage: 'Failed to load services',
          ),
        ],
        verify: (_) {
          verify(() => mockGetServices())
              .called(1); // Ensure the use case was called
        },
      );

      blocTest<ServiceBloc, ServiceState>(
        'emits [isLoading, errorMessage] when an unexpected error occurs',
        build: () {
          when(() => mockGetServices()).thenThrow(
              Exception('Unexpected error')); // Mock unexpected error
          return serviceBloc;
        },
        act: (bloc) => bloc.add(FetchServices()),
        expect: () => [
          ServiceState.initial()
              .copyWith(isLoading: true), // Expect loading state
          ServiceState.initial().copyWith(
            // Expect error state with error message
            isLoading: false,
            errorMessage: 'An unexpected error occurred',
          ),
        ],
        verify: (_) {
          verify(() => mockGetServices())
              .called(1); // Ensure the use case was called
        },
      );

      blocTest<ServiceBloc, ServiceState>(
        'emits [isLoading, isSuccess] when FetchServices is added and no services are returned',
        build: () {
          when(() => mockGetServices()).thenAnswer(
            (_) async => const Right([]), // Mock empty response (no services)
          );
          return serviceBloc;
        },
        act: (bloc) => bloc.add(FetchServices()),
        expect: () => [
          ServiceState.initial()
              .copyWith(isLoading: true), // Expect loading state
          ServiceState.initial().copyWith(
            // Expect success state with no services and empty message
            isLoading: false,
            isSuccess: true,
            services: [],
            errorMessage: '',
          ),
        ],
        verify: (_) {
          verify(() => mockGetServices())
              .called(1); // Ensure the use case was called
        },
      );

      blocTest<ServiceBloc, ServiceState>(
        'emits [isLoading, errorMessage] when FetchServices is added and the service list is empty',
        build: () {
          when(() => mockGetServices()).thenAnswer(
            (_) async => const Left(ApiFailure(
                message: 'No services found')), // Mock empty list error
          );
          return serviceBloc;
        },
        act: (bloc) => bloc.add(FetchServices()),
        expect: () => [
          ServiceState.initial()
              .copyWith(isLoading: true), // Expect loading state
          ServiceState.initial().copyWith(
            // Expect failure state with no services found message
            isLoading: false,
            isSuccess: false,
            errorMessage: 'No services found',
          ),
        ],
        verify: (_) {
          verify(() => mockGetServices())
              .called(1); // Ensure the use case was called
        },
      );
    });
  });
}
