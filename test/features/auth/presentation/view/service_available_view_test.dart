import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skillseek/features/servicesavailable/presentation/view/service_available_view.dart';
import 'package:skillseek/features/servicesavailable/presentation/view_more/service_available_bloc.dart';
import 'package:skillseek/features/servicesavailable/presentation/view_more/service_available_event.dart';
import 'package:skillseek/features/servicesavailable/presentation/view_more/service_available_state.dart';

import '../test_data/service_test_data.dart'; // Import your test data

// Mocking the ServiceBloc
class MockServiceBloc extends MockBloc<ServiceEvent, ServiceState>
    implements ServiceBloc {}

void main() {
  late MockServiceBloc serviceBloc;

  setUp(() {
    serviceBloc = MockServiceBloc();
  });

  // Helper function to load the ServiceListScreen with mocked ServiceBloc
  Widget loadServiceListScreen() {
    return BlocProvider<ServiceBloc>(
      create: (context) => serviceBloc,
      child: const MaterialApp(home: ServiceListScreen()),
    );
  }

  group('ServiceListScreen Tests', () {
   
    testWidgets('check for "No services available" message', (tester) async {
      // Arrange: Provide state with no services
      when(() => serviceBloc.state).thenReturn(const ServiceState(
        isLoading: false,
        services: [],
        errorMessage: '',
        isSuccess: true,
      ));

      // Act: Build the widget
      await tester.pumpWidget(loadServiceListScreen());
      await tester.pumpAndSettle();

      // Assert: Verify "No services available" message
      expect(find.text('No services available'), findsOneWidget);
    });

    testWidgets('displays a list of services', (tester) async {
      // Arrange: Provide state with mock services
      final mockServices = ServiceTestData.getServiceTestData();
      when(() => serviceBloc.state).thenReturn(ServiceState(
        isLoading: false,
        services: mockServices,
        errorMessage: '',
        isSuccess: true,
      ));

      // Act: Build the widget
      await tester.pumpWidget(loadServiceListScreen());
      await tester.pumpAndSettle();

      // Assert: Verify the services' titles are displayed
      expect(find.text('Service 1'), findsOneWidget);
      expect(find.text('Service 2'), findsOneWidget);
      expect(find.text('Service 3'), findsOneWidget);
    });

    testWidgets('check for error message when API fails', (tester) async {
  // Arrange: Provide an error state
  when(() => serviceBloc.state).thenReturn(const ServiceState(
    isLoading: false,
    services: [],
    errorMessage: 'Error fetching services',
    isSuccess: false,
  ));

  // Act: Build the widget
  await tester.pumpWidget(loadServiceListScreen());
  await tester.pumpAndSettle();

  // Assert: Verify the error message is displayed
  expect(find.text('Error fetching services'), findsOneWidget);
});

testWidgets('verify CircularProgressIndicator appears during loading', (tester) async {
  // Arrange: Provide loading state
  when(() => serviceBloc.state).thenReturn(const ServiceState(
    isLoading: true,
    services: [],
    errorMessage: '',
    isSuccess: false,
  ));

  // Act: Build the widget
  await tester.pumpWidget(loadServiceListScreen());

  // Assert: Verify loading spinner is visible
  expect(find.byType(CircularProgressIndicator), findsOneWidget);
});

  });
}
