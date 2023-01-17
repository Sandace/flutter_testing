import 'package:flutter/material.dart';
import 'package:flutter_test_demo/validate_form.dart';

class FormDemo extends StatefulWidget {
  const FormDemo({Key? key}) : super(key: key);

  @override
  State<FormDemo> createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  final formKey = GlobalKey<FormState>();
  final emailFieldKey = GlobalKey<FormFieldState<String>>();
  final passwordFieldKey = GlobalKey<FormFieldState<String>>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  const Text("Email"),
                  const SizedBox(height: 5),
                  TextFormField(
                    key: const Key('emailKey'),
                    validator: ValidateForm.validateEmail,
                    // validator: (value) {
                    //   if (value != null) {
                    //     if (value.isEmpty) {
                    //       return 'Email is required';
                    //     }
                    //     if (!value.contains('@')) {
                    //       return 'Please enter a valid email';
                    //     }
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                        hintText: "Enter your email here",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),
                  const SizedBox(height: 10),
                  const Text("Password"),
                  const SizedBox(height: 5),
                  TextFormField(
                    key: const Key('passwordKey'),
                    validator: ValidateForm.validatePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter your password here",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          // Do something()
                          print("Success");
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}




































































// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   test('Empty form fields should return error', () {
//     final formKey = GlobalKey<FormState>();
//     final emailFieldKey = GlobalKey<FormFieldState<String>>();
//     final passwordFieldKey = GlobalKey<FormFieldState<String>>();

//     Form(
//       key: formKey,
//       child: Column(
//         children: [
//           TextFormField(
//             key: emailFieldKey,
//             validator: (value) {
//               if (value.isEmpty) {
//                 return 'Email is required';
//               }
//               return null;
//             },
//           ),
//           TextFormField(
//             key: passwordFieldKey,
//             validator: (value) {
//               if (value.isEmpty) {
//                 return 'Password is required';
//               }
//               return null;
//             },
//           ),
//         ],
//       ),
//     );

//     emailFieldKey.currentState.didChange('');
//     passwordFieldKey.currentState.didChange('');

//     expect(formKey.currentState.validate(), isFalse);
//     expect(emailFieldKey.currentState.errorText, 'Email is required');
//     expect(passwordFieldKey.currentState.errorText, 'Password is required');
//   });

//   test('Form fields with valid input should return null error', () {
//     final formKey = GlobalKey<FormState>();
//     final emailFieldKey = GlobalKey<FormFieldState<String>>();
//     final passwordFieldKey = GlobalKey<FormFieldState<String>>();

//     Form(
//       key: formKey,
//       child: Column(
//         children: [
//           TextFormField(
//             key: emailFieldKey,
//             validator: (value) {
//               if (value.isEmpty) {
//                 return 'Email is required';
//               }
//               return null;
//             },
//           ),
//           TextFormField(
//             key: passwordFieldKey,
//             validator: (value) {
//               if (value.isEmpty) {
//                 return 'Password is required';
//               }
//               return null;
//             },
//           ),
//         ],
//       ),
//     );

//     emailFieldKey.currentState.didChange('test@example.com');
//     passwordFieldKey.currentState.didChange('password');

//     expect(formKey.currentState.validate(), isTrue);
//     expect(emailFieldKey.currentState.errorText, isNull);
//     expect(passwordFieldKey.currentState.errorText, isNull);
//   });
// }
