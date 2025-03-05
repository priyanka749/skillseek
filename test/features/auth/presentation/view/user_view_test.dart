import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skillseek/features/user/presentation/view/user_view.dart';
import 'package:skillseek/features/user/presentation/view_more/user_bloc.dart';
import 'package:skillseek/features/user/presentation/view_more/user_event.dart';
import 'package:skillseek/features/user/presentation/view_more/user_state.dart';

import '../../../auth/presentation/test_data/user_test_data.dart';

class MockCustomerBloc extends MockBloc<CustomerEvent, CustomerState>
    implements CustomerBloc {}

void main() {
  late MockCustomerBloc customerBloc;

  setUp(() {
    customerBloc = MockCustomerBloc();

    // Mocking the event behavior for the bloc
    when(() => customerBloc.state).thenReturn(CustomerState.initial());
  });

  // Helper function to load the CustomerScreen with mocked CustomerBloc
  Widget loadCustomerScreen() {
    return BlocProvider<CustomerBloc>(
      create: (_) => customerBloc,
      child: const MaterialApp(home: CustomerScreen()),
    );
  }

  group('CustomerScreen Widget Tests', () {
    testWidgets('displays no customers message', (tester) async {
      when(() => customerBloc.state).thenReturn(const CustomerState(
        isLoading: false,
        customers: [],
        errorMessage: '',
        isSuccess: true,
        successMessage: '', // Initial value for successMessage
      ));

      await tester.pumpWidget(loadCustomerScreen());
      await tester.pumpAndSettle();

      expect(find.text('No customers found.'), findsOneWidget);
    });

    testWidgets('handles edit functionality', (tester) async {
      final mockCustomers = CustomerTestData.getCustomerTestData();
      when(() => customerBloc.state).thenReturn(CustomerState(
        isLoading: false,
        customers: mockCustomers,
        errorMessage: '',
        isSuccess: true,
        successMessage: '', // Initial value for successMessage
      ));

      await tester.pumpWidget(loadCustomerScreen());
      await tester.pumpAndSettle();

      // Tap on a customer to view the profile
      await tester.tap(find.text('Customer 1'));
      await tester.pumpAndSettle();

      // Tap "Edit Profile" button
      await tester.tap(find.text('Edit Profile'));
      await tester.pumpAndSettle();

      // Verify that edit form fields are pre-populated with the customer data
      expect(find.text('Name'), findsOneWidget);
      expect(find.text('Location'), findsOneWidget);

      // Simulate editing the form
      await tester.enterText(find.byType(TextFormField).at(0), 'Updated Name');
      await tester.enterText(
          find.byType(TextFormField).at(1), 'Updated Location');

      // Simulate saving the changes
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      // Verify that the success message appears
      expect(find.text("✅ Update Successful"), findsOneWidget);
    });


testWidgets('displays a list of customers', (tester) async {
  final mockCustomers = CustomerTestData.getCustomerTestData();
  when(() => customerBloc.state).thenReturn(CustomerState(
    isLoading: false,
    customers: mockCustomers,
    errorMessage: '',
    isSuccess: true,
    successMessage: '',
  ));

  await tester.pumpWidget(loadCustomerScreen());
  await tester.pumpAndSettle();

  for (var customer in mockCustomers) {
    expect(find.text(customer.name), findsOneWidget);
  }
});


  });
}
