import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final String title;
  final String amount;
  final Color amountColor;
  final DateTime date;

  const TransactionItem({
    super.key,
    required this.title,
    required this.amount,
    required this.amountColor,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');

    final formattedDate = '$day.$month.$year  $hour:$minute';

    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        formattedDate,
        style: const TextStyle(color: Colors.white70),
      ),
      trailing: Text(
        '$amount₽',
        style: TextStyle(color: amountColor, fontSize: 18),
      ),
    );
  }
}
