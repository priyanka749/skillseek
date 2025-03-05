class SignUpTestData {
  SignUpTestData._(); // Prevent instantiation

  static const String validUsername = "John Doe";
  static const String validEmail = "john@example.com";
  static const String invalidEmail = "invalid-email";
  static const String validPhoneNumber = "9876543210";
  static const String validAddress = "123 Main St";
  static const String validPassword = "password123";
  static const String mismatchedPassword = "password456";

  static const String emptyFieldMessage = "Please enter this field";
  static const String emailValidationError = "Please enter a valid email";
  static const String passwordMismatchError = "Passwords do not match";
}
