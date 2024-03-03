import 'package:ane_calculator/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
void main() {
  //This is both a "Find widget" test and a "Widget test" because we test the wiget "MyApp", and find widgets inside it
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('test the add function', (tester) async {
      // Load app widget.
      await tester.pumpWidget(const MyApp());

      await calculate(5, 4, 9, '+', tester);
      await calculate(1, 2, 3, '+', tester);
      await calculate(9, 4, 13, '+', tester);
      await calculate(9, 9, 18, '+', tester);
    });
    testWidgets('test the subtract function', (tester) async {
      // Load app widget.
      await tester.pumpWidget(const MyApp());

      await calculate(5, 4, 1, '-', tester);
      await calculate(1, 2, -1, '-', tester);
      await calculate(9, 4, 5, '-', tester);
      await calculate(9, 9, 0, '-', tester);
    });
    testWidgets('test the multiply function', (tester) async {
      // Load app widget.
      await tester.pumpWidget(const MyApp());

      await calculate(5, 4, 20, '*', tester);
      await calculate(1, 2, 2, '*', tester);
      await calculate(9, 4, 36, '*', tester);
      await calculate(9, 9, 81, '*', tester);
    });
    testWidgets('test the division function', (tester) async {
      // Load app widget.
      await tester.pumpWidget(const MyApp());

      await calculate(5, 4, 1.25, '%', tester);
      await calculate(1, 2, 0.5, '%', tester);
      await calculate(9, 4, 2.25, '%', tester);
      await calculate(9, 9, 1.0, '%', tester);
    });
  });
}

Future<void> calculate(
    int a, int b, num expected, String operator, WidgetTester tester) async {
  await Future.delayed(Duration(seconds: 1));
  await tester.tap(find.byKey(Key('AC')));
  await Future.delayed(Duration(seconds: 1));

  expect(await findValueOfElementByKey('display', tester), '');

  // Tap the button
  await tester.tap(find.byKey(Key('$a')));
  await Future.delayed(Duration(seconds: 1));
  expect(await findValueOfElementByKey('display', tester), ' $a');

  await tester.tap(find.byKey(Key('Enter')));
  await Future.delayed(Duration(seconds: 1));
  expect(await findValueOfElementByKey('display', tester), '');
  expect(await findValueOfElementByKey('oldValues', tester), ' $a ,');

  await tester.tap(find.byKey(Key('$b')));
  await Future.delayed(Duration(seconds: 1));
  expect(await findValueOfElementByKey('display', tester), ' $b');
  expect(await findValueOfElementByKey('oldValues', tester), ' $a ,');

  await tester.tap(find.byKey(Key('Enter')));
  await Future.delayed(Duration(seconds: 1));
  expect(await findValueOfElementByKey('display', tester), '');
  expect(await findValueOfElementByKey('oldValues', tester), ' $a ,' + ' $b ,');

  await tester.tap(find.byKey(Key(operator)));
  await Future.delayed(Duration(seconds: 1));
  expect(await findValueOfElementByKey('display', tester), '$expected');
  expect(await findValueOfElementByKey('oldValues', tester), ' $a ,' + ' $b ,');
}

findValueOfElementByKey(String key, WidgetTester tester) async {
  var finder = (find.byKey(Key(key)));
  // Rebuild the widget to make sure it is the newest result returned.
  await tester.pump();
  var text = finder.evaluate().single.widget as Text;
  return text.data;
}
