import 'package:balancer/box/transaction.dart';
import 'package:flutter/material.dart';

import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) {
      return const Center(
        child: Text(
          'Ничего нет, добавьте транзакцию',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    return Expanded(
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          final isIncome = transaction.amount.startsWith('+');
          final day = transaction.date.day.toString().padLeft(2, '0');
          final month = transaction.date.month.toString().padLeft(2, '0');
          final year = transaction.date.year.toString();
          final hour = transaction.date.hour.toString().padLeft(2, '0');
          final minute = transaction.date.minute.toString().padLeft(2, '0');

          final formattedDate = '$day.$month.$year  $hour:$minute';

          return TransactionItem(
            title: transaction.title,
            subtitle: formattedDate,
            amount: transaction.amount,
            amountColor: isIncome ? Colors.green : Colors.red,
          );
        },
      ),
    );
  }
}
