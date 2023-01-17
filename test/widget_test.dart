// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_test_demo/main.dart';

void main() {
  testWidgets('Counter Starts at 0', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);

    // await tester.tap(find.byIcon(Icons.remove));
    // await tester.pump();

    // expect(find.text('1'), findsNothing);
    // expect(find.text('0'), findsOneWidget);
  });
  testWidgets("Counter increments", (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(const MyApp());
    const testKey = Key('test');
    Finder finder;
    finder = find.byKey(testKey);
    var text = finder.evaluate().single.widget as Text;
    int countervalue = int.parse(text.data ?? '0');
    int incrementedCounterValue = countervalue + 1;

    await widgetTester.tap(find.byIcon(Icons.add));
    await widgetTester.pump();

    // // Verify that our counter has incremented.
    expect(find.text(countervalue.toString()), findsNothing);
    expect(find.text(incrementedCounterValue.toString()), findsOneWidget);
  });
  testWidgets("Counter decrements", (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(const MyApp());
    const testKey = Key('test');
    Finder finder;
    finder = find.byKey(testKey);
    var text = finder.evaluate().single.widget as Text;
    int countervalue = int.parse(text.data ?? '0');
    int decrementedCounterValue = countervalue - 1;

    // await widgetTester.tap(find.byIcon(Icons.add));
    // await widgetTester.pump();

    await widgetTester.tap(find.byIcon(Icons.remove));
    await widgetTester.pump();

    // // Verify that our counter has decremented.
    expect(find.text(countervalue.toString()), findsNothing);
    expect(find.text(decrementedCounterValue.toString()), findsOneWidget);
  });

  testWidgets("Title is set", (WidgetTester tester) async {
    Widget testWidget = const MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(home: MyHomePage(title: 'Hello')));
    await tester.pumpWidget(testWidget);
    expect(find.text("Hello"), findsOneWidget);
  });
}
