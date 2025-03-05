import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skillseek/core/error/failure.dart';
import 'package:skillseek/features/user/domain/entity/user_entity.dart';
import 'package:skillseek/features/user/domain/usecase/user_usecase.dart';
import 'package:skillseek/features/user/presentation/view_more/user_bloc.dart';
import 'package:skillseek/features/user/presentation/view_more/user_event.dart';
import 'package:skillseek/features/user/presentation/view_more/user_state.dart';

class MockCustomerUseCases extends Mock implements CustomerUseCases {}

void main() {
  late MockCustomerUseCases mockCustomerUseCases;
  late CustomerBloc customerBloc;

  setUp(() {
    mockCustomerUseCases = MockCustomerUseCases();
    customerBloc = CustomerBloc(mockCustomerUseCases);
  });

  group('CustomerBloc', () {
    final customerEntity = CustomerEntity(
      id: '',
      name: 'John Doe',
      email: 'john.doe@example.com',
      phoneNumber: '1234567890',
      location: 'New York',
      userId: '',
      profileImage: '',
      createdAt: DateTime.now(),
    );

    final customers = [customerEntity];

    test('initial state is correct', () {
      expect(customerBloc.state, CustomerState.initial());
    });

    blocTest<CustomerBloc, CustomerState>(
      'emits [isLoading, isSuccess] when FetchCustomersEvent is added and customers are fetched successfully',
      build: () {
        when(() => mockCustomerUseCases.getAllCustomers())
            .thenAnswer((_) async => Right(customers));
        return customerBloc;
      },
      act: (bloc) => bloc.add(FetchCustomersEvent()),
      expect: () => [
        CustomerState.initial().copyWith(isLoading: true),
        CustomerState.initial().copyWith(
          isLoading: false,
          isSuccess: true,
          customers: customers,
          errorMessage: '',
          successMessage: '',
        ),
      ],
      verify: (_) {
        verify(() => mockCustomerUseCases.getAllCustomers()).called(1);
      },
    );

    blocTest<CustomerBloc, CustomerState>(
      'emits [isLoading, errorMessage] when FetchCustomersEvent fails',
      build: () {
        when(() => mockCustomerUseCases.getAllCustomers()).thenAnswer(
            (_) async =>
                const Left(ApiFailure(message: 'Failed to load customers')));
        return customerBloc;
      },
      act: (bloc) => bloc.add(FetchCustomersEvent()),
      expect: () => [
        CustomerState.initial().copyWith(isLoading: true),
        CustomerState.initial().copyWith(
          isLoading: false,
          isSuccess: false,
          customers: [],
          errorMessage: 'Failed to load customers',
          successMessage: '',
        ),
      ],
      verify: (_) {
        verify(() => mockCustomerUseCases.getAllCustomers()).called(1);
      },
    );

    blocTest<CustomerBloc, CustomerState>(
      'emits [isLoading, errorMessage] when UpdateCustomerProfileEvent fails',
      build: () {
        when(() => mockCustomerUseCases.updateCustomerProfile(
                  id: '1',
                  name: 'John Doe',
                  location: 'New York',
                  phoneNumber: '1234567890',
                  profileImagePath: 'https://example.com/image.jpg',
                ))
            .thenAnswer((_) async =>
                const Left(ApiFailure(message: 'Failed to update profile')));
        return customerBloc;
      },
      act: (bloc) => bloc.add(UpdateCustomerProfileEvent(
        id: '1',
        name: 'John Doe',
        location: 'New York',
        phoneNumber: '1234567890',
        profileImagePath: 'https://example.com/image.jpg',
      )),
      expect: () => [
        CustomerState.initial().copyWith(isLoading: true),
        CustomerState.initial().copyWith(
          isLoading: false,
          isSuccess: false,
          errorMessage: 'Failed to update profile',
          successMessage: '',
        ),
      ],
      verify: (_) {
        verify(() => mockCustomerUseCases.updateCustomerProfile(
              id: '1',
              name: 'John Doe',
              location: 'New York',
              phoneNumber: '1234567890',
              profileImagePath: 'https://example.com/image.jpg',
            )).called(1);
      },
    );
  });
}
