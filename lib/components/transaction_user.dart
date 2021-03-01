import 'package:flutter/material.dart';

import 'transaction_form.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  TransactionUser({Key key}) : super(key: key);

  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {

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
    return Column(
      children: [
        TransactionList(_transcations),
        TransactionForm()
      ],
    );
  }
}