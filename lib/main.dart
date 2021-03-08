import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';
import 'package:expanses/components/chart.dart';

void main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);

    return new MaterialApp(
      home: HomePage(),
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.orange,
          accentColor: Colors.orangeAccent,
          fontFamily: 'Archivo'),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transcations = [];

  List<Transaction> get _recentTransactions {
    return _transcations.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(
          days: 7,
        ),
      ));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime dateTime) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: dateTime,
    );

    setState(() {
      _transcations.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }

  _removeTransaction(String id) {
    setState(() {
      _transcations.removeWhere((tr) => tr.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build() _initalPage');
    final appBar = AppBar(
      title: Text(
        'Personal expenses',
        style: TextStyle(
          fontSize: 20.0 * MediaQuery.of(context).textScaleFactor,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.add_sharp),
          onPressed: () => _openTransactionFormModal(context),
        )
      ],
      centerTitle: true,
    );

    final availableHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return new Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: availableHeight * 0.25,
              child: Chart(_recentTransactions),
            ),
            Container(
              height: availableHeight * 0.75,
              child: TransactionList(_transcations, _removeTransaction),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add_sharp,
          size: 30.0,
        ),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
