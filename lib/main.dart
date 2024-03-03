import 'dart:async';

import 'package:ane_calculator/bll/calc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Coolest calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var operants;
  String _oldValues = "";
  String _changeableText = "";
  String _numberBuilder = "";
  Calculator calulator = new Calculator();

  void changeOldValues(var i) {
    setState(() {
      _oldValues = _oldValues + " $i ,";
    });
  }

  void viewResult(var i){
    setState(() {
      _changeableText = "$i";
    });
  }
  void changeText(var i) {
    setState(() {
      _changeableText = _changeableText + " $i";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  _oldValues,
                  textAlign: TextAlign.right,
                  key: Key('oldValues'),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    key: Key('display'),
                    _changeableText,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: 500,
                maxWidth: 500,
              minHeight: 300,
              minWidth: 300,
            ),
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 4,
              children: <Widget>[
                buildOperant(1),
                buildOperant(2),
                buildOperant(3),
                buildOperator("+"),
                buildOperant(4),
                buildOperant(5),
                buildOperant(6),
                buildOperator("-"),
                buildOperant(7),
                buildOperant(8),
                buildOperant(9),
                buildOperator("*"),
                buildOperator("AC"),
                buildOperant(0),
                buildOperator("%"),
                buildEnterElement("Enter")
              ],
            ),
          )
        ],
      ),
    );
  }

  ConstrainedBox buildEnterElement(String i) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
      child: OutlinedButton(
        key: ValueKey('$i'),
        onPressed: () {
          //Push the value to the stack
          calulator.push(int.parse(_numberBuilder));
          changeOldValues(_numberBuilder);
          _numberBuilder = "";
          _changeableText = '';
        },
        child: Text(i),
      ),
    );
  }

  Container buildACElement(String i) {
    return Container(
      child: OutlinedButton(
        key: ValueKey('$i'),
        onPressed: () {
          operators(i);
        },
        child: Text(i),
      ),
    );
  }

  Container buildOperator(String i) {
    return Container(
      child: OutlinedButton(
        key: ValueKey('$i'),
        onPressed: () {
          operators(i);
        },
        child: Text(i),
      ),
    );
  }

  Container buildOperant(int i) {
    return Container(
      child: ElevatedButton(
        key: Key('$i'),
        onPressed: () {
          changeText(i);
          _numberBuilder = _numberBuilder + "$i";
        },
        child: Text(i.toString()),
      ),
    );
  }

  void operators(String i) {
    if ("%" == i) {
      calulator.execute(DivideCommand());
      viewResult(calulator.pop().toString());
    } else if ("*" == i) {
      calulator.execute(MultiCommand());
      _changeableText = calulator.pop().toString();
    } else if ("+" == i) {
      calulator.execute(AddCommand());
      viewResult(calulator.pop().toString());
    } else if ("-" == i) {
      calulator.execute(SubCommand());
      viewResult(calulator.pop().toString());

    }else if ("AC" == i){
      calulator.clearStack();
      _changeableText = '';
      _oldValues = '';
    }
  }
}
