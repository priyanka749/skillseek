import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skillseek/features/service_provider/presentation/view/services_provider.dart';
import 'package:skillseek/features/service_provider/presentation/view_model/services/service_provider_bloc.dart';
import 'package:skillseek/features/service_provider/presentation/view_model/services/service_provider_state.dart';
import 'package:skillseek/features/service_provider/presentation/view_model/services/service_provider_event.dart';
import 'package:skillseek/features/request/presentation/view_model/request_bloc.dart';
import 'package:skillseek/features/request/presentation/view_model/request_state.dart';
import 'package:skillseek/features/request/presentation/view_model/request_event.dart';

import '../test_data/service_provider_test_data.dart';

class MockServiceProviderBloc extends MockBloc<ServiceProviderEvent, ServiceProviderState> implements ServiceProviderBloc {}

class MockServiceRequestBloc extends MockBloc<ServiceRequestEvent, ServiceRequestState> implements ServiceRequestBloc {}

void main() {
  late MockServiceProviderBloc serviceProviderBloc;
  late MockServiceRequestBloc serviceRequestBloc;

  setUp(() {
    serviceProviderBloc = MockServiceProviderBloc();
    serviceRequestBloc = MockServiceRequestBloc();
  });

  // Helper function to load the ServiceProviderScreen with mocked ServiceProviderBloc and ServiceRequestBloc
  Widget loadServiceProviderScreen() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ServiceProviderBloc>(
          create: (_) => serviceProviderBloc,
        ),
        BlocProvider<ServiceRequestBloc>(
          create: (_) => serviceRequestBloc,
        ),
      ],
      child: const MaterialApp(home: ServiceProviderScreen()),
    );
  }

  group('ServiceProviderScreen Widget Tests', () {

    testWidgets('displays no service providers message', (tester) async {
      when(() => serviceProviderBloc.state).thenReturn(const ServiceProviderState(
        isLoading: false,
        providers: [],
        errorMessage: '',
        isSuccess: true,
      ));

      await tester.pumpWidget(loadServiceProviderScreen());
      await tester.pumpAndSettle();

      expect(find.text('No service providers available'), findsOneWidget);
    });

  testWidgets('displays error message when service providers fail to load', (tester) async {
  // Arrange: Provide an error state
  when(() => serviceProviderBloc.state).thenReturn(const ServiceProviderState(
    isLoading: false,
    providers: [],
    errorMessage: 'Failed to load service providers',
    isSuccess: false,
  ));

  // Act: Build the widget
  await tester.pumpWidget(loadServiceProviderScreen());
  await tester.pumpAndSettle();

  // Assert: Verify the error message is displayed
  expect(find.text('Failed to load service providers'), findsOneWidget);
});


testWidgets('displays loading indicator while fetching service providers', (tester) async {
  // Arrange: Provide a loading state
  when(() => serviceProviderBloc.state).thenReturn(const ServiceProviderState(
    isLoading: true,
    providers: [],
    errorMessage: '',
    isSuccess: false,
  ));

  // Act: Build the widget
  await tester.pumpWidget(loadServiceProviderScreen());

  // Assert: Verify loading indicator is shown
  expect(find.byType(CircularProgressIndicator), findsOneWidget);
});



  });
}
