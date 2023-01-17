import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_demo/counter.dart';

void main() {
  group("counter function", () {
    test("incrementCounter() increments counter value", () {
      //setup
      Counter counter = Counter(value: 3);
      //do
      counter.incrementCounter();
      //test
      expect(counter.value, 4);
    });

    test("decrementCounter() decrements counter value", () {
      //setup
      Counter counter = Counter(value: 5);
      //do
      counter.decrementCounter();
      //test
      expect(counter.value, 4);
    });
  });
}
