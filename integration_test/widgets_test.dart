import 'package:ane_calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Find all widgets', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    var elements = ['display','oldValues','1','2','3','4','5','6','7','8','9','0',
                      'AC','+','-','*','%','Enter'];
    elements.forEach((element) =>expect(find.byKey(Key(element)), findsOneWidget));
    
    expect(find.byKey(Key('display')), findsOneWidget);

  });

  testWidgets('find value of display', (tester) async {
    await tester.pumpWidget(const MyApp());
    // Expect to find the item on screen.
    expect(await findValueOfElementByKey('display', tester), '');
  });

  testWidgets('enter number', (tester) async {
    await tester.pumpWidget(const MyApp());
    // Tap the button  button.
    await tester.tap(find.byKey(Key('1')));

    // Expect to find the item on screen.
    expect(await findValueOfElementByKey('display', tester), ' 1');
  });

  testWidgets('test all numbers and erase', (tester) async {
    await tester.pumpWidget(const MyApp());
    var numbers = ['1','2','3','4','5','6','7','8','9','0'];
    for(var number in numbers){
      await tester.tap(find.byKey(Key(number)));

      //Wait, to make sure the app can keep up with the test
      await Future.delayed(Duration(seconds: 1));

      // Expect to find the item on screen.
      expect(await findValueOfElementByKey('display', tester), ' ' + number);

      //Erase numbers
      await tester.tap(find.byKey(Key('AC')));
      //Wait, to make sure the app can keep up with the test
      await Future.delayed(Duration(seconds: 1));
      expect(await findValueOfElementByKey('display', tester), '');
    }
    });

}

findValueOfElementByKey(String key, WidgetTester tester) async {
  var finder = (find.byKey(Key(key)));
  // Rebuild the widget to make sure it is the newest result returned.
  await tester.pump();
  var text = finder.evaluate().single.widget as Text;
  return text.data;
}
