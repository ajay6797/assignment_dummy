import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(random());
}

class random extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Play'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> selectedNumbers = [];

  int? selectedNumber;

  final random = Random();

  Widget _buildDropdown() {
    return Column(
      children: [
        SizedBox(height: 20),
        Text('Select 5 Numbers:', style: TextStyle(fontSize: 20)),
        SizedBox(height: 10),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: List.generate(
            36,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  if (selectedNumbers.length < 5 &&
                      !selectedNumbers.contains(index + 1)) {
                    selectedNumbers.add(index + 1);
                    selectedNumbers.sort();
                  }
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5),
                  color: selectedNumbers.contains(index + 1)
                      ? Colors.blue
                      : Colors.white,
                ),
                width: 40,
                height: 40,
                child: Center(
                  child: Text(
                    (index + 1).toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: selectedNumbers.contains(index + 1)
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRandomButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedNumbers = List.generate(5, (_) => random.nextInt(36) + 1);
          selectedNumbers.sort();
        });
      },
      child: Text('Generate Random Numbers'),
    );
  }

  Widget _buildClearButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedNumbers.clear();
        });
      },
      child: Text('Clear Numbers'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildDropdown(),
            SizedBox(height: 20),
            _buildRandomButton(),
            SizedBox(height: 20),
            Text(
              'Selected Numbers: ${selectedNumbers.join(', ')}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            _buildClearButton(),
          ],
        ),
      ),
    );
  }
}
