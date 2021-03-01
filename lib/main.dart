import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Graphic'),
            ),
          ),
          Column(
            children: _transcations.map((transaction) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 10.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.lightBlue,
                          width: 2.0,
                        ),
                      ),
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        transaction.value.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.lightBlue,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          transaction.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue,
                          ),
                        ),
                        Text(
                          DateFormat('d MMM y').format(transaction.date),
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
