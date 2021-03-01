import 'package:flutter/material.dart';

import 'package:expanses/components/transaction_form.dart';
import 'package:expanses/components/transaction_list.dart';
import 'components/transaction_user.dart';

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
          TransactionUser(),
        ],
      ),
    );
  }
}
