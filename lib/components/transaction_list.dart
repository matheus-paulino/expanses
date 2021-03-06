import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(
    this.transactions,
    this.onRemove,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: 260,
                  child: Image.asset(
                    'assets/gifs/empty_list.gif',
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Your list transactions is empty...',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final transaction = transactions[index];
                return Card(
                  elevation: 3.0,
                  margin: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 5.0,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 30.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          child: Text(
                            '\$ ${transaction.value.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(transaction.title),
                    subtitle: Text(
                      DateFormat('MMM d, y').format(transaction.date),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete_rounded,
                        size: 25.0,
                      ),
                      onPressed: () => onRemove(transaction.id),
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
