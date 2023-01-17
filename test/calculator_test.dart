import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_demo/calculator.dart';

void main() {
  late Calculator calculator;

  setUpAll(
    () {
      calculator = Calculator();
    },
  );

  group(
    'Testing calculator functions',
    () {
      test(
        "Add function",
        () {
          int result = calculator.add(5, 4);
          expect(result, 9);
        },
      );
      test(
        "Subtract function",
        () {
          int result = calculator.subtract(5, 4);
          expect(result, 1);
        },
      );
      test(
        "Multiply function",
        () {
          int result = calculator.multiply(5, 4);
          expect(result, 20);
        },
      );
      test(
        "Divide function",
        () {
          double result = calculator.divide(54, 0);
          expect(result, double.infinity);
          double result2 = calculator.divide(54, 6);
          expect(result2, 9);
        },
        // skip: true
      );
    },
  );
}
