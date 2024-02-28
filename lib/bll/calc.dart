import 'dart:html';
import 'dart:math';
/*
void main (){
  Calculator calculator = new Calculator();
  calculator.push(2);
  calculator.push(4);
  calculator.execute(AddCommand());
  print(calculator.pop());
}*/

abstract class Command{
  apply(List<num> stack);
}

class Calculator{
  List<num> stack = [];

  void push(num value) {
    stack.add(value);
  }

  void execute(Command command) {
    command.apply(stack);
  }

  num pop() {
    return stack.removeLast();
  }
}

class AddCommand implements Command{
  void apply(List<num> stack){
    num a = stack.removeLast();
    num b = stack.removeLast();
    stack.add(a+b);
  }
}
class SubCommand implements Command{
  void apply(List<num> stack){
    num a = stack.removeLast();
    num b = stack.removeLast();
    stack.add(a-b);
  }
}
class MultiCommand implements Command{
  void apply(List<num> stack){
    num a = stack.removeLast();
    num b = stack.removeLast();
    stack.add(a*b);
  }
}
class DivideCommand implements Command{
  void apply(List<num> stack){
    num a = stack.removeLast();
    num b = stack.removeLast();
    stack.add(a/b);
  }
}
class PowCommand implements Command{
  void apply(List<num> stack){
    num a = stack.removeLast();
    num b = stack.removeLast();
    stack.add(pow(a,b));
  }
}
class SQRTCommand implements Command{
  void apply(List<num> stack){
    num a = stack.removeLast();
    stack.add(sqrt(a));
  }
}
