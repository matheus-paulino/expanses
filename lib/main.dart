import 'package:flutter/material.dart';

import './models/transaction.dart';

void main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final _transcations = [
    Transaction(
      id: 't1',
      title: 'New memory ram',
      value: 450.33,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Motherboard',
      value: 750.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'New Game',
      value: 50.33,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Personal expenses'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Graphic'),
            ),
          ),
          Card(
            child: Text(' List transactions'),
          ),
        ],
      ),
    );
  }
}
