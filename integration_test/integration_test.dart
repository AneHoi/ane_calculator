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
IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Find all widgets', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byKey(Key('display')), findsOneWidget);

    expect(find.byKey(Key('1')), findsOneWidget);
    expect(find.byKey(Key('2')), findsOneWidget);
    expect(find.byKey(Key('3')), findsOneWidget);
    expect(find.byKey(Key('4')), findsOneWidget);
    expect(find.byKey(Key('5')), findsOneWidget);
    expect(find.byKey(Key('6')), findsOneWidget);
    expect(find.byKey(Key('7')), findsOneWidget);
    expect(find.byKey(Key('8')), findsOneWidget);
    expect(find.byKey(Key('9')), findsOneWidget);
    // TODO find out, why this fails
    expect(find.byKey(Key('0')), findsOneWidget);

/*
    expect(find.byKey(Key('-')), findsOneWidget);
    expect(find.byKey(Key('+')), findsOneWidget);
    expect(find.byKey(Key('*')), findsOneWidget);*/
    //TODO and these
    //expect(find.byKey(Key('%')), findsOneWidget);
    //expect(find.byKey(Key('Enter')), findsOneWidget);



  });

}
