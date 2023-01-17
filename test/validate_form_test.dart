import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_demo/validate_form.dart';

void main() {
  group('Email validation', () {
    test('Empty email should show error text', () {
      //test emails
      String? emptyEmail = ValidateForm.validateEmail('');
      expect(emptyEmail, 'Email is required');
    });

    test('Emaiil should contain @', () {
      //test emails
      String? testInvalidEmail = ValidateForm.validateEmail("helloemail");
      String? testValidEmail = ValidateForm.validateEmail("hello@gmial.com");

      expect(testInvalidEmail, 'Enter valid email');
      expect(testValidEmail, isNull);
    });
  });
  group('Password Validation', () {
    test('Empty password should show error text', () {
      //test passwords
      String? emptyPassword = ValidateForm.validatePassword('');
      String? nonEmptyValidPassword =
          ValidateForm.validatePassword("Eightdigitpassword");
      expect(emptyPassword, 'Password is required');
      expect(nonEmptyValidPassword, isNull);
    });
    test('8 character password are valid', () {
      String? shortPassword = ValidateForm.validatePassword('short');
      String? longValidPassword = ValidateForm.validatePassword('longpassword');

      expect(shortPassword, 'Password must be at least 8 character long');
      expect(longValidPassword, isNull);
    });
  });
}
