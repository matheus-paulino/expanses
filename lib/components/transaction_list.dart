import 'package:expanses/components/transaction_item.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList(
    this.transactions,
    this.onRemove,
  );

  @override
  Widget build(BuildContext context) {
    print('build() _transactionlist');
    return transactions.isEmpty
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
              const Text(
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
              return TransactionItem(
                transaction: transaction,
                onRemove: onRemove,
              );
            },
          );
  }
}
