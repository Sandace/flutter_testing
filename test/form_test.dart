import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_demo/form.dart';

void main() {
  group('Form Widget test', () {
    testWidgets('Empty Form widget validation', (WidgetTester tester) async {
      Widget testWidget = const MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(
          home: FormDemo(),
        ),
      );

      await tester.pumpWidget(testWidget);

      final btnFinder = find.text('Submit');
      final emailErrorFinder = find.text('Email is required');
      final passwordErrorFinder = find.text('Password is required');

      await tester.tap(btnFinder);
      await tester.pump(const Duration(milliseconds: 300));

      expect(emailErrorFinder, findsOneWidget);
      expect(passwordErrorFinder, findsOneWidget);
    });
    testWidgets('Invalid form data test', (WidgetTester tester) async {
      // Widget testWidget = const MediaQuery(
      //     data: MediaQueryData(),
      //     child: MaterialApp(
      //       home: FormDemo(),
      //     ));
      Widget testWidget = const MaterialApp(
        home: FormDemo(),
      );
      await tester.pumpWidget(testWidget);

      final btnFinder = find.text('Submit');

      final emailErrorFinder = find.text('Enter valid email');
      final passwordErrorFinder =
          find.text('Password must be at least 8 character long');

      //entering value in email field
      var emailFieldKey = const Key('emailKey');
      final emailField = find.byKey(emailFieldKey);
      await tester.enterText(emailField, 'hellogmail.com');

      //entering value in password field
      var paswordFieldKey = const Key('passwordKey');
      final passwordField = find.byKey(paswordFieldKey);
      await tester.enterText(passwordField, 'hello');

      await tester.tap(btnFinder);
      await tester.pump(const Duration(milliseconds: 300));

      expect(emailErrorFinder, findsOneWidget);
      expect(passwordErrorFinder, findsOneWidget);
    });
    testWidgets('Valid form data test', (WidgetTester tester) async {
      Widget testWidget = const MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(
          home: FormDemo(),
        ),
      );
      await tester.pumpWidget(testWidget);
      final btnFinder = find.text('Submit');

      final emailErrorFinder = find.text('Email is required');
      final passwordErrorFinder = find.text('Password is required');
      final emailErrorFinder2 = find.text('Enter valid email');
      final passwordErrorFinder2 =
          find.text('Password must be at least 8 character long');

      //entering value in email field
      var emailFieldKey = const Key('emailKey');
      final emailField = find.byKey(emailFieldKey);
      await tester.enterText(emailField, 'hello@gmail.com');

      //entering value in password field
      var paswordFieldKey = const Key('passwordKey');
      final passwordField = find.byKey(paswordFieldKey);
      await tester.enterText(passwordField, 'hello1234');

      await tester.tap(btnFinder);
      await tester.pump(const Duration(milliseconds: 300));

      expect(emailErrorFinder, findsNothing);
      expect(passwordErrorFinder, findsNothing);
      expect(emailErrorFinder2, findsNothing);
      expect(passwordErrorFinder2, findsNothing);
    });
  });
}
