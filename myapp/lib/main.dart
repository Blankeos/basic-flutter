import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Counter & Name Input'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _currentName = "John";
  String _nameField = "";

  void _handleNameFieldChange(String input) {
    setState(() {
      _nameField = input;
    });
  }

  void _changeName() {
    setState(() {
      _currentName = _nameField;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Current Name: $_currentName',
              textScaleFactor: 1.5,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                    onPressed: _incrementCounter, child: Text("Increase")),
                TextButton(
                    onPressed: _decrementCounter, child: Text("Decrease")),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      decoration:
                          const InputDecoration(hintText: "Enter a name"),
                      onChanged: _handleNameFieldChange,
                      onSubmitted: (text) {
                        _changeName();
                      },
                    ),
                  ),
                  TextButton(
                      onPressed: _changeName, child: Text("Change Name")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
