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
      Widget testWidget = const MediaQuery(
          data: MediaQueryData(),
          child: MaterialApp(
            home: FormDemo(),
          ));
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










































































// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   test('Form validation test', () {
//     final formKey = GlobalKey<FormState>();
//     final nameController = TextEditingController();
//     final emailController = TextEditingController();
//     final passwordController = TextEditingController();

//     Widget buildTestableWidget(Widget widget) {
//       return MediaQuery(
//         data: MediaQueryData(),
//         child: MaterialApp(
//           home: Scaffold(
//             body: Form(
//               key: formKey,
//               child: widget,
//             ),
//           ),
//         ),
//       );
//     }

//     // Create a TextFormField for the name
//     final nameField = TextFormField(
//       controller: nameController,
//       decoration: InputDecoration(labelText: 'Name'),
//       validator: (value) {
//         if (value.isEmpty) {
//           return 'Please enter your name';
//         }
//         return null;
//       },
//     );

//     // Create a TextFormField for the email
//     final emailField = TextFormField(
//       controller: emailController,
//       decoration: InputDecoration(labelText: 'Email'),
//       validator: (value) {
//         if (value.isEmpty || !value.contains('@')) {
//           return 'Please enter a valid email';
//         }
//         return null;
//       },
//     );

//     // Create a TextFormField for the password
//     final passwordField = TextFormField(
//       controller: passwordController,
//       decoration: InputDecoration(labelText: 'Password'),
//       validator: (value) {
//         if (value.isEmpty || value.length < 8) {
//           return 'Please enter a valid password';
//         }
//         return null;
//       },
//     );

//     // Create a RaisedButton to submit the form
//     final submitButton = RaisedButton(
//       onPressed: () {
//         if (formKey.currentState.validate()) {
//           // Do something
//         }
//       },
//       child: Text('Submit'),
//     );

//     // Create the test widget
//     final widget = Column(
//       children: [
//         nameField,
//         emailField,
//         passwordField,
//         submitButton,
//       ],
//     );

//     // Build the testable widget
//     final testableWidget = buildTestableWidget(widget);

//     // Find the TextFormFields
//     final nameFinder = find.byType(TextFormField);
//     final emailFinder = nameFinder.next;
//     final passwordFinder = emailFinder.next;

//     // Find the RaisedButton
//     final submitButtonFinder = find.byType(RaisedButton);

//     // Test the initial state
//     expect(formKey.currentState.validate(), isFalse);

//     // Enter an invalid name
//     nameController.text = '';
//     await tester.pumpWidget(testableWidget);
//     await tester.tap(nameFinder);
//     await tester.pump();
//     expect(formKey.currentState.validate(), isFalse);

//     // Enter a valid name
//     nameController.text = 'John Doe';
//     await tester.pump
