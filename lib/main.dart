import 'package:flutter/material.dart';

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
  String _changeableText = "";

  void changeText(String i) {
    setState(() {
      _changeableText = _changeableText + " " + i;
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
              Container(
                color: Colors.blue[50],
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
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
          Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 4,
              children: <Widget>[
                buildElement("1"),
                buildElement("2"),
                buildElement("3"),
                buildElement("+"),

                buildElement("4"),
                buildElement("5"),
                buildElement("6"),
                buildElement("-"),

                buildElement("7"),
                buildElement("8"),
                buildElement("9"),
                buildElement("*"),
                buildElement("%"),

                buildElement("0"),
                buildElement("Enter")
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildElement(String i) {
    return Container(
      child: OutlinedButton(
        onPressed: () {
          changeText(i);
        },
        child: Text(i),
      ),
    );
  }
}
