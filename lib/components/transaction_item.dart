import 'package:expanses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final void Function(String) onRemove;

  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.symmetric(
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
                style: const TextStyle(
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
          icon: const Icon(
            Icons.delete_rounded,
            size: 25.0,
          ),
          onPressed: () => onRemove(transaction.id),
          color: Theme.of(context).errorColor,
        ),
      ),
    );
  }
}
