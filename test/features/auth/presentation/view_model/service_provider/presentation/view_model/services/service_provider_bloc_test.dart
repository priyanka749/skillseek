import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skillseek/core/error/failure.dart';
import 'package:skillseek/features/service_provider/domain/entity/service_provider_entity.dart';
import 'package:skillseek/features/service_provider/domain/usecase/service_provider_usecase.dart';
import 'package:skillseek/features/service_provider/presentation/view_model/services/service_provider_bloc.dart';
import 'package:skillseek/features/service_provider/presentation/view_model/services/service_provider_event.dart';
import 'package:skillseek/features/service_provider/presentation/view_model/services/service_provider_state.dart';

// Mock the GetServiceProviders use case
class MockGetServiceProviders extends Mock implements GetServiceProviders {}

void main() {
  late MockGetServiceProviders mockGetServiceProviders;
  late ServiceProviderBloc serviceProviderBloc;

  setUp(() {
    mockGetServiceProviders = MockGetServiceProviders();
    serviceProviderBloc = ServiceProviderBloc(mockGetServiceProviders);
  });

  group('ServiceProviderBloc', () {
    const serviceProviderEntity = ServiceProviderEntity(
      id: '',
      name: 'Provider 1',
      location: 'New York',
      userId: '',
      email: '',
      phoneNumber: '',
      bio: '',
      skills: [],
    );
    final serviceProviderList = [serviceProviderEntity];

    test('initial state is correct', () {
      expect(serviceProviderBloc.state, ServiceProviderState.initial());
    });

    blocTest<ServiceProviderBloc, ServiceProviderState>(
      'emits [isLoading, isSuccess] when FetchServiceProviders is added and providers are loaded successfully',
      build: () {
        when(() => mockGetServiceProviders(skill: 'Plumbing')).thenAnswer(
          (_) async => Right(
              serviceProviderList), // Mock successful service provider fetch
        );
        return serviceProviderBloc;
      },
      act: (bloc) => bloc.add(FetchServiceProviders(skill: 'Plumbing')),
      expect: () => [
        ServiceProviderState.initial()
            .copyWith(isLoading: true), // Expect loading state
        ServiceProviderState.initial().copyWith(
          isLoading: false,
          isSuccess: true,
          providers: serviceProviderList,
          errorMessage: '',
        ),
      ],
      verify: (_) {
        verify(() => mockGetServiceProviders(skill: 'Plumbing'))
            .called(1); // Ensure the use case was called
      },
    );

    blocTest<ServiceProviderBloc, ServiceProviderState>(
      'emits [isLoading, errorMessage] when FetchServiceProviders fails',
      build: () {
        when(() => mockGetServiceProviders(skill: 'Plumbing')).thenAnswer(
          (_) async => const Left(ApiFailure(
              message: 'Failed to load service providers')), // Mock failure
        );
        return serviceProviderBloc;
      },
      act: (bloc) => bloc.add(FetchServiceProviders(skill: 'Plumbing')),
      expect: () => [
        ServiceProviderState.initial()
            .copyWith(isLoading: true), // Expect loading state
        ServiceProviderState.initial().copyWith(
          isLoading: false,
          isSuccess: false,
          errorMessage: 'Failed to load service providers',
        ),
      ],
      verify: (_) {
        verify(() => mockGetServiceProviders(skill: 'Plumbing'))
            .called(1); // Ensure the use case was called
      },
    );

    blocTest<ServiceProviderBloc, ServiceProviderState>(
      'emits [isLoading, errorMessage] when no service providers are found',
      build: () {
        when(() => mockGetServiceProviders(skill: 'NonExistingSkill'))
            .thenAnswer(
          (_) async => const Left(ApiFailure(
              message:
                  'No service providers found')), // Mock no service providers
        );
        return serviceProviderBloc;
      },
      act: (bloc) => bloc.add(FetchServiceProviders(skill: 'NonExistingSkill')),
      expect: () => [
        ServiceProviderState.initial()
            .copyWith(isLoading: true), // Expect loading state
        ServiceProviderState.initial().copyWith(
          isLoading: false,
          isSuccess: false,
          errorMessage: 'No service providers found',
        ),
      ],
      verify: (_) {
        verify(() => mockGetServiceProviders(skill: 'NonExistingSkill'))
            .called(1); // Ensure the use case was called
      },
    );
  });
}
