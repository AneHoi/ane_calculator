import 'dart:math';

import 'package:ane_calculator/bll/calc.dart';
import 'package:flutter_test/flutter_test.dart';

//Widget test is fast
//numegration test

void main() {
  group('AllCommands', () {
    test('addCommand', () {
      expect(add(1,2), 3);
      expect(add(3,5), 8);
      expect(add(-10,8), -2);
      expect(add(-10,-10), -20);
      expect(add(-5,5), 0);
    });

    test('subtractCommand', () {
      expect(subtract(10, 10), 0);
      expect(subtract(1, 2), -1);
      expect(subtract(90, 8), 82);
      expect(subtract(5, 10), -5);
      expect(subtract(100, 50), 50);
      expect(subtract(9, 8), 1);
      expect(subtract(50, 90), -40);
      expect(subtract(30, 4), 26);
    });

    test('multiplyCommand', () {
      expect(multiply(2, 4), 8);
      expect(multiply(50, 2), 100);
      expect(multiply(29, 3), 87);
      expect(multiply(3, 3), 9);
      expect(multiply(-3, 3), -9);
      expect(multiply(-22, -10), 220);
      expect(multiply(-60, 8), -480);
    });

    test('divideCommand', () {
      expect(divide(10.0, 5.0), 2.0);
      expect(divide(30.0, 3.0), 10.0);
      expect(divide(20.0, 10.0), 2.0);
      expect(divide(4.0, 2.0), 2);
      expect(divide(2.0, 4.0), 0.5);
      expect(divide(-2.0, 4.0), -0.5);
      expect(divide(-10.0, 5.0), -2);
    });

  });
}

num divide(num a, num b) {
  final stack = [a,b];
  DivideCommand().apply(stack);
  return stack.removeLast();

}

num multiply(num a, num b) {
  final stack = [a,b];
  MultiCommand().apply(stack);
  return stack.removeLast();
}

num subtract(num a, num b) {
  final stack = [a,b];
  SubCommand().apply(stack);
  return stack.removeLast();

}

num add(num a, num b) {
  final stack = [a, b];
  AddCommand().apply(stack);
  return stack.removeLast();
}
