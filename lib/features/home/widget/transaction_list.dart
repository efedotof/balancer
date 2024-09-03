import 'package:balancer/box/transaction.dart';
import 'package:flutter/material.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final String headerTitle;
  final List<Transaction> transactions;

  const TransactionList({
    required this.headerTitle,
    required this.transactions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
        unselectedWidgetColor: Colors.transparent,
      ),
      child: ExpansionTile(
        title: Text(headerTitle, style: const TextStyle(fontSize: 22),),
        
        initiallyExpanded: headerTitle == 'Сегодня',
        children: transactions
            .map(
              (transaction) => Padding(
                padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
                child: TransactionItem(
                  title: transaction.title,
                  amount: transaction.amount,
                  amountColor: transaction.amount.startsWith('-')
                      ? Colors.red
                      : Colors.green,
                  date: transaction.date,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
