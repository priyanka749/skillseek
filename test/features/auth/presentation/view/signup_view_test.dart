import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skillseek/features/auth/presentation/view/signup_view.dart';
import 'package:skillseek/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:skillseek/features/auth/presentation/view_model/signup/register_event.dart';
import 'package:skillseek/features/auth/presentation/view_model/signup/register_state.dart';


class MockRegisterBloc extends MockBloc<RegisterEvent, RegisterState> implements RegisterBloc {}

void main() {
  late MockRegisterBloc registerBloc;

  setUp(() {
    // Initialize mock for RegisterBloc
    registerBloc = MockRegisterBloc();

    // Register the default behavior for the bloc's state
    when(() => registerBloc.state).thenReturn(RegisterState.initial());
  });

  // Helper function to load SignUpPage with mocked RegisterBloc
  Widget loadSignUpPage() {
    return BlocProvider<RegisterBloc>(
      create: (_) => registerBloc,
      child: const MaterialApp(home: SignUpPage()),
    );
  }

  group('SignUpPage Widget Tests', () {
    testWidgets('displays validation error when form is incomplete', (tester) async {
      await tester.pumpWidget(loadSignUpPage());
      await tester.pumpAndSettle();

      // Tap on the SignUp button without filling the form
      await tester.tap(find.byKey(Key('signUpButton'))); // Find the ElevatedButton with the key
      await tester.pumpAndSettle();

      // Check for validation error on fields
      expect(find.text("Please enter"), findsWidgets);
    });

    testWidgets('successfully fills the form and dispatches RegisterStudentEvent', (tester) async {
      // Mock the state to simulate successful registration
      when(() => registerBloc.state).thenReturn(RegisterState.initial().copyWith(isSuccess: true));

      await tester.pumpWidget(loadSignUpPage());
      await tester.pumpAndSettle();

      // Fill the form with mock data
      await tester.enterText(find.byType(TextFormField).at(0), "John Doe"); // Username
      await tester.enterText(find.byType(TextFormField).at(1), "johndoe@example.com"); // Email
      await tester.enterText(find.byType(TextFormField).at(2), "1234567890"); // Phone Number
      await tester.enterText(find.byType(TextFormField).at(3), "123 Street, City"); // Address
      await tester.enterText(find.byType(TextFormField).at(4), "password123"); // Password
      await tester.enterText(find.byType(TextFormField).at(5), "password123"); // Confirm Password

      // Mock image picker (if applicable)
      when(() => registerBloc.add(RegisterStudentEvent(
            context: any(named: 'context'),
            name: 'John Doe',
            email: 'johndoe@example.com',
            location: '123 Street, City',
            phoneNumber: '1234567890',
            skill: '',
            password: 'password123',
            confirmPassword: 'password123',
            image: 'mock_image.jpg',
          ))).thenReturn(null);

      // Tap on the SignUp button
      await tester.tap(find.byKey(Key('signUpButton'))); // Use the Key here
      await tester.pumpAndSettle();

      // Check if RegisterStudentEvent is called with correct parameters
      verify(() => registerBloc.add(RegisterStudentEvent(
        context: any(named: 'context'),
        name: 'John Doe',
        email: 'johndoe@example.com',
        location: '123 Street, City',
        phoneNumber: '1234567890',
        skill: '',
        password: 'password123',
        confirmPassword: 'password123',
        image: 'mock_image.jpg',
      ))).called(1);

      // Check for success message
      expect(find.text('Registration Successful'), findsOneWidget);
    });
  });
}
